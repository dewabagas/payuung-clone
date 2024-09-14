import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:payuung_clone/domain/vouchers/entities/voucher.dart';
import 'package:payuung_clone/infrastructure/vouchers/data_sources/local/voucher_dao.dart';

part 'wellness_vouchers_state.dart';
part 'wellness_vouchers_cubit.freezed.dart';

@injectable
class WellnessVouchersCubit extends Cubit<WellnessVouchersState> {
  final VoucherDao voucherDao;

  WellnessVouchersCubit(this.voucherDao)
      : super(const WellnessVouchersState.initial());

  Future<void> loadVouchers() async {
    emit(const WellnessVouchersState.loadInProgress());

    try {
      final vouchers = await voucherDao.getWellnessVouchers();
      emit(WellnessVouchersState.loadSuccess(vouchers));
    } catch (e) {
      emit(WellnessVouchersState.loadFailure(e.toString()));
    }
  }
}
