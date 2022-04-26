import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_topic_article_user.freezed.dart';

part 'zenn_topic_article_user.g.dart';

@freezed
abstract class ZennTopicArticleUser with _$ZennTopicArticleUser {
  factory ZennTopicArticleUser({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'avatar_small_url') required String avatarSmallUrl,
  }) = _ZennTopicArticleUser;

  ZennTopicArticleUser._();

  factory ZennTopicArticleUser.fromJson(Map<String, dynamic> json) =>
      _$ZennTopicArticleUserFromJson(json);
}
