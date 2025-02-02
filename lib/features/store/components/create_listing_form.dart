import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/dropdowns.dart';
import '../../../core/components/upload_image_selector.dart';
import '../../../core/dialogs.dart';
import '../../../core/web_router.gr.dart';
import '../../../utils/toast.dart';
import '../providers/create_listing_provider.dart';

class CreateListingForm extends BaseComponent {
  final int storeId;
  const CreateListingForm({Key? key, required this.storeId}) : super(key: key);

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref, bool forStartsAt) async {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.read(createListingProvider(storeId));

    final d = await showDatePicker(
      context: context,
      initialDate: forStartsAt ? listing.startsAt ?? DateTime.now() : listing.endsAt ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 100),
      ),
    );

    if (d != null) {
      provider.setDate(d, forStartsAt);
    }
  }

  Future<void> handleSubmit(BuildContext context, WidgetRef ref) async {
    final provider = ref.read(createListingProvider(storeId).notifier);

    final slug = await provider.submit();

    if (slug != null) {
      Toast.message("Auction Created!");
      AutoRouter.of(context).push(StoreListingScreenRoute(slug: slug));
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.watch(createListingProvider(storeId));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(provider),
            buildDescription(provider),
            buildPreviewManager(ref),
            const Divider(),
            buildStartsAt(provider, context, ref),
            buildEndsAt(provider, context, ref),
            const Divider(),
            buildNft(context, ref),
            buildAuctionSwitch(listing, provider),
            buildBuyNowSwitch(listing, provider),
            if (listing.hasAuction) buildFloorPrice(provider),
            if (listing.hasBuyNow) buildBuyNowPrice(provider),
            const Divider(),
            buildSubmit(context, ref),
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.watch(createListingProvider(storeId));

    return Form(
      key: provider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildName(provider),
          buildDescription(provider),
          buildPreviewManager(ref),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: buildStartsAt(provider, context, ref),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              Expanded(
                child: buildEndsAt(provider, context, ref),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              buildNft(context, ref),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              buildAuctionSwitch(listing, provider),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              buildBuyNowSwitch(listing, provider)
            ],
          ),
          const Divider(),
          Row(
            children: [
              if (listing.hasAuction)
                Expanded(
                  child: buildFloorPrice(provider),
                ),
              if (listing.hasAuction && listing.hasBuyNow)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 2,
                    height: 32,
                    color: Colors.white24,
                  ),
                ),
              if (listing.hasBuyNow)
                Expanded(
                  child: buildBuyNowPrice(provider),
                ),
            ],
          ),
          if (listing.hasAuction || listing.hasBuyNow) const Divider(),
          buildSubmit(context, ref)
        ],
      ),
    );
  }

  Widget buildPreviewManager(WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.watch(createListingProvider(storeId));

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Preview Image(s)",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: listing.previewUrls.asMap().entries.map((entry) {
              final index = entry.key;
              final url = entry.value;
              return UploadImageSelector(
                  key: Key(url),
                  url: url,
                  onChange: (val) {
                    if (val == null) {
                      provider.removePreviewUrl(index);
                    } else {
                      provider.updatePreviewUrl(val, index);
                    }
                  });
            }).toList(),
          ),
          UploadImageSelector(onChange: (val) {
            if (val != null) {
              provider.addPreviewUrl(val);
            }
          }),
        ],
      ),
    );
  }

  Align buildSubmit(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppButton(
        label: "Create",
        onPressed: () async {
          final confirmed =
              await ConfirmDialog.show(title: "Publish Auction", body: "Are you sure you are ready to publish this auction?", confirmText: "Publish");
          if (confirmed == true) {
            handleSubmit(context, ref);
          }
        },
      ),
    );
  }

  TextFormField buildBuyNowPrice(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.buyNowPriceController,
      validator: provider.buyNowPriceValidator,
      decoration: const InputDecoration(label: Text("Buy Now Price (USD)")),
      inputFormatters: [
        FilteringTextInputFormatter.deny(',', replacementString: '.'),
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
      ],
    );
  }

  TextFormField buildFloorPrice(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.floorPriceController,
      validator: provider.floorPriceValidator,
      decoration: const InputDecoration(label: Text("Auction Floor Price (USD)")),
      inputFormatters: [
        FilteringTextInputFormatter.deny(',', replacementString: '.'),
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
      ],
    );
  }

  Row buildBuyNowSwitch(CreateListingModel listing, CreateListingProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
            value: listing.hasBuyNow,
            onChanged: (val) {
              provider.setHasBuyNow(val);
            }),
        const SizedBox(
          width: 6,
        ),
        const Text("Allow Purchase (Buy Now)")
      ],
    );
  }

  Row buildAuctionSwitch(CreateListingModel listing, CreateListingProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
            value: listing.hasAuction,
            onChanged: (val) {
              provider.setHasAuction(val);
            }),
        const SizedBox(
          width: 6,
        ),
        const Text("Allow Bidding (Auction)")
      ],
    );
  }

  Widget buildNft(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.read(createListingProvider(storeId));
    // return SizedBox();

    return AppDropdown<String>(
        label: "NFT",
        selectedValue: listing.nft == null ? '' : listing.nft!.id,
        selectedLabel: listing.nft == null ? '-' : listing.nft!.truncatedName,
        options: [
          const AppDropdownOption(label: "- - -", value: ""),
          ...listing.nfts
              .map((n) => AppDropdownOption<String>(
                    label: n.truncatedName,
                    value: n.id,
                  ))
              .toList()
        ],
        onChange: (val) {
          if (val.isNotEmpty) {
            provider.setNftWithId(val);
          }
        });
  }

  TextFormField buildDescription(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.descriptionController,
      validator: provider.descriptionValidator,
      decoration: const InputDecoration(
        label: Text("Auction Description"),
      ),
      minLines: 3,
      maxLines: 6,
    );
  }

  TextFormField buildName(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.nameController,
      validator: provider.nameValidator,
      decoration: const InputDecoration(label: Text("Auction Name")),
    );
  }

  TextFormField buildEndsAt(CreateListingProvider provider, BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: provider.endsAtController,
      validator: provider.endsAtValidator,
      onTap: () {
        _showDatePicker(context, ref, false);
      },
      decoration: InputDecoration(
        label: const Text(
          "Ends On",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          onPressed: () {
            _showDatePicker(context, ref, false);
          },
        ),
      ),
    );
  }

  TextFormField buildStartsAt(CreateListingProvider provider, BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: provider.startsAtController,
      validator: provider.startsAtValidator,
      onTap: () {
        _showDatePicker(context, ref, true);
      },
      decoration: InputDecoration(
        label: const Text(
          "Starts On",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          onPressed: () {
            _showDatePicker(context, ref, true);
          },
        ),
      ),
    );
  }
}
