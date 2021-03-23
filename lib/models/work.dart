import 'package:my_work/models/base_model.dart';

class Work extends BaseModel{
  int id;
  int workPrice = 0;
  int businessOwner;
  String workContent;
  DateTime workDate;
  int remainingPayment = 0;

  Work(
      {
      this.businessOwner,
      this.workContent,
      this.workPrice = 0,
      this.workDate,
      this.remainingPayment});

  Work.withId({
    this.id,
    this.businessOwner,
    this.workContent,
    this.workPrice = 0,
    this.workDate,
  });

  Work.fromMap(dynamic object) {
    print(object["saveDate"].toString());
    this.id = object["id"];
    this.businessOwner = object["businessOwner"];
    this.workPrice = object["workPrice"];
    this.workContent = object["workContent"];
    if (object["saveDate"] != null) {
      this.workDate = DateTime.parse(object["workDate"]);
    } else {
      this.workDate = DateTime.now();
    }
  }

  @override
  Map<String, dynamic>  toMap() {
    //todo
    print(this.workDate.toLocal());
    Map map = Map<String, dynamic>();
    map["businessOwner"] = this.businessOwner;
    map["workDate"] = this.workDate.toUtc().toString();
    map["workPrice"] = this.workPrice;
    map["workContent"] = this.workContent;
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
