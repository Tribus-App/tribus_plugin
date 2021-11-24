import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CardImageHorizontalScrollWidget extends StatelessWidget {
  final ToCardImageHorizontalScrollWidget card;
  CardImageHorizontalScrollWidget(this.card);

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
            padding: MaterialStateProperty.all(
              EdgeInsets.all(
                10,
              ),
            ),
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
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              child: Image.network(
                "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/85/b2/45/85b24589-ecbb-978e-b066-51e759ef1175/source/512x512bb.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToCardImageHorizontalScrollWidget {
  String description;
  bool isNew;
  ModuleChurchEntity module;

  ToCardImageHorizontalScrollWidget({
    required this.description,
    required this.isNew,
    required this.module,
  });

  bool isValid() {
    return true;
  }
}
