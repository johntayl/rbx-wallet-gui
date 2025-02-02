import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/keygen/models/keypair.dart';
import '../../features/nft/providers/nft_list_provider.dart';
import '../../features/wallet/models/wallet.dart';
import '../app_constants.dart';
import '../services/explorer_service.dart';
import '../singletons.dart';
import '../storage.dart';
import 'ready_provider.dart';

class WebSessionModel {
  final Keypair? keypair;
  final double? balance;
  final bool isAuthenticated;
  final String timezoneName;

  const WebSessionModel({
    this.keypair,
    this.balance,
    this.isAuthenticated = false,
    this.timezoneName = "America/Los_Angeles",
  });

  WebSessionModel copyWith({
    Keypair? keypair,
    double? balance,
    bool? isAuthenticated,
    String? timezoneName,
  }) {
    return WebSessionModel(
      keypair: keypair ?? this.keypair,
      balance: balance ?? this.balance,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      timezoneName: timezoneName ?? this.timezoneName,
    );
  }

  Wallet? get currentWallet {
    if (keypair == null) return null;
    return Wallet(
      id: 0,
      publicKey: keypair!.publicInflated,
      privateKey: keypair!.private,
      address: keypair!.public,
      balance: balance ?? 0,
      isValidating: false,
      // isEncrypted: false,
    );
  }
}

class WebSessionProvider extends StateNotifier<WebSessionModel> {
  final Reader read;

  static const _initial = WebSessionModel();

  WebSessionProvider(this.read, [WebSessionModel model = _initial]) : super(model) {
    init();
  }

  void init() {
    final savedKeypair = singleton<Storage>().getMap(Storage.WEB_KEYPAIR);
    if (savedKeypair != null) {
      final keypair = Keypair.fromJson(savedKeypair);
      login(keypair, false);
    }
    read(readyProvider.notifier).setReady(true);

    final timezoneName = DateTime.now().timeZoneName.toString();
    state = state.copyWith(timezoneName: timezoneName);
  }

  void login(Keypair keypair, [bool andSave = true]) {
    if (andSave) {
      singleton<Storage>().setMap(Storage.WEB_KEYPAIR, keypair.toJson());
    }

    state = state.copyWith(keypair: keypair, isAuthenticated: true);
    loop();
  }

  void loop() async {
    getBalance();
    getNfts();
    await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
    loop();
  }

  Future<void> getBalance() async {
    if (state.keypair == null) {
      return;
    }
    final balance = await ExplorerService().getBalance(state.keypair!.public);

    state = state.copyWith(balance: balance);
  }

  Future<void> getNfts() async {
    if (state.keypair == null) {
      return;
    }
    read(nftListProvider.notifier).load(1, state.keypair!.email, state.keypair!.public);
  }

  Future<void> logout() async {
    singleton<Storage>().remove(Storage.WEB_KEYPAIR);
    state = _initial;

    await Future.delayed(const Duration(milliseconds: 150));
  }
}

final webSessionProvider = StateNotifierProvider<WebSessionProvider, WebSessionModel>(
  (ref) => WebSessionProvider(ref.read),
);
