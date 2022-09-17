void millisecondsPerformance(String methodDescription, Function method) {
  DateTime now = DateTime.now();
  method();
  DateTime end = DateTime.now();

  print('Perfomance $methodDescription = ms'
      ' ${end.difference(now).inMilliseconds}');
}
