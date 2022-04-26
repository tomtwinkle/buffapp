import 'package:freezed_annotation/freezed_annotation.dart';

import 'zenn_topic_article_user.dart';

part 'zenn_topic_article.freezed.dart';

part 'zenn_topic_article.g.dart';

@freezed
class ZennTopicArticle with _$ZennTopicArticle {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ZennTopicArticle({
    required int id,
    required String postType,
    required String title,
    required String slug,
    required int commentsCount,
    required int likedCount,
    required int bodyLettersCount,
    required int readingTime,
    required String articleType,
    required String emoji,
    required String publishedAt,
    required ZennTopicArticleUser user,
  }) = _ZennTopicArticle;

  ZennTopicArticle._();

  factory ZennTopicArticle.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicArticleFromJson(json);
}
