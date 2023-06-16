
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test('Observation configuration identity', () {

    final observable = _MockObservable<int>();
    void onData(data) {}

    final observation = _Observation<int>(
      configuration: observable,
      emit: onData,
    );

    final isConfigurationIdentical = identical(observation.configuration, observable);
    final isEmitIdentical = identical(observation.emit, onData);

    expect(isConfigurationIdentical, true);
    expect(isEmitIdentical, true);
    
  });

  test('Observation lifecycle', () {

    final invokes = <String>[];

    final observable = _MockObservable<int>(
      onInit: () => invokes.add('onInit'),
      onDispose: () => invokes.add('onDispose'),
    );

    final observation = _Observation<int>(
      configuration: observable,
      emit: (data) { },
    );
    expect(invokes, [
      'onInit'
    ]);

    observation.dispose();
    expect(invokes, [
      'onInit',
      'onDispose',
    ]);

  });
}

class _MockObservable<T> implements Observable<T> {
  _MockObservable({
    this.onInit,
    this.onDispose,
  });
  final VoidCallback? onInit;
  final VoidCallback? onDispose;
  
  @override
  Disposable observe(OnData<T> onData) {
    throw UnimplementedError();
  }
}

class _Observation<T> extends Observation<_MockObservable<T>, T> {

  _Observation({
    required super.configuration, 
    required super.emit,
  });

  @override
  void init() {
    configuration.onInit?.call();
  }

  @override
  void dispose() {
    configuration.onDispose?.call();
  }
}