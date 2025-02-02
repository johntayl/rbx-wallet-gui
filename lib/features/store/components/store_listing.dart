import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/countdown.dart';
import '../../../core/components/simple_expandable_text.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/html_helpers.dart';
import '../../../utils/toast.dart';
import '../../auth/auth_utils.dart';
import '../../nft/components/nft_qr_code.dart';
import '../models/listing.dart';
import '../models/store_collection.dart';
import '../providers/bid_provider.dart';
import '../providers/purchase_provider.dart';
import 'bid_history.dart';
import 'bid_modal.dart';
import 'purchase_modal.dart';

class StoreListing extends BaseComponent {
  final Listing listing;
  final bool withShareButtons;
  final StoreCollection? collection;

  const StoreListing(
    this.listing, {
    Key? key,
    this.withShareButtons = true,
    this.collection,
  }) : super(key: key);

  Future<void> handleBid(BuildContext context, WidgetRef ref) async {
    final session = ref.read(webSessionProvider);
    final provider = ref.read(bidProvider(listing.slug).notifier);
    provider.setCollection(collection);
    if (session.keypair == null) {
      await AuthModal.show(
          context: context,
          withExplanation: true,
          onValidSubmission: (auth) async {
            await handleCreateWithEmail(
              context,
              ref,
              auth.email,
              auth.password,
            );
            if (ref.read(webSessionProvider).isAuthenticated) {
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return BidModal(
                      listing: listing,
                    );
                  });
            }
          });

