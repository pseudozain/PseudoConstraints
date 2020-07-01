
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Alamofire.svg?style=flat)](https://github.com/pseudozain/PseudoConstraints)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/pseudozain/PseudoConstraints/blob/master/LICENSE)

# PseudoConstraints

PseudoConstraints is an easy and simple interface to set ```NSLayoutConstraints``` programatically. PseudoConstraints uses native ```UIKit``` APIs at its core, so making it more efficient.

## Installation

PseudoConstrains is available through Cocoapods and Carthage.

### CocoaPods Installation

To install PseudoConstraints through CocoaPods add following to your podfile:

```ruby
pod 'IdentityScanner'
```

And run:

```ruby
pod install
``` 

### Carthage installation

To install PseudoConstraints through CocoaPods add following to your cartfile:

```ruby
github "pseudozain/PseudoConstraints"
```

And run:

```ruby
carthge update --plateform iOS
```

## Usage

PseudoConstraints is easy to use and you can set constraints of your views as easily as following:


```Swift
headingLabel
    .alignEdgeWithSuperviewSafeArea(.top, constant: 45)
    .alignEdgesWithSuperview([.left, .right], constant: 25)

detailsLabel
    .below(headingLabel, constant: 15)
    .centerHorizontallyInSuperview()
    .alignEdgeWithSuperviewSafeArea(.left, constant: 25)
```
## Author

Zain ul Abe Din

## License

PseudoConstraints is available under the MIT license. See the LICENSE file for more info.
