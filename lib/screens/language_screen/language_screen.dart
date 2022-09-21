import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languageList = [
    "Chinese",
    "English",
    "Spanish",
    "Arabic",
    "French",
    "Persian",
    "German",
    "Russian",
    "Malay",
    "Portuguese",
    "Italian",
    "Turkish",
    "Lahnda",
    "Tamil",
    "Urdu",
    "Korean",
    "Hindi",
    "Bengali",
    "Japanese",
    "Vietnamese",
    "Telugu",
    "Marath"
  ];
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Language"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ColorRemover(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                    // shrinkWrap: true\
                    physics: const BouncingScrollPhysics(),
                    itemCount: languageList.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        child: RadioListTile(
                          // secondary: true,
                          controlAffinity: ListTileControlAffinity.trailing,

                          title: Text(languageList[index]),
                          value: index,
                          groupValue: value,
                          onChanged: (int? ind) {
                            setState(() {
                              value = ind!;
                            });
                          },
                          // onChanged: (ind) =>
                          //     setState(() =>  int.parse(ind)),
                        ),
                      );
                    }),
              ),
              MyButton(
                name: "Continues",
                whenpress: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => const SelectPlanScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
