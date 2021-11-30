// ignore_for_file: import_of_legacy_library_into_null_safe
library church_plugin;
import 'package:church_plugin/src/ui/components/route.dart';
import 'package:church_plugin/src/utils/i18n/route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class BoxLogin extends StatelessWidget {
  const BoxLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: 2,
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(90),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Center(
                      child: Icon(
                        EvaIcons.personOutline,
                        color: Theme.of(context)
                            .floatingActionButtonTheme
                            .foregroundColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: Text(
                      R.strings.loginDescription,
                      style: TextStyle(wordSpacing: 1.1, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10,),
              ),
            ),
            child: MNButton.outline(
              color: Colors.transparent,
              foregroundColor:
                  Theme.of(context).textTheme.bodyText1!.color!,
              height: 50,
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  "/login",
                );
              },
              labelText: R.strings.access,
            ),
          ),
        ],
      ),
    );
  }
}
