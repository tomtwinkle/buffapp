import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class Page1Bloc extends Bloc {
  final counter = BehaviorSubject<int>.seeded(0);
  final error = BehaviorSubject<String>.seeded("");

  Stream<int> get countStream => counter.stream;

  void addCount() {
    counter.add(counter.value + 1);
  }

  void somethingProc() {
    error.add("error!");
  }

  @override
  void dispose() {}
}
