import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_work/bloc/base_bloc.dart';
import 'package:my_work/repository/user_repo.dart';
import 'package:my_work/models/user.dart';

part 'user_state.dart';

// burada metot yazılır
class UsersCubit extends Cubit<UsersState> with BaseBloc<User> {
  final UserRepo _userRepo;

  UsersCubit(this._userRepo) : super(UsersInitial()); // then initialing

  Future<void> insertUser(User user) async {
    //todo try catch içine al
    emit(UsersLoading());
    final response  = await _userRepo.insert(user);
    emit(UsersCompleted(response));
  }

  @override
  Future<void> delete(int id) async{
    //todo try catch içine al
    emit(UsersLoading());
    final response  = await _userRepo.delete(id);
    emit(UsersCompleted(response));
  }

  @override
  Future<void> deleteAll() async{
    emit(UsersLoading());
    final response  = await _userRepo.deleteAll();
    emit(UsersCompleted(response));
  }

  @override
  Future<void> getAll() async {
    try {
      emit(UsersLoading());
      final response = await _userRepo.getAll();
      emit(UsersCompleted(response));
      //todo return
    } on ProcessError catch (e) {
      emit(UsersError(e.message));
    }
  }

  @override
  Future<void> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> insert(User object) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(User object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
