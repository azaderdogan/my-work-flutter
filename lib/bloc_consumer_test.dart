import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_work/bloc/user_cubit.dart';
import 'package:my_work/config/db_sembast.dart';
import 'package:my_work/repository/user_repo.dart';

import 'models/user.dart';

class BlocConsumerView extends StatefulWidget {
  @override
  _BlocConsumerViewState createState() => _BlocConsumerViewState();
}

class _BlocConsumerViewState extends State<BlocConsumerView> {
  UserRepo userRepo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = new User(
        username: 'azad',
        password: '12122112',
        name: 'azad',
        lastName: 'erdogan',
        owe: 123);
    DbHelper dbHelper = DbHelper.instance;
    print('in consumer ${dbHelper.toString()}');
    //userRepo.insert(user);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(UserRepo()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Hello')),
        body: BlocConsumer<UsersCubit, UsersState>(builder: (context, state) {
          if (state is UsersInitial) {
            return buildCenterInitial(context);
          } else if (state is UsersLoading) {
            return CircularProgressIndicator();
          } else if (state is UsersCompleted) {
            return buildListViewCompleted(state);
          } else {
            return buildError(state);
          }
        },
            //state çalışırken is error  veya başka bişi gelirse
            listener: (context, state) {
          buildListener(state, context);
        }),
      );

  void buildListener(UsersState state, BuildContext context) {
    if (state is UsersError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    }
  }

  Text buildError(UsersState state) {
    final error = state as UsersError;
    return Text(error.message);
  }

  ListView buildListViewCompleted(UsersCompleted state) {
    return ListView.builder(
      itemBuilder: (context, index) => Text(state.response[index].name),
      itemCount: state.response.length,
    );
  }

  Center buildCenterInitial(BuildContext context) {
    return Center(
      child: Column(
        children: [Text('Hello'), buildFloatingActionButton(context)],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // User user = new User(
        //     username: 'azad',
        //     password: '12122112',
        //     name: 'azad',
        //     lastName: 'erdogan',
        //     owe: 123);
        context.read<UsersCubit>().getAll();
        // context.read<UsersCubit>().insertUser(user);
      },
    );
  }
}
