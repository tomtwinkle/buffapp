import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class Page1Bloc extends Bloc {

  final counter = BehaviorSubject<int>.seeded(0);

  Stream<int> get countStream => counter.stream;

  @override
  void dispose() {

  }
}