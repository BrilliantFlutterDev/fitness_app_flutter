import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/chat_screen/open_chat.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: ColorRemover(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: constants.chat.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const OpenChat()));
                    },
                    title: Text(
                      constants.chat[index].name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      constants.chat[index].lastMessage,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: const Text(
                      "11:40 am",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    leading: Image(
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/${constants.chat[index].image}")),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
