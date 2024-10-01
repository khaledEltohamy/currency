# currency_converter_app

Create a currency converter app with the following features:
1. List of supported currencies with their country’s flag. Store the data locally in a database
after the first API request & load the data from it for future usage.
2. Historical data for 2 currencies of your choosing for the last 7 days.
3. Currency converter where the user can select 2 currencies with the amount to convert.

### A. Instructions on how to build the project:

This application was built following basic programming principles such as SOLID and based on object-oriented programming (OOP) and also using design patterns and with the help of flutter technology with Bloc pattern for state management (with clean architecture) to find the best solutions to problems.

## List of supported currencies with their country’s flag , Store the data locally in a database.

For the list of supported currencies you can use the Cloudmersive API (https://api.cloudmersive.com/docs/currency.asp) to get a list of available currencies and corresponding countries. This API provides a list of currencies with their ISO codes, names, and country names and country flags (https://flagcdn.com/16x12/countryIsoCode.png).

 A few resources:
- [cloudmersive](https://api.cloudmersive.com/docs/currency.asp)
- [Free countries flags icons](https://flagcdn.com/)

 # NOTE ::

 Solving multi requests problem by three solutions:
  - the simple way, for call three api as default.
  - using future.wait().
  - [future.wait() online resource](https://api.flutter.dev/flutter/dart-async/Future/wait.html)
  - using rxDart (ZipStream()).
  - [ZipStream online resource](https://pub.dev/documentation/rxdart/latest/rx/ZipStream-class.html)
 
## Historical data for 2 currencies of your choosing for the last 7 days.
 
 For List Historical data for 2 currencies (USD,CAD) based on (EUR) using Exchange Rates API: This API provides a list of supported currencies with their country's flag, as well as historical data for the last 7 days. The API has a free plan that allows for 250 requests per month.

 A few resources:
- [exchangeratesapi](https://api.exchangeratesapi.io/)

## Currency converter where the user can select 2 currencies with the amount to convert.
 For currency converter where the user can select 2 currencies using currency layer API:  this endpoint, simply specify a from currency code, a to Currency Code, and the amount you would like to convert.

.
 A few resources:
- [currencylayer](https://api.currencylayer.com/)

## B. Adapted design pattern for the app architecture with justification on why to choose it.

- Singleton : class has only one instance, while providing a global access point to this instance example.

- Adapter : convert the interface of one object so that another object can understand it . example :: (model/entity).

- Factory : creating objects in a superclass, but allows subclasses to alter the type of objects that will be created example :: factories in (model class).

- Observable : a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing.

- Repository : Repository Pattern with Layered Architecture provides a clean and robust framework for developing applications that are maintainable, scalable, and easily testableRepository Pattern with Layered Architecture provides a clean and robust framework for developing applications that are maintainable, scalable, and easily testable .


## C. Adapted image loader library with justification on why to choose it.

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


## D. Used database in the app with justification on why to choose it.

Hive is a lightweight, NoSQL database for Flutter that provides a simple and efficient way to store and retrieve data. Here are some benefits of using Hive in Flutter:

- Fast: Hive is designed to be fast and efficient, making it suitable for real-time applications.
- Lightweight: Hive is a lightweight database that doesn't require a lot of resources, making it suitable for mobile devices.
- NoSQL: Hive is a NoSQL database, which means it doesn't require a predefined schema, making it flexible and adaptable to changing data structures.
Support for complex data structures: Hive supports complex data structures such as lists, maps, and sets, making it easy to store and retrieve complex data.
- Encryption: Hive provides built-in encryption, making it easy to secure your data.
Support for multiple platforms: Hive is available on multiple platforms, including Android, iOS, and web.
- Small footprint: Hive has a small footprint, making it suitable for applications with limited storage space.

- [hive online documentation](https://pub.dev/packages/hive)


## unit testing for the API integration & business logic implementation.
We can find all test files for each layer and all use cases.

# NOTE : 
You can use Makefile to execute test commands .
for example : make test_datasource .
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

