import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/beacon.dart';
import '../services/beacon_service.dart';

class BeaconListProvider extends StateNotifier<List<Beacon>> {
  final Reader read;

  BeaconListProvider(this.read, [List<Beacon> topics = const []]) : super(topics) {
    load();
  }

  Future<void> load() async {
    state = await BeaconService().list();
  }

  void refresh() {
    load();
  }
}

final beaconListProvider = StateNotifierProvider<BeaconListProvider, List<Beacon>>(
  (ref) => BeaconListProvider(ref.read),
);
