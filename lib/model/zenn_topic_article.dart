import 'package:freezed_annotation/freezed_annotation.dart';

import 'zenn_topic_article_user.dart';

part 'zenn_topic_article.freezed.dart';

part 'zenn_topic_article.g.dart';

@freezed
class ZennTopicArticle with _$ZennTopicArticle {
  factory ZennTopicArticle({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'post_type') required String postType,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'published') required String published,
    @JsonKey(name: 'comments_count') required int commentsCount,
    @JsonKey(name: 'liked_count') required int likedCount,
    @JsonKey(name: 'body_letters_count') required int bodyLettersCount,
    @JsonKey(name: 'reading_time') required int readingTime,
    @JsonKey(name: 'article_type') required String articleType,
    @JsonKey(name: 'emoji') required String emoji,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'user') required ZennTopicArticleUser user,
  }) = _ZennTopicArticle;

  ZennTopicArticle._();

  factory ZennTopicArticle.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicArticleFromJson(json);
}
