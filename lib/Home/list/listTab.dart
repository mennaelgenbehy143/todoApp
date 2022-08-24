import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/DataBase/FireBaseUtils.dart';
import 'package:todo/DataBase/Models/Todo.dart';
import 'package:todo/Home/list/todoItem.dart';
import 'package:todo/Providers/AppConfigProvider.dart';

import '../../Providers/ListProvider.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {

  DateTime focusedDay = DateTime.now();



  @override
  Widget build(BuildContext context) {
    listProvider listprovider=Provider.of(context);
    listprovider.refreshTodo();
    AppConfigProvider provider = Provider.of(context);
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TableCalendar(
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: focusedDay,
            //headerVisible: false,
            //weekendDays: [],
            locale: provider.appLanguage,
            selectedDayPredicate: (day) {
              return isSameDay(listprovider.selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {

              setState(() {
                listprovider.setNewSelectedDay(selectedDay);
                listprovider.refreshTodo();

                this.focusedDay = focusedDay;
              });
            },
            daysOfWeekHeight: 25,
            headerStyle:
            HeaderStyle(decoration: BoxDecoration(color: Colors.white)),
            daysOfWeekStyle:
            DaysOfWeekStyle(decoration: BoxDecoration(color: Colors.white)),
            calendarStyle: CalendarStyle(
              defaultDecoration: BoxDecoration(
                color: Colors.white,
              ),
              isTodayHighlighted: false,
              selectedDecoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            calendarFormat: CalendarFormat.week,
          ),
        ),
        Expanded(child: ListView.builder(
            itemCount: listprovider.items.length,
            itemBuilder: (context, index) {
              return ToDoItem(listprovider.items[index]);
            }
        ),
        ),
      ],
    );
  }



}