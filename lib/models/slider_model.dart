class SliderModel {
  String? time;
  bool? isBookmarked;
  String? image;
  String? description;

  SliderModel({
    this.time,
    this.isBookmarked,
    this.image,
    this.description,
  });

  SliderModel copyWith({
    String? time,
    bool? isBookmarked,
    String? image,
    String? description,
  }) =>
      SliderModel(
        time: time ?? this.time,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        image: image ?? this.image,
        description: description ?? this.description,
      );
}
