part of 'wellness_vouchers_cubit.dart';

@freezed
class WellnessVouchersState with _$WellnessVouchersState {
  const factory WellnessVouchersState.initial() = _Initial;
  const factory WellnessVouchersState.loadInProgress() = _Loading;
  const factory WellnessVouchersState.loadSuccess(List<Voucher> vouchers) =
      _Loaded;
  const factory WellnessVouchersState.loadFailure(String message) = _Error;
}
