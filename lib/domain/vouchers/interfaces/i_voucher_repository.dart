import 'package:payuung_clone/domain/vouchers/entities/voucher.dart';

abstract class IVoucherRepository {
  Future<List<Voucher>> getWellnessVouchers();
}
