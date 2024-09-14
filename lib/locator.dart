import 'package:get_it/get_it.dart';
import 'package:payuung_clone/infrastructure/vouchers/data_sources/local/voucher_dao.dart';
import 'package:payuung_clone/presentation/routes/app_router.dart';

GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => VoucherDao());
}
