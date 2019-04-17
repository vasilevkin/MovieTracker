<h1 align="center">MovieTracker</h1>

<br />

<div align="center">
<!-- Travis CI -->
<a href="https://travis-ci.org/vasilevkin/MovieTracker">
<img src="https://travis-ci.org/vasilevkin/MovieTracker.svg?branch=master" alt="Travis CI">

<!-- Last commit -->
<a href="https://github.com/vasilevkin/MovieTracker/commits/master">
<img src="https://img.shields.io/github/last-commit/vasilevkin/MovieTracker.svg" alt="last commit">

<!-- Commits since latest release-->
<a href="https://github.com/vasilevkin/MovieTracker/releases">
<img src="https://img.shields.io/github/commits-since/vasilevkin/MovieTracker/latest.svg" alt="commits latest release">

<!-- Open issues -->
<a href="https://github.com/vasilevkin/MovieTracker/issues">
<img src="https://img.shields.io/github/issues-raw/vasilevkin/MovieTracker.svg" alt="open issues">

<!-- License: GPLv3 -->
<a href="https://opensource.org/licenses/gpl-3.0.html">
<img src="https://img.shields.io/badge/License-GPLv3-yellow.svg" alt="License: GPLv3">

<!-- Platforms -->
<a href="https://developer.apple.com/develop/">
<img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" alt="Platforms">

<!-- Swift version -->
<a href="https://developer.apple.com/swift/">
<img src="https://img.shields.io/badge/Swift-5-orange.svg?style=flat" alt="Swift version">
</div>

<div align="center">
<sub><a href="https://svasilevkin.wordpress.com/">Crafted with ❤︎ by Sergey Vasilevkin</a></sub>
</div>

<br />

<br />


Movie Tracker - trailers, iOS app

<h1 align="center">👷 Work in progress 🛠️</h1>

<br />

<br />


Sample iOS app. Crafted the way I make iOS apps. Because of NDA (Non-disclosure agreement), I cannot share the apps I currently work on as a consultant.

Movie Tracker - trailers is an iOS app that connects to [themoviedb.org](https://www.themoviedb.org) for Movies, TV Shows, and People data.
It plays movie trailers from YouTube.

## Shown concepts

### Architecture concepts

* MVVM
* Data Bindings
* Dependency Injection
* Dependencies management
* Coordinators

### Other concepts

* Different techniques to get data from network
* Automatic Code Style guide enforcement using swiftlint
* Continuous integration
* Unit testing
* UI testing
* [Debug print log](https://svasilevkin.wordpress.com/2019/03/24/debug-print-log/)
* Asynchronous image loading with transition animation
* Continuous integration / Continuous Delivery
* [Xcode Custom Paths](https://svasilevkin.wordpress.com/2019/04/03/xcode-custom-paths/)
* [Protect private info in open source project](https://svasilevkin.wordpress.com/2019/04/03/protect-private-info-in-open-source-project/)
* Ignore files which are in git repository already


## Getting started

### Prerequisites

* XCode 10 or newer
* [CocoaPods](https://cocoapods.org) (optional)

### Cloning

Clone the GitHub repository and open the workspace `movietracker.xcworkspace`.
All dependencies inluded in the project repository.

```
$ git clone https://github.com/vasilevkin/MovieTracker.git
$ cd MovieTracker/movietracker/
$ open movietracker.xcworkspace
```

#### App login
🔒 Use your themoviedb.org credentials.
🔒 Or a test user, username `mtios` and password `test`

### Built With

- [RxSwift](https://github.com/ReactiveX/RxSwift) - Reactive Programming in Swift 
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [Nuke](https://github.com/kean/Nuke) - Powerful image loading and caching system
- [Travis CI](https://travis-ci.org) - Test and Deploy with Confidence. Easily sync your GitHub projects


## Related blog posts:

* [New project starts. Welcome Movie Tracker - trailers!](https://svasilevkin.wordpress.com/2019/03/23/new-project-starts-welcome-movie-tracker-trailers/)
* [Debug print log](https://svasilevkin.wordpress.com/2019/03/24/debug-print-log/)
* [Xcode Custom Paths](https://svasilevkin.wordpress.com/2019/04/03/xcode-custom-paths/)
* [Protect private info in open source project](https://svasilevkin.wordpress.com/2019/04/03/protect-private-info-in-open-source-project/)
* [Privacy Policy for open source app on GitHub](https://svasilevkin.wordpress.com/2019/04/13/privacy-policy-for-open-source-app-on-github/)

## Author

Sergey Vasilevkin - [Contact me](https://svasilevkin.wordpress.com/contact-me/)

My blog
[Passionate Mobile Development](https://svasilevkin.wordpress.com/blog/)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
