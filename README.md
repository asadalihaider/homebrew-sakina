# homebrew-sakina

A [Homebrew](https://brew.sh) tap for [Sakina](https://github.com/asadalihaider/pray-with-sakina),
a prayer companion that lives in the macOS menu bar.

```bash
brew install --cask asadalihaider/sakina/sakina
```

To upgrade later:

```bash
brew upgrade --cask sakina
```

## Releasing a new version

The cask is updated by hand, which for a project that releases a few times a
year is less machinery than a token with write access to two repositories.

After a release is published, take its version and checksum — the checksum is
printed in the release notes — and put them in [`Casks/sakina.rb`](Casks/sakina.rb):

```bash
VERSION=0.2.0
curl -sL "https://github.com/asadalihaider/pray-with-sakina/releases/download/v$VERSION/Sakina.zip" \
  | shasum -a 256 | cut -d' ' -f1
```

Then commit and push. `brew` picks it up on the next `brew update`.
