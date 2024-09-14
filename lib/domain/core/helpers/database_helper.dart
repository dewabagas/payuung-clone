// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:payuung_clone/domain/vouchers/entities/voucher.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'vouchers.db');

    final database = await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE wellness_vouchers(id INTEGER PRIMARY KEY, voucherName TEXT, price INTEGER, merchantName TEXT, imageUrl TEXT)',
        );
        // Insert dummy data
        await _insertDummyData(db);
      },
      version: 1,
    );
    return database;
  }

  Future<void> _insertDummyData(Database db) async {
    final List<Voucher> dummyVouchers = [
      Voucher(
          id: 1,
          voucherName: 'Voucher Digital Indomaret Rp. 25.000',
          price: 25000,
          merchantName: 'Indomaret',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/1280px-Logo_Indomaret.png'),
      Voucher(
        id: 2,
        voucherName: 'Voucher Super Indo Rp. 45.000',
        price: 45000,
        merchantName: 'Super Indo',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/id/6/66/Logo_Super_Indo.png',
      ),
      Voucher(
        id: 3,
        voucherName: 'Voucher Hypermart Rp. 60.000',
        price: 60000,
        merchantName: 'Hypermart',
        imageUrl:
            'https://play-lh.googleusercontent.com/FaCJim5ATHRhvfgP1WC8cRZ706iMcmPFRgYvYK-dR0yI8xFF1yjq34kBtgpkGt6UU0Q',
      ),
      Voucher(
        id: 4,
        voucherName: 'Voucher Gramedia Rp. 75.000',
        price: 75000,
        merchantName: 'Gramedia',
        imageUrl:
            'https://mir-s3-cdn-cf.behance.net/project_modules/disp/51c8c811397453.560f71c80f78b.jpg',
      ),
      Voucher(
        id: 5,
        voucherName: 'Voucher Hero Rp. 20.000',
        price: 20000,
        merchantName: 'Hero',
        imageUrl:
            'https://images.crunchbase.com/image/upload/c_pad,f_auto,q_auto:eco,dpr_1/qjallyyk7zpsakxfzkrw',
      ),
      Voucher(
        id: 6,
        voucherName: 'Voucher Carrefour Rp. 55.000',
        price: 55000,
        merchantName: 'Carrefour',
        imageUrl:
            'https://cdn.dribbble.com/users/1363333/screenshots/11340831/media/a673708391f5a8c0950fc71b1202615c.jpg?resize=400x300&vertical=center',
      ),
    ];

    for (var voucher in dummyVouchers) {
      await db.insert('wellness_vouchers', voucher.toJson());
    }
  }
}
