import 'package:church_plugin/church_plugin.dart';
import 'package:church_plugin/src/utils/i18n/resources.dart';
import 'package:church_plugin/src/utils/i18n/strings/pt_br.dart';

Uri convertApi(String router, {Map<String, dynamic>? params}) {
  String lang = "";
  if (R.strings.about == PtBr().about) {
    lang = "pt_BR";
  } else {
    lang = "en_US";
  }

  String urlParams = "";

  params?.forEach((key, value) {
    urlParams = urlParams + "&$key=$value";
  });

  return Uri.parse(
    "${ChurchPackage.current!.url}$router?lang=$lang$urlParams",
  );
}
