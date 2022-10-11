import 'package:date_time_picker/date_time_picker.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>{

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context){
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
        print("Refresh State>>>>>>>>>>>>");

      }
    }, builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(">>>>>>>>>>>>>Pressed");
            showDialog(
              context: context,
              builder: (_) =>  Dialog(
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  //dateMask: 'd MMM, yyyy',
                  // controller: _controller1,
                  //initialValue: _initialValue,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  //icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  use24HourFormat: false,
                  locale: Locale('pt', 'BR'),
                  selectableDayPredicate: (date) {
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }
                    return true;
                  },
                  onChanged: (val) {},
                  validator: (val) {
                    {}
                    return null;
                  },
                  onSaved: (val) {},
                ),
              ),
            );
           // _homeBloc.add(RefreshScreenEvent());
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("REMINDER"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.notifications_none, color: Colors.white, size: 80,),
            ),
            SizedBox(height: 10),
            Text("Please set your reminder",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );});
  }
}