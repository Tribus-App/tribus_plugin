library church_plugin;

import '../package.dart';

import '../domain/helpers/environment_type.dart';


class Production extends ChurchPackage {
  final String appName = "Tribus Production";
  final String url = "https://tribusapp.com";
  final String baseUrl = "https://stg-global-app-proxy.tribusapp.com/_functions/";
  final String apiKey = "thlIuTaIRQW3go7RGfPtf3O2FrMFkOmTIzbaWxhi";

  EnvironmentType environmentType = EnvironmentType.PRODUCTION;
}
