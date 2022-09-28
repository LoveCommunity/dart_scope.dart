## 0.1.0-alpha.4

- refactor
  - rethrow future error using async/await [\#126](https://github.com/LoveCommunity/dart_scope.dart/pull/126) ([beeth0ven](https://github.com/beeth0ven))

## 0.1.0-alpha.3

- feature 
  - add `Async<T>` [\#123](https://github.com/LoveCommunity/dart_scope.dart/pull/123) ([beeth0ven](https://github.com/beeth0ven))

## 0.1.0-alpha.2

- refactor 
  - merge `Final`, `LateFinal` and `FinalBase` into `Final` [\#113](https://github.com/LoveCommunity/dart_scope.dart/pull/113) ([beeth0ven](https://github.com/beeth0ven))
  - merge `FinalStates`, `LateFinalStates` and `FinalStatesBase` into `FinalStates` [\#112](https://github.com/LoveCommunity/dart_scope.dart/pull/112) ([beeth0ven](https://github.com/beeth0ven))
  - merge `FinalStatesConvertible`, `LateFinalStatesConvertible` and `FinalStatesConvertibleBase` into `FinalStatesConvertible` [\#111](https://github.com/LoveCommunity/dart_scope.dart/pull/111) ([beeth0ven](https://github.com/beeth0ven))
  - rename `Computed.late` to `Computed.lazy` [\#116](https://github.com/LoveCommunity/dart_scope.dart/pull/116) ([beeth0ven](https://github.com/beeth0ven))
  - add @experimental annotation to `ConfigurableCompose` [\#120](https://github.com/LoveCommunity/dart_scope.dart/pull/120) ([beeth0ven](https://github.com/beeth0ven))
  - add @experimental annotation to `Computed` [\#118](https://github.com/LoveCommunity/dart_scope.dart/pull/118) ([beeth0ven](https://github.com/beeth0ven))
  - simplify implementation of `ConfigurableCombine` [\#119](https://github.com/LoveCommunity/dart_scope.dart/pull/119) ([beeth0ven](https://github.com/beeth0ven))

## 0.1.0-alpha.1

* add `tests.yaml` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/3
* add `Observer` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/4
* add `ObserverFunction` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/5
* add `Observable` interface by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/6
* add `CreateObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/7
* add `MapObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/8
* export `Disposable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/9
* add `CastObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/10
* test - add `ObservableTester` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/11
* add operator `Observable.combine` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/12
* replace `observableA` with `observable1` in combine test by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/13
* add operator `Observable.combine2` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/14
* replace `disposeA` with `dispose1` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/15
* feature - add `test_gen` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/16
* add operator `Observable.combine3` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/17
* add `ProxyObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/18
* refactor `CombineObservable*` to extends `CombineObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/19
* add operator `observable.where` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/20
* add operator `observable.distinct` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/21
* add operator `observable.distinctMap` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/22
* add operator `observable.skip` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/23
* add `Subject` interface by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/24
* add `PublishSubject` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/25
* add `ValueSubject` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/26
* add `ReplaySubject` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/27
* add operator `observable.multicast` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/28
* add operator `observable.multicastReplay` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/29
* add `Driver` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/30
* add `observable.asDriver` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/31
* add `DriverTester` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/32
* add `Driver` default constructor by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/33
* add operator `driver.map` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/34
* add operator `driver.cast` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/35
* add operator `driver.distinct` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/36
* add operator `driver.select` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/37
* add operator `driver.cache` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/38
* add operators `driver.skip` and `driver.skipFirst` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/39
* replace 'map observable ' to '`observable.map`' in all test descriptions by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/40
* improve names in test by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/41
* rename test files by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/42
* add `driver.first` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/43
* Refactor - rename test_gen files by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/44
* extract `observableCombineTestHeader` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/45
* rename `CombineObservable...` to `ObservableCombine...` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/46
* extract `testAll` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/47
* rename test_gen test by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/48
* add operator `Driver.combine` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/49
* rename `observable_combine_test.dart` to `combine_test.dart` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/50
* add `DriverCombineTestGenerator` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/51
* add operator `Driver.combine{2,3}` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/52
* refactor `Observable.combine` to replace `Object?` with `T` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/53
* rename `Driver` to `States` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/54
* rename `StatesLatestValueNotReplayError` to `LatestStateNotReplayError` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/55
* rename `data` to `state` when using `States` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/56
* improve `states.first` implementation by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/57
* initial `Scope` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/58
* add `scope.push` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/59
* Feature/scope dispose by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/60
* improve `scope` type test by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/61
* add `scope.get` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/62
* add `ConfigurableFunction` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/63
* add `Configurable.combine` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/64
* add `Final` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/65
* add `scope.addDispose` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/66
* use `scope.addDispose` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/67
* restructure test files by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/68
* add `AsyncFinal` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/69
* extract `exposeInScope` method by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/70
* scope auto dispose if configuration throw error by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/71
* rename `CombineObservable` to `ObservableCombine` etc. by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/73
* rename `CombineConfigurable` to `ConfigurableCombine` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/74
* remove `ProxyObservable` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/75
* make `ConfigurableCombine` abstract class by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/76
* add `states.activated` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/77
* add `ConfigurableCompose` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/78
* refactor `ConfigurableCombine` to extends `ConfigurableCompose` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/79
* extract `FinalBase` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/80
* Feature/final states by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/82
* Refactor/rename instance to value by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/83
* dev - add lints by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/84
* feature - add `FinalStatesConvertible` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/86
* make `FinalBase.late` parameter default to false in test by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/87
* upgrade `disposal` to 0.1.0-alpha.3 by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/89
* Refactor/rename observable children by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/90
* Refactor/rename states children by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/91
* rename `children` to `configurables` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/92
* tests verify `expose` use `scope.has` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/93
* remove `FinalStates.expose` parameter by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/94
* Feature/computed by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/95
* add configurable `Computed2` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/96
* add `ConfigurableComputedTestGenerator` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/97
* extract code gen method `code` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/98
* Refactor/tests by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/99
* Feature/computed3 by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/100
* Meta/meta by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/101
* downgrade `analyzer` min to 4.0.0 by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/102
* Ci/publish by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/103
* Refactor/rename package by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/105
* rename package to `dart_scope` to avoid name conflict by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/104
* rename `observables` to `dart_observable` to avoid name conflict by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/106
* rename annotation file `*_test.dart` to `*_test_annotation.dart` by @beeth0ven in https://github.com/LoveCommunity/dart_scope.dart/pull/107
