import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../components/topic_detail.dart';
import '../providers/topic_detail_provider.dart';

class TopicDetailScreen extends BaseScreen {
  final String topicUid;
  const TopicDetailScreen({Key? key, @PathParam("uid") required this.topicUid}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(topicDetailProvider(topicUid));

    return data.when(
      data: (topic) => topic != null
          ? AppBar(
              title: Text(topic.name),
              actions: const [WalletSelector()],
            )
          : AppBar(
              title: Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: Text("Error"),
      ),
      loading: () => AppBar(
        title: Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(topicDetailProvider(topicUid));
    return data.when(
      data: (topic) => topic != null ? TopicDetail(topic) : Center(child: Text("Error")),
      error: (_, __) => Text("Error"),
      loading: () => CenteredLoader(),
    );
  }
}
