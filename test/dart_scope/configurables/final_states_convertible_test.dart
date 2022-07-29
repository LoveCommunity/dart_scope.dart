
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../../dart_observable/shared/states_tester.dart';
import '../shared/mock_configurable.dart';

void main() {

  test('`FinalStatesConvertibleBase` is sync configuration', () {

    final scope = Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) => _MockSubject('a'),
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);
    
    expect(scope, isA<Scope>());
  });

  test('`FinalStatesConvertibleBase` share same value and states in scope', () async {

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) => _MockSubject('a'),
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);

    final subject1 = scope.get<_MockSubject<String>>();
    final subject2 = scope.get<_MockSubject<String>>();
    final states1 = scope.get<States<String>>();
    final states2 = scope.get<States<String>>();

    final isSubjectIdentical = identical(subject1, subject2);
    final isStatesIdentical = identical(states1, states2);

    expect(isSubjectIdentical, true);
    expect(isStatesIdentical, true);

  });

  test('`FinalStatesConvertibleBase` share same value and states in scope with name', () async {

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: 'subject',
        equal: (_) => _MockSubject('a'),
        statesName: 'states',
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);

    final subject1 = scope.get<_MockSubject<String>>(name: 'subject');
    final subject2 = scope.get<_MockSubject<String>>(name: 'subject');
    final states1 = scope.get<States<String>>(name: 'states');
    final states2 = scope.get<States<String>>(name: 'states');

    final isSubjectIdentical = identical(subject1, subject2);
    final isStatesIdentical = identical(states1, states2);

    expect(isSubjectIdentical, true);
    expect(isStatesIdentical, true);

  });

  test('`FinalStatesConvertibleBase` assign value which depends on other scope value', () async {
    
    final scope = await Scope.root([
      MockConfigurable((scope) {
        scope.expose<int>(expose: () => 0);
      }),
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (scope) {
          final value = scope.get<int>().toString();
          return _MockSubject(value);
        },
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);

    final subject = scope.get<_MockSubject<String>>();

    expect(subject.value, '0');

  });

  test('`FinalStatesConvertibleBase` assign states success', () async {

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) => _MockSubject('a'),
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);
    
    final subject = scope.get<_MockSubject<String>>();
    final states = scope.get<States<String>>();

    final tester = StatesTester(
      states,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, <String>[
      'a',
      'b',
    ]);

    tester.stopObserve();

  });

  test('`FinalStatesConvertibleBase` expose value and states using custom `expose`', () async {

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) => _MockSubject('a'),
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: (scope, getSubject, getStates) {
          scope.expose<Observer<String>>(expose: getSubject);
        },
        dispose: null,
        late: false,
      ),
    ]);
    
    final hasSubject = scope.has<_MockSubject<String>>();
    final hasStates = scope.has<States<String>>();
    final hasObserver = scope.has<Observer<String>>();

    expect(hasSubject, false);
    expect(hasStates, false);
    expect(hasObserver, true);

  });

  test('`FinalStatesConvertibleBase` register value dispose logic using `dispose`', () async {

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) => _MockSubject('a'),
        statesName: null,
        statesEqual: (it) => it.asStates(),
        expose: null,
        dispose: (it) => it.dispose(),
        late: false,
      ),
    ]);

    final subject = scope.get<_MockSubject<String>>();

    expect(subject.disposed, false);
    scope.dispose();
    expect(subject.disposed, true);

  });

  test('`FinalStatesConvertibleBase` assign value and states immediately when late is false', () async {

    final invokes = <String>[];

    await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) {
          invokes.add('equal');
          return _MockSubject('a');
        },
        statesName: null,
        statesEqual: (it) {
          invokes.add('statesEqual');
          return it.asStates();
        },
        expose: null,
        dispose: null,
        late: false,
      ),
    ]);

    expect(invokes, <String>[
      'equal',
      'statesEqual',
    ]);

  });

  test('`FinalStatesConvertibleBase` assign value and states lazily when late is true', () async {

    final invokes = <String>[];

    final scope = await Scope.root([
      FinalStatesConvertibleBase<_MockSubject<String>, String>(
        name: null,
        equal: (_) {
          invokes.add('equal');
          return _MockSubject('a');
        },
        statesName: null,
        statesEqual: (it) {
          invokes.add('statesEqual');
          return it.asStates();
        },
        expose: null,
        dispose: null,
        late: true,
      ),
    ]);

    expect(invokes, <String>[]);
    scope.get<_MockSubject<String>>();
    expect(invokes, <String>[
      'equal',
    ]);
    scope.get<States<String>>();
    expect(invokes, <String>[
      'equal',
      'statesEqual',
    ]);

  });

  test('`FinalStatesConvertible` assign value and states immediately', () async {

    final invokes = <String>[];

    await Scope.root([
      FinalStatesConvertible<_MockSubject<String>, String>(
        equal: (_) {
          invokes.add('equal');
          return _MockSubject('a');
        },
        statesEqual: (it) {
          invokes.add('statesEqual');
          return it.asStates();
        },
      ),
    ]);

    expect(invokes, <String>[
      'equal',
      'statesEqual',
    ]);

  });

  test('`LateFinalStatesConvertible` assign value and states lazily', () async {

    final invokes = <String>[];

    final scope = await Scope.root([
      LateFinalStatesConvertible<_MockSubject<String>, String>(
        equal: (_) {
          invokes.add('equal');
          return _MockSubject('a');
        },
        statesEqual: (it) {
          invokes.add('statesEqual');
          return it.asStates();
        },
      ),
    ]);

    expect(invokes, <String>[]);
    scope.get<_MockSubject<String>>();
    expect(invokes, <String>[
      'equal',
    ]);
    scope.get<States<String>>();
    expect(invokes, <String>[
      'equal',
      'statesEqual',
    ]);

  });
}

class _MockSubject<T> implements Subject<T> {
  _MockSubject(this._value);

  T _value;
  bool _disposed = false;
  final _observers = <OnData<T>>{};

  T get value => _value;
  bool get disposed => _disposed;

  @override
  Disposable observe(OnData<T> onData) {
    onData(_value);
    _observers.add(onData);
    return Disposable(() {
      _observers.remove(onData);
    });
  }

  @override
  void onData(T data) {
    _value = data;
    for (final onData in _observers) {
      onData(data);
    }
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _observers.clear();
  }
}
