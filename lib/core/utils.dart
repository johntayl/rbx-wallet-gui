import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../features/wallet/providers/wallet_list_provider.dart';
import '../utils/toast.dart';
import 'env.dart';

Future<bool> backupKeys(BuildContext context, WidgetRef ref) async {
  try {
    final wallets = ref.read(walletListProvider);

    String output = "";

    for (final w in wallets) {
      output += "Address:\n${w.address}\n\n";
      output += "Public Key:\n${w.publicKey}\n\n";
      output += "Private Key:\n${w.privateKey}\n\n";
      output += "===================================\n\n";
    }

    List<int> bytes = utf8.encode(output);

    final date = DateTime.now();
    final d = "${date.year}-${date.month}-${date.day}";

    if (Platform.isMacOS) {
      await FileSaver.instance.saveAs("rbx-keys-backup-$d", Uint8List.fromList(bytes), 'txt', MimeType.TEXT);
    } else {
      final data = await FileSaver.instance.saveFile("rbx-keys-backup-$d", Uint8List.fromList(bytes), 'txt', mimeType: MimeType.TEXT);
      Toast.message("Saved to $data");
    }

    return true;
  } catch (e) {
    print("Error on backupKeys");
    print(e);
    return false;
  }
}

Future<bool> backupMedia(BuildContext context, WidgetRef ref) async {
  try {
    Directory appDocDir = Platform.isMacOS ? await getApplicationDocumentsDirectory() : await getApplicationSupportDirectory();

    String rbxPath = appDocDir.path;

    final assetsFolderName = Env.isTestNet ? "AssetsTestNet" : "Assets";

    if (Platform.isMacOS) {
      rbxPath = rbxPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/rbx");
    } else {
      rbxPath = rbxPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\RBX${Env.isTestNet ? 'Test' : ''}");
    }

    String inputPath = "$rbxPath${Platform.isWindows ? '\\' : '/'}$assetsFolderName";

    final archive =
        Platform.isMacOS ? createArchiveFromDirectory(Directory.fromUri(Uri.parse(inputPath))) : createArchiveFromDirectory(Directory(inputPath));

    var bytes = ZipEncoder().encode(archive);
    if (bytes == null) {
      return false;
    }

    final date = DateTime.now();
    final d = "${date.year}-${date.month}-${date.day}";

    if (Platform.isMacOS) {
      await FileSaver.instance.saveAs("rbx-media-backup-$d", Uint8List.fromList(bytes), 'zip', MimeType.ZIP);
    } else {
      final data = await FileSaver.instance.saveFile("rbx-media-backup-$d", Uint8List.fromList(bytes), 'zip', mimeType: MimeType.ZIP);
      Toast.message("Saved to $data");
    }

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
