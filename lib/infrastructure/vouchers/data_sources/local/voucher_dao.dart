import 'package:payuung_clone/domain/core/helpers/database_helper.dart';
import 'package:payuung_clone/domain/vouchers/entities/voucher.dart';

class VoucherDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insertWellnessVoucher(Voucher voucher) async {
    final db = await _databaseHelper.database;
    await db.insert('wellness_vouchers', voucher.toJson());
  }

  Future<List<Voucher>> getWellnessVouchers() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('wellness_vouchers');
    if (maps.isEmpty) return [];

    return List<Voucher>.from(
      maps.map((voucher) => Voucher.fromJson(voucher)),
    );
  }

  Future<void> deleteAllVouchers() async {
    final db = await _databaseHelper.database;
    await db.delete('wellness_vouchers');
  }
}
