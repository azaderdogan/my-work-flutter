import 'package:my_work/repository//base_repo.dart';
import 'package:my_work/models/work_detail.dart';
import 'package:sembast/sembast.dart';

class WorkDetailRepo extends BaseRepo<WorkDetail> {
  static const String STORE = 'work_details';
  final _workDetails = intMapStoreFactory.store(STORE);

  static final WorkDetailRepo _singleton = WorkDetailRepo._internal();

  WorkDetailRepo._internal();

  factory WorkDetailRepo() => _singleton;

  @override
  Future delete(int id) async{
    var finder = Finder(filter: Filter.byKey(id));
    await _workDetails.delete(await database, finder: finder);
  }

  @override
  Future<List<WorkDetail>> getAll() async {
    final snapshot = await _workDetails.find(await database);
    return snapshot.map((e) {
      var workDetail = WorkDetail.fromMap(e.value);
      workDetail.id = e.key;
      return workDetail;
    }).toList();
  }

  @override
  Future<WorkDetail> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future insert(WorkDetail object)async {
    await _workDetails.add(await database, object.toMap());
  }

  @override
  Future update(WorkDetail object) async {
    var finder = Finder(filter: Filter.byKey(object.id));
    await _workDetails.update(await database, object.toMap(), finder: finder);
  }

  @override
  Future deleteAll()async {
    await _workDetails.delete(await database);
  }
}
