import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_01/page1_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State {
  @override
  Widget build(BuildContext context) {
    Page1Bloc bloc = BlocProvider.of<Page1Bloc>(context);
   return Scaffold(
     appBar: AppBar(
       title: const Text("HOGEGEGEGEGE"),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
          bloc.counter.add(2);
       },
     ),
     body: StreamBuilder(
       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         return Text("カウンター:${bloc.counter.value}");
       },
     ),
   );
  }
}
