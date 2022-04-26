import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
abstract class ZennTopic with _$ZennTopic {
  factory ZennTopic({
    @JsonKey(name: 'articles') required List<> articles,
    @JsonKey(name: 'next_page') required int nextPage,
  }) = _ZennTopic;

  ZennTopic._();

  factory ZennTopic.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicFromJson(json);
}
