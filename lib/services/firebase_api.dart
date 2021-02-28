import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:habo_master/widgets/habit.dart';

class FirebaseApi {

 final String uid;
 FirebaseApi({this.uid});


   Future<String> createHabit(Habit habit) async {
    //final docTodo = FirebaseFirestore.instance.collection('todo').doc();
    final docHabit = FirebaseFirestore.instance
        .collection('test')
        .doc();
    habit.id = int.parse(docHabit.id);
    await docHabit.set(habit.toJson());

    return docHabit.id;
  }

}