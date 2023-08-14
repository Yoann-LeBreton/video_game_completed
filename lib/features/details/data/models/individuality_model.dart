import 'package:json_annotation/json_annotation.dart';

part 'individuality_model.g.dart';

@JsonSerializable()
class IndividualityModel {
  IndividualityModel(this.platform, this.polled, this.mainCompare);

  @JsonKey(name: "platform")
  final String platform;
  @JsonKey(name: "count_comp")
  final String polled;
  @JsonKey(name: "comp_main")
  final String mainCompare;

  factory IndividualityModel.fromJson(Map<String, dynamic> json) =>
      _$IndividualityModelFromJson(json);
}