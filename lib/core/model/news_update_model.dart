import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_update_model.g.dart';
part 'news_update_model.freezed.dart';

@freezed
class NewsUpdateModel with _$NewsUpdateModel {
  const factory NewsUpdateModel({
    @Default("") String title,
    @Default("") String description,
    @Default("") String createdAt,
    @Default("") String image,
}) = _NewsUpdateModel;

  factory NewsUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$NewsUpdateModelFromJson(json);
}
