library church_plugin;
import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:church_plugin/src/ui/components/cards/card_text_spotlight.dart';
import 'package:church_plugin/src/utils/i18n/resources.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardShortcutModule extends StatelessWidget {
  final ToCardShortcut card;
  CardShortcutModule(this.card);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 8,
              ),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(90),
                ),
                color: Theme.of(context).cardColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(90),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    overlayColor: MaterialStateProperty.all(
                        Theme.of(context).secondaryHeaderColor),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () async {
                    if (card.module.module.router != null) {
                      if (await canLaunch(card.module.module.router!)) {
                        launch(card.module.module.router.toString());
                      } else {
                        Navigator.pushNamed(
                          context,
                          card.module.module.router!,
                          arguments: card.module,
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Icon(
                      card.icon,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
            card.isNew ? CardTextSpotlight(text: R.strings.isNew) : SizedBox(),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          card.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
      ],
    );
  }
}

class ToCardShortcut {
  String name;
  IconData icon;
  bool isNew;
  ModuleChurchEntity module;

  ToCardShortcut({
    required this.name,
    required this.icon,
    required this.isNew,
    required this.module,
  });

  bool isValid() {
    return true;
  }
}
