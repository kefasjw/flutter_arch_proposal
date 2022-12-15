# Flutter architecture proposal

## Architecture

The architecture and folder structure follow
Android's [Guide to app architecture](https://developer.android.com/topic/architecture) and its
sample [Now in Android](https://github.com/android/nowinandroid). Even though this is an Android's guide, most of the
recommendations and best practices are generic, which can also be applied to Flutter apps. Multiple Flutter
architecture guides on the internet have also been updated to follow this architecture, for
example [1](https://twitter.com/ASalvadorini/status/1597862552180252673)
and [2](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction).

## Libraries

- State Management: [riverpod](https://pub.dev/packages/riverpod)
    - Dependency injection (can easily inject multiple dependencies unlike its
      predecessor [provider](https://pub.dev/packages/provider))
    - Mock dependencies for testing
    - [Simpler than other state managements](https://blog.codemagic.io/flutter-state-management-part-1)
- Navigation: [go_router](https://pub.dev/packages/go_router)
    - First party navigation library
      to [simplify the usage of Navigator 2.0](https://github.com/flutter/flutter/issues/69315)
    - Support deep links and web urls
    - Support [multi stack navigation](https://github.com/flutter/flutter/issues/99126)