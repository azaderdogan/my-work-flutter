import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'work_type_state.dart';

class WorkTypeCubit extends Cubit<WorkTypeState> {
  WorkTypeCubit() : super(WorkTypeInitial());
}
