
import 'package:my_work/models/base_model.dart';

class WorkType extends BaseModel {
  int id;
  String workName;

  WorkType({this.workName});

  WorkType.withId({this.id, this.workName});

  WorkType.fromMap(dynamic object) {
    this.id = object['id'];
    this.workName = object['workName'];
  }

  @override
  Map<String, dynamic>  toMap() {
    Map map = Map<String, dynamic>();
    map['id'] = this.id;
    map['workName'] = this.workName;
  }
}
