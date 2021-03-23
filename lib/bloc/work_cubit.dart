import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_work/bloc/base_bloc.dart';
import 'package:my_work/models/work.dart';
import 'package:my_work/repository/work_repo.dart';

part 'work_state.dart';

class WorkCubit extends Cubit<WorkState> with BaseBloc<Work> {
  WorkCubit(this._workRepo) : super(Initial());
  final WorkRepo _workRepo;

  @override
  Future<void> delete(int id) async {
    //todo try catch içine al
    emit(Loading());
    final response = await _workRepo.delete(id);
    emit(Completed(response));
  }

  @override
  Future<void> deleteAll() async {
    //todo try catch içine al
    emit(Loading());
    final response = await _workRepo.deleteAll();
    emit(Completed(response));
  }

  @override
  Future<void> getAll() async {
    //todo try catch içine al
    emit(Loading());
    final response = await _workRepo.getAll();
    emit(Completed(response));
  }

  @override
  Future<void> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Work object) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(Work object) async {
    //todo try catch içine al
    emit(Loading());
    final response = await _workRepo.update(object);
    emit(Completed(response));
  }
}
