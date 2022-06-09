
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';
import '../../toolbox/observable_tester.dart';

void main() {

  test('multicast observable connect when observers increase to one', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicastObservable = observable.multicast();

    expect(invokes, 0);
    final observation1 = multicastObservable.observe((data) {});
    expect(invokes, 1);
    final observation2 = multicastObservable.observe((data) {});
    expect(invokes, 1);

    observation1.dispose();
    observation2.dispose();

  });

  test('multicast observable disconnect when observers decrease to zero', () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final multicastObservable = observable.multicast();

    final observation1 = multicastObservable.observe((data) {});
    final observation2 = multicastObservable.observe((data) {});

    expect(invokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    observation2.dispose();
    expect(invokes, 1);

  });

  test('multicast observable forward data to observers', () async {

    final observable = Observable<String>((onData) {
      Future(() => onData('a'));
      return Disposable.empty;
    });

    final multicastObservable = observable.multicast();

    final tester1 = ObservableTester(
      multicastObservable,
    );

    final tester2 = ObservableTester(
      multicastObservable,
    );
    
    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, []);
    expect(tester2.recorded, []);
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


  test('multicast observable connect when observers increase to one, using custom subject', () {

    int invokes = 0;

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final multicastObservable = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    expect(invokes, 0);
    final observation1 = multicastObservable.observe((data) {});
    expect(invokes, 1);
    expect(subject.observeInvokes, 1);
    final observation2 = multicastObservable.observe((data) {});
    expect(invokes, 1);
    expect(subject.observeInvokes, 2);

    observation1.dispose();
    observation2.dispose();

  });

  test('multicast observable disconnect when observers decrease to zero, using custom subject', () {

    int invokes = 0;

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final multicastObservable = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    final observation1 = multicastObservable.observe((data) {});
    final observation2 = multicastObservable.observe((data) {});

    expect(invokes, 0);
    expect(subject.observationDisposeInvokes, 0);
    observation1.dispose();
    expect(invokes, 0);
    expect(subject.observationDisposeInvokes, 1);
    observation2.dispose();
    expect(invokes, 1);
    expect(subject.observationDisposeInvokes, 2);

  });

  test('multicast observable dispose subject when observers decrease to zero, using custom subject', () {

    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      return Disposable.empty;
    });

    final multicastObservable = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );
    
    final observation1 = multicastObservable.observe((data) {});
    final observation2 = multicastObservable.observe((data) {});

    expect(subject.disposeInvokes, 0);
    observation1.dispose();
    expect(subject.disposeInvokes, 0);
    observation2.dispose();
    expect(subject.disposeInvokes, 1);

  });
  
  test('multicast observable forward data to observers, using custom subject', () async {
    
    late final _MockSubject<String> subject;

    final observable = Observable<String>((onData) {
      Future(() => onData('a'));
      return Disposable.empty;
    });

    final multicastObservable = observable
      .multicast(
        createSubject: () {
          subject = _MockSubject();
          return subject;
        },
      );

    final observation = multicastObservable.observe((data) {});

    expect(subject.recorded, []);
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

