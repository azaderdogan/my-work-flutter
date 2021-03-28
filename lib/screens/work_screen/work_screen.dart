import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:my_work/bloc/work_detail_cubit.dart';
import 'package:my_work/config/constants.dart';
import 'package:my_work/models/work_detail.dart';
import 'package:my_work/models/work_type.dart';
import 'package:my_work/repository/work_detail_repo.dart';
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
  String address;
  DateTime workDate = DateTime.now();
  int workPrice;
  double amountPaid;
  WorkType workTypeInstance;
  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildFormFieldBusinessOwner(),
                buildFFWorkContent(),
                buildWorkTypeWrap(),
                buildFFWorkAmount(),
                buildDatePicker(context),
                buildFFAddress()
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
                BlocProvider(
                  create: (context) => WorkDetailCubit(WorkDetailRepo()),
                  child: BlocConsumer<WorkDetailCubit, WorkDetailState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            WorkDetail workdetail = WorkDetail(
                                workType: workTypeInstance,
                                workAmount: amountPaid,
                                workContent: workContent,
                                workDate: workDate,
                                address: address);
                            context.read<WorkDetailCubit>().insert(workdetail);
                            print(context.read<WorkDetailCubit>().getAll());
                          }
                        },
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ])
        ],
      ),
    );
  }

  Padding buildFFAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onSaved: (data) => address = data,
        decoration: InputDecoration(
          labelText: 'Adres',
          hintText: 'Adresi yazınız',
        ),
      ),
    );
  }

  MaterialButton buildDatePicker(BuildContext context) {
    return MaterialButton(
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
        ));
  }

  Padding buildFFWorkAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onSaved: (data) => amountPaid = double.parse(data),
        decoration: InputDecoration(
          labelText: 'Sefer Sayısı',
          hintText: '1',
        ),
      ),
    );
  }

  final _formKeyWorkType = GlobalKey<FormState>();
  Wrap buildWorkTypeWrap() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        WorkTypeElement(workType: 'Kum'),
        IconButton(
            color: kBackgroundColor,
            icon: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    String workType;
                    int workPrice;
                    return AlertDialog(
                      insetPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      content: Stack(
                        children: [
                          Positioned(
                            child: Form(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sefer Türü ekleyin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(color: kPrimaryColor),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormField(
                                    onSaved: (data) {
                                      workType = data;
                                    },
                                    validator: (data) {
                                      if (data.isEmpty) {
                                        return 'Boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Sefer türü',
                                      hintText: 'kum,çimento',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormField(
                                    onSaved: (data) {
                                      workPrice = int.parse(data);
                                    },
                                    validator: (data) {
                                      if (data.isEmpty) {
                                        return 'Boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Sefer Ücreti',
                                      hintText: '50',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("sadsadsad");

                                    if (_formKeyWorkType.currentState
                                        .validate()) {
                                      _formKeyWorkType.currentState.save();
                                    }

                                    workTypeInstance = new WorkType(
                                        workName: workType,
                                        workPrice: workPrice);
                                    //todo cubite yolla
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'Deftere Ekle',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                          ),
                        ],
                      ),
                      actions: [],
                    );
                  });
            })
      ],
    );
  }

  Padding buildFFWorkContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onSaved: (data) => workContent = data,
        decoration: InputDecoration(
          labelText: 'İş İçeriği',
          hintText: 'Azad...',
        ),
      ),
    );
  }

  Padding buildFormFieldBusinessOwner() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onSaved: (data) => businessOwner = data,
        decoration: InputDecoration(
          labelText: 'İş sahibinin adı',
          hintText: 'Azad...',
        ),
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
          Icon(
            Icons.add,
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}
