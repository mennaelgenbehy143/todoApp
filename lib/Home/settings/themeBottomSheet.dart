import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.setNewMode(ThemeMode.light);
            },
            child: getMainView(AppLocalizations.of(context)!.light, provider.mode==ThemeMode.light),
          ),
          InkWell(
            onTap: (){
              provider.setNewMode(ThemeMode.dark);
            },
            child: getMainView(AppLocalizations.of(context)!.dark, provider.mode==ThemeMode.dark),
          ),

        ],
      ),
    );
  }

  Widget getMainView (String mode,bool selected){
    if(selected){
      return Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(mode,
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
        child: Text(mode,
          textAlign: TextAlign.start,),
      );
    }
  }
}
