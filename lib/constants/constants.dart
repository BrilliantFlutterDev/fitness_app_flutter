import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/models/chat_model.dart';
import 'package:fitness_app/models/exercise_model.dart';
import 'package:fitness_app/models/gym_model.dart';
import 'package:fitness_app/models/user_model.dart';

import '../models/day_model.dart';

class ExerciseConstants {
  List<GymModel> dailyExercises = [
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 1",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 1",
        name: "SQUATS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 1",
        name: "HIGH STEPPING",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Run in place while pulling your knees as high as possible with each step."
            "\n\n"
            "Keep your upper body upright during this exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 1",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 1",
        name: "REVERSE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 1",
        name: "PLANK",
        raps: 15,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 1",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),
    // GymModel(
    //     image: "Battle Rope.jpg",
    //     dayTitle: "Day 1",
    //     name: "Battle Rope",
    //     raps: 15,
    //     time: "00",
    //     type: 'rap',
    //     kneeIssue: 'N',
    //     planLevel: "B",
    //     inPushUpCat: 'Y',
    //     inPlankCat: 'N'),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 2",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 2",
        name: "TRICEPS DIPS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 2",
        name: "JUMPING JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 2",
        name: "LONG ARM CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 2",
        name: "BICYCLE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 2",
        name: "PLANK",
        raps: 15,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 2",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),
    // GymModel(
    //     image: "Battle Rope.jpg",
    //     dayTitle: "Day 2",
    //     name: "Battle Rope",
    //     raps: 15,
    //     time: "00",
    //     type: 'rap',
    //     kneeIssue: 'N',
    //     planLevel: "B",
    //     inPushUpCat: 'Y',
    //     inPlankCat: 'N'),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 3",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 3",
        name: "JUMPING JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 3",
        name: "ABDOMINAL CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 3",
        name: "HEEL TOUCH",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 3",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 3",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 3",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),
    // GymModel(
    //     image: "Battle Rope.jpg",
    //     dayTitle: "Day 3",
    //     name: "Battle Rope",
    //     raps: 15,
    //     time: "00",
    //     type: 'rap',
    //     kneeIssue: 'N',
    //     planLevel: "B",
    //     inPushUpCat: 'Y',
    //     inPlankCat: 'N'),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 4",
        name: "Wheel Stretch",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 4",
        name: "Full Crunches",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 4",
        name: "Battle Rope",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 4",
        name: "Side Crunches",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 4",
        name: "Half Crunches",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 4",
        name: "Wheel Stretch",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 4",
        name: "Full Crunches",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 4",
        name: "Battle Rope",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 5",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 5",
        name: "LUNGES",
        raps: 0,
        time: 16,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 5",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 5",
        name: "REVERSE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 5",
        name: "HEEL TOUCH",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 5",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 5",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 6",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 6",
        name: "TRICEPS DIPS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 6",
        name: "HIGH STEPPING",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Run in place while pulling your knees as high as possible with each step."
            "\n\n"
            "Keep your upper body upright during this exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 6",
        name: "SQUAT PULSES",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart. Bend your arms in front of you to keep balance."
            "\n\n"
            "Lower your body until your thighs are parallel with the floor. Come half way up instead of coming all the way up, then squat down again. Repeat.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 6",
        name: "BICYCLE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 6",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 6",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 7",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 7",
        name: "TRICEPS DIPS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 7",
        name: "LUNGES",
        raps: 0,
        time: 16,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 7",
        name: "LONG ARM CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 7",
        name: "REVERSE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 7",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 7",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 9",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 9",
        name: "SQUATS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 9",
        name: "PLANK JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 9",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 9",
        name: "LEG RAISES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your back, and put your hands beneath your hips for support."
            "\n\n"
            "Then lift your legs up until they form a right angle with the floor."
            "\n\n"
            "Slowly bring your legs back down and repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 9",
        name: "HEEL TOUCH",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 9",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 9",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 10",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 10",
        name: "LUNGES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 10",
        name: "PLANK JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 10",
        name: "LONG ARM CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 10",
        name: "ABDOMINAL CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 10",
        name: "REVERSE CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 10",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 10",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 11",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 11",
        name: "SQUATS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 11",
        name: "LATERAL PLANK WALK",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in a straight arm plank position with your hands underneath your shoulders."
            "\n\n"
            "Walk your hands and feet to the left at the same time. Take a few steps to the left, then a few steps to the right. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 11",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 11",
        name: "BICYCLE CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 11",
        name: "HEEL TOUCH",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 11",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 11",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 13",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 13",
        name: "TRICEPS DIPS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 13",
        name: "HIGH STEPPING",
        raps: 0,
        time: 36,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Run in place while pulling your knees as high as possible with each step."
            "\n\n"
            "Keep your upper body upright during this exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 13",
        name: "LATERAL PLANK WALK",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in a straight arm plank position with your hands underneath your shoulders."
            "\n\n"
            "Walk your hands and feet to the left at the same time. Take a few steps to the left, then a few steps to the right. Repeat the exercise.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 13",
        name: "LONG ARM CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 13",
        name: "ABDOMINAL CRUNCHES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 13",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 13",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 14",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 14",
        name: "JUMPING JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 14",
        name: "STEP-UP ONTO CHAIR",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand in front of a chair. Then step up on the chair and step back down."
            "\n\n"
            "The exercise works to strengthen the legs and buttocks.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 14",
        name: "LEG RAISES",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your back, and put your hands beneath your hips for support."
            "\n\n"
            "Then lift your legs up until they form a right angle with the floor."
            "\n\n"
            "Slowly bring your legs back down and repeat.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 14",
        name: "BUTT BRIDGE",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms flat at your sides."
            "\n\n"
            "Then lift your butt up and down.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 14",
        name: "BICYCLE CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 14",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 14",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 15",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 15",
        name: "STEP-UP ONTO CHAIR",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand in front of a chair. Then step up on the chair and step back down."
            "\n\n"
            "The exercise works to strengthen the legs and buttocks.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 15",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 15",
        name: "LEG RAISES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your back, and put your hands beneath your hips for support."
            "\n\n"
            "Then lift your legs up until they form a right angle with the floor."
            "\n\n"
            "Slowly bring your legs back down and repeat.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 15",
        name: "HEEL TOUCH",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 15",
        name: "RECLINED OBLIQUE TWIST",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 15",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 15",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 17",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 17",
        name: "LUNGES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 17",
        name: "PLANK JACKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 17",
        name: "ABDOMINAL CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 17",
        name: "BUTT BRIDGE",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms flat at your sides."
            "\n\n"
            "Then lift your butt up and down.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 17",
        name: "REVERSE CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 17",
        name: "RECLINED OBLIQUE TWIST",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 17",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 17",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 18",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 18",
        name: "SQUATS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 18",
        name: "BURPEES",
        raps: 6,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart, then put your hands on the ground and kick your feet backward. Do a quick push-up and then jump up.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 18",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 18",
        name: "REVERSE CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 18",
        name: "HEEL TOUCH",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 18",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 18",
        name: "PLANK",
        raps: 0,
        time: 00,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 18",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 19",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 19",
        name: "HIGH STEPPING",
        raps: 0,
        time: 36,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Run in place while pulling your knees as high as possible with each step."
            "\n\n"
            "Keep your upper body upright during this exercise.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 19",
        name: "LATERAL PLANK WALK",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in a straight arm plank position with your hands underneath your shoulders."
            "\n\n"
            "Walk your hands and feet to the left at the same time. Take a few steps to the left, then a few steps to the right. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 19",
        name: "SQUAT PULSES",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart. Bend your arms in front of you to keep balance."
            "\n\n"
            "Lower your body until your thighs are parallel with the floor. Come half way up instead of coming all the way up, then squat down again. Repeat.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 19",
        name: "ABDOMINAL CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 19",
        name: "BUTT BRIDGE",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms flat at your sides."
            "\n\n"
            "Then lift your butt up and down.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 19",
        name: "RECLINED OBLIQUE TWIST",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 19",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 19",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 21",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 21",
        name: "TRICEPS DIPS",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 21",
        name: "BURPEES",
        raps: 6,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart, then put your hands on the ground and kick your feet backward. Do a quick push-up and then jump up.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 21",
        name: "LONG ARM CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 21",
        name: "BUTT BRIDGE",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms flat at your sides."
            "\n\n"
            "Then lift your butt up and down.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 21",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 21",
        name: "RECLINED OBLIQUE TWIST",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 21",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 21",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 22",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 22",
        name: "SQUATS",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 22",
        name: "TRICEPS DIPS",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 22",
        name: "PLANK JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 22",
        name: "LEG RAISES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your back, and put your hands beneath your hips for support."
            "\n\n"
            "Then lift your legs up until they form a right angle with the floor."
            "\n\n"
            "Slowly bring your legs back down and repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 22",
        name: "HEEL TOUCH",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 22",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 22",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 22",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 23",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 23",
        name: "LUNGES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 23",
        name: "PLANK JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 23",
        name: "ABDOMINAL CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 23",
        name: "BICYCLE CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your hands behind your ears. Raise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. Repeat the exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 23",
        name: "REVERSE CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 23",
        name: "CRUNCHES WITH LEGS RAISED",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs straight up towards the ceiling and your hands behind your ears."
            "\n\n"
            "Lift your shoulders up off the floor,then slowly go back to the starting position. Repeat the exercise.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 23",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 23",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 25",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 25",
        name: "TRICEPS DIPS",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 25",
        name: "HIGH STEPPING",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Run in place while pulling your knees as high as possible with each step."
            "\n\n"
            "Keep your upper body upright during this exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 25",
        name: "LONG ARM CRUNCHES",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 25",
        name: "BUTT BRIDGE",
        raps: 16,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms flat at your sides."
            "\n\n"
            "Then lift your butt up and down.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 25",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 25",
        name: "RECLINED OBLIQUE TWIST",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 25",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 25",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 26",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 26",
        name: "LUNGES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 26",
        name: "JUMPING JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 26",
        name: "STEP-UP ONTO CHAIR",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand in front of a chair. Then step up on the chair and step back down."
            "\n\n"
            "The exercise works to strengthen the legs and buttocks.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 26",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 26",
        name: "LONG ARM CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 26",
        name: "RECLINED OBLIQUE TWIST",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs extended and your elbows directly under your shoulders."
            "\n\n"
            "Lift your left leg up at a 45 degree angle while reaching your right arm over to your left side."
            "\n\n"
            "Then slowly go back to the starting position. Repeat several times, and then switch to the other side.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 26",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 26",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 27",
        name: "MOUNTAIN CLIMBER",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
            "\n\n"
            "This exercise strengthens multiple muscle groups.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 27",
        name: "SQUATS",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 27",
        name: "PLANK JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in the straight arm plank position with your hands under your shoulders and feet together."
            "\n\n"
            "Hop your feet apart and land on your toes, then hop back. Repeat the exercise.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 27",
        name: "BURPEES",
        raps: 6,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart, then put your hands on the ground and kick your feet backward. Do a quick push-up and then jump up.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 27",
        name: "REVERSE CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees up at a 90 degree angle and your hands behind your head."
            "\n\n"
            "Lift your upper body and thighs, and then stretch out. Repeat this exercise.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 27",
        name: "HEEL TOUCH",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 27",
        name: "CRUNCHES WITH LEGS RAISED",
        raps: 18,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your legs straight up towards the ceiling and your hands behind your ears."
            "\n\n"
            "Lift your shoulders up off the floor,then slowly go back to the starting position. Repeat the exercise.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 27",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 27",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 29",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 29",
        name: "SQUATS",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor."
            "\n\n"
            "Your knees should be extended in the same direction as your toes. Return to the start position and do the next rep."
            "\n\n"
            "This works the thighs, hips buttocks, quads, hamstrings and lower body.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 29",
        name: "TRICEPS DIPS",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair."
            "\n\n"
            "Slowly bend and stretch your arms to make your body go up and down. This is a great exercise for the triceps.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 29",
        name: "JUMPING JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 29",
        name: "SQUAT PULSES",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart. Bend your arms in front of you to keep balance."
            "\n\n"
            "Lower your body until your thighs are parallel with the floor. Come half way up instead of coming all the way up, then squat down again. Repeat.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 29",
        name: "LONG ARM CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with knees bent and feet flat on the floor. Put your arms straight over the top of your head."
            "\n\n"
            "Lift your upper body off the floor, then slowly go back to the start position. The exercise increases abdominal endurance.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 29",
        name: "FLUTTER KICKS",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your arms at your sides. Lift your legs and keep them as straight as you can."
            "\n\n"
            "Then quickly raise your right leg up, and simultaneously lower your left leg. Switch legs and repeat.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 29",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 29",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),

    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 30",
        name: "SKIPPING WITHOUT ROPE",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Place your arms at your sides and pretend to hold a skipping rope handle in each hand."
            "\n\n"
            "Jump and alternately land on the balls of your feet, rotating your wrists at the same time as if you were spinning a rope.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 30",
        name: "LUNGES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Stand with your feet shoulder width apart and your hands on your hips."
            "\n\n"
            "Take a step forward with your right leg and lower your body until your right thigh is parallel with the floor."
            "\n\n"
            "Then return and switch to the other leg. This exercise strengthens the quadriceps, gluteus maximus and hamstrings.",
    ),
    GymModel(
        image: "Battle Rope.jpg",
        dayTitle: "Day 30",
        name: "JUMPING JACKS",
        raps: 0,
        time: 40,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead."
            "\n\n"
            "Return to the start position then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.",
    ),
    GymModel(
        image: "Side Crunches.jpg",
        dayTitle: "Day 30",
        name: "LATERAL PLANK WALK",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Start in a straight arm plank position with your hands underneath your shoulders."
            "\n\n"
            "Walk your hands and feet to the left at the same time. Take a few steps to the left, then a few steps to the right. Repeat the exercise.",
    ),
    GymModel(
        image: "Half Crunches.jpg",
        dayTitle: "Day 30",
        name: "PUSH-UPS",
        raps: 15,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lay prone on the ground with arms supporting your body."
            "\n\n"
            "Keep your body straight while raising and lowering your body with your arms."
            "\n\n"
            "This exercise works the chest, shouIders, triceps, back and legs.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 30",
        name: "ABDOMINAL CRUNCHES",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on your back with your knees bent and your arms stretched forward."
            "\n\n"
            "Then lift your upper body off the floor. Hold for a few seconds and slowly return."
            "\n\n"
            "It primarily works the rectus abdominis muscle and the obliques.",
    ),
    GymModel(
        image: "Wheel Stretch.jpg",
        dayTitle: "Day 30",
        name: "HEEL TOUCH",
        raps: 20,
        time: 0,
        type: 'rap',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the ground with your legs bent and your arms by your sides."
            "\n\n"
            "Slightly lift your upper body off the floor and make your hands alternately reach your heels.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 30",
        name: "PLANK",
        raps: 0,
        time: 0,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can."
            "\n\n"
            "This exercise strengthens the abdomen, back and shoulders.",
    ),
    GymModel(
        image: "Full Crunches.jpg",
        dayTitle: "Day 30",
        name: "COBRA STRETCH",
        raps: 0,
        time: 30,
        type: 'time',
        kneeIssue: 'N',
        planLevel: "B",
        inPushUpCat: 'Y',
        inPlankCat: 'N',
        discription: "Lie down on your stomach and bend your elbows with your hands beneath your shoulders."
            "\n\n"
            "Then push your chest up off the ground as far as possible. Hold this position for seconds.",
    ),
  ];


  List<ExercisesModel> AllExercises = [
      ExercisesModel(
          id: 1,
          name: "MOUNTAIN CLIMBER",
          image: "Wheel Stretch.jpg",
          type: "time",
          raps: 0,
          time: 30,
          discription: "Start in the push-up position. Bend your right knee towards your chest and keep your left leg straight, then quickly switch from one leg to the other."
              "\n\n"
              "This exercise strengthens multiple muscle groups.",
      ),
    // GymModel(image: "Chest Workouts.jpg", name: "STRAIGHT-ARM PLANK"),
    // GymModel(image: "Arm Workouts.jpg", name: "STANDING BICYCLE CRUNCHES"),
    // GymModel(image: "Back Workouts.jpg", name: "HIGH STEPPING"),
    // GymModel(image: "Leg Workouts.jpg", name: "JUMPING JACKS"),
    // GymModel(image: "Chest Workouts.jpg", name: "SKIPPING WITHOUT ROPE"),
    // GymModel(image: "Arm Workouts.jpg", name: "MOUNTAIN CLIMBER"),
    // GymModel(image: "Back Workouts.jpg", name: "TOY SOLDIERS"),
    // GymModel(image: "Leg Workouts.jpg", name: "BACKWARD LUNGE"),
    // GymModel(image: "Chest Workouts.jpg", name: "KNEE TO ELBOW CRUNCHES"),
    // GymModel(image: "Arm Workouts.jpg", name: "IN & OUT"),
    // GymModel(image: "Back Workouts.jpg", name: "SQUAT REACH UPS"),
    // GymModel(image: "Leg Workouts.jpg", name: "BUTT BRIDGE"),
    // GymModel(image: "Chest Workouts.jpg", name: "GLUTE KICK BACK"),
    // GymModel(image: "Arm Workouts.jpg", name: "FROG PRESS"),
    // GymModel(image: "Back Workouts.jpg", name: "STRAIGHT LEG RAISE LEFT"),
    // GymModel(image: "Leg Workouts.jpg", name: "STRAIGHT LEG RAISE RIGHT"),
    // GymModel(image: "Chest Workouts.jpg", name: "FLUTTER KICKS"),
    // GymModel(image: "Arm Workouts.jpg", name: "SQUATS"),
    // GymModel(image: "Back Workouts.jpg", name: "REVERSE CRUNCHES"),
    // GymModel(image: "Leg Workouts.jpg", name: "STEP-UP ONTO CHAIR"),
    // GymModel(image: "Chest Workouts.jpg", name: "TRICEPS DIPS"),
    // GymModel(image: "Arm Workouts.jpg", name: "PLANK"),
    // GymModel(image: "Back Workouts.jpg", name: "BICYCLE CRUNCHES"),
    // GymModel(image: "Leg Workouts.jpg", name: "LUNGES"),
    // GymModel(image: "Chest Workouts.jpg", name: "INCLINE PUSH-UPS"),
    // GymModel(image: "Arm Workouts.jpg", name: "RUSSIAN TWIST"),
    // GymModel(image: "Back Workouts.jpg", name: "COBRA STRETCH"),
    // GymModel(image: "Leg Workouts.jpg", name: "BURPEES"),
    // GymModel(image: "Chest Workouts.jpg", name: "ABDOMINAL CRUNCHES"),
    // GymModel(image: "Arm Workouts.jpg", name: "LEG RAISES"),
    // GymModel(image: "Back Workouts.jpg", name: "SCISSORS"),
    // GymModel(image: "Leg Workouts.jpg", name: "INCHWORMS"),
    // GymModel(image: "Chest Workouts.jpg", name: "HEEL TOUCH"),
    // GymModel(image: "Arm Workouts.jpg", name: "RECLINED OBLIQUE TWIST"),
    // GymModel(image: "Back Workouts.jpg", name: "PLANK JACKS"),
    // GymModel(image: "Leg Workouts.jpg", name: "V-UP"),
    // GymModel(image: "Chest Workouts.jpg", name: "CRUNCHES WITH LEGS RAISED"),
    // GymModel(image: "Arm Workouts.jpg", name: "SQUAT PULSES"),
    // GymModel(image: "Back Workouts.jpg", name: "LATERAL PLANK WALK"),
    // GymModel(image: "Leg Workouts.jpg", name: "ROUNDHOUSE SQUAT KICKS"),
    // GymModel(image: "Chest Workouts.jpg", name: "PUSH-UPS"),
    // GymModel(image: "Arm Workouts.jpg", name: "LONG ARM CRUNCHES"),
    // GymModel(image: "Back Workouts.jpg", name: "DECLINE PUSH-UPS"),
  ];

  List<ChatModel> chat = [
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
  ];
  List<ChatModel> beginers = [
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];
  List<ChatModel> skills = [
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];

  List<ChatModel> recentActities = [
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];
  List<ChatModel> workouts = [
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
  ];
}

