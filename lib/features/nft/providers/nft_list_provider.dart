import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/services/transaction_service.dart';
import '../models/nft.dart';
import '../services/nft_service.dart';

class NftListModel {
  final int page;
  final String search;
  final String currentSearch;
  final CliPaginatedResponse<Nft> data;

  const NftListModel({required this.page, required this.data, this.search = "", this.currentSearch = ""});

  NftListModel copyWith({
    int? page,
    CliPaginatedResponse<Nft>? data,
    String? search,
    String? currentSearch,
  }) {
    return NftListModel(
      page: page ?? this.page,
      data: data ?? this.data,
      search: search ?? this.search,
      currentSearch: currentSearch ?? this.currentSearch,
    );
  }
}

class NftListProvider extends StateNotifier<NftListModel> {
  final Reader read;
  final dynamic refresh;

  final TextEditingController searchController = TextEditingController();

  NftListProvider(
    this.read,
    this.refresh,
    NftListModel model,
  ) : super(model) {
    load(1);
  }

  Future<void> load(int page, [String? email, String? address]) async {
    if (kIsWeb) {
      final nfts = await TransactionService().listNfts(email ?? "", address ?? "");
      final d = CliPaginatedResponse(count: nfts.length, results: nfts, page: 1);
      state = state.copyWith(data: d, page: 1, currentSearch: '');
      return;
    }
    final data = await NftService().list(page, search: state.search);
    state = state.copyWith(data: data, page: page, currentSearch: state.search);
  }

  Future<void> reloadCurrentPage([String? email, String? address]) async {
    load(state.page, email, address);
  }

  void setSearch(String search) {
    state = state.copyWith(search: search);
  }

  void clearSearch() {
    state = state.copyWith(search: "");
    searchController.clear();
  }
}

final nftListProvider = StateNotifierProvider<NftListProvider, NftListModel>(
  (ref) => NftListProvider(ref.read, ref.refresh, NftListModel(page: 0, data: CliPaginatedResponse.empty())),
);
