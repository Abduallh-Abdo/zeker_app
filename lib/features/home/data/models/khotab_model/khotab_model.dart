import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'links.dart';

class KhotabModel extends Equatable {
  final List<Datum>? data;
  final Links? links;

  const KhotabModel({this.data, this.links});

  factory KhotabModel.fromJson(Map<String, dynamic> json) => KhotabModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
      };

  @override
  List<Object?> get props => [data, links];
}
