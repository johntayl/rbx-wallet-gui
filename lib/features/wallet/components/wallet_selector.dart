import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../encrypt/utils.dart';
import '../providers/wallet_list_provider.dart';
import 'manage_wallet_bottom_sheet.dart';

class WalletSelector extends BaseComponent {
  final bool truncatedLabel;
  final bool withOptions;
  const WalletSelector({
    Key? key,
    this.truncatedLabel = true,
    this.withOptions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;
    final allWallets = ref.watch(walletListProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentWallet != null)
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: currentWallet.address),
              );
              Toast.message("${currentWallet.address} copied to clipboard");
            },
            child: const Icon(
              Icons.copy,
              size: 12,
            ),
          ),
        PopupMenuButton(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(currentWallet != null
                      ? truncatedLabel
                          ? currentWallet.label
                          : currentWallet.labelWithoutTruncation
                      : "Wallet"),
                  const Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
            ),
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];

            for (final wallet in allWallets) {
              final isSelected = currentWallet != null && wallet.address == currentWallet.address;

              final color = isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).textTheme.bodyText1!.color;

              list.add(
                PopupMenuItem(
                  child: Text(
                    truncatedLabel ? wallet.label : wallet.labelWithoutTruncation,
                    style: TextStyle(color: color),
                  ),
                  onTap: () {
                    ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                  },
                ),
              );
            }

            if (withOptions) {
              if (list.isNotEmpty) {
                list.add(const PopupMenuDivider());
              }

              list.add(
                PopupMenuItem(
                  child: const Text("Import Wallet"),
                  onTap: () async {
                    if (!await passwordRequiredGuard(context, ref)) return;
                    if (!guardWalletIsNotResyncing(ref.read)) return;

                    PromptModal.show(
                      title: "Import Wallet",
                      validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                      labelText: "Private Key",
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                      onValidSubmission: (value) async {
                        await ref.read(walletListProvider.notifier).import(value);
                      },
                    );
                  },
                ),
              );
              list.add(
                PopupMenuItem(
                  child: const Text("New Wallet"),
                  onTap: () async {
                    if (!await passwordRequiredGuard(context, ref)) return;
                    await ref.read(walletListProvider.notifier).create();
                  },
                ),
              );

              list.add(
                PopupMenuItem(
                  child: const Text("Manage Wallets"),
                  onTap: () async {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return const ManageWalletBottomSheet();
                      },
                    );
                  },
                ),
              );
            }

            return list;
          },
        ),
      ],
    );
  }
}
