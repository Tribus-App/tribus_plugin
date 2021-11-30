library church_plugin;
import 'package:church_plugin/church_plugin.dart';

Uri convertApi(String router, {Map<String, dynamic>? params}) {
  String lang = "";
  if (R.strings is PtEs) {
    lang = "pt_ES";
  } else if (R.strings is EnUs) {
    lang = "en_US";
  } else {
    lang = "pt_BR";
  }

  String urlParams = "";

  params?.forEach((key, value) {
    urlParams = urlParams + "&$key=$value";
  });

  return Uri.parse(
    "${ChurchPackage.current!.url}$router?lang=$lang&api_key=${ChurchPackage.current!.apiKey}$urlParams",
  );
}
