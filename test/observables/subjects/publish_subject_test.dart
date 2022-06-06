
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

import '../../toolbox/observable_tester.dart';

void main() {

  test('publish subject forward data to single observer', () {

    final subject = PublishSubject<String>();
    
    final tester = ObservableTester(
      subject,
    );

    tester.startObserve();

    expect(tester.recorded, []);
    subject.onData('a');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();
    subject.dispose();

  });

  test('publish subject forward data to multiple observers', () {
    
    final subject = PublishSubject<String>();
    
    final tester1 = ObservableTester(
      subject,
    );

    final tester2 = ObservableTester(
      subject,
    );

    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, []);
    expect(tester2.recorded, []);
    subject.onData('a');
    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();
    subject.dispose();

  });

  test("publish subject only forward data after observed", () {
    
    final subject = PublishSubject<String>();

    final tester = ObservableTester(
      subject,
    );

    subject.onData('a');

    tester.startObserve();

    expect(tester.recorded, []);
    subject.onData('b');
    expect(tester.recorded, [
      'b',
    ]);

    tester.stopObserve();
    subject.dispose();

  });

  test("publish subject won't forward data after observation disposed", () {

    final subject = PublishSubject<String>();

    final tester = ObservableTester(
      subject,
    );

    tester.startObserve();

    subject.onData('a');

    tester.stopObserve();

    expect(tester.recorded, [
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    subject.dispose();

  }); 

  test("publish subject won't forward data after subject disposed", () {

    final subject = PublishSubject<String>();

    final tester = ObservableTester(
      subject,
    );

    tester.startObserve();

    subject.onData('a');

    subject.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    subject.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('publish subject throws error when been observed after it is disposed', () {
    
    final subject = PublishSubject<String>();

    subject.dispose();

    expect(
      () {
        subject.observe((data) {});
      },
      throwsA(
        isA<StateError>()
          .having(
            (error) => error.toString(),
            'description',
            contains("Subject is disposed and can't be observed."),
          ),
      ),
    );
  });

}
