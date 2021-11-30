library church_plugin;
import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:church_plugin/src/ui/components/cards/card_filter.dart';

class CardDiscoverModule extends StatelessWidget {
  final ToCardDiscover card;
  CardDiscoverModule(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 185,
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: BoxConstraints(
        maxWidth: 310,
        minWidth: 180,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).cardColor),
          overlayColor:
              MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                card.icon.toString() == "null" || card.icon.toString() == ""
                    ? SizedBox()
                    : Container(
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Icon(
                          card.icon,
                          size: 30,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                Expanded(
                  child: Text(
                    card.name,
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Text(
              card.description,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
            ),
            CardFilter(
              title: card.label,
              selected: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ToCardDiscover {
  String name;
  String description;
  String label;
  IconData icon;
  ModuleChurchEntity module;

  ToCardDiscover({
    required this.name,
    required this.description,
    required this.label,
    required this.icon,
    required this.module,
  });

  bool isValid() {
    return true;
  }
}
