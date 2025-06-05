void main() async {
  // print('1');
  //
  // Future.delayed(Duration.zero, () {
  //   print('2');
  // });
  //
  // for (int i = 0; i < 300; i++) {
  //   print('$i');
  // }

  // try {
  //   final number = await _getIntFromNetwork();
  //   final number = await _getIntFromNetwork();
  //   final number = await _getIntFromNetwork();
  //   print(number);
  // } on MyException catch(error) {
  //
  // } catch (error) {
  //   print(error);
  // }
  
  int toto;
  toto = await _getIntFromNetwork();
  print(toto);
}

Future<int> _getIntFromNetwork() async {
  await Future.delayed(Duration(seconds: 1));
  return 42;
  // return Future.delayed(Duration(seconds: 1), () {
  //   return 42;
  // });
}
