import 'package:my_work/repository/base_repo.dart';
import 'package:my_work/models/work.dart';
import 'package:sembast/sembast.dart';

class WorkRepo extends BaseRepo<Work> {
  static const String STORE = "works";
  final _works = intMapStoreFactory.store(STORE);

  static final WorkRepo _singleton = WorkRepo._internal();

  WorkRepo._internal();

  factory WorkRepo() => _singleton;

  @override
  Future<List<Work>> getAll() async {
    final snapshot = await _works.find(await database);
    return snapshot.map((e) {
      Work work = Work.fromMap(e.value);
      work.id = e.key;
      return work;
    }).toList();
  }

  @override
  Future<Work> getById(int id) async {
    var finder = Finder(filter: Filter.byKey(id));
    var snapshot = await _works.find(await database, finder: finder);
    print(snapshot.length);
    print(snapshot.first.value);
  }

  @override
  Future insert(Work object) async {
    await _works.add(await database, object.toMap());
  }

  @override
  Future update(Work object) async {
    var finder = Finder(filter: Filter.byKey(object.id));
    await _works.update(await database, object.toMap(), finder: finder);
  }

  @override
  Future delete(int id) async {
    var finder = Finder(filter: Filter.byKey(id));
    await _works.delete(await database, finder: finder);
  }

  @override
  Future deleteAll() async {
    await _works.delete(await database);
  }
}
