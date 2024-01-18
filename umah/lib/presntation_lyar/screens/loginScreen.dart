import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/uploding_data/uploding_data_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  File? _selectedAudio;

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
          _Textarea(),
          ElevatedButton(
              onPressed: () {
                _pickAudio();
                context.read<UplodingDataCubit>().uploadAudio(_selectedAudio, titleController.text);
              
                    

              },
              child: Text('mohamed'))
        ],
      ),
    ));
  }
}
