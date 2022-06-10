
import 'package:test/test.dart';
import 'package:scopes/scopes.dart';

void main() {

  test("from driver's observable is identical to observable passed in", () {

    final observable = Observable<String>((onData) {
      return Disposable.empty;
    });
    
    final driver = Driver.from(observable);

    expect(driver.observable, observable);

  });

  test("observable as driver's observable is identical to origin observable", () {

    final observable = Observable<String>((onData) {
      return Disposable.empty;
    });

    final driver = observable.asDriver();

    expect(driver.observable, observable);

  });
  
  test("driver drive cause observable observe", () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      invokes += 1;
      return Disposable.empty;
    });

    final driver = Driver.from(observable);

    expect(invokes, 0);
    final observation = driver.drive((data) {});
    expect(invokes, 1);

    observation.dispose();
  });

  test("driver dispose cause observable dispose", () {

    int invokes = 0;

    final observable = Observable<String>((onData) {
      return Disposable(() {
        invokes += 1;
      });
    });

    final driver = Driver.from(observable);

    final observation = driver.drive((data) {});

    expect(invokes, 0);
    observation.dispose();
    expect(invokes, 1);

  });
}
