import 'package:my_work/config/db_sembast.dart';
import 'package:sembast/sembast.dart';

abstract class BaseRepo<T> {
  Database _database;
  DbHelper _dbHelper= DbHelper.instance;


  Future<Database> get database async {
    print("VERİ TABANI ALINITYOR");
    print('in base repo ${await _dbHelper.database}');
    _database = await _dbHelper.database;
    print('in base repo ${_database}');
    return _database;
  }

  Future<List<T>> getAll();

  Future<T> getById(int id);

  Future insert(T object);

  Future delete(int id);

  Future update(T object);

  Future deleteAll();
}
