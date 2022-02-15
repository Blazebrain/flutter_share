import 'package:flutter/material.dart';
import 'package:flutter_share/app/app.locator.dart';
import 'package:flutter_share/models/fish_response_model.dart';
import 'package:flutter_share/services/fish_species_service.dart';
import 'package:flutter_share/services/share_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _fishSpecieService = locator<FishSpecieService>();
  final _shareService = locator<ShareService>();
  List<FishResponseModel?>? fishSpeciesList = [];

  Future<void> getFishSpecies() async {
    try {
      fishSpeciesList = await runBusyFuture(
        _fishSpecieService.getFishSpecie(),
        throwException: true,
      );
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> shareFishSeries(FishResponseModel fishSeries) async {
    try {
      await _shareService.onShare(fishSeries);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
