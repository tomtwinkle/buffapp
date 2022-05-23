import 'package:freezed_annotation/freezed_annotation.dart';

import 'zenn_topic_article.dart';

part 'zenn_topic.freezed.dart';

part 'zenn_topic.g.dart';

@freezed
class ZennTopic with _$ZennTopic {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ZennTopic({
    required List<ZennTopicArticle> articles,
    int? nextPage,
  }) = _ZennTopic;

  ZennTopic._();

  factory ZennTopic.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicFromJson(json);
}
