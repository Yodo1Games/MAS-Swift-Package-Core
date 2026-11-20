# Yodo1 MAS iOS SDK - Yodo1MasCore

Yodo1 MAS (Managed Ad Services) iOS SDK for Swift Package Manager.
This package contains the Yodo1 MAS Core SDK, the shared runtime that every
network package builds on.

## Requirements

| Requirement | Value |
|-------------|-------|
| iOS | 15.0+ |
| Swift tools | 5.6+ |
| Xcode (tested with) | 26.1.1 |

## Installation

To integrate the Yodo1 MAS Core SDK using Swift Package Manager:

### 1. Add the package

#### Xcode

1. **File → Add Package Dependencies…**
2. Enter the repository URL:

   ```
   https://github.com/Yodo1Games/MAS-Swift-Package-Core.git
   ```

3. Choose a dependency rule: an exact version you pick from this repository's tags (every Yodo1 MAS package in a project must pin the same one).
4. Add `Yodo1MasCore` to your target when prompted, then click **Add Package**.

#### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "<version>")
]
```

> Replace `<version>` with a tag from this repository (listed under **Tags**
> or **Releases**). Prerelease tags carry a `-beta.N` suffix, where `N` is
> the prerelease number.

Then add `Yodo1MasCore` to your target:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
    ]
)
```

### 2. Add the `-ObjC` linker flag (required)

The SDK ships as **static** frameworks, so your app must link with `-ObjC`.
This is **required**: without it the linker drops the SDK's mediation adapters
and Objective-C categories, and ads silently fail to load.

In Xcode, go to **Build Settings**, search for **Other Linker Flags**, and add
`-ObjC` (equivalently, set `OTHER_LDFLAGS = $(inherited) -ObjC` in an
`.xcconfig`).

Check out our [iOS integration guide](https://developers.yodo1.com/docs/sdk/guides/ios/integration)
for more info on getting started with the Yodo1 MAS SDK.

## Products

`Yodo1MasCore` is the shared core every network package links; adding this
product alone is enough.

```swift
// Core
.product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
```

> Only the products you add to your target — and their transitive dependencies
> — are built and linked.

### Combining networks

Each network is its own package, and the `Yodo1MasFull` repository lists every
network package. Add the repository URL of every network you use and keep every
package on the same exact version: the packages pin each other, so a mixed set
must resolve to a single version. For the standard set of networks in a single
dependency, use `Yodo1MasFull` itself from https://github.com/Yodo1Games/MAS-Swift-Package-Full.git.

CSJ, Tencent and ToBid are distributed through CocoaPods only and have no Swift Package Manager product.

## License

Copyright (c) 2020-2026 Yodo1 Games. See [LICENSE](LICENSE).
