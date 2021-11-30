library church_plugin;
import 'package:church_plugin/src/domain/entities/card_expanded_entity.dart';
import 'package:flutter/material.dart';

class CardVerticalShortcut extends StatelessWidget {
  final CardExpandedEntity cardExpandedEntity;
  CardVerticalShortcut(this.cardExpandedEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 185,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).cardColor),
          overlayColor:
              MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        onPressed: () {
          if (cardExpandedEntity.router != null) {
            Navigator.pushNamed(
              context,
              cardExpandedEntity.router!,
              arguments: cardExpandedEntity.paramns,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            cardExpandedEntity.image.toString() != "null" &&
                    cardExpandedEntity.image.toString() != ""
                ? Container(
                    width: 185,
                    height: 185,
                    child: Hero(
                      tag: cardExpandedEntity.image as Object,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.network(
                          "${cardExpandedEntity.image}",
                          width: 185,
                          height: 185,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 185,
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 11,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${cardExpandedEntity.name}",
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 2,
                    ),
                    cardExpandedEntity.description != null
                        ? Text(
                            "${cardExpandedEntity.description}",
                            style: Theme.of(context).textTheme.bodyText2,
                            maxLines: 2,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
