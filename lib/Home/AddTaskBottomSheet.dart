
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/DataBase/FireBaseUtils.dart';
import 'package:todo/DataBase/Models/Todo.dart';

import '../Providers/ListProvider.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  DateTime dateTime = DateTime.now();
  String title ='';
  String description ='';
  late listProvider listprovider;

  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     listprovider=Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              'Add New Task',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
        ),
        Form(
          key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (text){
                    title=text;
                  },
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Enter title here';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Task Title',
                  ),
                ),
                TextFormField(
                  onChanged: (text){
                    description=text;
                  },
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Enter description here';
                    }
                  },
                  maxLines: 4,
                  //maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Enter Task Description',
                  ),
                ),
              ],
            ),
        ),

        Container(
          margin: EdgeInsets.all(16),
          width: double.infinity,
          child: Text('Select Time',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.start,),
        ),
        InkWell(
          onTap: (){
            showMydatePicker();
          },
          child: Container(
            margin: EdgeInsets.all(12),
              child: Text('${dateTime.year}/ ${dateTime.month}/ ${dateTime.day}',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,),
          ),
        ),
        Spacer(),
        Container(
          margin:  EdgeInsets.all(16),
            child: ElevatedButton(onPressed: (){
              listprovider.refreshTodo();
              addTodo();

            }, child: Text('Add',),)),
      ],
    );
  }
  void addTodo(){
    if(!formKey.currentState!.validate()) return;
    Todo todo = Todo(title: title, description: description, dateTime: dateTime);
    addTodoFireStore(todo).then((value) {
      
    }).timeout(Duration(microseconds: 500),onTimeout: (){
    listprovider.refreshTodo();
    });
    Navigator.pop(context);
  }
  void showMydatePicker(){

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),),) .then((date) {
          if(date!=null) {
            this.dateTime = date;
            setState(() {

            });
          }
    });
  }
}
