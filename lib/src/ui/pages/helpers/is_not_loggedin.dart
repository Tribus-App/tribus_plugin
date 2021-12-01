import 'package:church_plugin/src/domain/entities/country_language_entity.dart';
import 'package:church_plugin/src/ui/components/box/route.dart';
import 'package:church_plugin/src/utils/i18n/route.dart';
import 'package:flutter/material.dart';

class IsNotLoggedinPage extends StatelessWidget {
  const IsNotLoggedinPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      verifyLanguage().flag,
                      height: 130,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      R.strings.titleNotLoggedIn,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      R.strings.descriptionNotLoggedIn,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const BoxLogin(),
            ],
          ),
        ),
      ),
    );
  }
}