class Constants {
  List<DayModel> days = [
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 1",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 2",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 3",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 4",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 5",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 6",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 7",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 8",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 9",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 10",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 11",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 12",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 13",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 14",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 15",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 16",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 17",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 18",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 19",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 20",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 21",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 22",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 23",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 24",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 25",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 26",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Muscle Building Programs.jpg",
        name: "Day 27",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Chest Workouts.jpg",
        name: "Day 28",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0,
        isRest: 1,
    ),
    DayModel(
        image: "Weight Loss Programs.jpeg",
        name: "Day 29",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
    DayModel(
        image: "Weight Gain Programs.jpg",
        name: "Day 30",
        completedPercentage: 0,
        completeStatus: '0',
        planLevel: '',
        noOfGlassWaterDrank: 0,
        kneeIssue: '',
        exerciseNumInProgress: 0
    ),
  ];
  // List<GymModel> standard = [
  //   GymModel(image: "Chest Workouts.jpg", name: "STRAIGHT-ARM PLANK"),
  //   GymModel(image: "Arm Workouts.jpg", name: "STANDING BICYCLE CRUNCHES"),
  //   GymModel(image: "Back Workouts.jpg", name: "HIGH STEPPING"),
  //   GymModel(image: "Leg Workouts.jpg", name: "JUMPING JACKS"),
  //   GymModel(image: "Chest Workouts.jpg", name: "SKIPPING WITHOUT ROPE"),
  //   GymModel(image: "Arm Workouts.jpg", name: "MOUNTAIN CLIMBER"),
  //   GymModel(image: "Back Workouts.jpg", name: "TOY SOLDIERS"),
  //   GymModel(image: "Leg Workouts.jpg", name: "BACKWARD LUNGE"),
  //   GymModel(image: "Chest Workouts.jpg", name: "KNEE TO ELBOW CRUNCHES"),
  //   GymModel(image: "Arm Workouts.jpg", name: "IN & OUT"),
  //   GymModel(image: "Back Workouts.jpg", name: "SQUAT REACH UPS"),
  //   GymModel(image: "Leg Workouts.jpg", name: "BUTT BRIDGE"),
  //   GymModel(image: "Chest Workouts.jpg", name: "GLUTE KICK BACK"),
  //   GymModel(image: "Arm Workouts.jpg", name: "FROG PRESS"),
  //   GymModel(image: "Back Workouts.jpg", name: "STRAIGHT LEG RAISE LEFT"),
  //   GymModel(image: "Leg Workouts.jpg", name: "STRAIGHT LEG RAISE RIGHT"),
  //   GymModel(image: "Chest Workouts.jpg", name: "FLUTTER KICKS"),
  //   GymModel(image: "Arm Workouts.jpg", name: "SQUATS"),
  //   GymModel(image: "Back Workouts.jpg", name: "REVERSE CRUNCHES"),
  //   GymModel(image: "Leg Workouts.jpg", name: "STEP-UP ONTO CHAIR"),
  //   GymModel(image: "Chest Workouts.jpg", name: "TRICEPS DIPS"),
  //   GymModel(image: "Arm Workouts.jpg", name: "PLANK"),
  //   GymModel(image: "Back Workouts.jpg", name: "BICYCLE CRUNCHES"),
  //   GymModel(image: "Leg Workouts.jpg", name: "LUNGES"),
  //   GymModel(image: "Chest Workouts.jpg", name: "INCLINE PUSH-UPS"),
  //   GymModel(image: "Arm Workouts.jpg", name: "RUSSIAN TWIST"),
  //   GymModel(image: "Back Workouts.jpg", name: "COBRA STRETCH"),
  //   GymModel(image: "Leg Workouts.jpg", name: "BURPEES"),
  //   GymModel(image: "Chest Workouts.jpg", name: "ABDOMINAL CRUNCHES"),
  //   GymModel(image: "Arm Workouts.jpg", name: "LEG RAISES"),
  //   GymModel(image: "Back Workouts.jpg", name: "SCISSORS"),
  //   GymModel(image: "Leg Workouts.jpg", name: "INCHWORMS"),
  //   GymModel(image: "Chest Workouts.jpg", name: "HEEL TOUCH"),
  //   GymModel(image: "Arm Workouts.jpg", name: "RECLINED OBLIQUE TWIST"),
  //   GymModel(image: "Back Workouts.jpg", name: "PLANK JACKS"),
  //   GymModel(image: "Leg Workouts.jpg", name: "V-UP"),
  //   GymModel(image: "Chest Workouts.jpg", name: "CRUNCHES WITH LEGS RAISED"),
  //   GymModel(image: "Arm Workouts.jpg", name: "SQUAT PULSES"),
  //   GymModel(image: "Back Workouts.jpg", name: "LATERAL PLANK WALK"),
  //   GymModel(image: "Leg Workouts.jpg", name: "ROUNDHOUSE SQUAT KICKS"),
  //   GymModel(image: "Chest Workouts.jpg", name: "PUSH-UPS"),
  //   GymModel(image: "Arm Workouts.jpg", name: "LONG ARM CRUNCHES"),
  //   GymModel(image: "Back Workouts.jpg", name: "DECLINE PUSH-UPS"),
  // ];

