import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff1c1b20),
        title: const Text("Help"),
      ),
      body: ListView(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme:const IconThemeData(
                color:  Color(0xff1ce5c1),
              ),
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "What is this App about?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How can i start my training?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How to follow trainer?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How to track my progress?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                'What is "Add to training"?',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How to logout?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How to edit my profile?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xff1ce5c1),
            ),
            child: const ExpansionTile(
              title: Text(
                "How to share this app?",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(12.0),
              children: [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
