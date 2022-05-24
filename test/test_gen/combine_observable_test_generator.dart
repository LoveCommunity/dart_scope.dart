import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'combine_observable_test.dart';

class CombineObservableTestGenerator extends GeneratorForAnnotation<CombineObservableTest> {

  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    print('generateForAnnotatedElement');
    return 'void _main() {}';
  }
}
