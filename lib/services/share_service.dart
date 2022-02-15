import 'package:flutter_share/models/fish_response_model.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  Future<void> onShare(FishResponseModel fishSpecie) async {
    var status = await Permission.storage.status;

    if (status.isDenied) {
      await Permission.storage.request();
    }
    var imageId = await ImageDownloader.downloadImage(
        fishSpecie.speciesIllustrationPhoto!.src!);
    if (imageId == null) {
      return;
    }
    var path = await ImageDownloader.findPath(imageId);

    await Share.shareFiles(
      [path!],
      text: '''Specie Name: ${fishSpecie.speciesName}\n'''
          '''Protein Content: ${fishSpecie.protein}\n''',
      subject: fishSpecie.quote,
    );
  }
}
