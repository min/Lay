<p align="center"><img src="docs/Logo@2x.jpg" width="400"></p>

Computes a perfectly justified collection of elements for any given width while maintaining the source aspect ratio. This library aims to mimic the layout implementations found in:
- [Flickr](https://www.flickr.com/search/?text=san%20francisco)
- [Chromatic](http://www.chromatic.io)
- Google photos

At it's core, Lay applies the [linear partitioning algorithm](https://www8.cs.umu.se/kurser/TDBA77/VT06/algorithms/BOOK/BOOK2/NODE45.HTM) against the aspect ratios of each size element to compute the balanced layout.

## Features
- No cropping, source size aspect ratios will be maintained.
- Flexible, works with any array of elements that conform to the `Sizable` protocol.
- Swift 3.0

Checkout out the Example app to see how this can be integrated with `UICollectionViews`.

<img src="docs/Screenshot@2x.jpg" width="375">

This project is heavily inspired by [this article](https://medium.com/@jtreitz/the-algorithm-for-a-perfectly-balanced-photo-gallery-914c94a5d8af#.ac11ixwdn) written by [Johannes Treitz](https://medium.com/@jtreitz).


## Usage

```swift
import Lay

let aspectRatios: [CGSize] = [
	.init(width: 100, height: 100),
	.init(width: 80, height: 120),
	.init(width: 100, height: 100),
	.init(width: 200, height: 200),
	.init(width: 80, height: 100),
	.init(width: 100, height: 120),
	.init(width: 100, height: 80)
]

// Can now use these sizes to render your elements however you want

let sizes: [CGSize] = aspectRatios.lay_justify(for: view.bounds.size.width)

>>> [
      (140.0, 140.0),
      (93.0, 140.0),
      (142.0, 140.0),
      (208.0, 208.0),
      (167.0, 208.0),
      (150.0, 180.0),
      (225.0, 180.0)
    ]
```

## TODO

- Tests
- Cocoapods support

## Requirements

- Xcode 8.0+
- iOS 9.0+
- Swift 3.0

## Installation

### Carthage

For [Carthage](https://github.com/Carthage/Carthage), add the following to your `Cartfile`:

```ogdl
github "min/Lay" ~> 0.1.0
```
