library church_plugin;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<String> encryptText(String texto) async {
  final publicPem = await rootBundle.loadString('assets/crypt/public.pem');
  final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
  final encrypter = Encrypter(RSA(
    publicKey: publicKey,
    encoding: RSAEncoding.PKCS1,
  ));

  final Encrypted encrypted = encrypter.encrypt(texto);

  return encrypted.base64;
}
