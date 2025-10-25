# OpenTofu with AWS image

Docker image for running OpenTofu with AWS CLI.

## What's Inside

- Alpine Linux
- OpenTofu 
- AWS CLI 
- git, curl

## Building Locally

```bash
docker build -t opentofu-aws-cli .
```

## GitHub Container Registry

Images are automatically built and pushed to `ghcr.io` on every push to main.
