import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_work/bloc/base_bloc.dart';
import 'package:my_work/models/work_detail.dart';
import 'package:my_work/repository/work_detail_repo.dart';

part 'work_detail_state.dart';

class WorkDetailCubit extends Cubit<WorkDetailState> with BaseBloc<WorkDetail> {
  WorkDetailCubit(this._workDetailRepo) : super(Initial());
  final WorkDetailRepo _workDetailRepo;

  @override
  Future<void> delete(int id) async {
    //todo try catch içine al
    emit(Loading());
    final response = await _workDetailRepo.delete(id);
    emit(Completed(response));
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<void> getAll() async {
    emit(Loading());
    final response = await _workDetailRepo.getAll();
    emit(Completed(response));
  }

  @override
  Future<void> getById(int id) async {}

  @override
  Future<void> insert(WorkDetail object) async {
    emit(Loading());
    final response = await _workDetailRepo.insert(object);
    emit(Completed(response));
  }

  @override
  Future<void> update(WorkDetail object) async {
    emit(Loading());
    final response = await _workDetailRepo.update(object);
    emit(Completed(response));
  }
}
