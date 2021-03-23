part of 'user_cubit.dart';

@immutable
abstract class UsersState {
  const UsersState();
}

//ekran açıldğında çalışacak olan state
class UsersInitial extends UsersState {
  const UsersInitial();
}

//sayfanın loading anı
class UsersLoading extends UsersState {
  const UsersLoading();
}

// işlem başarılır
class UsersCompleted extends UsersState {
  // işlem bitince dönülecek cevap
  final List<User> response;

  const UsersCompleted(this.response);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersCompleted &&
          runtimeType == other.runtimeType &&
          response == other.response;

  @override
  int get hashCode => response.hashCode;
}

// hata verirse
class UsersError extends UsersState {
  final String message;
  const UsersError(this.message);
}
