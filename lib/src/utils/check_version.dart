bool checkVersion() {
  bool isProduction = const bool.fromEnvironment('dart.vm.product');
  return isProduction;
}