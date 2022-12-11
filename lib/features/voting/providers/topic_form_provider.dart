import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/models/value_label.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/voting/models/new_topic.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/providers/topic_list_provider.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';
import 'package:rbx_wallet/features/voting/utils.dart';
import 'package:rbx_wallet/utils/validation.dart';

class TopicFormProvider extends StateNotifier<NewTopic> {
  final Reader read;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TopicFormProvider(this.read, NewTopic model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    descriptionController.addListener(() {
      state = state.copyWith(description: descriptionController.text);
    });
    load(state);
  }

  load(NewTopic topic) {
    state = topic;
    nameController.text = topic.name;
    descriptionController.text = topic.description;
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) => formValidatorNotEmpty(val, "Description");

  List<ValueLabel> categoryOptions(BuildContext context) {
    return voteTopicCategoryValueLabels(context);
  }

  List<ValueLabel> votingDaysOptions(BuildContext context) {
    return votingDaysValueLabels(context);
  }

  setCategory(VoteTopicCategory category) {
    state = state.copyWith(category: category);
  }

  setVotingEndDays(VotingDays days) {
    state = state.copyWith(votingEndDays: days);
  }

  clear() {
    load(NewTopic.empty());
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    read(globalLoadingProvider.notifier).start();
    final success = await TopicService().create(state);
    read(globalLoadingProvider.notifier).complete();

    if (success) {
      clear();
      for (final t in TopicListType.values) {
        read(topicListProvider(t).notifier).refresh();
      }
    }
    return success;
  }
}

final topicFormProvider = StateNotifierProvider<TopicFormProvider, NewTopic>((ref) {
  return TopicFormProvider(ref.read, NewTopic.empty());
});
