import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/AppConfigProvider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: (){
                provider.setNewLanguage('en');
              },
              child: getMainView('English', provider.appLanguage=='en'),
          ),
          InkWell(
              onTap: (){
                provider.setNewLanguage('ar');
              },
              child:getMainView('العربية', provider.appLanguage=='ar'),
          ),
        ],
      ),
    );
  }

  Widget getMainView (String lang,bool selected){
    if(selected){
      return Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(lang,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),),
            Spacer(),
            Icon(Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      );
    }else{
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        child: Text(lang,
          textAlign: TextAlign.start,),
      );
    }
  }
}
