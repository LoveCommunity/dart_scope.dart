
import 'package:dart_scope/dart_scope.dart';

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

/// Example simulates:
/// ```dart
/// void rootScope() {
/// 
///   final PersistenceService persistenceService = PersistenceService();
///   final AppNotifier appNotifier = AppNotifier(
///     persistenceService: persistenceService,
///   );
///
///   final myPersistenceService = persistenceService;
///   final myAppNotifier = appNotifier;
/// }
/// ```
Future<void> scopeRootExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(name: 'persistenceService', equal: (scope) => PersistenceService()),
    Final<AppNotifier>(name: 'appNotifier', equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(name: 'persistenceService'),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>(name: 'persistenceService');
  final myAppNotifier = rootScope.get<AppNotifier>(name: 'appNotifier');

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
}

/// Example simulates:
/// ```dart
/// void rootScope() {
/// 
///   final PersistenceService persistenceService1 = PersistenceService();
///   final PersistenceService persistenceService2 = PersistenceService();
///   final PersistenceService persistenceService3 = PersistenceService();
/// 
///   final myPersistenceService1 = persistenceService1;
///   final myPersistenceService2 = persistenceService2;
///   final myPersistenceService3 = persistenceService3;
/// }
/// ```
Future<void> multipleNamesExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(name: 'persistenceService1', equal: (scope) => PersistenceService()),
    Final<PersistenceService>(name: 'persistenceService2', equal: (scope) => PersistenceService()),
    Final<PersistenceService>(name: 'persistenceService3', equal: (scope) => PersistenceService()),
  ]);

  final myPersistenceService1 = rootScope.get<PersistenceService>(name: 'persistenceService1');
  final myPersistenceService2 = rootScope.get<PersistenceService>(name: 'persistenceService2');
  final myPersistenceService3 = rootScope.get<PersistenceService>(name: 'persistenceService3');

  print('myPersistenceService1: $myPersistenceService1');
  print('myPersistenceService2: $myPersistenceService2');
  print('myPersistenceService3: $myPersistenceService3');
}

/// Name can be private, so instance can only be resolved 
/// in current library (mostly current file)
final _privateName = Object();

Future<void> privateNameExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(name: _privateName, equal: (scope) => PersistenceService()),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>(name: _privateName);

  print('myPersistenceService: $myPersistenceService');
}

/// Name can be omitted, in this case `null` is used as name
Future<void> withoutNameExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
}

/// Example simulates async setup:
/// ```dart
/// void rootScope() async {
///   final PersistenceService persistenceService = await createPersistenceService();
///   final AppNotifier appNotifier = AppNotifier(
///     persistenceService: persistenceService,
///   );
///
///   final myPersistenceService = persistenceService;
///   final myAppNotifier = appNotifier;
/// }
/// ```
Future<void> scopeRootAsyncExample() async {
  // simulate async resolve instance like `SharedPreferences.getInstance()`
  Future<PersistenceService> createPersistenceService() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return PersistenceService();
  }

  final rootScope = await Scope.root([
    AsyncFinal<PersistenceService>(equal: (scope) async {
      return await createPersistenceService();
    }),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
}


class AddTodoNotifier {}

/// Example simulates:
/// ```dart
/// void rootScope() {
///   final PersistenceService persistenceService = PersistenceService();
///   final AppNotifier appNotifier = AppNotifier(
///     persistenceService: persistenceService,
///   ); 
/// 
///   void childScope() {
///     final AddTodoNotifier addTodoNotifier = AddTodoNotifier();
/// 
///     final myPersistenceService = persistenceService;
///     final myAppNotifier = appNotifier;
///     final myAddTodoNotifier = addTodoNotifier;
///   }
/// }
/// ```
Future<void> scopePushExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(equal: (scope) => PersistenceService()),
    Final<AppNotifier>(equal: (scope) => AppNotifier(
      persistenceService: scope.get<PersistenceService>(),
    )),
  ]);

  final childScope = await rootScope.push([
    Final<AddTodoNotifier>(equal: (scope) => AddTodoNotifier()),
  ]);

  final myPersistenceService = childScope.get<PersistenceService>();
  final myAppNotifier = childScope.get<AppNotifier>();
  final myAddTodoNotifier = childScope.get<AddTodoNotifier>();

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
  print('myAddTodoNotifier: $myAddTodoNotifier');
}

/// Usage of `scope.has<T>()`
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

  print(rootScope.has<PersistenceService>());   // true
  print(rootScope.has<AppNotifier>());          // true
  print(rootScope.has<AddTodoNotifier>());      // false

  print(childScope.has<PersistenceService>());  // true
  print(childScope.has<AppNotifier>());         // true
  print(childScope.has<AddTodoNotifier>());     // true
}

/// Usage of `scope.getOrNull<T>()`
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

// Example for `scope.dispose()`
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

  // dispose scope, will also dispose `appNotifier`
  rootScope.dispose();
} 

/// Instance is assigned lazily by default, 
/// set `lazy` to false, so it will be assigned immediately
Future<void> nonLazyFinalExample() async {
  final rootScope = await Scope.root([
    Final<PersistenceService>(
      equal: (scope) => PersistenceService(),
      lazy: false // set to false
    ),
    Final<AppNotifier>(
      equal: (scope) => AppNotifier(
        persistenceService: scope.get<PersistenceService>(),
      ),
      lazy: false // set to false
    ),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
}

/// Using inline `Configurable` to setup scope
/// in a customizable way
Future<void> configurableInlineExample() async {
  final rootScope = await Scope.root([
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

  print('myPersistenceService: $myPersistenceService');
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

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier');
}

/// High level configuration is often combined/composed with 
/// low level configurations:
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

Future<void> configurableCombineExample() async {
  final rootScope = await Scope.root([
    AppConfigurables(),
  ]);

  final myPersistenceService = rootScope.get<PersistenceService>();
  final myAppNotifier = rootScope.get<AppNotifier>();

  print('myPersistenceService: $myPersistenceService');
  print('myAppNotifier: $myAppNotifier'); 
}

const examples = {
  'scopeRootExample':             scopeRootExample,
  'multipleNamesExample':         multipleNamesExample,
  'privateNameExample':           privateNameExample,
  'withoutNameExample':           withoutNameExample,
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