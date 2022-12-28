# dart_scope <!-- no toc --> 

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
    - [Usage of `Scope.root`](#usage-of-scoperoot)
    - [Usage of `name`](#usage-of-name)
    - [`Scope.root` async setup](#scoperoot-async-setup)
    - [Usage of `scope.push(...)`](#usage-of-scopepush)
    - [Usage of `scope.has<T>()`](#usage-of-scopehast)
    - [Usage of `scope.getOrNull<T>()`](#usage-of-scopegetornullt)
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
class PersistenceService {
  // ...implementations  
}

class AppNotifier {
  AppNotifier({
    required this.persistenceService,
  });
  final PersistenceService persistenceService;
  // ...implementations
  void dispose() {}
}
```

`PersistenceService` has no dependency. And `AppNotifier` depend on `PersistenceService`.

### Usage of `Scope.root`

```dart
Future<void> scopeRootExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(name: 'persistenceService', equal: (scope) => PersistenceService()),
    Final<AppNotifier>(name: 'appNotifier', equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(name: 'persistenceService'),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>(name: 'persistenceService');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');
}
```

We created a `rootScope` which expose singletons of `PersistenceService` and `AppNotifier`. Later we can resolve those instance by calling `scope.get<T>()`. Above example simulates:

```dart
void rootScope() {  // `{` is the start of scope

  // create and expose instances in current scope
  final PersistenceService persistenceService = PersistenceService();
  final AppNotifier appNotifier = AppNotifier(
    persistenceService: persistenceService,
  );

  // we can resolve instances in current scope
  final myPersistenceService = persistenceService;
  final myAppNotifier = appNotifier;

}                   // `}` is the end of scope
```

This simple pseudocode shown:
  - function scope that starts with `{`, ends with `}`
  - how to create instances with dependencies in current scope
  - how to resolve instances in current scope

### Usage of `name`

We can use different names to create multiple instances. 

```dart
Future<void> multipleNamesExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(name: 'persistenceService1', equal: (scope) => PersistenceService()),
    Final<PersistenceService>(name: 'persistenceService2', equal: (scope) => PersistenceService()),
    Final<PersistenceService>(name: 'persistenceService3', equal: (scope) => PersistenceService()),
  ]);

  final myPersistenceService1 = rootScope.get<PersistenceService>(name: 'persistenceService1');
  final myPersistenceService2 = rootScope.get<PersistenceService>(name: 'persistenceService2');
  final myPersistenceService3 = rootScope.get<PersistenceService>(name: 'persistenceService3');
}
```

Which simulates: 

```dart
void rootScope() {

  final PersistenceService persistenceService1 = PersistenceService();
  final PersistenceService persistenceService2 = PersistenceService();
  final PersistenceService persistenceService3 = PersistenceService();

  final myPersistenceService1 = persistenceService1;
  final myPersistenceService2 = persistenceService2;
  final myPersistenceService3 = persistenceService3;
}
```

Name can be private, so instance can only be resolved in current library (mostly current file):

```dart
// name is private in current library
final _privateName = Object();

Future<void> privateNameExample() async {
  final rootScope = await Scope.root([
    // use private name
    Final<PersistenceService>(name: _privateName, equal: (scope) => PersistenceService()),
  ]);

  // instance can only be resolved in current library with private name
  final myPersistenceService = rootScope.get<PersistenceService>(name: _privateName);
}
```

Name can also be omitted, in this case `null` is used as name:

```dart
Future<void> withoutNameExample() async {
  final rootScope = await Scope.root([
    // assigned without name
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  // also resolved without name
  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

### `Scope.root` async setup

If there is async setup like resolving `SharedPreferences`. We can follow this:

```dart
Future<void> scopeRootAsyncExample() async {
  // simulate async resolve instance like `SharedPreferences.getInstance()`
  Future<PersistenceService> createPersistenceService() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return PersistenceService();
  }

  final rootScope = await Scope.root([
    // using `AsyncFinal` to handle async setup
    AsyncFinal<PersistenceService>(equal: (scope) async {
      return await createPersistenceService();
    }),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

Above example simulates:

```dart
void rootScope() async {
  final PersistenceService persistenceService = await createPersistenceService();
  final AppNotifier appNotifier = AppNotifier(
    persistenceService: persistenceService,
  );

  final myPersistenceService = persistenceService;
  final myAppNotifier = appNotifier;
}
```

### Usage of `scope.push(...)`

Use `scope.push(...)` to create a new child scope:

```dart
class AddTodoNotifier {}

Future<void> scopePushExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  // create child scope
  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  // resolve instances in child scope
  final myPersistenceService = childScope.get<PersistenceService>();
  final myAppNotifier = childScope.get<AppNotifier>();
  final myAddTodoNotifier = childScope.get<AddTodoNotifier>();
}
```

Child scope inherited getters from parent, as:

```dart
void rootScope() {                                                    
  final PersistenceService persistenceService = PersistenceService();
  final AppNotifier appNotifier = AppNotifier(
    persistenceService: persistenceService,
  ); 

  void childScope() {
    final AddTodoNotifier addTodoNotifier = AddTodoNotifier();

    // resolve instances:
    //  `persistenceService` is inherited from parent scope
    //  `appNotifier`        is inherited from parent scope
    //  `addTodoNotifier`    is exposed in current scope
    final myPersistenceService = persistenceService; 
    final myAppNotifier = appNotifier;
    final myAddTodoNotifier = addTodoNotifier;
  }
}
```

### Usage of `scope.has<T>()`

We can use `scope.has<T>()` to check if instance has been exposed:

```dart
Future<void> scopeHasExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  // check parent scope
  print(rootScope.has<PersistenceService>());   // true
  print(rootScope.has<AppNotifier>());          // true
  print(rootScope.has<AddTodoNotifier>());      // false

  // check child scope
  print(childScope.has<PersistenceService>());  // true
  print(childScope.has<AppNotifier>());         // true
  print(childScope.has<AddTodoNotifier>());     // true
}
```

### Usage of `scope.getOrNull<T>()`

We can use `scope.getOrNull<T>()` to safely resolve instance. This method will not throw error when instance is not exposed, instead `null` is returned:

```dart
Future<void> scopeGetOrNullExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  print(rootScope.getOrNull<PersistenceService>());   // Instance of 'PersistenceService'
  print(rootScope.getOrNull<AppNotifier>());          // Instance of 'AppNotifier'
  print(rootScope.getOrNull<AddTodoNotifier>());      // null

  print(childScope.getOrNull<PersistenceService>());  // Instance of 'PersistenceService'
  print(childScope.getOrNull<AppNotifier>());         // Instance of 'AppNotifier'
  print(childScope.getOrNull<AddTodoNotifier>());     // Instance of 'AddTodoNotifier'
}
```

### Usage of `scope.dispose()`

Scope can be disposed/popped. We can register dispose logic, that will run when scope been disposed: 

```dart
Future<void> scopeDisposeExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        persistenceService: scope.get<PersistenceService>(),
      ),
      // register dispose instance logic
      dispose: (appNotifier) => appNotifier.dispose(),
    ),
  ]);

  // dispose/pop scope will also dispose `appNotifier`
  rootScope.dispose();
}
```

### (Non)Lazily assignment

Instances are assigned lazily by default, which means it will be assigned when accessed for the first time. If we need them to be immediately assigned, just set `lazy` to `false`:

```dart
Future<void> nonLazyFinalExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(
      equal: (scope) => PersistenceService(),
      lazy: false // set lazy to false
    ),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        persistenceService: scope.get<PersistenceService>(),
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

