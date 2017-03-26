# HexClock

A minimal hexadecimal clock for the Apple TV.

![](https://github.com/cfdrake/hexclock/raw/master/Screenshot.png)

## Dependencies

Fastlane is used to manage the build and deploy process - please install Fastlane via Bundler:

```
$ bundle install
```

Next, configure the secrets needed for this project. Create a `.env` file, filling out this template:

```bash
FASTLANE_USER="<apple id>"
HEXCLOCK_CERTS_REPO="<git repository holding certificates>"
```

## Building

### Development

First, begin by fetching the development certificate for deployment to development devices:

```
$ bundle exec cert
```

To build for the Simulator or a physical device, simply open the `xcworkspace` file and select `Product > Run`.

### Beta/Release

To build a beta version and upload to TestFlight, execute the following command:

```
$ bundle exec fastlane beta
```

To build and deploy to the App Store:

```
$ bundle exec fastlane release
```

## License

Please see the `LICENSE.md` file.
