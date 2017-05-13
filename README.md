# Hex Color Clock

A simple, minimal hexadecimal clock for the Apple TV.

[Download it on the App Store!](https://itunes.apple.com/us/app/hex-color-clock/id1207660670?mt%3D8)

![](https://github.com/cfdrake/hexclock/raw/master/Screenshot.png)

## Dependencies

Fastlane is used to manage the build and deploy process - please install Fastlane via Bundler:

```
$ bundle install
```

## Building

### Development

Deploying and testing on the Simulator requires no certificate. Simply build and run as normal.

To deploy and test on a physical Apple TV, begin by fetching the development certificate:

```
$ export FASTLANE_USER="<apple id>"
$ export HEXCLOCK_CERTS_REPO="<git repository holding certificates>"
$ bundle exec fetch_dev_cert
```

To run on physical device, select your Apple TV device, then select `Product > Run`.

### Release

First, begin by fetching the App Store certificate:

```
$ export FASTLANE_USER="<apple id>"
$ export HEXCLOCK_CERTS_REPO="<git repository holding certificates>"
$ bundle exec fastlane fetch_release_cert
```

To build for the App Store, select `Product > Archive`.

## License

Please see the `LICENSE.md` file.
