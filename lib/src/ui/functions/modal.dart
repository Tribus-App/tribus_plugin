import 'package:flutter/material.dart';

showModal(BuildContext context, Widget widget, {bool isDismissible = true}) async {
  if(MediaQuery.of(context).size.width > 580) {
    return await showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 450,
          child: ModalWeb(widget),
        );
      }
    );
  } else {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: context,
      builder: (context) => widget
    );
  }
}

class ModalWeb extends StatelessWidget {
  final Widget child;

  const ModalWeb(this.child);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(0),
        width: 450,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}