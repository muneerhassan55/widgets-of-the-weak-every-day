import 'package:flutter/material.dart';

class BottomModelSheet extends StatefulWidget {
  const BottomModelSheet({super.key});

  @override
  State<BottomModelSheet> createState() => _BottomModelSheetState();
}

class _BottomModelSheetState extends State<BottomModelSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BotomModelSheet'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2022/01/be_a_better_photographer_cover.jpg?resize=1250,1120'))),
                        ),
                        Text(
                          'PhotoGraphy',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "The word Photography literally means 'drawing with light', which derives from the Greek photo, meaning light and graph, meaning to draw. Photography is the process of recording an image – a photograph – on lightsensitive film or, in the case of digital photography, via a digital electronic or magnetic memory"),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text("Share"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }
}
