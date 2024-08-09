import 'package:local_grocery/providers/request/generic_parent_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_request.g.dart';

@JsonSerializable()
class GenericRequest extends GenericParentRequest {
  String? parameter_1 = "";
  String? parameter_2 = "";
  String? parameter_3 = "";
  String? parameter_4 = "";
  String? parameter_5 = "";
  String? parameter_6 = "";
  String? parameter_7 = "";
  String? parameter_8 = "";
  String? parameter_9 = "";
  String? parameter_10 = "";
  String? parameter_11 = "";
  String? parameter_12 = "";
  String? parameter_13 = "";
  String? parameter_14 = "";
  String? parameter_15 = "";
  String? parameter_16 = "";
  String? parameter_17 = "";
  String? parameter_18 = "";
  String? parameter_19 = "";
  String? parameter_20 = "";

  GenericRequest({
    this.parameter_1 = "",
    this.parameter_2 = "",
    this.parameter_3 = "",
    this.parameter_4 = "",
    this.parameter_5 = "",
    this.parameter_6 = "",
    this.parameter_7 = "",
    this.parameter_8 = "",
    this.parameter_9 = "",
    this.parameter_10 = "",
    this.parameter_11 = "",
    this.parameter_12 = "",
    this.parameter_13 = "",
    this.parameter_14 = "",
    this.parameter_15 = "",
    this.parameter_16 = "",
    this.parameter_17 = "",
    this.parameter_18 = "",
    this.parameter_19 = "2022-09-03T08:02:10.808Z",
    this.parameter_20 = "2022-09-03T08:02:10.808Z",
  });

  factory GenericRequest.fromJson(Map<String, dynamic> json) =>
      _$GenericRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GenericRequestToJson(this);
}
