import 'package:my_work/config/db_sembast.dart';
import 'package:my_work/repository/base_repo.dart';
import 'package:my_work/models/user.dart';
import 'package:sembast/sembast.dart';

class UserRepo extends BaseRepo<User> {
  static const String STORE = 'users';
  final _users = intMapStoreFactory.store(STORE);

  static final UserRepo _singleton = UserRepo._internal();

  UserRepo._internal() : super();

  factory UserRepo() => _singleton;

  @override
  Future<List<User>> getAll() async {
    final snapshot = await _users.find(await database);
    return snapshot.map((map) {
      final user = User.fromMap(map.value);
      user.id = map.key;
      return user;
    }).toList();
  }

  @override
  Future deleteAll() async {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<User> getById(int id) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  Future insert(User user) async {
    await _users.add(await database, user.toMap());
  }

  Future delete(int userId) async {
    var finder = Finder(filter: Filter.byKey(userId));
    await _users.delete(await database, finder: finder);
  }

  Future update(User user) async {
    final finder = Finder(filter: Filter.byKey(user.id));
    await _users.update(await database, user.toMap(), finder: finder);
  }
}

class ProcessError implements Exception {
  final String message;

  ProcessError(this.message);
}
