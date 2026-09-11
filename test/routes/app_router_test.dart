import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_routs_and_navigation/routes/app_router.dart';
void main() {
  group('AppRouter', () {
    test('router instance is not null', () => expect(AppRouter.router, isNotNull));
  });
}
