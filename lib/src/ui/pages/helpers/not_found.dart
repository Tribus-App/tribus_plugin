library church_plugin;
import 'package:church_plugin/src/utils/i18n/route.dart';
import 'package:flutter/material.dart';

class NotFoundChurch extends StatelessWidget {
  const NotFoundChurch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(25,),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                R.strings.notFoundPage,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10,),
              Text(
                R.strings.weDidNotFindRequestedResource,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}