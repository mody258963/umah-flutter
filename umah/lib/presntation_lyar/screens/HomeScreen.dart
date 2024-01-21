import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/besnese_logic/get_method/get_method_cubit.dart';
import 'package:umah/costanse/pages.dart';
import 'package:umah/web_servese/model/username.dart';

import '../../besnese_logic/get_method/get_method_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  void _Circelindecator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
    showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        builder: (context) {
          return alertDialog;
        });
  }

  Widget _buildPhoneNumberSumbit() {
    return BlocBuilder<GetMethodCubit, GetMethodState>(
        builder: (context, state) {
      if (state is AllItemsState) {
        final allUsersList = state.posts;
        return SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: allUsersList.length,
              itemBuilder: (context, index) {
                final user = allUsersList[index];
                return ListTile(
                  title: Text(user.name.toString()),
                  subtitle: Text(user.email.toString()),
                );
              }),
        );
      }
      return Container();
    });
  }

  Widget _buildloginAuth() {
    return BlocListener<EmailAuthCubit, EmailAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, EmailAuthState state) {
        if (state is LoginLoading) {
          _Circelindecator(context);
        }
        if (state is Loginfails) {
          AlertDialog(
            title: Text('dont play with me'),
          );
        }
        if (state is LoginSuccess) {
          Navigator.maybePop(context);
          Navigator.of(context, rootNavigator: true).pushReplacementNamed(posters);
        }
      },
      child: Container(),
    );
  }

  Widget Textarea() {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(labelText: 'Password'),
        ),
      ],
    );
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
            Textarea(),
            ElevatedButton(
                onPressed: () {
                  // BlocProvider.of<GetMethodCubit>(context).emitGetAllUSers();
                  context.read<EmailAuthCubit>().loginUser(
                        emailController.text,
                        passwordController.text,
                      );
                },
                child: Text("mohamed")),
            _buildloginAuth(),
          ],
        ),
      ),
    );
  }
}
