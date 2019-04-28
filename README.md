# Flutter Webview Example

Webview Example build using flutter. Download [app-release.apk](https://github.com/pravodev/flutter-webview-example/raw/master/app-release.apk)

Screenshots :

![alt text](https://raw.githubusercontent.com/pravodev/flutter-webview-example/master/screenshots/ss1.jpeg "Webview 1")

![alt text](https://raw.githubusercontent.com/pravodev/flutter-webview-example/master/screenshots/ss2.jpeg "Webview 2")

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

This project using plugin [flutter_webview_plugin](https://pub.dartlang.org/packages/flutter_webview_plugin).

```
Widget buildWebview(){
    return WebviewScaffold(
        url: "https://www.google.com",
        appBar: new AppBar(
        title: new Text("Widget webview"),
        ),
    )
}
```
