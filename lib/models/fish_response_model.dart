class FishResponseModel {
  String? speciesName;
  String? protein;
  ImageGallery? speciesIllustrationPhoto;
  String? quote;
  FishResponseModel({
    required this.protein,
    required this.speciesIllustrationPhoto,
    required this.quote,
  });

  FishResponseModel.fromJson(Map<String, dynamic> json) {
    speciesName = json['Species Name'];
    protein = json['Protein'];
    quote = json['Quote'];
    speciesIllustrationPhoto =
        ImageGallery.fromJson(json['Species Illustration Photo']);
  }
}

class ImageGallery {
  String? src;
  String? alt;
  String? title;

  ImageGallery({this.src, this.alt, this.title});

  ImageGallery.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    alt = json['alt'];
    title = json['title'];
  }
}
