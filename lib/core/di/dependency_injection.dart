import 'package:get_it/get_it.dart';
import 'package:zabardash/core/utils/pref_utils.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  try {
    locator.registerSingleton(PreferenceUtils());
  } catch (err) {
    // print('Dependency Injection Error: $err');
  }
}
