import 'package:equatable/equatable.dart';

class Weekday extends Equatable {
  final String? en;
  final String? ar;

  const Weekday({this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };

  @override
  List<Object?> get props => [en, ar];
}
