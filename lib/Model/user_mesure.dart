// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserMesure {
  
  final int bodyHeight;
  final int bodyWeight;
  final int? bodyAge;
  final String? bodyGender;
  final String? imcCalc;
  final String? txtLabel;
  final String? txtInterpretation;
  
  UserMesure({
    required this.bodyHeight,
    required this.bodyWeight,
    this.bodyAge,
    this.bodyGender,
    this.imcCalc,
    this.txtLabel,
    this.txtInterpretation,
  });
  

  UserMesure copyWith({
    int? bodyHeight,
    int? bodyWeight,
    int? bodyAge,
    String? bodyGender,
    String? imcCalc,
    String? txtLabel,
    String? txtInterpretation,
  }) {
    return UserMesure(
      bodyHeight: bodyHeight ?? this.bodyHeight,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      bodyAge: bodyAge ?? this.bodyAge,
      bodyGender: bodyGender ?? this.bodyGender,
      imcCalc: imcCalc ?? this.imcCalc,
      txtLabel: txtLabel ?? this.txtLabel,
      txtInterpretation: txtInterpretation ?? this.txtInterpretation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bodyHeight': bodyHeight,
      'bodyWeight': bodyWeight,
      'bodyAge': bodyAge,
      'bodyGender': bodyGender,
      'imcCalc': imcCalc,
      'txtLabel': txtLabel,
      'txtInterpretation': txtInterpretation,
    };
  }

  factory UserMesure.fromMap(Map<String, dynamic> map) {
    return UserMesure(
      bodyHeight: map['bodyHeight'] as int,
      bodyWeight: map['bodyWeight'] as int,
      bodyAge: map['bodyAge'] != null ? map['bodyAge'] as int : null,
      bodyGender: map['bodyGender'] != null ? map['bodyGender'] as String : null,
      imcCalc: map['imcCalc'] != null ? map['imcCalc'] as String : null,
      txtLabel: map['txtLabel'] != null ? map['txtLabel'] as String : null,
      txtInterpretation: map['txtInterpretation'] != null ? map['txtInterpretation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMesure.fromJson(String source) => UserMesure.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserMesure(bodyHeight: $bodyHeight, bodyWeight: $bodyWeight, bodyAge: $bodyAge, bodyGender: $bodyGender, imcCalc: $imcCalc, txtLabel: $txtLabel, txtInterpretation: $txtInterpretation)';
  }

  @override
  bool operator ==(covariant UserMesure other) {
    if (identical(this, other)) return true;
  
    return 
      other.bodyHeight == bodyHeight &&
      other.bodyWeight == bodyWeight &&
      other.bodyAge == bodyAge &&
      other.bodyGender == bodyGender &&
      other.imcCalc == imcCalc &&
      other.txtLabel == txtLabel &&
      other.txtInterpretation == txtInterpretation;
  }

  @override
  int get hashCode {
    return bodyHeight.hashCode ^
      bodyWeight.hashCode ^
      bodyAge.hashCode ^
      bodyGender.hashCode ^
      imcCalc.hashCode ^
      txtLabel.hashCode ^
      txtInterpretation.hashCode;
  }
}
