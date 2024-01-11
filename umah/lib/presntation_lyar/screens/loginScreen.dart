import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:file_picker/file_picker.dart';
import 'package:just_audio/just_audio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  Widget _Textarea() {
    return Column(
      children: [
        Text('duration is here'),
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Password'),
        ),
      ],
    );
  }

  Future<Duration?> getAudioDuration(String filePath) async {
  final FlutterSoundPlayer player = FlutterSoundPlayer();
  final duration = await player.;
  print('Audio duration: ${duration.inSeconds} seconds');
  await player.closeAudio();
  }

  Future<void> pickAndUploadAudio() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.isNotEmpty) {
      String filePath = result.files.first.path!;
      await uploadAudioFile(filePath);
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
        children: [_Textarea()],
      ),
    ));
  }
}
