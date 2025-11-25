fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios load_asc_api_key

```sh
[bundle exec] fastlane ios load_asc_api_key
```

Load App Store Connect API Key

### ios fetch_and_increment_build_number

```sh
[bundle exec] fastlane ios fetch_and_increment_build_number
```

Fetch and increment build number

### ios code_signing

```sh
[bundle exec] fastlane ios code_signing
```

Code Signing using Match

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Build and upload to TestFlight

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
