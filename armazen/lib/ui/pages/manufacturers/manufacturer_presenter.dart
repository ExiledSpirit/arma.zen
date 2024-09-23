import 'manufacturer.dart';

import 'package:flutter/material.dart';

abstract class ManufacturersPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<bool> get isSessionExpiredStream;
  Stream<List<ManufacturerViewModel>> get ManufacturersStream;
  Stream<String?> get navigateToStream;

  Future<void> loadData();
  void goToManufacturerResult(String manufacturerId);
}