# Divio Project Deployment Action

🚀 :octocat: Divio Project Deployment Action. This actions supports deploying your project on Divio using GitHub Action.

## Getting Started

You can include the action in your workflow as `juancarlosjr97/divio-deploy-action@v1`. Example:

```yaml
name: Deploy
on:
  push:
    branches:
      - main
      - staging

jobs:
  deploy:
    runs-on: ubuntu-latest
    name: Deploy 🚀
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Deploying
        uses: juancarlosjr97/divio-deploy-action@v1
        env:
          DIVIO_LOGIN_ACCESS_TOKEN: ${{ secrets.DIVIO_LOGIN_ACCESS_TOKEN }}
          DIVIO_REMOTE_PROJECT_ID: ${{ secrets.DIVIO_REMOTE_PROJECT_ID }}
```

## Inputs

TODO

## Inputs

### `input`

**Required** Description. Default `"Test"`.

## Outputs

### `DEPLOYMENT_STATUS`

TODO.

## Example usage