  List<ChatModel> chat = [
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
    ChatModel(
        image: "Amenda Johnson.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Amenda Johnson"),
    ChatModel(
        image: "Lliana George.png",
        lastMessage: "No Worries,Believe in yourself",
        name: "Lliaana George"),
    ChatModel(
        image: "Olivier Haydon.jpg",
        lastMessage: "Yes, You can repeat same exerise today.",
        name: "Olivier Haydon"),
    ChatModel(
        image: "Peter  Johnson.jpg",
        lastMessage: "Fitness Trainer",
        name: "Peter Johnson"),
    ChatModel(
        image: "Suzein Smith.jfif",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Suzein Smith"),
    ChatModel(
        image: "Russeil Taylor.jpg",
        lastMessage: "It will help you in anyway,Trust me.",
        name: "Russeil Taylor"),
  ];
  List<ChatModel> beginers = [
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];
  List<ChatModel> skills = [
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];

  List<ChatModel> recentActities = [
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Strecho Workout.jpg",
      lastMessage: "90 | Amenda Johnson",
      name: "Strecho Workout",
    ),
    ChatModel(
      image: "Bell Magic Workout.jpg",
      lastMessage: "125 | Jackwill Smith",
      name: "Bell Magic Workout",
    ),
    ChatModel(
      image: "Soft Curve Workout.jpg",
      lastMessage: "100 | Linda Williamson",
      name: "Soft Curve Workout",
    ),
    ChatModel(
      image: "Strecho Workout2.jpg",
      lastMessage: "60 | Amenda Johnson",
      name: "Strecho Workout",
    ),
  ];
  List<ChatModel> workouts = [
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
    ChatModel(
      image: "Wheel Stretch.jpg",
      lastMessage: "2 mins |1 set | 12 reps",
      name: "Wheel Stretch",
    ),
    ChatModel(
      image: "Full Crunches.jpg",
      lastMessage: "5 mins |2 set | 25 reps",
      name: "Full Crunches",
    ),
    ChatModel(
      image: "Battle Rope.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Battle Rope",
    ),
    ChatModel(
      image: "Side Crunches.jpg",
      lastMessage: "3 mins |1 set | 15 reps",
      name: "Side Crunches",
    ),
    ChatModel(
      image: "Half Crunches.jpg",
      lastMessage: "5 mins |2 set | 30 reps",
      name: "Half Crunches",
    ),
  ];
}

class UserConstants {
  UserModel userdata = UserModel(
        gender: 'Male',
        dateOfBirth: '01-01-2000',  //DateTime.now()
        weight: '50',
        height: '5.7',
        countDownTime: 10,
        trainingRest: 20,
        turnOnWaterTracker: false,
        drinkNotification: false
    );
}
