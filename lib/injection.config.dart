// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:payuung_clone/application/wellness_vouchers_cubit/wellness_vouchers_cubit.dart'
    as _i132;
import 'package:payuung_clone/infrastructure/vouchers/data_sources/local/voucher_dao.dart'
    as _i988;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i132.WellnessVouchersCubit>(
        () => _i132.WellnessVouchersCubit(gh<_i988.VoucherDao>()));
    return this;
  }
}
