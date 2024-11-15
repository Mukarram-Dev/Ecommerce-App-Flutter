import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

T useAuthProvider<T>(AlwaysAliveRefreshable<T> provider) {
  final context = useContext();
  return ProviderScope.containerOf(context).read(provider);
}
