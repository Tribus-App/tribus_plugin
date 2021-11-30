// ignore_for_file: import_of_legacy_library_into_null_safe

library church_plugin;
import 'package:church_plugin/src/ui/components/cards/card_text_spotlight.dart';
import 'package:church_plugin/src/utils/i18n/resources.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/church_entity.dart';

import 'package:church_plugin/src/domain/entities/church_entity.dart';
import 'package:shortcut/shortcut.dart';

class CardFavoriteChurch extends StatefulWidget {
  final ChurchEntity churchEntity;
  CardFavoriteChurch(this.churchEntity);

  @override
  State<CardFavoriteChurch> createState() => _CardFavoriteChurchState();
}

class _CardFavoriteChurchState extends State<CardFavoriteChurch> {
  bool hideInstalShortcut = true;

  @override
  void initState() {
    super.initState();
    verifyShortcutInstall();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).cardColor),
            overlayColor: MaterialStateProperty.all(
                Theme.of(context).secondaryHeaderColor),
            shadowColor: MaterialStateProperty.all(
                Theme.of(context).secondaryHeaderColor),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: Theme.of(context).cardColor)),
            shape: MaterialStateProperty.all(
                ContinuousRectangleBorder(side: BorderSide.none)),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SplashChurch(
            //       church: widget.churchEntity,
            //     ),
            //   ),
            // );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(
              0,
              20,
              0,
              0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
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
                            widget.churchEntity.image,
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
                                "${widget.churchEntity.name}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${widget.churchEntity.email}",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(height: 6),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Wrap(
                                  runSpacing: 8,
                                  spacing: 5,
                                  children: widget.churchEntity.category
                                      .map<Widget>((e) {
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
                SizedBox(
                  height: 20,
                ),
                hideInstalShortcut
                    ? SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              height: 0.5,
                              width: MediaQuery.of(context).size.width,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(
                                    .2,
                                  )),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).cardColor),
                              overlayColor: MaterialStateProperty.all(
                                  Theme.of(context).secondaryHeaderColor),
                              shadowColor: MaterialStateProperty.all(
                                  Theme.of(context).secondaryHeaderColor),
                              elevation: MaterialStateProperty.all(0),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(0)),
                              side: MaterialStateProperty.all(BorderSide.none),
                              shape: MaterialStateProperty.all(
                                  ContinuousRectangleBorder(
                                      side: BorderSide.none)),
                            ),
                            onPressed: () async {
                              // await showModal(
                              //   context,
                              //   AddShortcutToHomeScreenBottomSheetChurch(
                              //     church: widget.churchEntity,
                              //   ),
                              //   isDismissible: false,
                              // );
                              // verifyShortcutInstall();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 15,
                                top: 10,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(EvaIcons.smartphoneOutline,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    R.strings.addToHomeScreen,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyShortcutInstall() async {
    hideInstalShortcut = await Shortcut.searchShortcut(
      id: '${widget.churchEntity.id}',
    ).catchError((p) {});
    setState(() {});
  }
}
