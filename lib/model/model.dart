import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final String companyName;
  final String tradingSymbol;
  final String logo;
  final String currency;
  final bool isCompliant;
  final PriceModel price;
  final DateTime analysisDate;
  final bool shariahCheck;

  Model(this.companyName, this.tradingSymbol, this.logo, this.currency, this.isCompliant, this.price, this.analysisDate, this.shariahCheck);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

}

@JsonSerializable()
class PriceModel {
  final double? price;
  final double? currentPrice;
  final double? changePercent;
  final double? changeValue;

  PriceModel(this.price, this.changePercent, this.changeValue, this.currentPrice);

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

}

//{
//             "companyName": "Amesite Inc",
//             "tradingSymbol": "AMST",
//             "logo": "https://ailatapi.kz/media/logos/AMST.png",
//             "currency": "USD",
//             "isCompliant": false,
//             "price": {
//                 "price": 2.78,
//                 "changePercent": -7.95,
//                 "changeValue": -0.24
//             },
//             "analysisDate": "2025-05-14T19:00:00.000Z",
//             "shariahCheck": true
//         },
