import 'dart:convert';

import '../helpers/payment_account_type.dart';

class PaymentAccountEntity {
  String? pixKey;
  String? picpay;
  String? agency;
  String? verifyingDigit;
  PaymentAccountType? paymentAccountType;
  String? document;

  PaymentAccountEntity({
    this.pixKey,
    this.picpay,
    this.agency,
    this.verifyingDigit,
    this.paymentAccountType,
    this.document,
  });

  Map<String, dynamic> toMap() {
    return {
      'pixKey': pixKey,
      'picpay': picpay,
      'agency': agency,
      'verifyingDigit': verifyingDigit,
      'paymentAccountType': paymentAccountType,
      'document': document,
    };
  }

  factory PaymentAccountEntity.fromMap(Map<String, dynamic> map) {
    return PaymentAccountEntity(
      pixKey: map['pixKey'],
      picpay: map['picpay'],
      agency: map['agency'],
      verifyingDigit: map['verifyingDigit'],
      paymentAccountType: map['paymentAccountType'],
      document: map['document'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentAccountEntity.fromJson(String source) => PaymentAccountEntity.fromMap(json.decode(source));

  PaymentAccountEntity copyWith({
    String? pixKey,
    String? picpay,
    String? agency,
    String? verifyingDigit,
    PaymentAccountType? paymentAccountType,
    String? document,
  }) {
    return PaymentAccountEntity(
      pixKey: pixKey ?? this.pixKey,
      picpay: picpay ?? this.picpay,
      agency: agency ?? this.agency,
      verifyingDigit: verifyingDigit ?? this.verifyingDigit,
      paymentAccountType: paymentAccountType ?? this.paymentAccountType,
      document: document ?? this.document,
    );
  }

  @override
  String toString() {
    return 'PaymentAccountEntity(pixKey: $pixKey, picpay: $picpay, agency: $agency, verifyingDigit: $verifyingDigit, paymentAccountType: $paymentAccountType, document: $document)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PaymentAccountEntity &&
      other.pixKey == pixKey &&
      other.picpay == picpay &&
      other.agency == agency &&
      other.verifyingDigit == verifyingDigit &&
      other.paymentAccountType == paymentAccountType &&
      other.document == document;
  }

  @override
  int get hashCode {
    return pixKey.hashCode ^
      picpay.hashCode ^
      agency.hashCode ^
      verifyingDigit.hashCode ^
      paymentAccountType.hashCode ^
      document.hashCode;
  }
}
