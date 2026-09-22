# smorinlabs tap

Homebrew tap for CLI tools published by `smorinlabs`.

## Install

```bash
brew tap smorinlabs/tap
brew install envgen
```

Or install directly without persisting tap config:

```bash
brew install smorinlabs/tap/envgen
```

## Maintenance policy

- Formula updates are submitted and merged via pull requests.
- Direct pushes to `main` should be avoided.
- `envgen` formula updates are automated from `smorinlabs/envgen` release events.

## Landing formula updates (bottling)

Formula PRs land with prebuilt bottles through the `pr-pull` workflow:

1. Open a PR updating the formula. `test-bot` builds and tests it on Linux and macOS, uploading bottle artifacts.
2. Review, then wait for `test-bot` to go green on the PR's latest commit.
3. Add the `pr-pull` label. The publish workflow downloads the bottles, commits their hashes into the formula, pushes to `main`, and deletes the branch.

Rules of thumb:

- Label only after green CI on the current head. Labeled too early, or pushed after labeling? Remove the label and re-add it to re-run.
- Non-formula PRs (CI, docs) need no bottles: `pr-pull` skips bottling and still lands the commits.
- `No bottle JSON files found` in the log means CI produced no bottles for this head — get a green run first, then re-label.
- On fork PRs the branch-delete step is skipped by design; the fork owner deletes their branch.
