import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/DataBase/FireBaseUtils.dart';

import '../../DataBase/Models/Todo.dart';
import '../../Providers/AppConfigProvider.dart';
import '../../Providers/ListProvider.dart';

class ToDoItem extends StatelessWidget {
 late Todo item;
  ToDoItem(this.item);

  @override
  Widget build(BuildContext context) {
    listProvider listprovider=Provider.of(context);
    AppConfigProvider provider = Provider.of(context);
    return Slidable(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 4,
              height: 60,
              color: Theme.of(context).primaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,style:TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
                Text(item.description,
                    style:provider.mode == ThemeMode.light?
                    Theme.of(context).textTheme.headline1:
                    Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),
              ],
            ),
            Spacer(),
            Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                ),
            child: Icon(Icons.check,color:Colors.white ,size: 30,),
            ),
          ],
        ),
      ),
      startActionPane: provider.appLanguage=='en'?ActionPane(
        motion: ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 13,right: 8,bottom: 13),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight:Radius.circular(12) )
              ),

              child: InkWell(
                onTap: (){
                  getTodoRefWithConverters().doc(item.id).delete();
                  listprovider.refreshTodo();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,color: Colors.white,size: 30,),
                    Text('Delete',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ):null,
      endActionPane: provider.appLanguage=='ar'?ActionPane(
        motion: ScrollMotion(),
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 13,right: 8,bottom: 13),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight:Radius.circular(12) )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete,color: Colors.white,size: 30,),
                  Text('Delete',style: TextStyle(color: Colors.white,fontSize: 20),),
                ],
              ),
            ),
          ),
        ],
      ):null,
    );
  }
}
