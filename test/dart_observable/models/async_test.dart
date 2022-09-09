
import 'package:test/test.dart';
import 'package:dart_scope/dart_scope.dart';

void main() {

  test('`Async` default constructor', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.current;

    final asyncString = Async<String>(
      status: AsyncStatus.error,
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    expect(asyncString.status, AsyncStatus.error);
    expect(asyncString.data, 'a');
    expect(asyncString.error, exception);
    expect(asyncString.stackTrace, stackTrace);

  });

  test('`Async.loading` constructor', () {

    final asyncString = Async<String>.loading(
      data: 'a',
    );

    expect(asyncString.status, AsyncStatus.loading);
    expect(asyncString.data, 'a');
    expect(asyncString.error, null);
    expect(asyncString.stackTrace, null);

  });

  test('`Async.loaded` constructor', () {

    final asyncString = Async<String>.loaded(
      data: 'a',
    );
    
    expect(asyncString.status, AsyncStatus.loaded);
    expect(asyncString.data, 'a');
    expect(asyncString.error, null);
    expect(asyncString.stackTrace, null);

  });

  test('`Async.error` constructor', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.current;

    final asyncString = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    expect(asyncString.status, AsyncStatus.error);
    expect(asyncString.data, 'a');
    expect(asyncString.error, exception);
    expect(asyncString.stackTrace, stackTrace);

  });

  test('`async.operator== && async.hashCode` when instances are identical', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.current;

    final asyncString1 = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    final asyncString2 = asyncString1;

    final areInstancesEqual = asyncString1 == asyncString2;
    final areHashCodesEqual = asyncString1.hashCode == asyncString2.hashCode;

    expect(areInstancesEqual, true);
    expect(areHashCodesEqual, true);
    
  });

  test('`async.operator== && async.hashCode` when instances are equal', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.current;

    final asyncString1 = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    final asyncString2 = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    final areInstancesEqual = asyncString1 == asyncString2;
    final areHashCodesEqual = asyncString1.hashCode == asyncString2.hashCode;

    expect(areInstancesEqual, true);
    expect(areHashCodesEqual, true);

  });

  test('`async.operator==` when instances are not equal', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.current;

    final asyncString1 = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    final asyncString2 = Async<String>.error(
      error: exception,
      stackTrace: stackTrace,
    );

    final areInstancesEqual = asyncString1 == asyncString2;

    expect(areInstancesEqual, false);

  });

  test('`async.toString` return description', () {

    final exception = Exception('custom exception');
    final stackTrace = StackTrace.empty;

    final asyncString = Async<String>.error(
      data: 'a',
      error: exception,
      stackTrace: stackTrace,
    );

    final description = asyncString.toString();

    expect(
      description, 
      "Async<String>(status: AsyncStatus.error, data: a, error: Exception: custom exception, stackTrace: )"
    );

  });

  test('`async.requireData` return data if there is data', () {

    final asyncString = Async<String>.loaded(
      data: 'a',
    );

    expect(asyncString.requireData, 'a');

  });

  test('`async.requireData` throws if there is no data', () {

    final asyncString = Async<String>.loaded(
      data: null,
    );

    expect(() => asyncString.requireData, throwsA(isA<TypeError>()));

  });
  
  test('`async.requireError` return error if there is error', () {

    final exception = Exception('custom exception');

    final asyncString = Async<String>.error(
      error: exception,
    );

    expect(asyncString.requireError, exception);

  });

  test('`async.requireError` throws if there is no error', () {

    final asyncString = Async<String>.loading();

    expect(() => asyncString.requireError, throwsA(isA<TypeError>()));

  });
}
