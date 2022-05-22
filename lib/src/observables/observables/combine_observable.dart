
import 'package:meta/meta.dart';
import 'package:disposal/disposal.dart';

import '../observers/observer.dart';
import 'observable.dart';


@internal
class CombineObservable<R> implements Observable<R> {

  const CombineObservable({
    required List<Observable<Object?>> children,
    required R Function(List<Object?> items) combiner,
  }): _children = children,
    _combiner = combiner;

  final List<Observable<Object?>> _children;
  final R Function(List<Object?> items) _combiner;

  @override
  Disposable observe(OnData<R> onData) {
    if (_children.isEmpty) {
      return Disposable.empty;
    }

    final length = _children.length;
    final emitted = <int>{};
    final latests = List<Object?>.filled(length, null);

    Disposable _observe(int index) {
      return _children[index].observe((data) {
        if (!emitted.contains(index)) {
          emitted.add(index);
        }
        latests[index] = data;
        if (emitted.length == length) {
          final result = _combiner(List.from(latests)); 
          onData(result);
        }
      });
    }

    final observations = Iterable<Disposable>
      .generate(length, _observe)
      .toList();

    return Disposable.combine(
      children: observations,
    );
  }
}
