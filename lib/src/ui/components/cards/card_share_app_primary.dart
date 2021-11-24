// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:church_plugin/src/utils/i18n/resources.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CardShareAppPrimaryWidget extends StatelessWidget {
  const CardShareAppPrimaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  EvaIcons.shareOutline,
                  color: Theme.of(context).textTheme.headline2!.color,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    R.strings.shareOurApp,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            R.strings.shareOurAppDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
