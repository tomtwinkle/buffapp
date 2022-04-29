import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

import 'client/zenn_api.dart';
import 'model/zenn_topic.dart';
import 'repository/zenn_repository.dart';

class Page3Bloc extends Bloc {
  final _zennRepository = ZennRepository(client: ZennAPI());

  // ZennTopic
  final _topic =
      BehaviorSubject<ZennTopic>.seeded(ZennTopic(nextPage: 1, articles: []));

  // 入力
  final _input = BehaviorSubject<String>.seeded('');

  Stream<ZennTopic> get topicStream => _topic.stream;

  Sink<String> get topicInputAction => _input.sink;

  Future<void> getTopic() async {
    final result = await _zennRepository.listTopics(_input.value);
    _topic.add(result);
  }

  @override
  void dispose() {
    _topic;
    _input;
  }
}