Next, we will explore advanced features:
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

`Configurable` is an interface which require `configure` method. It's okay if we're a little confused. Things will become clear when it's in the right context.

### Inline `Configurable`

Previously, we've seen this simple example:

```dart
Future<void> withoutNameExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
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
      late final PersistenceService persistenceService = PersistenceService();
      late final AppNotifier appNotifier = AppNotifier(
        persistenceService: persistenceService,
      );
      // expose instances in current scope
      scope.expose<PersistenceService>(expose: () => persistenceService);
      scope.expose<AppNotifier>(expose: () => appNotifier);
      // register dispose logic
      scope.addDispose(() {
        appNotifier.dispose();
      });
      // done
    }),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

This inline `Configurable` can also be used to setup scope in a customizable way.

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

    scope.expose(name: name, expose: getValue);
    
    if (dispose != null) {
      scope.addDispose(() {
        final instance = getValue();
        dispose!(instance);
      });
    }
  }
}
```

`Configurable` is like a flutter widget, `configure` method is like `build` method. But `configure` will only run once during scope creation. Now we can use `MyFinal` like this:

```dart
Future<void> configurableExample() async {
  final rootScope = await Scope.root([
    MyFinal<PersistenceService>(
      name: 'persistenceService',
      equal: (scope) => PersistenceService(),
      lazy: false,
    ),
    MyFinal<AppNotifier>(
      name: 'appNotifier',
      equal: (scope) => AppNotifier(
        persistenceService: scope.get<PersistenceService>(name: 'persistenceService'),
      ),
      lazy: false,
      dispose: (appNotifier) => appNotifier.dispose(),
    ),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>(name: 'persistenceService');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');
}
```

### Compose configurations

High level configurable is often combined/composed with low level configurations:

```dart
class AppConfigurables extends ConfigurableCombine {

  const AppConfigurables({
    this.persistenceServiceName,
    this.appNotifierName,
    this.lazy = true,
    this.dispose = true,
  });

  final Object? persistenceServiceName;
  final Object? appNotifierName;
  final bool lazy;
  final bool dispose;

  @override
  List<Configurable> combine() {
    return [
      MyFinal<PersistenceService>(
        name: persistenceServiceName,
        equal: (scope) => PersistenceService(),
        lazy: lazy,
      ),
      MyFinal<AppNotifier>(
        name: appNotifierName,
        equal: (scope) => AppNotifier(
          persistenceService: scope.get<PersistenceService>(name: persistenceServiceName),
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

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();
}
```

That is it.