
import 'package:test/test.dart';

import 'package:scopes/scopes.dart';


void main() {

  test('`Observer.default` function invokes', () {
    
    final List<String> invokes = [];

    final observer = Observer<String>((data) {
      invokes.add(data);
    });

    expect(invokes, []);
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
