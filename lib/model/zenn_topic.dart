import 'package:freezed_annotation/freezed_annotation.dart';

import 'zenn_topic_article.dart';

part 'zenn_topic.freezed.dart';

part 'zenn_topic.g.dart';

@freezed
abstract class ZennTopic with _$ZennTopic {
  factory ZennTopic({
    @JsonKey(name: 'articles') required List<ZennTopicArticle> articles,
    @JsonKey(name: 'next_page') required int nextPage,
  }) = _ZennTopic;

  ZennTopic._();

  factory ZennTopic.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicFromJson(json);
}
