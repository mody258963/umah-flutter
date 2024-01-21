import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/besnese_logic/uploding_data/uploding_data_cubit.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  File? _selectedAudio;
  final TextEditingController titleController = TextEditingController();

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
          title: Text('Upload Audio'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Textarea(),
            ElevatedButton(
              onPressed: () {
                _pickAudio();
              },
              child: Text('pick'),
            ),
            ElevatedButton(
              onPressed: () {
                     context
            .read<UplodingDataCubit>()
            .uploadAudio(_selectedAudio, titleController.text, "1");
              },
              child: Text('upload'),
            )
          ],
        ),
      ),
    );
  }
}
