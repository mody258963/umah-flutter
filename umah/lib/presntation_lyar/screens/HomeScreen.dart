import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/get_method/get_method_cubit.dart';
import 'package:umah/web_servese/model/username.dart';

import '../../besnese_logic/get_method/get_method_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildPhoneNumberSumbit() {
    return BlocBuilder<GetMethodCubit, GetMethodState>(
        builder: (context, state) {
      if (state is AllItemsState) {
        List<User> allUsersList = state.posts;
        print("======${allUsersList.length}");
        return Container(
          child: ListView.builder(
              itemCount: allUsersList.length,
              itemBuilder: (context, index) {
                final user = allUsersList[index];
                print('=======${user.image}');
                return ListTile(
                  title: Text('====${user.image}'),
                );
              }),
        );
      }
      return Container();
    });
  }

  Widget Alldatauser(List<User> allUsersList) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListView.builder(
          itemCount: allUsersList.length,
          itemBuilder: (context, index) {
            final user = allUsersList[index];
            print('=======${user.image}');
            return ListTile(
              title: Text('====${user.name}'),
            );
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('fatch'),
        ),
        body: Column(
          children: [
            _buildPhoneNumberSumbit(),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetMethodCubit>(context).emitGetAllUSers();
                },
                child: Text("mohamed"))
          ],
        ),
      ),
    );
  }
}
