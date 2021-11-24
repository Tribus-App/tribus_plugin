// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_masked_text/flutter_masked_text.dart';

String toPrice(
  dynamic valor, 
  {bool cifraoEsquerda = true, 
  String separadorDecimal = ",", 
  String separadorMilhar = ".", 
  bool ocultarCentavos = false,
  bool retornoGratis = true,
}){
  valor = valor.toString();
  dynamic tmp;
  String simbolo = cifraoEsquerda ? "R\$ " : "";
  var msk = MoneyMaskedTextController(decimalSeparator: separadorDecimal, thousandSeparator: separadorMilhar, leftSymbol: simbolo);
  if(valor.contains(",") || valor.contains(".")){
    if(valor.contains(",") && valor.contains(".")) valor = valor.replaceAll(".", "").replaceAll(",", ".");
    else valor = valor.replaceAll(",", ".");
    tmp = double.tryParse(valor);
  }else{
    tmp = int.tryParse(valor);
  }
  
  if(tmp.toString() == "null"){
    if(retornoGratis) return "Grátis";
    else return msk.text;
  }
  
  tmp = tmp.toStringAsFixed(2);
  msk.text = tmp;

  if(ocultarCentavos && msk.text.substring(msk.text.length - 2) == "00"){
    String valor = msk.text;
    valor = valor.substring(0, valor.length - 3);
    return valor;
  }

  if (msk.text.toString() == "null" || 
      msk.text.toString() == "0${separadorDecimal}00" || 
      msk.text.toString() == "${simbolo}0${separadorDecimal}00"
  ){
    if(retornoGratis) return "Grátis";
    else return msk.text;
  }

  return msk.text;
}