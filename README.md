# Steroids for Swinject

![Swift 5.0+](https://img.shields.io/badge/Swift-5.0+-orange.svg)
[![license](https://img.shields.io/github/license/SwiftCommon/Steroids.svg)](https://github.com/SwiftCommon/Steroids/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/SwiftCommon/Steroids.svg?branch=master)](https://travis-ci.org/SwiftCommon/Steroids)
[![codecov](https://codecov.io/gh/SwiftCommon/Steroids/branch/master/graph/badge.svg)](https://codecov.io/gh/SwiftCommon/Steroids)

@Injected is Swinject on Steroids.

Getting started
---------------

On first checkout you best run: `$ make setup` that will trigger the `scripts/setup` bash script to run
and check the required dependencies and generate the Xcodeproj.

Features
--------

### Injected propertyWrapper

```swift
class VeryClass {
    @Injected var someService: SomeAwesomeService
}
```

### Register through Swinject Container

```swift
// Register a Service
Dealer.push(name: "crystal") { MagicBlues() as SomeAwesomeService }

// to drop all registrations
Dealer.reset()
```

Installation
------------

### Swift PM

Put this in your `Package.swift`:

```swift
    ...
    dependencies: [
       .package(url: "https://github.com/SwiftCommon/Steroids", from: "0.0.1")
    ],
    targets: [
       .target(
          name: "YourAwesomeApp",
          dependencies: ["Steroids"]
       )
    ]
```

License
-------

Licensed under the MIT license.
