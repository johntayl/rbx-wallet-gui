import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/models/property.dart';

part 'tokenization.freezed.dart';
part 'tokenization.g.dart';

@freezed
class Tokenization with _$Tokenization {
  const Tokenization._();

  static const int compilerEnum = 111; //TODO

  @JsonSerializable(explicitToJson: true)
  const factory Tokenization({
    @Default("") String id,
    @Default("") String name,
    @Default("") String description,
    @Default([]) List<Property> properties,
    Asset? photo,
    Asset? provenance,
  }) = _Tokenization;

  factory Tokenization.fromJson(Map<String, dynamic> json) => _$TokenizationFromJson(json);

  factory Tokenization.fromCompiler(dynamic json) {
    return Tokenization(
      name: json['Name'],
      description: json['Description'],
    );
  }

  Map<String, dynamic> serializeForCompiler() {
    return {
      'Name': name,
      'Description': description,
    };
  }
}
