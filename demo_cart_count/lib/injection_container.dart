// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';

import 'features/main/presentation/viewmodel/main_screen_view_model.dart';

final sl = GetIt.instance;

init() {
  /// Repository

  /// Use case

  /// View Model
  sl.registerLazySingleton<MainScreenViewModel>(() => MainScreenViewModel());
}
