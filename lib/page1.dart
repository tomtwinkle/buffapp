import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_01/page1_bloc.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late Page1Bloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<Page1Bloc>(context);
    registerListener();
  }

  void registerListener() {
    bloc.error.listen((value) async {
      if (value.isEmpty) {
        return;
      }

      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("エラーダイアログ"),
            content: Text(value),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // もどる で とじる
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.addCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          icon: const Icon(Icons.account_tree),
          onPressed: () {
            print("account_tree");
          },
        ),
        IconButton(
          icon: const Icon(Icons.print),
          onPressed: () {
            print("print");
          },
        ),
      ],
      body: StreamBuilder(
        stream: bloc.counter.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print("StreamBuilder.builder");
          print(snapshot.error);
          print(snapshot.toString());
          return Text("カウンター:${snapshot.data}");
        },
      ),
    );
  }
}
