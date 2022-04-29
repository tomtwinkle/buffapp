import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_01/model/zenn_topic_article.dart';
import 'package:flutter/material.dart';

import 'model/zenn_topic.dart';
import 'page3_bloc.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<Page3Bloc>(context);

    Widget topics = StreamBuilder<ZennTopic>(
      stream: bloc.topicStream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.articles.length ?? 0,
          itemBuilder: (context, index) {
            ZennTopicArticle? article = snapshot.data?.articles[index];
            return Text(article!.title);
          },
        );
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ZennTopic検索'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Topic:'),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: bloc.topicInputAction.add,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.getTopic();
                  },
                  child: const Text('検索'),
                ),
              ],
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.all(6),
              // 配列を元にリスト表示
              child: topics,
            ),
          ],
        ),
      ),
    );
  }
}
