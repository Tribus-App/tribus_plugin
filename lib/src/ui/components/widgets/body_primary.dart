library church_plugin;
import 'package:flutter/material.dart';

class BodyPrimaryChurch extends StatelessWidget {
  final Widget child;
  const BodyPrimaryChurch({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).navigationBarTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 10,
            color: Theme.of(context).navigationBarTheme.backgroundColor,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Theme.of(context).navigationBarTheme.backgroundColor,
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10,),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10,),
                    ),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}