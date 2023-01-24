import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1b20),
        title: const Text("Common Questions"),
      ),
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.025),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "FREQUENT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kColorPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('How often should I exercise?'),
                      children: [
                        Text('You can repeat your daily workouts as you need. For beginners, we suggest that you exercise once a day, 2-3 times a week. For experienced users, you can exercise once or several times a day as you need.\n'),
                        Text('All workouts are designed by professionals, it\'s suitable for everyone, teens and adults, men and women.\n'),
                        Text('If you\'re ill, injured, or unable to exercise due to your personal physical condition, please consult your doctor before exercising. We\'re not responsible for any injuries you may sustain while exercising.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Don\'t want ads?'),
                      children: [
                        Text('Our app is free, so we need to make money by displaying ads. But we won\'t pop up any ads outside the app.\n'),
                        Text('We\'re trying to find ways to display ads without disturbing you. Please feel free to contact us if you have any suggestions.\n'),
                        Text('We also allow you to remove all ads if you want to. Thanks for your understanding.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Is it too easy for me?'),
                      children: [
                        Text('We provide workout plans with 3 difficulty levels for you, you can adjust to a higher level by tapping + in the upper right corner of the home page.\n'),
                        Text('Besides, you can use weight, such as holding dumbbells or water bottles when performing workouts.\n'),
                        Text('Note: To avoid injury, we recommend you start with a light weight, then gradually increase weight when your body adapts to the exercise.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Is it too hard for me?'),
                      children: [
                        Text('Don\'t be anxious, you don\'t have to strictly follow the scheduled workout day by day.\n'),
                        Text('If you feel the workout is too hard to go on, you can repeat the day that you feel appropriate, and move to the next day when you\'re ready.\n'),
                        Text('Listen to your body and adjust your workout. But remember persistence is always the most important thing. Hope you achieve your goal! '),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Can\'t see the results?'),
                      children: [
                        Text('Rome was not built in a day. The key to losing weight is determination and persistence, and the completion of each movement is an improvement.\n'),
                        Text('We recommend that you choose a goal that fits your fitness level, and perform exercises under the guidance. In addition, a low-sugar and high-protein diet can maximize your results.\n'),
                        Text('Don\'t be discouraged, there are many other ways to measure your progress:\n '),
                        Text(' 1. You feel that working out is not as tired as before \n 2. Your body circumference reduced \n 3. You can see from the recorded photos that you\'re getting fitter'),
                      ]
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.025),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "APP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kColorPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Can I use this app?'),
                      children: [
                        Text('The answer is absolutely "Yes" if you are in a good condition. All workouts are designed by professionals, it\'s suitable for everyone, teens and adults, men and women.\n'),
                        Text('If you are a beginner, especially a teen beginner, please follow our beginner plan to slowly start, and gradually build up to prevent injury. Warm-up and cool-down are important, please make sure not to skip them.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Want more workouts?'),
                      children: [
                        Text('We have already started to prepare workouts of warm-up, stretching, leg, upper body, with dumbbells and so on, and look forward to providing you with these contents soon.\n'),
                        Text('Your suggestion is very important to help us improve our app. Please feel free to send it by the feedback button below or on the Me page.\n'),
                        Text('We would consider it seriously and work hard to bring you a better experience. Thanks for your support.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('I\'ve finished 30 days training. What now?'),
                      children: [
                        Text('Good job! You can try a higher level now.\n'),
                        Text('If you have finished all the levels, you can repeat the advanced training to reinforce your results or custom your own training in "My Training".'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Should I warm up & cool down?'),
                      children: [
                        Text('Yes. Warm-up is important before your workout. It helps you reduce injuries and improve your workout performance.\n'),
                        Text('Cooling down after workout is also necessary, because it helps your body return to its normal state and even reduce the chance of muscle soreness.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('What if I miss a workout day?'),
                      children: [
                        Text('Take it easy, missing one workout day won\'t derail your progress. You can count it a rest day and continue the workout tomorrow. Listen to your body, don\'t rush to catch up on the missing progress.\n'),
                        Text('However, don\'t make it a habit. Lack of motivation can hinder your progress. We provide workout reminder to help you stick to workout.'),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ExpansionTile(
                      title: Text('Why does the Reminder not work?'),
                      children: [
                        Text('There may be several reasons. You can check settings as follows:\n 1. Have you enabled Lose Weight App for Men to auto start on your phone?\n 2. Have you installed third-party apps like CleanMaster which may prohibit Lose Weight App for Men running in background and send notifications?\n 3. Have you turned off the reminder?'),
                        Text('If you have checked and the reminder still doesn\'t work, please send us "6189" via the feedback button below. We will try our best to solve the problem ASAP and bring you a better experience.'),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}