library church_plugin;
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';

class CardLoadingChurch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> listaPlaceholderLines = [];
    for(int i = 0; i < 3; i++){
      listaPlaceholderLines.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2,),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: MediaQuery.of(context).size.width,
          height: 96,
          child: Row(
            children: [
              Container(
                height: 65,
                width: 65,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(65),
                  ),
                  child: PlaceholderLines(
                    animationOverlayColor: Theme.of(context).secondaryHeaderColor,
                    count: 1,
                    animate: true,
                    color: Theme.of(context).cardColor.withOpacity(.6),
                    maxOpacity: 1,
                    minOpacity: 0.4,
                    minWidth: 1.0,
                    maxWidth: 1.0,
                    lineHeight: 65,
                  ),
                ),
              ),
              Expanded(
                child: PlaceholderLines(
                  animationOverlayColor: Theme.of(context).secondaryHeaderColor,
                  count: 2,
                  animate: true,
                  color: Theme.of(context).cardColor.withOpacity(.6),
                  maxOpacity: 1,
                  minOpacity: 0.4,
                  minWidth: 0.6,
                  maxWidth: 1.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: listaPlaceholderLines,
      ),
    );
  }
}