#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting Syft diff script"


mkdir /syft-diff-action
mkdir /syft-diff-action/new
mkdir /syft-diff-action/old
mkdir /syft-diff-action/workspace
cp --archive /github/workspace/. /syft-diff-action/workspace
chmod -R a+w /syft-diff-action
cd /syft-diff-action/workspace


if [ ! "$GITHUB_EVENT_NAME" = "pull_request" ]; then
    echo "Not a PR!"
    exit 0
fi

api_url="$(cat $GITHUB_EVENT_PATH | jq --raw-output '.pull_request.comments_url')"
ancestor_sha="$(git merge-base $GITHUB_SHA origin/$GITHUB_BASE_REF)" # find the closest common ancestor between the PR branch and the target branch

syft ${INPUT_SCAN_TARGET} -o table >../new/sbom.txt
git checkout --force $ancestor_sha
syft ${INPUT_SCAN_TARGET} -o table >../old/sbom.txt
diff=$(diff -U 0 ../old/sbom.txt ../new/sbom.txt || true)
diff=$(echo $diff | tail +3)

message="SBOM-Diff for target \`${INPUT_SCAN_TARGET}\`:"
message="$message"$'\n'$'\n'
if [ -z "$diff" ]; then
message="$message"'```'$'\n'"No changes in detected."$'\n''```'
else
message="$message"'```diff'$'\n'"$diff"$'\n''```'
fi

curl --include --verbose --fail \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-H "Authorization: token ${GITHUB_TOKEN}" \
--request POST --data "$(jq --null-input --arg escaped_diff "$message" '{body: $escaped_diff}')" \
$api_url


echo "Done"
