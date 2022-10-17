import 'package:fitness_app/screens/rest_screen/rest_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class StartExercise extends StatefulWidget {
  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  StartExercise({Key? key,required this.exerciseData,required this.dayModelLocalDB}) : super(key: key);

  @override
  State<StartExercise> createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  double value = 60.0;
  int index=0;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    index=widget.dayModelLocalDB!.exerciseNumInProgress;

  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is LoadingState) {
      } else if (state is ErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white,
            fontSize: 12.0);
      } else if (state is RefreshScreenState) {
      }else if (state is UpdateAllExerciseState) {
        widget.exerciseData!.exerciseList![index]=state.exerciseModelLocalDB;
        double progress;
        if(index<widget.exerciseData!.exerciseList!.length) {
          if (widget.dayModelLocalDB!.completedPercentage == 0) {
            progress = (1 / widget.exerciseData!.exerciseList!.length);
            progress = progress * 100;
            print('>>>>>>> $progress');
          } else {
            progress = (widget.dayModelLocalDB!.completedPercentage / 100);
            progress = progress * widget.exerciseData!.exerciseList!.length;
            progress = progress + 1;
            progress = progress / widget.exerciseData!.exerciseList!.length;
            progress = progress * 100;
            print('>>>>>>>2 $progress');
          }

          index = index + 1;
          widget.dayModelLocalDB!.exerciseNumInProgress = index;


          _homeBloc.add(UpdateDayProgressEvent(
              dayModelLocalDB: widget.dayModelLocalDB!,
              progress: int.parse(progress.ceil().toString())));
        }

      }else if (state is UpdateDayProgressState) {
        widget.dayModelLocalDB=state.dayModelLocalDB;

      }
    }, builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state is LoadingState,
      child: Scaffold(
        body: SafeArea(
          child: ColorRemover(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/${widget.exerciseData!.exerciseList![index].image}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xff1c1b20),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Column(
                            children: [
                              AppBar(
                                leading: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                                backgroundColor: Colors.transparent,
                                actions: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.info_outline)),
                                ],
                              ),
                              const Spacer(),
                               Text(
                                widget.exerciseData!.exerciseList![index].name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              const Text(
                                "2 mins |1 set |15 reps",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "READY TO GO!",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff1ce5c1)),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),

                          widget.exerciseData!.exerciseList![index].type=='rap'?SizedBox():SleekCircularSlider(
                            initialValue: value,
                            max: 100,
                            appearance: CircularSliderAppearance(
                              // infoProperties: InfoProperties(),
                              angleRange: 360,
                              size: MediaQuery.of(context).size.width * 0.5,
                              customWidths: CustomSliderWidths(
                                  progressBarWidth: 12.0, trackWidth: 6.0),
                              customColors: CustomSliderColors(
                                hideShadow: true,
                                progressBarColor: const Color(0xff1ce5c1),
                                dotColor: Colors.transparent,
                                trackColor: const Color(0xff404040),
                                progressBarColors: [
                                  const Color(0xff1ce5c1),
                                  const Color(0xff1ce5c1),
                                ],
                              ),
                            ),
                            innerWidget: (re) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "0:30",
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    Text(
                                      "mins",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onChange: (e) {
                              setState(() {
                                value = e;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  widget.exerciseData!.exerciseList![index].type=='rap'? Center(
                      child: Text(
                        "X ${widget.exerciseData!.exerciseList![index].raps}",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )):const SizedBox(),
                  widget.exerciseData!.exerciseList![index].type=='rap'?SizedBox(
                    height: screenSize.height*0.07,
                  ):const SizedBox(),
                  index!=0?GestureDetector(
                    onTap: () {
                     if(index>=1){
                       index=index-1;
                       setState(() {

                       });
                     }
                    },
                    child: const Center(
                        child: Text(
                          "< PREVIOUS",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1ce5c1),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ):SizedBox(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      alignment: Alignment.center,
                      child: MyButton(name: widget.exerciseData!.exerciseList![index].type=='rap'?"Done":"Stop", whenpress: () {
    if(index<widget.exerciseData!.exerciseList!.length) {
      _homeBloc.add(ChangeExerciseStatusToDoneEvent(
          exerciseModelLocalDB: widget.exerciseData!.exerciseList![index]));
    }
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  index<widget.exerciseData!.exerciseList!.length-1?GestureDetector(
                    onTap: () {
                      if(index<widget.exerciseData!.exerciseList!.length){
                        index=index+1;
                        setState(() {

                        });
                      }
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (ctx) =>const RestScreen()));
                    },
                    child: const Center(
                        child: Text(
                      "SKIP >",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff1ce5c1),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ):const SizedBox(),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          index<widget.exerciseData!.exerciseList!.length-1? widget.exerciseData!.exerciseList![index+1].name:"",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        index<widget.exerciseData!.exerciseList!.length-1?const Text(
                          "5 mins |2 set |26 reps",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ):const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );});
  }
}