      return;
    }

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return BidModal(
            listing: listing,
          );
        });
  }

  Future<void> handlePurchase(BuildContext context, WidgetRef ref) async {
    final session = ref.read(webSessionProvider);
    final provider = ref.read(purchaseProvider(listing.slug).notifier);
    provider.setCollection(collection);
    if (session.keypair == null) {
      await AuthModal.show(
          context: context,
          withExplanation: true,
          onValidSubmission: (auth) async {
            await handleCreateWithEmail(
              context,
              ref,
              auth.email,
              auth.password,
            );
            if (ref.read(webSessionProvider).isAuthenticated) {
              showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    return PurchaseModal(
                      listing: listing,
                    );
                  });
            }
          });

      return;
    }

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return PurchaseModal(
            listing: listing,
          );
        });
  }

  Future<void> handleCopyUrl() async {
    final url = HtmlHelpers().getUrl();
    await Clipboard.setData(ClipboardData(text: url));
    Toast.message("URL copied to clipboard");
  }

  @override
  Padding body(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildInfo(context, withShareButtons: withShareButtons),
          const SizedBox(
            height: 8,
          ),
          buildPreview(context),
          if (listing.hasFinished || listing.isPurchased) const _AuctionEnded(),
          if (listing.isActive && listing.isAuction)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildAuction(context, ref),
            ),
          if (listing.isActive && listing.isBuyNow)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildPurchase(context, ref),
            ),
          Center(child: buildCountdown(context)),
          buildPreviewDetails(context),
          buildNftDetails(context, ref),
          const SizedBox(height: 8),
          buildDetails(context),
        ],
      ),
    );
  }

  @override
  Padding desktopBody(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildPreview(context),
                const SizedBox(height: 8),
                if (listing.hasFinished || listing.isPurchased) const _AuctionEnded(),
                if (listing.isActive)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (listing.isAuction) buildAuction(context, ref),
                      if (listing.isBuyNow) buildPurchase(context, ref),
                    ],
                  ),
                buildCountdown(context),
                buildPreviewDetails(context),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfo(context, withShareButtons: withShareButtons),
                  const SizedBox(height: 8),
                  buildNftDetails(context, ref),
                  const SizedBox(height: 16),
                  buildDetails(context),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildCountdown(BuildContext context) {
    return Column(
      crossAxisAlignment: BreakPoints.useMobileLayout(context) ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (listing.isActive && listing.endsAt != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(dueDate: listing.endsAt!, prefix: "Auction Ends"),
          ),
        if (!listing.hasStarted)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(dueDate: listing.startsAt, prefix: "Auction Starts"),
          ),
      ],
    );
  }

  Widget buildPreviewDetails(BuildContext context) {
    final nft = listing.nft.smartContract;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("NFT Features:", style: Theme.of(context).textTheme.headline5),
          Builder(
            builder: (context) {
              if (nft.features.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.cancel,
                        size: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "No Smart Contract Features",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nft.featureList
                    .map(
                      (f) => ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: ListTile(
                          leading: Icon(f.icon),
                          title: Text(f.nameLabel),
                          subtitle: Text(f.description),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }

  Row buildShareButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(child: buildInfo(context)),
        IconButton(
            onPressed: () {
              final url = HtmlHelpers().getUrl();

              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: NftQrCode(
                        data: url,
                        withClose: true,
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.qr_code)),
        IconButton(
            onPressed: () {
              handleCopyUrl();
            },
            icon: const Icon(Icons.link))
      ],
    );
  }

  Widget buildNftDetails(BuildContext context, WidgetRef ref) {
    final headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      color: Theme.of(context).colorScheme.secondary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.4,
            ),
            children: [
              TextSpan(text: "NFT Name: ", style: headingStyle),
              TextSpan(text: listing.nft.name),
              const TextSpan(text: "\n"),
              TextSpan(text: "NFT Description:\n", style: headingStyle),

              // TextSpan(text: listing.nft.description.replaceAll("\\n", "\n"))
            ],
          ),
        ),
        SimpleExpandableText(
            '${listing.appendDescriptionText != null ? '${listing.appendDescriptionText}\n\n' : ''}${listing.nft.description.replaceAll("\\n", "\n")}'),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget buildPreview(BuildContext context) {
    final urls = listing.previewUrls;

    if (urls.isEmpty) return const SizedBox();

    return PreviewCarousel(urls: urls);
  }

  Column buildInfo(BuildContext context, {bool withShareButtons = true}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                listing.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            if (withShareButtons) buildShareButtons(context),
          ],
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(listing.description),
        ),
      ],
    );
  }

  Widget buildDetails(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white10.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                children: [
                  buildDetailRow(context, "Identifier", listing.nft.identifier, true),
                  buildDetailRow(context, "Owner Address", listing.nft.ownerAddress, true),
                  buildDetailRow(context, "Minted On", listing.nft.mintedAtLabelPrecise),
                  buildDetailRow(context, "Minted By", listing.nft.minterName),
                  buildDetailRow(context, "Minter Address", listing.nft.smartContract.minterAddress),
                  buildDetailRow(context, "Chain", "RBX"),
                  if (listing.endsAt != null) buildDetailRow(context, "Sale Ends", listing.endTimeLabelPrecise),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPurchase(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Colors.white10.withOpacity(0.05),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              buildPrice(context, "Buy Now Price", listing.buyNowPriceLabel),
              const SizedBox(height: 16),
              AppButton(
                label: "Buy Now",
                icon: Icons.money,
                size: AppSizeVariant.Lg,
                onPressed: () {
                  handlePurchase(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuction(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Colors.white10.withOpacity(0.05),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Auction",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              buildPrice(context, "Floor Price", listing.floorPriceLabel),
              const Divider(),
              if (listing.highestBid != null)
                buildPrice(
                  context,
                  "Highest Bid",
                  listing.allowRbx ? listing.highestBid!.amountLabel : listing.highestBid!.amountLabelWithoutRbx,
                  Theme.of(context).colorScheme.success,
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(label: "Bid Now", icon: Icons.gavel, size: AppSizeVariant.Lg, onPressed: () => handleBid(context, ref)),
                  const SizedBox(
                    width: 6,
                  ),
                  AppButton(
                    label: "History",
                    icon: Icons.punch_clock,
                    size: AppSizeVariant.Lg,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return BidHistory(
                              listing: listing,
                            );
                          });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrice(
    BuildContext context,
    String label,
    String amount, [
    Color priceColor = Colors.white,
  ]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: priceColor,
          ),
        )
      ],
    );
  }

  TableRow buildDetailRow(BuildContext context, String label, String value, [bool copyValue = false]) {
    final isMobile = BreakPoints.useMobileLayout(context);

    if (isMobile) {
      return TableRow(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$label: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(value),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ]);
    }
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value),
              const SizedBox(width: 8),
              if (copyValue)
                InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: value));

                      Toast.message("$label copied to clipboard");
                    },
                    child: const Icon(Icons.copy, size: 12)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuctionEnded extends StatelessWidget {
  const _AuctionEnded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "This auction has ended",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PreviewCarousel extends StatefulWidget {
  const PreviewCarousel({
    Key? key,
    required this.urls,
  }) : super(key: key);

  final List<String> urls;

  @override
  State<PreviewCarousel> createState() => _PreviewCarouselState();
}

class _PreviewCarouselState extends State<PreviewCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    CarouselController controller = CarouselController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                offset: Offset.zero,
                blurRadius: 5,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                spreadRadius: 4,
              )
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: isMobile ? double.infinity : 320,
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    // autoPlay: BreakPoints.useMobileLayout(context) ? false : true,
                    autoPlay: false,
                    onPageChanged: (i, _) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                  ),
                  items: widget.urls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: PinchZoom(
                                      child: Image.network(
                                        url,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Image.network(
                          url,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        if (widget.urls.isNotEmpty)
          DotsIndicator(
            dotsCount: widget.urls.length,

            position: selectedIndex.toDouble(), // lol why does this package use a double for an index :P
            // onTap: (index) {
            //   print(index.toInt());
            //   // controller.animateToPage(index.toInt());
            //   // controller.animateToPage(index.toInt());
            // },
            decorator: const DotsDecorator(
              activeColor: Colors.white,
              color: Colors.white54,
              size: Size.fromRadius(3),
              activeSize: Size.fromRadius(4),
            ),
          )
      ],
    );
  }
}
