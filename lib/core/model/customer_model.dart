import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';


///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class CustomerModel extends BaseObject with _$CustomerModel {

  const factory CustomerModel({
    @Default("") String name,
    @Default("") String email,
    @Default("") String profilePic,
}) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
