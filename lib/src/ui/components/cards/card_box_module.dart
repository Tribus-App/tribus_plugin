library church_plugin;
import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:church_plugin/src/ui/components/widgets/divider.dart';
import 'package:flutter/material.dart';

class CardBoxModule extends StatelessWidget {
  final ToCardBox card;
  CardBoxModule(this.card);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).scaffoldBackgroundColor),
            overlayColor: MaterialStateProperty.all(
                Theme.of(context).secondaryHeaderColor),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
            side: MaterialStateProperty.all(BorderSide.none),
            shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(side: BorderSide.none)),
          ),
          onPressed: () {
            if (card.module.module.router != null) {
              Navigator.pushNamed(
                context,
                card.module.module.router!,
                arguments: card.module,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 25,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        card.icon,
                        size: 30,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      SizedBox(height: 14),
                      Text(
                        card.name,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 14),
                      Text(
                        card.description,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Theme.of(context).textTheme.headline2!.color,
                  ),
                )
              ],
            ),
          ),
        ),
        MNDivider(),
      ],
    );
  }
}

class ToCardBox {
  String name;
  String description;
  IconData icon;
  ModuleChurchEntity module;

  ToCardBox({
    required this.name,
    required this.description,
    required this.icon,
    required this.module,
  });

  bool isValid() {
    return true;
  }
}
