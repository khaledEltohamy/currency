# currency_converter_app

A Currency converter app project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Create a currency converter app with the following features:

## List of supported currencies with their country’s flag , Store the data locally in a database.

For the list of supported currencies you can use the Cloudmersive API (https://api.cloudmersive.com/docs/currency.asp) to get a list of available currencies and corresponding countries. This API provides a list of currencies with their ISO codes, names, and country names and country flags (https://flagcdn.com/16x12/countryIsoCode.png).

 A few resources:
- [Free API for the app](https://api.cloudmersive.com/docs/currency.asp)
- [Free countries flags icons](https://flagcdn.com/)
 
 Solving multi requests problem by three solutions:
  - the simple way, for call three api as default.
  - using future.wait().
  - [future.wait() online resource](https://api.flutter.dev/flutter/dart-async/Future/wait.html)
  - using rxDart (ZipStream()).
  - [future.wait() online resource](https://pub.dev/documentation/rxdart/latest/rx/ZipStream-class.html)
 
 - Note: can un commit for three TODO in remoteDataSource.dart file and try it.
 
 After the first API request & load the data from it for future usage:
 can try it when lost connection from internet.

## Adapted image loader library with justification on why to choose it.

The goodness of caching network images in a Flutter application does more than just boot up the performance of the application itself.

that shows a network image with caching functionality.
The image displayed with this widget will be downloaded and stored in the cache directory of the app for a period of time.
It will available for offline use without an internet connection.

Other significant benefits are:

Reduce the burden on your server and reduce the cost you have to pay for bandwidth in loading images.

Reduce internet charges for your users if they use 3G/4G/5G.

Fortunately, implementing image caching in Flutter is not an advanced task and we can get it done with a few dozen lines of code and the help of a great plugin named.

For help getting started with cached_network_image, view the
- [cached_network_image online documentation](https://pub.dev/packages/cached_network_image)

## Adapted design pattern for the app architecture with justification on why to choose it.

- Factory.
- Singleton.
- Repository.
- Observable.

## Used database in the app with justification on why to choose it.

SharedPreferences is on par with Hive when it comes to read performance. SQLite performs much worse.
Hive greatly outperforms SQLite and SharedPreferences when it comes to writing or deleting.
But in our solution there was no significant difference in performance, so we can use either of them.

- [shared_preferences online documentation](https://pub.dev/packages/shared_preferences)
- [hive online documentation](https://pub.dev/packages/hive)


## Apply dependency injection with inj the selected library.

As your App grows, at some point you will need to put your app's logic in classes that are separated from your Widgets.

Keeping your widgets from having direct dependencies makes your code better organized and easier to test and maintain.

But now you need a way to access these objects from your UI code.

It can be used instead of InheritedWidget or Provider to access objects e.g. from your UI.

- Extremely fast (O(1))
- Easy to learn/use
- Doesn't clutter your UI tree with special Widgets to access your data like provider or Redux does.

goodies highly inspired by Splat.
For help view the
- [Splat online documentation Github](https://github.com/reactiveui/splat)

For help getting started with get_it view the
- [get_it online documentation](https://pub.dev/packages/get_it)

