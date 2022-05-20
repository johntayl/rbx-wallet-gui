import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/formatting.dart';

class NftDataModal extends StatelessWidget {
  final String data;
  const NftDataModal(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = getPrettyJSONString(jsonDecode(data));

    return ModalContainer(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            text,
            softWrap: false,
          ),
        )
      ],
    );
  }
}
