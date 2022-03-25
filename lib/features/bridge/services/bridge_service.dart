import 'dart:convert';

import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/block/block.dart';
import 'package:rbx_wallet/features/genesis/models/genesis_block.dart';
import 'package:rbx_wallet/features/node/models/node.dart';
import 'package:rbx_wallet/features/node/models/node_info.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class BridgeService extends BaseService {
  Future<dynamic> status() async {
    return await getText('/CheckStatus');
  }

  Future<String> getCliVersion() async {
    return await getText("/GetCLIVersion");
  }

  Future<String> walletInfo() async {
    return await getText('/GetWalletInfo');
  }

  Future<String> wallets() async {
    return await getText('/GetAllAddresses');
  }

  Future<String> validators() async {
    return await getText('/GetValidatorAddresses');
  }

  Future<GenesisBlock?> genesisBlock() async {
    try {
      final response = await getText("/getgenesisblock");
      final data = jsonDecode(response);
      return GenesisBlock.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Transaction>?> transactions() async {
    final response = await getText('/GetAllTransactions');
    if (response.isEmpty) {
      return null;
    }

    if (response == "FAIL") {
      return null;
    }

    if (response == "No TX") {
      return null;
    }

    final items = jsonDecode(response);

    final List<Transaction> transactions = [];
    for (final item in items) {
      transactions.add(Transaction.fromJson(item));
    }

    return transactions.reversed.toList();
  }

  Future<Map<String, dynamic>?> importPrivateKey(String key) async {
    final response = await getText("/ImportPrivateKey/$key");
    if (response == "NAC") {
      return null;
    }

    return jsonDecode(response);
  }

  Future<List<String>?> newAddress() async {
    final response = await getText("/GetNewAddress");
    if (response == "Fail") {
      return null;
    }
    return response.split(':');
  }

  Future<String?> sendFunds({
    required int amount,
    required String to,
    required String from,
  }) async {
    final response = await getText("/SendTransaction/$from/$to/$amount");

    if (response == "FAIL") {
      Toast.error();

      return null;
    }

    if (response ==
        "This is not a valid RBX address to send to. Please verify again.") {
      Toast.error(response);
      return null;
    }

    return response;
  }

  Future<String> startValidating(String address, String username) async {
    return await getText("/StartValidating/$address/$username");
  }

  Future<String?> turnOnValidator(String id) async {
    final message = await getText("/TurnOnValidator/$id");

    if (message == "STV") {
      return null;
    }

    return message;
  }

  Future<bool> turnOffValidator(String id) async {
    try {
      await getText("/TurnOffValidator/$id");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Block?> blockInfo() async {
    final response = await getText("/GetLastBlock");
    try {
      final data = jsonDecode(response);
      return Block.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Node>> getMasterNodes() async {
    final response = await getText("/GetMasternodes");
    try {
      final items = jsonDecode(response);
      final List<Node> nodes = [];
      for (final item in items) {
        nodes.add(Node.fromJson(item));
      }
      return nodes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<NodeInfo>> getPeerInfo() async {
    // return [
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1001,
    //     latency: 322,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1005,
    //     latency: 322,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1201,
    //     latency: 122,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1001,
    //     latency: 322,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1005,
    //     latency: 322,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    //   NodeInfo(
    //     ip: "127.0.0.1",
    //     height: 1201,
    //     latency: 122,
    //     lastCheked: DateTime.fromMillisecondsSinceEpoch(1648126610 * 1000),
    //   ),
    // ];

    final response = await getText("/GetPeerInfo");
    try {
      final items = jsonDecode(response);
      final List<NodeInfo> nodeInfos = [];
      for (final item in items) {
        nodeInfos.add(NodeInfo.fromJson(item));
      }
      return nodeInfos;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> killCli() async {
    if (Env.launchCli) {
      try {
        await getText("/SendExit");
      } catch (e) {
        return true;
      }
    }

    return true;
  }
}
