import 'package:butcher_core/butcher_core.dart';

final L = _QLogger('👑');
final l = L;

class _QLogger {
  final String name;
  _QLogger([this.name = '']);
  void e(Object msg) {
    log('${'[$name]'}$msg');
  }

  void w(Object msg) {
    log('${'[$name]'}$msg');
  }

  void i(Object msg) {
    log('${'[$name]'}$msg');
  }

  void d(Object msg) {
    log('${'[$name]'}$msg');
  }

  void wtf(Object msg) {
    log('${'[$name]'}$msg');
  }

  void f(Object msg) {
    log('${'[$name]'}$msg');
  }
}
