import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';

class CardLoadingHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> listaPlaceholderLines = [];
    for(int i = 0; i < 3; i++){
      listaPlaceholderLines.add(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4,),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Row(
            children: [
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
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
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
                    lineHeight: 80,
                  ),
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