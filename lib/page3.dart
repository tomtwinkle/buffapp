import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_01/model/zenn_topic_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            String avatarImageUrl = article!.user.avatarSmallUrl;

            Card cardWidget = Card(
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 右寄せ
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image: avatarImageUrl,
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: 200, maxWidth: 290),
                      child: Text(
                        article.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ));

            return Slidable(
              key: UniqueKey(),
              child: cardWidget,
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (buildContext) {
                      print("save!");
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ZennTopic検索'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Topic:'),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
            SizedBox(
              height: 600,
              // 配列を元にリスト表示
              child: topics,
            ),
          ],
        ),
      ),
    );
  }
}
