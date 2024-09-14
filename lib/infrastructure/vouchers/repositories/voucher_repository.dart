import 'package:payuung_clone/domain/vouchers/entities/voucher.dart';
import 'package:payuung_clone/domain/vouchers/interfaces/i_voucher_repository.dart';
import 'package:payuung_clone/infrastructure/vouchers/data_sources/local/voucher_dao.dart';

class VoucherRepository implements IVoucherRepository {
  final VoucherDao voucherDao;

  VoucherRepository(this.voucherDao);

  @override
  Future<List<Voucher>> getWellnessVouchers() async {
    return await voucherDao.getWellnessVouchers();
  }
}
