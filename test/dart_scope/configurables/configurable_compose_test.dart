
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

import '../shared/mock_configurable.dart';

void main() {

  test('`ConfigurableCompose` build invoked', () async {

    int invokes = 0;

    final configurable = _MockConfigurableCompose(() {
      invokes += 1;
      return MockConfigurable((_) {});
    });

    expect(invokes, 0);
    await Scope.root([
      configurable,
    ]);
    expect(invokes, 1);

  });

  test('`ConfigurableCompose` configure invoked', () async {

    int invokes = 0;

    final configurable = _MockConfigurableCompose(() {
      return MockConfigurable((_) {
        invokes += 1;
      });
    });

    expect(invokes, 0);
    await Scope.root([
      configurable,
    ]);
    expect(invokes, 1);

  });

  test('`ConfigurableCompose` configure success', () async {

    final configurable = _MockConfigurableCompose(() {
      return MockConfigurable((scope) {
        scope.expose<String>(expose: () => 'a');
      });
    });

    final scope = await Scope.root([
      configurable,
    ]);

    final value = scope.get<String>();
    expect(value, 'a');

  });

}

class _MockConfigurableCompose extends ConfigurableCompose {

  _MockConfigurableCompose(this._build);

  final Configurable Function() _build;

  @override
  Configurable build() => _build();
}
