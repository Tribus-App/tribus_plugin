library church_plugin;
import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CardHorizontalScrollModule extends StatelessWidget {
  final ToCardHorizontalScroll card;
  CardHorizontalScrollModule(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).cardColor),
            overlayColor: MaterialStateProperty.all(
                Theme.of(context).secondaryHeaderColor),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            )),
            side: MaterialStateProperty.all(BorderSide.none),
            shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(side: BorderSide.none)),
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
          child: Text(
            card.description,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}

class ToCardHorizontalScroll {
  String description;
  bool isNew;
  ModuleChurchEntity module;

  ToCardHorizontalScroll({
    required this.description,
    required this.isNew,
    required this.module,
  });

  bool isValid() {
    return true;
  }
}
