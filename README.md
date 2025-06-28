# base

## .env

'REGISTRY_URL="ghcr.io"' >> .env
'REGISTRY_USERNAME="github_username"' >> .env
'GITHUB_TOKEN="github_token"' >> .env

## macos
```bash
brew install cosign podman
podman machine init --rootful
sudo /opt/homebrew/Cellar/podman/5.5.2/bin/podman-mac-helper install
podman machine start
```
