# PureMark

[![Build Status](https://travis-ci.org/wito/PureMark.svg?branch=master)](https://travis-ci.org/wito/PureMark)

PureMark is a Markdown to HTML renderer built in Swift, based on [SwiftMark by Caleb Kleveter](https://github.com/calebkleveter/SwiftMark).

\#pureswift

## Usage

PureMark is an SPM package. Add this line to your dependencies array in your `Package.swift`:

```swift
.package(url: "https://github.com/calebkleveter/SwiftMark.git", from: "2.0.0"),
```

Additionally, to any targets using PureMark, add `"PureMark"` to the target dependencies.

Using PureMark is very simple. The interface consists of a single `String` extension with a single property:

```swift
  var markdownToHTML: String?
```

The contents of this property is the HTML form (in the XML serialization) of the Markdown in the string.

## License

The whole PureMark package is under the MIT license agreement.

## Attribution

Thanks to [Caleb Kleveter](https://github.com/calebkleveter) for the initial implementation of SwiftMark.
