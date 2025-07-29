// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      json['companyName'] as String,
      json['tradingSymbol'] as String,
      json['logo'] as String,
      json['currency'] as String,
      json['isCompliant'] as bool,
      PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      DateTime.parse(json['analysisDate'] as String),
      json['shariahCheck'] as bool,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'companyName': instance.companyName,
      'tradingSymbol': instance.tradingSymbol,
      'logo': instance.logo,
      'currency': instance.currency,
      'isCompliant': instance.isCompliant,
      'price': instance.price,
      'analysisDate': instance.analysisDate.toIso8601String(),
      'shariahCheck': instance.shariahCheck,
    };

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      (json['price'] as num?)?.toDouble(),
      (json['changePercent'] as num?)?.toDouble(),
      (json['changeValue'] as num?)?.toDouble(),
      (json['currentPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'currentPrice': instance.currentPrice,
      'changePercent': instance.changePercent,
      'changeValue': instance.changeValue,
    };
