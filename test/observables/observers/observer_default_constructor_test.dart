
import 'package:test/test.dart';

import 'package:scopes/scopes.dart';


void main() {

  test('`Observer.defaultConstructor` function invokes', () {
    
    final invokes = <String>[];

    final observer = Observer<String>((data) {
      invokes.add(data);
    });

    expect(invokes, <String>[]);
    observer.onData('a');
    expect(invokes, [
      'a',
    ]);

    observer.onData('b');
    expect(invokes, [
      'a',
      'b',
    ]);
  });
}
