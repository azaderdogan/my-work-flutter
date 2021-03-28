import 'package:my_work/models/base_model.dart';
import 'package:my_work/models/work_type.dart';

class WorkDetail extends BaseModel {
  int id;
  int workId;
  WorkType workType;
  DateTime workDate;
  double workAmount;
  String address;
  String workContent;


  WorkDetail(
      {this.workId, this.workType, this.workDate, this.workAmount, this.address,this.workContent});

  WorkDetail.withId({
    this.id,
    this.workId,
    this.workType,
    this.workDate,
    this.workAmount,
    this.address
    ,this.workContent});

  WorkDetail.fromMap(dynamic object) {
    this.id = object["id"];
    this.workId = object["workId"];

    this.workAmount = object["workAmount"];
    this.address = object["address"];
    this.workContent = object["workContent"];
    if (object["workDate"] != null) {
      this.workDate = DateTime.parse(object["workDate"]);
    } else {
      this.workDate = DateTime.now();
    }

    if (object["workType"] != null) {
      this.workType = WorkType.fromMap(object['workType']);
    }
  }

  @override
  Map<String, dynamic>  toMap() {
    //todo
    print(this.workDate.toLocal());
    Map map = Map<String, dynamic>();
    map["workId"] = this.workId;
    map["workDate"] = this.workDate.toUtc().toString();
    map["workType"] = this.workType.toMap();
    map["workAmount"] = this.workAmount;
    map["address"] = this.address;
    map["workContent"] = this.workContent;
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
