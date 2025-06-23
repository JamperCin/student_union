import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devotional_type.freezed.dart';
part 'devotional_type.g.dart';

@freezed
class DevotionalType extends BaseObject with _$DevotionalType {
  const factory DevotionalType({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
  }) = _DevotionalType;

  factory DevotionalType.fromJson(Map<String, Object?> json) => _$DevotionalTypeFromJson(json);
}


