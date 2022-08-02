
import 'package:disposal/disposal.dart';
import '../observables/observable.dart';
import '../observers/observer.dart';

abstract class Subject<T> implements Observable<T>, Observer<T>, Disposable {}
