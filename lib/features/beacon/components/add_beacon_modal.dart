import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/beacon/providers/add_beacon_form_provider.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_form_provider.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_list_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

class AddBeaconModal extends BaseComponent {
  const AddBeaconModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(addBeaconFormProvider.notifier);
    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        Text("Add Beacon"),
        Text(
          "Add an existing beacon to foreign nodes to use that relay instead of default ones on the RBX network. Configure your wallet to use a remote beacon for media transferring rather than using the default RBX network beacons. You will need to know the IP address of the remote beacon. If that beacon is using the non-default port, provide that as well. The beacon name is a friendly name visible only to you.",
          style: Theme.of(context).textTheme.caption,
        ),
        Form(
          key: provider.formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: provider.nameController,
                  validator: provider.nameValidator,
                  decoration: InputDecoration(
                    label: Text("Beacon Name"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  controller: provider.ipController,
                  validator: provider.ipAddressValidator,
                  decoration: InputDecoration(
                    label: Text("IP Address"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 240,
                child: TextFormField(
                  controller: provider.portController,
                  decoration: InputDecoration(label: Text("Port (leave blank for default)")),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              type: AppButtonType.Text,
              variant: AppColorVariant.Light,
              onPressed: () {
                provider.clear();
                Navigator.of(context).pop();
              },
            ),
            AppButton(
              label: "Add",
              variant: AppColorVariant.Success,
              onPressed: () async {
                final success = await provider.submit();

                if (success == null) {
                  return;
                }

                ref.read(beaconListProvider.notifier).refresh();
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    );
  }
}
