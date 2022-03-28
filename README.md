# SBOM-Diff-Action

> Create SBOM diffs from PR changes.

## Usage

```yaml
on:
  pull_request:
    types:
      - opened
      - edited
      - reopened
      - synchronize

jobs:
  sbom-diff:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: "0"
      - name: Create SBOM-Diff
        uses: ckotzbauer/sbom-diff-action@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SCAN_TARGET: file:go.mod
```

## Environment Variables

| Name | Description | Required |
| --- | --- | --- |
| `GITHUB_TOKEN` | `GITHUB_TOKEN` or a `repo` scoped [PAT](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). | `true` |
| `SCAN_TARGET` | Target to create SBOM from with Syft | `true` |

Every [documented source](https://github.com/anchore/syft#supported-sources) from Syft is allowed as `SCAN_TARGET`. The detected differences are added as PR comment.


## License

[MIT](LICENSE)

## Contributing

Please refer to the [Contribution guildelines](https://github.com/ckotzbauer/.github/blob/main/CONTRIBUTING.md).

## Code of conduct

Please refer to the [Conduct guildelines](https://github.com/ckotzbauer/.github/blob/main/CODE_OF_CONDUCT.md).

## Security

Please refer to the [Security process](https://github.com/ckotzbauer/.github/blob/main/SECURITY.md).
