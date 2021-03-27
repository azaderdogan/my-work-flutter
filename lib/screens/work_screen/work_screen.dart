import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:my_work/config/constants.dart';
import 'package:my_work/screens/home/components/body.dart';

class WorkScreen extends StatelessWidget {
  static String routeName = '/work';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: AddWorkForm(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Yeni İş Ekle',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: kPrimaryColor),
      ),
    );
  }
}

class AddWorkForm extends StatefulWidget {
  AddWorkForm({
    Key key,
  }) : super(key: key);

  @override
  _AddWorkFormState createState() => _AddWorkFormState();
}

class _AddWorkFormState extends State<AddWorkForm> {
  _AddWorkFormState();
  final _formKey = GlobalKey<FormState>();
  String businessOwner;
  String workContent;
  DateTime workDate = DateTime.now();
  int workPrice;
  int amountPaid;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'İş sahibinin adı',
                      hintText: 'Azad...',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'İş İçeriği',
                      hintText: 'Azad...',
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    WorkTypeElement(workType: 'Kum'),
                    WorkTypeElement(workType: 'Çimento'),
                    WorkTypeElement(workType: 'Nakliye'),
                    WorkTypeElement(workType: 'Kum'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sefer Sayısı',
                      hintText: '1',
                    ),
                  ),
                ),
                MaterialButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2015, 3, 5),
                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          workDate = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.tr);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tarihi seç',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: kPrimaryColor),
                        ),
                        Icon(
                          Icons.date_range,
                          size: 30,
                          color: kPrimaryColor,
                        ),
                        Text(
                          '${workDate.day}-${workDate.month}-${workDate.year}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: kPrimaryColor),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '₺500',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.65,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )),
                    child: Center(
                      child: Text(
                        'Deftere Ekle',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ])
        ],
      ),
    );
  }
}

class WorkTypeElement extends StatelessWidget {
  const WorkTypeElement({
    Key key,
    this.workType,
  }) : super(key: key);
  final String workType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
        color: kBackgroundColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            workType,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.purple),
          ),
          Icon(Icons.add)
        ],
      ),
    );
  }
}
