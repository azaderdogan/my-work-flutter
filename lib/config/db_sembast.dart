import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class DbHelper {
  Database _database;
  static final DbHelper _singleton = DbHelper._internal();

  DbHelper._internal();

  static  DbHelper get instance => _singleton;

  final String databaseName = 'record_book.db';

  Future<Database> get database async {
    if (_database != null) {
      print('DATABASE NON NULL');
      return _database;
    }
    print('DATABASE  NULL ${this.hashCode}');
    _database = await initDb();
    return _database;
  }

  Future initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, databaseName);
    _database = await databaseFactoryIo.openDatabase(dbPath);
    print('databaseeee : $_database');
    return _database;
  }

// Future<String> getDbPath()  {
//
//   print('DB PATH $dbPath');
//   return dbPath;
// }
//
// void closeDatabase() async {
//   this._database.close();
// }

}
