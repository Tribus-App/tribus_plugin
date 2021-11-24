import 'package:church_plugin/src/domain/entities/events_entity.dart';
import 'package:church_plugin/src/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  final EventEntity event;
  CardEvent(this.event);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(
                10.0,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.network(
                  event.cover!,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.pushNamed(
                context,
                "/event-church-item",
                arguments: event,
              );
            },
            child: Container(
              padding: EdgeInsets.all(
                20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.0)
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0x77e5e5e5),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Text(
                          "${event.tags.toString()}",
                          style: TextStyle(color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${event.title}",
                    style: AppTheme.darkTheme.textTheme.headline2,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${event.description}",
                    style: AppTheme.darkTheme.textTheme.bodyText1,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(int value) : super(value);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color fromHex2(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('99');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color fromHex3(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('33');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
