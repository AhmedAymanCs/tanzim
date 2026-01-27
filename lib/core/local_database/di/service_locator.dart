import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanzim/core/local_database/shared_pref/shared_pref_impl.dart';
import 'package:tanzim/core/service/notification_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreference>(
    () => AppPreferenceImpl(sharedPreferences),
  );
}

Future<void> setupNotification() async {
  final service = NotificationService();
  await service.init();
  getIt.registerSingleton<NotificationService>(service);
}
