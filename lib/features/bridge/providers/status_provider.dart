import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../models/log_entry.dart';
import '../services/bridge_service.dart';
import 'log_provider.dart';

enum BridgeStatus {
  Loading,
  Online,
  Offline,
}

class StatusProvider extends StateNotifier<BridgeStatus> {
  final Reader read;
  Timer? timer;

  StatusProvider(this.read, [BridgeStatus model = BridgeStatus.Loading]) : super(model) {
    _init();
  }

  Future<void> _init() async {
    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      read(logProvider.notifier).append(LogEntry(message: "Connecting..."));
    });
    _checkStatus();
    timer = Timer.periodic(const Duration(seconds: REFRESH_TIMEOUT_SECONDS), (Timer t) => _checkStatus());
  }

  Future<void> _checkStatus() async {
    final status = await BridgeService().status();

    final prevState = state;

    if (status == 'Online') {
      state = BridgeStatus.Online;

      if (state != prevState) {
        read(logProvider.notifier).append(LogEntry(message: "You are connected"));

        // read(walletInfoProvider.notifier).fetch();
      }
    } else {
      print("Got unexpected status");
      state = BridgeStatus.Offline;
      read(logProvider.notifier).append(
        LogEntry(message: "You are disconnected"),
      );
    }
  }
}

final statusProvider = StateNotifierProvider<StatusProvider, BridgeStatus>((ref) {
  return StatusProvider(ref.read);
});
