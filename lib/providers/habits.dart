import 'package:flutter/cupertino.dart';
import 'package:habo_master/services/firebase_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habo_master/widgets/habit.dart';
import 'package:provider/provider.dart';


class TodosProvider extends ChangeNotifier {

  final FirebaseAuth auth = FirebaseAuth.instance;

   inputData() async{
    final User user = auth.currentUser;
    String uid = '123'; // FOR TESTING PURPOSE
    print('UID TEST');
    print(uid);
    return uid;
  }
  List<Habit> _habits = [];


  void setTodos(List<Habit> habits) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _habits = habits;
        notifyListeners();
      });

  void addHabit(Habit habit) async => FirebaseApi(uid:await inputData()).createHabit(habit);



}
