
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';
import '../shared/observable_tester.dart';

void main() {

  test('observable.multicast connect when observers increase to one', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicast = observable.multicast();

    expect(invokes, 0);
    final observation1 = multicast.observe((_) {});
    expect(invokes, 1);
    final observation2 = multicast.observe((_) {});
    expect(invokes, 1);

    observation1.dispose();
    observation2.dispose();

  });

  test('observable.multicast disconnect when observers decrease to zero', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final multicast = observable.multicast();

    final observation1 = multicast.observe((_) {});
    final observation2 = multicast.observe((_) {});

    expect(invokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    observation2.dispose();
    expect(invokes, 1);

  });

  test('observable.multicast forward data to observers', () async {

    final observable = Observable<String>((onData) {
      Future(() => onData('a'));
      return Disposable.empty;
    });

    final multicast = observable.multicast();

    final tester1 = ObservableTester(
      multicast,
    );

    final tester2 = ObservableTester(
      multicast,
    );
    
    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, <String>[]);
    expect(tester2.recorded, <String>[]);
    await Future(() {});
    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();

  });


  test('observable.multicast connect when observers increase to one, using custom subject', () {

    int invokes = 0;

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicast = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    expect(invokes, 0);
    final observation1 = multicast.observe((_) {});
    expect(invokes, 1);
    expect(subject.observeInvokes, 1);
    final observation2 = multicast.observe((_) {});
    expect(invokes, 1);
    expect(subject.observeInvokes, 2);

    observation1.dispose();
    observation2.dispose();

  });

  test('observable.multicast disconnect when observers decrease to zero, using custom subject', () {

    int invokes = 0;

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final multicast = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    final observation1 = multicast.observe((_) {});
    final observation2 = multicast.observe((_) {});

    expect(invokes, 0);
    expect(subject.observationDisposeInvokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    expect(subject.observationDisposeInvokes, 1);
    observation2.dispose();
    expect(invokes, 1);
    expect(subject.observationDisposeInvokes, 2);

  });

  test('observable.multicast dispose subject when observers decrease to zero, using custom subject', () {

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      return Disposable.empty;
    });

    final multicast = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    final observation1 = multicast.observe((_) {});
    final observation2 = multicast.observe((_) {});

    expect(subject.disposeInvokes, 0);
    observation1.dispose();
    expect(subject.disposeInvokes, 0);
    observation2.dispose();
    expect(subject.disposeInvokes, 1);

  });
  
  test('observable.multicast forward data to observers, using custom subject', () async {
    
    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      Future(() => onData('a'));
      return Disposable.empty;
    });

    final multicast = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );

    final observation = multicast.observe((_) {});

    expect(subject.recorded, <String>[]);
    await Future(() {});
    expect(subject.recorded, [
      'a',
    ]);

    observation.dispose();

  });

}

class _MockSubject<T> implements Subject<T> {

  int observeInvokes = 0;
  int observationDisposeInvokes = 0;
  final recorded = <T>[];
  int disposeInvokes = 0;

  @override
  Disposable observe(OnData<T> onData) {
    observeInvokes += 1;
    return Disposable(() {
      observationDisposeInvokes += 1;
    });
  }

  @override
  void onData(T data) {
    recorded.add(data);
  }

  @override
  void dispose() {
    disposeInvokes += 1;
  }
}

