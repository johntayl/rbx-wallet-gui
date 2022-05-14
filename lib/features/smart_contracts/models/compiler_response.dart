import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';

part 'compiler_response.freezed.dart';
part 'compiler_response.g.dart';

@freezed
abstract class CompilerResponse with _$CompilerResponse {
  const CompilerResponse._();

  factory CompilerResponse({
    @JsonKey(name: "Success") required bool success,
    @JsonKey(name: "SmartContractCode") required String code,
    @JsonKey(name: "SmartContractMain")
        required CompiledSmartContract smartContract,
  }) = _CompilerResponse;

  factory CompilerResponse.fromJson(Map<String, dynamic> json) =>
      _$CompilerResponseFromJson(json);
}
