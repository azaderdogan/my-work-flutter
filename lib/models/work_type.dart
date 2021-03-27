import 'package:my_work/models/base_model.dart';

class WorkType extends BaseModel {
  int id;
  String workName;
  int workPrice;

  WorkType({this.workName, this.workPrice});

  WorkType.withId({this.id, this.workName, this.workPrice});

  WorkType.fromMap(dynamic object) {
    this.id = object['id'];
    this.workName = object['workName'];
    this.workPrice = object['workPrice'];
  }

  @override
  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map['id'] = this.id;
    map['workName'] = this.workName;
    map['workPrice'] = this.workPrice;
  }
}
