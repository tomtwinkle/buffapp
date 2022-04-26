import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_01/client/zipcode_api.dart';
import 'package:rxdart/rxdart.dart';

import 'repository/zip_repository.dart';

class Page2Bloc extends Bloc {
  final _zipRepository = ZipRepository(client: ZipCodeAPI());

  // 住所
  final _address = BehaviorSubject<String>.seeded('');

  // 入力
  final _input = BehaviorSubject<String>.seeded('');

  Stream<String> get addressStream => _address.stream;

  Sink<String> get addressInputAction => _input.sink;

  Future<void> _getAddressFromZip(String zip) async {
    final result = await _zipRepository.getAddressFromZipCode(zip);
    final displayString =
        '${result.address1}${result.address2}${result.address3}';
    _address.add(displayString);
  }

  Future<void> search() async {
    await _getAddressFromZip(_input.value);
  }

  @override
  void dispose() {
    _address;
    _input;
  }
}
