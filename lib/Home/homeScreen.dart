import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home/list/listTab.dart';
import 'package:todo/Home/settings/settingsTab.dart';

import 'AddTaskBottomSheet.dart';

class HomeScreen extends StatefulWidget {
  static String ROUTE_NAME = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0;
  List<Widget> tabs =[
    ListTab(),SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){
          showToDoBottomSheet();
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*.2,
        title: Text('To Do List'),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex=index;
            setState(() {

            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.list,),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
        ],
        ),
      ),
    );
  }
  showToDoBottomSheet(){
    showModalBottomSheet(context: context, builder: (context){
      return AddTaskBottomSheet();
    }
    );
  }
}
