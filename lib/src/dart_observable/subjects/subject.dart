
import 'package:disposal/disposal.dart';
import '../observables/observable.dart';
import '../observers/observer.dart';

/// A Subject is a sort of bridge or proxy that acts both as an observer 
/// and as an Observable. Because it is an observer, it can subscribe to one 
/// or more Observables, and because it is an Observable, it can pass through 
/// the items it observes by reemitting them, and it can also emit new items.
/// 
/// Modified from: https://reactivex.io/documentation/subject.html
abstract class Subject<T> implements Observable<T>, Observer<T>, Disposable {}
