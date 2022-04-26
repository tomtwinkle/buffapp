import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_topic_article_user.freezed.dart';

part 'zenn_topic_article_user.g.dart';

@freezed
class ZennTopicArticleUser with _$ZennTopicArticleUser {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ZennTopicArticleUser({
    required int id,
    required String username,
    required String name,
    required String avatarSmallUrl,
  }) = _ZennTopicArticleUser;

  ZennTopicArticleUser._();

  factory ZennTopicArticleUser.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicArticleUserFromJson(json);
}
