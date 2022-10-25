
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/observable_tester.dart';

void main() {

  test('`Publisher` forward data to single observer', () {

    final publisher = Publisher<String>();
    
    final tester = ObservableTester(
      publisher,
    );

    tester.startObserve();

    expect(tester.recorded, <String>[]);
    publisher.onData('a');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();
    publisher.dispose();

  });

  test('`Publisher` forward data to multiple observers', () {
    
    final publisher = Publisher<String>();
    
    final tester1 = ObservableTester(
      publisher,
    );

    final tester2 = ObservableTester(
      publisher,
    );

    tester1.startObserve();
    tester2.startObserve();

    expect(tester1.recorded, <String>[]);
    expect(tester2.recorded, <String>[]);
    publisher.onData('a');
    expect(tester1.recorded, [
      'a',
    ]);
    expect(tester2.recorded, [
      'a',
    ]);

    tester1.stopObserve();
    tester2.stopObserve();
    publisher.dispose();

  });

  test("`Publisher` only forward data after observed", () {
    
    final publisher = Publisher<String>();

    final tester = ObservableTester(
      publisher,
    );

    publisher.onData('a');

    tester.startObserve();

    expect(tester.recorded, <String>[]);
    publisher.onData('b');
    expect(tester.recorded, [
      'b',
    ]);

    tester.stopObserve();
    publisher.dispose();

  });

  test("`Publisher` won't forward data after observation disposed", () {

    final publisher = Publisher<String>();

    final tester = ObservableTester(
      publisher,
    );

    tester.startObserve();

    publisher.onData('a');

    tester.stopObserve();

    expect(tester.recorded, [
      'a',
    ]);
    publisher.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    publisher.dispose();

  }); 

  test("`Publisher` won't forward data after publisher disposed", () {

    final publisher = Publisher<String>();

    final tester = ObservableTester(
      publisher,
    );

    tester.startObserve();

    publisher.onData('a');

    publisher.dispose();

    expect(tester.recorded, [
      'a',
    ]);
    publisher.onData('b');
    expect(tester.recorded, [
      'a',
    ]);

    tester.stopObserve();

  });

  test('`Publisher` throws error when been observed after it is disposed', () {
    
    final publisher = Publisher<String>();

    publisher.dispose();

    expect(
      () {
        publisher.observe((_) {});
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
