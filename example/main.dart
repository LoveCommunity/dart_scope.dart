
import 'package:dart_scope/dart_scope.dart';

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

/// Example simulates:
/// ```dart
/// void rootScope() {
/// 
///   final Repository repository = Repository();
///   final AppNotifier appNotifier = AppNotifier(
///     repository: repository,
///   );
///
///   final myRepository = repository;
///   final myAppNotifier = appNotifier;
/// }
/// ```
Future<void> scopeRootExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(name: 'repository', equal: (scope) => Repository()),
    Final<AppNotifier>(name: 'appNotifier', equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(name: 'repository'),
    )),
  ]);

  final myRepository = rootScope.get<Repository>(name: 'repository');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}

/// Example simulates:
/// ```dart
/// void rootScope() {
/// 
///   final Repository repository1 = Repository();
///   final Repository repository2 = Repository();
///   final Repository repository3 = Repository();
/// 
///   final myRepository1 = repository1;
///   final myRepository2 = repository2;
///   final myRepository3 = repository3;
/// }
/// ```
Future<void> multipleNamesExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(name: 'repository1', equal: (scope) => Repository()),
    Final<Repository>(name: 'repository2', equal: (scope) => Repository()),
    Final<Repository>(name: 'repository3', equal: (scope) => Repository()),
  ]);

  final myRepository1 = rootScope.get<Repository>(name: 'repository1');
  final myRepository2 = rootScope.get<Repository>(name: 'repository2');
  final myRepository3 = rootScope.get<Repository>(name: 'repository3');

  print('myRepository1: $myRepository1');
  print('myRepository2: $myRepository2');
  print('myRepository3: $myRepository3');
}

/// Name can be private, so instance can only be resolved 
/// in current library (mostly current file)
final _privateName = Object();

Future<void> privateNameExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(name: _privateName, equal: (scope) => Repository()),
  ]);

  final myRepository = rootScope.get<Repository>(name: _privateName);

  print('myRepository: $myRepository');
}

/// Name can be omitted, in this case `null` is used as name
Future<void> omitNameExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}

// simulate async resolve instance like `SharedPreferences.getInstance()`
Future<Repository> createRepository() async {
  await Future<void>.delayed(Duration(seconds: 1));
  return Repository();
}

/// Example simulates async setup:
/// ```dart
/// void rootScope() async {
///   final Repository repository = await createRepository();
///   final AppNotifier appNotifier = AppNotifier(
///     repository: repository,
///   );
///
///   final myRepository = repository;
///   final myAppNotifier = appNotifier;
/// }
/// ```
Future<void> scopeRootAsyncExample() async {
  final rootScope = await Scope.root([
    AsyncFinal<Repository>(equal: (scope) async {
      return await createRepository();
    }),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}


class AddTodoNotifier {}

/// Example simulates:
/// ```dart
/// void rootScope() {
///   final Repository repository = Repository();
///   final AppNotifier appNotifier = AppNotifier(
///     repository: repository,
///   ); 
/// 
///   void childScope() {
///     final AddTodoNotifier addTodoNotifier = AddTodoNotifier();
/// 
///     final myRepository = repository;
///     final myAppNotifier = appNotifier;
///     final myAddTodoNotifier = addTodoNotifier;
///   }
/// }
/// ```
Future<void> scopePushExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(equal: (scope) => Repository()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      repository: scope.get<Repository>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  final myRepository = childScope.get<Repository>();
  final myAppNotifier = childScope.get<AppNotifier>();
  final myAddTodoNotifier = childScope.get<AddTodoNotifier>();

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
  print('myAddTodoNotifier: $myAddTodoNotifier');
}

/// Usage of `scope.has<T>()`
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

  print(rootScope.has<Repository>());           // true
  print(rootScope.has<AppNotifier>());          // true
  print(rootScope.has<AddTodoNotifier>());      // false

  print(childScope.has<Repository>());          // true
  print(childScope.has<AppNotifier>());         // true
  print(childScope.has<AddTodoNotifier>());     // true
}

/// Usage of `scope.getOrNull<T>()`
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

  print(rootScope.getOrNull<Repository>());           // Instance of 'Repository'
  print(rootScope.getOrNull<AppNotifier>());          // Instance of 'AppNotifier'
  print(rootScope.getOrNull<AddTodoNotifier>());      // null

  print(childScope.getOrNull<Repository>());          // Instance of 'Repository'
  print(childScope.getOrNull<AppNotifier>());         // Instance of 'AppNotifier'
  print(childScope.getOrNull<AddTodoNotifier>());     // Instance of 'AddTodoNotifier'
}

// Example for `scope.dispose()`
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

  // dispose scope, will also dispose `appNotifier`
  rootScope.dispose();
} 

/// Instance is assigned lazily by default, 
/// set `lazy` to false, so it will be assigned immediately
Future<void> nonLazyFinalExample() async {
  final rootScope = await Scope.root([
    Final<Repository>(
      equal: (scope) => Repository(),
      lazy: false // set to false
    ),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        repository: scope.get<Repository>(),
      ),
      lazy: false // set to false
    ),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}

/// Using inline `Configurable` to setup scope
/// in a customizable way
Future<void> configurableInlineExample() async {
  final rootScope = await Scope.root([
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

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}

/// Split high level configuration into low level `Configurable`
/// which can be reused and composed. This is where `Final`
/// comes from, and how it works:
class MyFinal<T> implements Configurable {

  MyFinal({
    this.name,
    required this.equal,
    this.dispose,
    this.lazy = true,
  });

  final Object? name;
  final Equal<T> equal;
  final DisposeValue<T>? dispose;
  final bool lazy;

  @override
  FutureOr<void> configure(ConfigurableScope scope) {

    final Getter<T> getValue;
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

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier');
}

/// High level configuration is often combined/composed with 
/// low level configurations:
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

Future<void> configurableCombineExample() async {
  final rootScope = await Scope.root([
    AppConfigurables(),
  ]);

  final myRepository = rootScope.get<Repository>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myRepository: $myRepository');
  print('myAppNotifier: $myAppNotifier'); 
}

const examples = {
  'scopeRootExample':             scopeRootExample,
  'multipleNamesExample':         multipleNamesExample,
  'privateNameExample':           privateNameExample,
  'omitNameExample':              omitNameExample,
  'scopeRootAsyncExample':        scopeRootAsyncExample,
  'scopePushExample':             scopePushExample,
  'scopeHasExample':              scopeHasExample,
  'scopeGetOrNullExample':        scopeGetOrNullExample,
  'scopeDisposeExample':          scopeDisposeExample,
  'nonLazyFinalExample':          nonLazyFinalExample,
  'configurableInlineExample':    configurableInlineExample,
  'configurableExample':          configurableExample,
  'configurableCombineExample':   configurableCombineExample,
};

void main() async {
  for (final entry in examples.entries) {
    print('--- ${entry.key} ---');
    await entry.value();
  }
}