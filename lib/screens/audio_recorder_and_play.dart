import 'dart:io';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecorderAndPlay extends StatefulWidget {
  const AudioRecorderAndPlay({super.key});

  @override
  State<AudioRecorderAndPlay> createState() => _AudioRecorderAndPlayState();
}

class _AudioRecorderAndPlayState extends State<AudioRecorderAndPlay> {
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false, isPlaying = false;
  String? recordingPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUi(),
      floatingActionButton: _recrdingButton(),
    );
  }

  Widget _buildUi() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (recordingPath != null)
            MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                child: Text(
                  isPlaying
                      ? 'Stop Playing Recording'
                      : 'Start Playing Recording',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (audioPlayer.playing) {
                    audioPlayer.stop();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    await audioPlayer.setFilePath(recordingPath!);
                    audioPlayer.play();
                    setState(() {
                      isPlaying = true;
                    });
                  }
                }),
          if (recordingPath == null) Text('No Recording Found! :')
        ],
      ),
    );
  }

  Widget _recrdingButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (isRecording) {
          String? filePath = await audioRecorder.stop();
          if (filePath != null) {
            setState(() {
              isRecording = false;
              recordingPath = filePath;
            });
          }
        } else {
          if (await audioRecorder.hasPermission()) {
            final Directory appDocumetDir =
                await getApplicationCacheDirectory();
            final String filePath = p.join(appDocumetDir.path, 'recording.wav');
            await audioRecorder.start(RecordConfig(), path: filePath);
            setState(() {
              isRecording = true;
              recordingPath = null;
            });
          }
        }
      },
      child: Icon(isRecording ? Icons.stop : Icons.mic),
    );
  }
}
