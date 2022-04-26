import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Address({
    required String address1,
    required String address2,
    required String address3,
  }) = _Address;

  Address._();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
