# HuggingGeometryReader

HuggingGeometryReader is a SwiftUI package that has a different sizing behavior then the official `GeometryReader`.

## The problem

We use `GeometryReader` to find out view's size. However, `GeometryReader` attempts to **match the parent size**, as indicated in the comments for GeometryReader:

```
This view returns a flexible preferred size to its parent layout.
```

This is sometimes not what we want, for example:

If we want to get the height of a `Text` as below

<img src="Img/img1.png" width="320"/>

And with the origional `GeometryReader`, we might have something like this:

``` swift
GeometryReader { proxy in
    Text("Hello, height is \(proxy.size.height)")
        .padding()
        .background(Color.green)
}
.background(Color.red)
```

But the result would be something like this:

<img src="Img/img2.png" width="320"/>

The size we get is actually the red part, that's not what we want. Also, the `GeometryReader` occupies the whole screen and breaks the layout.

## A simple example

This package solves the above problems with simple usage:

``` swift
HuggingGeometryReader { size in
    Text("Hello, height is \(size.height)")
        .padding()
        .background(Color.green)
}
.background(Color.red)
```

This code will have the result of the first image above.

# Installation

## Swift Package Manager

- Repository URL: `https://github.com/chihsuanwu/HuggingGeometryReader`

# Usage

Still working ...

# Contribution

Any contributions are welcome.