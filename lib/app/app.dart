import 'package:flutter_share/services/api_service.dart';
import 'package:flutter_share/services/fish_species_service.dart';
import 'package:flutter_share/services/share_service.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: FishSpecieService),
    LazySingleton(classType: ShareService)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
