import 'package:flutter_share/models/fish_response_model.dart';
import 'package:flutter_share/app/app.locator.dart';
import 'package:flutter_share/services/api_service.dart';
import 'package:flutter_share/utils/api_constants.dart';

class FishSpecieService {
  final _apiService = locator<ApiService>();

  Future<List<FishResponseModel?>?> getFishSpecie() async {
    List<FishResponseModel?> fishSpeciesList = [];
    try {
      final response = await _apiService.get(ApiConstants.getFishSpecies);

      if (response != null) {
        for (var i = 0; i < 15; i++) {
          final model = FishResponseModel.fromJson(response[i]);
          fishSpeciesList.add(model);
        }

        return fishSpeciesList;
      }
    } catch (e) {
      rethrow;
    }
  }
}
