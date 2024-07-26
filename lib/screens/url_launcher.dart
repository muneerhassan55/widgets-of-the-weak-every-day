import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({super.key});

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Url Launcher"),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  launchUrl(Uri.https('hussainmustafa.com'));
                });
              },
              child: Text(
                "Launch Web Url",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.green,
            ),
            MaterialButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    "mailto:muneerhassan5544@gmail.com?subject=Flutter Developer&body=Hi How are you"));
              },
              child: Text(
                "Launch Mail Url",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
