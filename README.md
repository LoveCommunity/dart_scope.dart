# dart_scope

[![Build Status](https://github.com/LoveCommunity/dart_scope.dart/workflows/Tests/badge.svg)](https://github.com/LoveCommunity/dart_scope.dart/actions/workflows/tests.yaml)
[![Coverage Status](https://img.shields.io/codecov/c/github/LoveCommunity/dart_scope.dart/main.svg)](https://codecov.io/gh/LoveCommunity/dart_scope.dart) 
[![Pub](https://img.shields.io/pub/v/dart_scope)](https://pub.dev/packages/dart_scope)

A declarative dependency injection library which use dart syntax and flutter style

## Features

* Dart only without flutter as dependency
* Configuration is aligned with syntax of dart language
* Configuration is aligned with style of flutter widget 
* Scope strategy is aligned with scoping of functions
* Configuration is composable/decomposable
* Can handle async setup

## Table Of Content
- [dart_scope](#dart_scope)
  - [Features](#features)
  - [Table Of Content](#table-of-content)
  - [Quick Tour](#quick-tour)
    - [Usage of `Scope.root(...)`](#usage-of-scoperoot)
    - [Usage of `name`](#usage-of-name)
    - [`Scope.root(...)` async setup](#scoperoot-async-setup)
    - [Usage of `scope.push(...)`](#usage-of-scopepush)
    - [Usage of `scope.has<T>(...)`](#usage-of-scopehast)
    - [Usage of `scope.getOrNull<T>(...)`](#usage-of-scopegetornullt)
    - [Usage of `scope.dispose()`](#usage-of-scopedispose)
    - [(Non)Lazily assignment](#nonlazily-assignment)
  - [Advanced](#advanced)
    - [Configurable](#configurable)
    - [Inline `Configurable`](#inline-configurable)
    - [Decompose configuration](#decompose-configuration)
    - [Compose configurations](#compose-configurations)

## Quick Tour

Let's explore with quick examples, assume we have following classes:

```dart
class Repository {
  // ...implementations  
}

class AppNotifier {
  AppNotifier({
    required this.repository,
  });
  final Repository repository;

  // ...implementations

  void dispose() {}
}
```

### Usage of `Scope.root(...)`

Use `Scope.root(...)` to create a top level scope with configurations:

```dart
Future<void> scopeRootExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(name: 'repository', equal: (scope) => Repository()),
    Final<AppNotifier>(name: 'appNotifier', equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(name: 'repository'),
    )),
  ]);

  // resolve instances
  final myRepository = rootScope.get<Repository>(name: 'repository');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');
}
```

A `rootScope` is created which expose singletons of `Repository` and `AppNotifier`. Later, these instances can be resolved by calling `scope.get<T>(...)`. Above example simulates:

```dart
void rootScope() {  // `{` is the start of scope

  // create and expose instances in current scope
  final Repository repository = Repository();
  final AppNotifier appNotifier = AppNotifier(
    repository: repository,
  );

  // resolve instances in current scope
  final myRepository = repository;
  final myAppNotifier = appNotifier;

}                   // `}` is the end of scope
```

This simple pseudocode shown:
  - function scope that starts with `{`, ends with `}`
  - how to create and expose instances in current scope
  - how to resolve instances in current scope

### Usage of `name`

Use different names to create multiple instances: 

```dart
Future<void> multipleNamesExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(name: 'repository1', equal: (scope) => Repository()),
    Final<Repository>(name: 'repository2', equal: (scope) => Repository()),
    Final<Repository>(name: 'repository3', equal: (scope) => Repository()),
  ]);

  final myRepository1 = rootScope.get<Repository>(name: 'repository1');
  final myRepository2 = rootScope.get<Repository>(name: 'repository2');
  final myRepository3 = rootScope.get<Repository>(name: 'repository3');
}
```

Which simulates: 

```dart
void rootScope() {

  final Repository repository1 = Repository();
  final Repository repository2 = Repository();
  final Repository repository3 = Repository();

  final myRepository1 = repository1;
  final myRepository2 = repository2;
  final myRepository3 = repository3;
}
```

Name can be private, so instance will only be resolved in current library (mostly current file):

```dart
// name is private in current library
final _privateName = Object();

Future<void> privateNameExample() async {
  final rootScope = await Scope.root([
    // use private name
    Final<Repository>(name: _privateName, equal: (scope) => Repository()),
  ]);

  final myRepository = rootScope.get<Repository>(name: _privateName);
}
```

Name can also be omitted, in this case `null` is used as name:

```dart
Future<void> omitNameExample() async {
  final rootScope = await Scope.root([
    // assigned without name
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  // also resolved without name
  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

### `Scope.root(...)` async setup

If there is async setup like resolving `SharedPreferences`. We can follow this:

```dart
// simulate async resolve instance like `SharedPreferences.getInstance()`
Future<Repository> createRepositoryAsync() async {
  await Future<void>.delayed(Duration(seconds: 1));
  return Repository();
}

Future<void> scopeRootAsyncExample() async {
  final rootScope = await Scope.root([
    // using `AsyncFinal` to handle async setup
    AsyncFinal<Repository>(equal: (scope) async {
      return await createRepositoryAsync();
    }),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

Above example simulates:

```dart
void rootScope() async {
  final Repository repository = await createRepositoryAsync();
  final AppNotifier appNotifier = AppNotifier(
    repository: repository,
  );

  final myRepository = repository;
  final myAppNotifier = appNotifier;
}
```

### Usage of `scope.push(...)`

Use `scope.push(...)` to create a new child scope. Child scope inherited getters from parent:

```dart
class AddTodoNotifier {}

Future<void> scopePushExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  // create child scope
  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  // resolve instances in child scope
  final myRepository = childScope.get<Repository>();
  final myAppNotifier = childScope.get<AppNotifier>();
  final myAddTodoNotifier = childScope.get<AddTodoNotifier>();
}
```

Which simulates::

```dart
void rootScope() {                                                    
  final Repository repository = Repository();
  final AppNotifier appNotifier = AppNotifier(
    repository: repository,
  ); 

  void childScope() {
    final AddTodoNotifier addTodoNotifier = AddTodoNotifier();

    // resolve instances:
    //  `repository`      is inherited from parent scope
    //  `appNotifier`     is inherited from parent scope
    //  `addTodoNotifier` is exposed in current scope
    final myRepository = repository; 
    final myAppNotifier = appNotifier;
    final myAddTodoNotifier = addTodoNotifier;
  }
}
```

### Usage of `scope.has<T>(...)`

Use `scope.has<T>(...)` to check if instance has been exposed:

```dart
Future<void> scopeHasExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  // check parent scope
  print(rootScope.has<Repository>());       // true
  print(rootScope.has<AppNotifier>());      // true
  print(rootScope.has<AddTodoNotifier>());  // false

  // check child scope
  print(childScope.has<Repository>());      // true
  print(childScope.has<AppNotifier>());     // true
  print(childScope.has<AddTodoNotifier>()); // true
}
```

### Usage of `scope.getOrNull<T>(...)`

Use `scope.getOrNull<T>(...)` to safely resolve instance. This method will return `null` when instance is not exposed::

```dart
Future<void> scopeGetOrNullExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  print(rootScope.getOrNull<Repository>());       // Instance of 'Repository'
  print(rootScope.getOrNull<AppNotifier>());      // Instance of 'AppNotifier'
  print(rootScope.getOrNull<AddTodoNotifier>());  // null

  print(childScope.getOrNull<Repository>());      // Instance of 'Repository'
  print(childScope.getOrNull<AppNotifier>());     // Instance of 'AppNotifier'
  print(childScope.getOrNull<AddTodoNotifier>()); // Instance of 'AddTodoNotifier'
}
```

### Usage of `scope.dispose()`

As opposite to `scope.push`, scope can also be disposed/popped. We can register dispose logic, that will run when scope been disposed: 

```dart
Future<void> scopeDisposeExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        repository: scope.get<Repository>(),
      ),
      // register dispose instance logic
      dispose: (appNotifier) => appNotifier.dispose(),
    ),
  ]);

  // dispose scope will also dispose `appNotifier`
  rootScope.dispose();
}
```

### (Non)Lazily assignment

Instances are assigned lazily by default, which means it will be assigned when accessed for the first time. If we need them to be immediately assigned, just set `lazy` to `false`:

```dart
Future<void> nonLazyFinalExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(
      equal: (scope) => Repository(),
      lazy: false // set lazy to false
    ),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        repository: scope.get<Repository>(),
      ),
      lazy: false // set lazy to false
    ),
  ]);
}
```

## Advanced

We've covered basic part of `dart_scope`:
* Configuration is aligned with syntax of dart language
* Scope strategy is aligned with scoping of functions
* Can handle async setup

Next, we'll explore advanced features:
* Configuration is aligned with style of flutter widget 
* Configuration is composable/decomposable

### Configurable

We have used `Scope.root` and `scope.push` to create new scope:

```dart
class Scope {
  // Scope.root(...)
  static FutureOr<Scope> root(List<Configurable> configure);

  // scope.push(...)
  FutureOr<Scope> push(List<Configurable> configure);
  ...
}
```

Creating `Scope` needs configuration which called `Configurable`:

```dart
abstract class Configurable {
  FutureOr<void> configure(ConfigurableScope scope);
}
```

`Configurable` is an interface which required a `configure` method. Let's explore with some examples.

### Inline `Configurable`

Previously, we've seen this example:

```dart
Future<void> example() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        repository: scope.get<Repository>(),
      ),
      dispose: (appNotifier) => appNotifier.dispose(),
    ),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

We can achieve same thing using inline `Configurable`:

```dart
Future<void> configurableInlineExample() async {
  final rootScope = await Scope.root([

    // inline `Configurable`
    Configurable((scope) {
      // build dependency graph
      late final Repository repository = Repository();
      late final AppNotifier appNotifier = AppNotifier(
        repository: repository,
      );
      // expose instances in current scope
      scope.expose<Repository>(expose: () => repository);
      scope.expose<AppNotifier>(expose: () => appNotifier);
      // register dispose logic
      scope.addDispose(() {
        appNotifier.dispose();
      });
      // done
    }),

  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

Inline `Configurable` use a closure `(scope) { ... }` to configure current scope with steps:
  1. build dependency graph using assignment `late final Repository repository = Repository();`
  2. expose instance using `scope.expose(...)`
  3. register dispose logic using `scope.addDispose(...)`

This closure will run only once during scope creation. It is used to configure scope in a customizable way. Inline `Configurable` is just for convenience, if we need scale up, then can create class that implements `Configurable` interface.

### Decompose configuration

In general, high level configuration can be split into low level `Configurable`, which is easier reused and composed. That is where `Final` comes from, and how it works:

```dart
class MyFinal<T> implements Configurable {

  MyFinal({
    this.name,
    required this.equal,
    this.dispose,
    this.lazy = true,
  });

  final Object? name;
  final T Function(ScopeGet scope) equal;
  final void Function(T)? dispose;
  final bool lazy;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final T Function() getValue;
    if (lazy) {
      late final instance = equal(scope);
      getValue = () => instance;
    } else {
      final instance = equal(scope);
      getValue = () => instance;
    }

    scope.expose<T>(name: name, expose: getValue);
    
    if (dispose != null) {
      scope.addDispose(() {
        final instance = getValue();
        dispose!(instance);
      });
    }
  }
}
```

`Configurable` is like a flutter widget, `configure` method is like `build` method. Now we can use `MyFinal` like this:

```dart
Future<void> configurableExample() async {
  final rootScope = await Scope.root([
    MyFinal<Repository>(
      name: 'repository',
      equal: (scope) => Repository(),
      lazy: false,
    ),
    MyFinal<AppNotifier>(
      name: 'appNotifier',
      equal: (scope) => AppNotifier(
        repository: scope.get<Repository>(name: 'repository'),
      ),
      lazy: false,
      dispose: (appNotifier) => appNotifier.dispose(),
    ),
  ]);

  final myRepository = rootScope.get<Repository>(name: 'repository');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');
}
```

### Compose configurations

High level configuration is often combined/composed with low level configurations:

```dart
class AppConfigurables extends ConfigurableCombine {

  const AppConfigurables({
    this.repositoryName,
    this.appNotifierName,
    this.lazy = true,
    this.dispose = true,
  });

  final Object? repositoryName;
  final Object? appNotifierName;
  final bool lazy;
  final bool dispose;

  @override
  List<Configurable> combine() {
    return [
      MyFinal<Repository>(
        name: repositoryName,
        equal: (scope) => Repository(),
        lazy: lazy,
      ),
      MyFinal<AppNotifier>(
        name: appNotifierName,
        equal: (scope) => AppNotifier(
          repository: scope.get<Repository>(name: repositoryName),
        ),
        lazy: lazy,
        dispose: dispose 
          ? (appNotifier) => appNotifier.dispose() 
          : null,
      ),
    ];
  }
}
```

`AppConfigurables` is composition of multiple `Configurable`, like high level flutter widget is composition of low level widgets. Then it can be used as:

```dart
Future<void> configurableCombineExample() async {
  final rootScope = await Scope.root([
    AppConfigurables(),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

That is it.