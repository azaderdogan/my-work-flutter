part of 'work_detail_cubit.dart';

@immutable
abstract class WorkDetailState {
  const WorkDetailState();
}

class Initial extends WorkDetailState {
  const Initial();
}
class Loading  extends WorkDetailState {
  const Loading();
}


class Completed extends WorkDetailState {
  // işlem bitince dönülecek cevap
  final List<WorkDetail> response;

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


class Error extends WorkDetailState{
  final String message;
  const Error(this.message);
}
