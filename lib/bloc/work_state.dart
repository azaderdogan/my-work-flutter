part of 'work_cubit.dart';

@immutable
abstract class WorkState {
  const WorkState();
}

class Initial extends WorkState {
  const Initial();
}
class Loading  extends WorkState {
  const Loading();
}


class Completed extends WorkState {
  // işlem bitince dönülecek cevap
  final List<Work> response;

  const Completed(this.response);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Completed &&
              runtimeType == other.runtimeType &&
              response == other.response;

  @override
  int get hashCode => response.hashCode;
}


class Error extends WorkState{
  final String message;
  const Error(this.message);
}
