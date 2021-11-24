// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:church_plugin/src/ui/components/cards/card_text_spotlight.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/church_entity.dart';

class CardChurchHorizontal extends StatelessWidget {
  final ChurchEntity churchEntity;
  CardChurchHorizontal(this.churchEntity);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).scaffoldBackgroundColor),
        overlayColor:
            MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
        shadowColor:
            MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        side: MaterialStateProperty.all(BorderSide.none),
        shape: MaterialStateProperty.all(
            ContinuousRectangleBorder(side: BorderSide.none)),
      ),
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 18,
        ),
        padding: EdgeInsets.only(
          left: 25,
          right: 15,
        ),
        child: Row(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(65),
                ),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).cardColor,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(65),
                ),
                child: Image.network(
                  churchEntity.image,
                  height: 85,
                  width: 85,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${churchEntity.name}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${churchEntity.email}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        runSpacing: 8,
                        spacing: 5,
                        children: churchEntity.category.map<Widget>((e) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CardTextSpotlight(
                                text: e,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.heartOutline,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
