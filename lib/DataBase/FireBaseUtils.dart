import 'package:cloud_firestore/cloud_firestore.dart';

import 'Models/Todo.dart';

extension getDateTime on DateTime{
  DateTime getDateTimeWhithOutTimeDetails(){
    return DateTime(this.year,this.month,this.day);
  }
}

CollectionReference<Todo> getTodoRefWithConverters(){

  return FirebaseFirestore.instance.collection('todos').withConverter<Todo>(
    fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );
}

Future<void> addTodoFireStore(Todo todo){
  DocumentReference doc = getTodoRefWithConverters().doc();
  todo.id=doc.id;
  Todo newTodo =Todo(id :doc.id, title: todo.title, description: todo.description, dateTime: todo.dateTime);
  return doc.set(newTodo);
}