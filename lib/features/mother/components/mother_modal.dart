import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/files.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../models/mother_child.dart';
import '../services/mother_service.dart';
import 'mother_add_host_dialog.dart';
import 'mother_create_host_dialog.dart';

class MotherModal extends BaseComponent {
  final MotherData? motherData;
  final List<MotherChild> children;
  const MotherModal(this.motherData, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectedToMother = ref.watch(walletInfoProvider)?.connectedToMother == true;

    return ModalContainer(
      padding: 16.0,
      withDecor: false,
      withClose: false,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Monitor Tx Hashes & Addresses Expo Remote",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                  Text(
                    "MOTHER is a tool for monitoring the state of your remote validators.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            AppButton(
              label: "Close",
              onPressed: () {
                Navigator.of(context).pop();
              },
              type: AppButtonType.Text,
              variant: AppColorVariant.Light,
            ),
          ],
        ),
        const Divider(),
        const Text(
          "Status",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        Text("Is Host: ${motherData != null ? 'YES' : 'NO'}"),
        Text("Is Remote: ${connectedToMother ? 'YES' : 'NO'}"),
        if (motherData != null) Text("Children: ${children.length}"),
        const Divider(),
        if (motherData != null)
          ListTile(
            title: const Text("Launch MOTHER"),
            leading: const Icon(Icons.launch),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              AutoRouter.of(context).push(const MotherDashboardScreenRoute());
            },
          ),
        ListTile(
          title: Text(motherData == null ? "Set Wallet as Host" : "Update Host Info"),
          leading: const Icon(Icons.cell_tower),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            final data = await showDialog(
              context: context,
              builder: (context) => MotherCreateHostDialog(forUpdate: motherData != null),
            );

            if (data != null) {
              Navigator.of(context).pop();
            }
          },
        ),
        if (motherData != null)
          ListTile(
            title: const Text("Stop Host"),
            leading: const Icon(
              Icons.stop,
              color: Colors.red,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final confirmed = await ConfirmDialog.show(
                title: "Stop MOTHER Host?",
                body: "Are you sure you want to stop running this wallet as a MOTHER host?",
                confirmText: "Stop",
                cancelText: "Cancel",
              );

              if (confirmed == true) {
                final success = await MotherService().stopHost();
                if (success == true) {
                  final restart = await ConfirmDialog.show(
                    title: "CLI Restart Required",
                    body: "Would you like to restart now?",
                    confirmText: "Restart",
                    cancelText: "Later",
                  );

                  if (restart == true) {
                    ref.read(sessionProvider.notifier).restartCli();
                  }
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        if (motherData == null && !connectedToMother)
          ListTile(
            title: const Text("Set Wallet as Remote"),
            leading: const Icon(Icons.satellite_alt_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final data = await showDialog(
                context: context,
                builder: (context) => MotherAddHostDialog(),
              );

              if (data != null) {
                Navigator.of(context).pop();
              }
            },
          ),
        if (motherData == null && connectedToMother)
          ListTile(
            title: const Text("Stop Remote"),
            leading: const Icon(
              Icons.stop,
              color: Colors.red,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              InfoDialog.show(
                title: "Stop Remote",
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("In order to stop the REMOTE you need to update your configuration file."),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        final path = await configPath();
                        openFile(File(path));
                      },
                      child: const Text(
                        "1. Open Config",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("2. Remove the following entries:"),
                    Text(
                      "-> MotherAddress",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      "-> MotherPassword",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 16),
                    const Text("4. Save the config file."),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () async {
                        ref.read(sessionProvider.notifier).restartCli();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "3. Restart the CLI",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              );

              // if (data != null) {
              //   Navigator.of(context).pop();
              // }
            },
          ),
        ListTile(
          title: const Text("What is MOTHER?"),
          leading: const Icon(Icons.help),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            InfoDialog.show(
              title: "Monitor Tx Hashes & Addresses Expo Remote",
              body:
                  "MOTHER is a tool for monitoring the state of your remote validators.\n\nFirst you must setup one of your wallets as the HOST and then add your additional node as a REMOTE.\n\nWhen adding a REMOTE node, you will need to know the IP address and the password for the HOST.\n\nOnce complete, you'll be able to view a dashboard tracking all of your node's activity from one wallet.\n\nNote: you must have port '${Env.validatorPort}' open on the HOST machine.",
            );
          },
        ),
      ],
    );
  }
}
