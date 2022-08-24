import 'package:flutter/material.dart';

import '../DataBase/FireBaseUtils.dart';
import '../DataBase/Models/Todo.dart';

class listProvider extends ChangeNotifier{
  List<Todo> items = [];
  DateTime selectedDay = DateTime.now();
  void refreshTodo() {
    getTodoRefWithConverters().get().then((documentSnapShot) {
      items = documentSnapShot.docs.map((document)  {
       return document.data();
      }).toList();
      items = items.where((todo){
        return selectedDay.getDateTimeWhithOutTimeDetails().compareTo(todo.dateTime.getDateTimeWhithOutTimeDetails())==0;
      } ).toList();
      items.sort((Todo a , Todo b){
        return a.dateTime.compareTo(b.dateTime);
      });
      notifyListeners();
    });
  }

  void setNewSelectedDay(DateTime newSelectedDay){
    selectedDay=newSelectedDay;
    notifyListeners();
  }
}