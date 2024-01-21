import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/besnese_logic/get_method/get_method_cubit.dart';
import 'package:umah/besnese_logic/get_method/get_method_state.dart';
import 'package:umah/besnese_logic/uploding_data/uploding_data_cubit.dart';

class LoginScreen extends StatefulWidget {
 LoginScreen({super.key, required this.email, required this.password});
   final String email;
  final String password;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  File? _selectedAudio;

  Widget _buildauth() {
    return BlocBuilder<EmailAuthCubit, EmailAuthState>(
        builder: (context, state) {
      if (state is LoginSuccess) {
        context.read<GetMethodCubit>().emitGetAllCourseOfUser(state.userId);
      }
      return Container();
    });
  }

  Widget _buildGetAllDataSumbit() {
    return BlocBuilder<GetMethodCubit, GetMethodState>(
        builder: (context, state) {
      if (state is CourseOfUserState) {
        final allUsersList = state.posts;
        return SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: allUsersList.length,
              itemBuilder: (context, index) {
                final user = allUsersList[index];
                return ListTile(
                  title: Text(user.title.toString()),
                  subtitle: Text(user.description.toString()),
                );
              }),
        );
      }
      return Container();
    });
  }

  Widget _Textarea() {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'title'),
        ),
      ],
    );
  }

  Future<File?> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (result != null) {
      _selectedAudio = File(result.files.single.path!);
      print('Selected Audio: ${_selectedAudio!.path}');
      return _selectedAudio;
    } else {
      // User canceled the file picker
      print('No audio file selected');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('upload Audio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              _buildauth(),
            _buildGetAllDataSumbit(),
          ElevatedButton(
              onPressed: () {
              context.read<EmailAuthCubit>().loginUser(widget.email, widget.password);

              },
              child: Text('mohamed'))
        ],
      ),
    ));
  }
}
