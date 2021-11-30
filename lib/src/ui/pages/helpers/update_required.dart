library church_plugin;
import 'package:church_plugin/src/utils/i18n/route.dart';
import 'package:flutter/material.dart';

class UpdateRequiredChurch extends StatelessWidget {
  const UpdateRequiredChurch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          R.strings.needsUpdateToSeeResource,
        ),
      ),
    );
  }
}