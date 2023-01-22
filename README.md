# Flutter architecture proposala

## Architecture

See [Flutter Architecture Proposal](https://bfifinance.atlassian.net/wiki/spaces/BW/pages/219087539/Flutter+Architecture+Proposal)

## Modularization

See [Flutter Architecture Proposal](https://bfifinance.atlassian.net/wiki/spaces/BW/pages/219087539/Flutter+Architecture+Proposal)

## Libraries

See [Flutter Architecture Proposal](https://bfifinance.atlassian.net/wiki/spaces/BW/pages/219087539/Flutter+Architecture+Proposal)

Additional libraries:
- [freezed](https://pub.dev/packages/freezed) to generate data classess and sealed classes (similar to Kotlin)

## Development Environment

This project uses [Melos](https://melos.invertase.dev/) to manage multiple sub-packages. 

- Install the latest Melos version
    ```
    dart pub global activate melos
    ```
- Run pub get on all packages
    ```
    melos bs
    ```
- Generate files with `build_runner`
    ```
    melos generate
    ```
- Generate `l10n`
    ```
    melos l10n
    ```
- All of the remaining Melos commands can be seen on `melos.yaml`
