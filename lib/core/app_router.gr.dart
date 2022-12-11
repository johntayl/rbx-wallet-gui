// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/foundation.dart' as _i24;
import 'package:flutter/material.dart' as _i23;
import 'package:rbx_wallet/features/adjudicator/adjudicator_screen.dart'
    as _i12;
import 'package:rbx_wallet/features/adnr/screens/adnr_screen.dart' as _i18;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart'
    as _i14;
import 'package:rbx_wallet/features/dsts/screens/dst_screen.dart' as _i17;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i7;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i15;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i13;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart' as _i9;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i8;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart'
    as _i22;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart'
    as _i5;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_drafts_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart'
    as _i10;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart'
    as _i11;
import 'package:rbx_wallet/features/voting/screens/create_topic_screen.dart'
    as _i21;
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart'
    as _i20;
import 'package:rbx_wallet/features/voting/screens/topic_list_screen.dart'
    as _i19;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RootContainer());
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MySmartContractsScreen());
    },
    SmartContractDraftsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SmartContractDraftsScreen());
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.TemplateChooserScreen());
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i5.SmartContractCreatorContainerScreen());
    },
    HomeTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    SendTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ReceiveTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    TransactionsTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ValidatorTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    AdjudicatorTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    NodesTabsRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    DatanodeTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    NftTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    DstsTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    AdnrTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    VotingTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    SendScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.SendScreen());
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ReceiveScreen());
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.TransactionsScreen());
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.ValidatorScreen());
    },
    AdjudicatorScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.AdjudicatorScreen());
    },
    NodeListScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.NodeListScreen());
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.DataNodeScreen());
    },
    NftListScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.NftListScreen());
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.SmartContractsScreen());
    },
    DstsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.DstsScreen());
    },
    AdnrScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.AdnrScreen());
    },
    TopicListScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i19.TopicListScreen());
    },
    TopicDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TopicDetailScreenRouteArgs>(
          orElse: () => TopicDetailScreenRouteArgs(
              topicUid: pathParams.getString('uid')));
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i20.TopicDetailScreen(key: args.key, topicUid: args.topicUid));
    },
    CreateTopicScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i21.CreateTopicScreen());
    },
    SmartContractCreatorMainRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i22.SmartContractCreatorMain());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(RootContainerRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(HomeScreenRoute.name,
                    path: '', parent: HomeTabRouter.name)
              ]),
          _i6.RouteConfig(SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(SendScreenRoute.name,
                    path: '', parent: SendTabRouter.name)
              ]),
          _i6.RouteConfig(ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(ReceiveScreenRoute.name,
                    path: '', parent: ReceiveTabRouter.name)
              ]),
          _i6.RouteConfig(TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(TransactionsScreenRoute.name,
                    path: '', parent: TransactionsTabRouter.name)
              ]),
          _i6.RouteConfig(ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(ValidatorScreenRoute.name,
                    path: '', parent: ValidatorTabRouter.name)
              ]),
          _i6.RouteConfig(AdjudicatorTabRouter.name,
              path: 'adjudicator',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(AdjudicatorScreenRoute.name,
                    path: '', parent: AdjudicatorTabRouter.name)
              ]),
          _i6.RouteConfig(NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(NodeListScreenRoute.name,
                    path: '', parent: NodesTabsRouter.name)
              ]),
          _i6.RouteConfig(DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(DataNodeScreenRoute.name,
                    path: '', parent: DatanodeTabRouter.name)
              ]),
          _i6.RouteConfig(NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(NftListScreenRoute.name,
                    path: '', parent: NftTabRouter.name)
              ]),
          _i6.RouteConfig(SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(SmartContractsScreenRoute.name,
                    path: '', parent: SmartContractsTabRouter.name)
              ]),
          _i6.RouteConfig(DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(DstsScreenRoute.name,
                    path: '', parent: DstsTabRouter.name)
              ]),
          _i6.RouteConfig(AdnrTabRouter.name,
              path: 'adnr',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(AdnrScreenRoute.name,
                    path: '', parent: AdnrTabRouter.name)
              ]),
          _i6.RouteConfig(VotingTabRouter.name,
              path: 'voting',
              parent: RootContainerRoute.name,
              children: [
                _i6.RouteConfig(TopicListScreenRoute.name,
                    path: '', parent: VotingTabRouter.name),
                _i6.RouteConfig(TopicDetailScreenRoute.name,
                    path: ':uid', parent: VotingTabRouter.name),
                _i6.RouteConfig(CreateTopicScreenRoute.name,
                    path: 'create', parent: VotingTabRouter.name)
              ])
        ]),
        _i6.RouteConfig(MySmartContractsScreenRoute.name,
            path: 'my-smart-contracts'),
        _i6.RouteConfig(SmartContractDraftsScreenRoute.name,
            path: 'smart-contract-drafts'),
        _i6.RouteConfig(TemplateChooserScreenRoute.name,
            path: 'smart-contract-templates'),
        _i6.RouteConfig(SmartContractCreatorContainerScreenRoute.name,
            path: 'create-smart-contract',
            children: [
              _i6.RouteConfig('#redirect',
                  path: '',
                  parent: SmartContractCreatorContainerScreenRoute.name,
                  redirectTo: 'main',
                  fullMatch: true),
              _i6.RouteConfig(SmartContractCreatorMainRoute.name,
                  path: 'main',
                  parent: SmartContractCreatorContainerScreenRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i6.PageRouteInfo<void> {
  const RootContainerRoute({List<_i6.PageRouteInfo>? children})
      : super(RootContainerRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i6.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(MySmartContractsScreenRoute.name, path: 'my-smart-contracts');

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.SmartContractDraftsScreen]
class SmartContractDraftsScreenRoute extends _i6.PageRouteInfo<void> {
  const SmartContractDraftsScreenRoute()
      : super(SmartContractDraftsScreenRoute.name,
            path: 'smart-contract-drafts');

  static const String name = 'SmartContractDraftsScreenRoute';
}

/// generated route for
/// [_i4.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i6.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(TemplateChooserScreenRoute.name,
            path: 'smart-contract-templates');

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i5.SmartContractCreatorContainerScreen]
class SmartContractCreatorContainerScreenRoute extends _i6.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute(
      {List<_i6.PageRouteInfo>? children})
      : super(SmartContractCreatorContainerScreenRoute.name,
            path: 'create-smart-contract', initialChildren: children);

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeTabRouter extends _i6.PageRouteInfo<void> {
  const HomeTabRouter({List<_i6.PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SendTabRouter extends _i6.PageRouteInfo<void> {
  const SendTabRouter({List<_i6.PageRouteInfo>? children})
      : super(SendTabRouter.name, path: 'send', initialChildren: children);

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ReceiveTabRouter extends _i6.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i6.PageRouteInfo>? children})
      : super(ReceiveTabRouter.name,
            path: 'receive', initialChildren: children);

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class TransactionsTabRouter extends _i6.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i6.PageRouteInfo>? children})
      : super(TransactionsTabRouter.name,
            path: 'transactions', initialChildren: children);

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ValidatorTabRouter extends _i6.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i6.PageRouteInfo>? children})
      : super(ValidatorTabRouter.name,
            path: 'validator', initialChildren: children);

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class AdjudicatorTabRouter extends _i6.PageRouteInfo<void> {
  const AdjudicatorTabRouter({List<_i6.PageRouteInfo>? children})
      : super(AdjudicatorTabRouter.name,
            path: 'adjudicator', initialChildren: children);

  static const String name = 'AdjudicatorTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class NodesTabsRouter extends _i6.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i6.PageRouteInfo>? children})
      : super(NodesTabsRouter.name, path: 'nodes', initialChildren: children);

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class DatanodeTabRouter extends _i6.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i6.PageRouteInfo>? children})
      : super(DatanodeTabRouter.name,
            path: 'datanode', initialChildren: children);

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class NftTabRouter extends _i6.PageRouteInfo<void> {
  const NftTabRouter({List<_i6.PageRouteInfo>? children})
      : super(NftTabRouter.name, path: 'nft', initialChildren: children);

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SmartContractsTabRouter extends _i6.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i6.PageRouteInfo>? children})
      : super(SmartContractsTabRouter.name,
            path: 'smart-contracts', initialChildren: children);

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class DstsTabRouter extends _i6.PageRouteInfo<void> {
  const DstsTabRouter({List<_i6.PageRouteInfo>? children})
      : super(DstsTabRouter.name, path: 'dsts', initialChildren: children);

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class AdnrTabRouter extends _i6.PageRouteInfo<void> {
  const AdnrTabRouter({List<_i6.PageRouteInfo>? children})
      : super(AdnrTabRouter.name, path: 'adnr', initialChildren: children);

  static const String name = 'AdnrTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class VotingTabRouter extends _i6.PageRouteInfo<void> {
  const VotingTabRouter({List<_i6.PageRouteInfo>? children})
      : super(VotingTabRouter.name, path: 'voting', initialChildren: children);

  static const String name = 'VotingTabRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i8.SendScreen]
class SendScreenRoute extends _i6.PageRouteInfo<void> {
  const SendScreenRoute() : super(SendScreenRoute.name, path: '');

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i9.ReceiveScreen]
class ReceiveScreenRoute extends _i6.PageRouteInfo<void> {
  const ReceiveScreenRoute() : super(ReceiveScreenRoute.name, path: '');

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i10.TransactionsScreen]
class TransactionsScreenRoute extends _i6.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(TransactionsScreenRoute.name, path: '');

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i11.ValidatorScreen]
class ValidatorScreenRoute extends _i6.PageRouteInfo<void> {
  const ValidatorScreenRoute() : super(ValidatorScreenRoute.name, path: '');

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i12.AdjudicatorScreen]
class AdjudicatorScreenRoute extends _i6.PageRouteInfo<void> {
  const AdjudicatorScreenRoute() : super(AdjudicatorScreenRoute.name, path: '');

  static const String name = 'AdjudicatorScreenRoute';
}

/// generated route for
/// [_i13.NodeListScreen]
class NodeListScreenRoute extends _i6.PageRouteInfo<void> {
  const NodeListScreenRoute() : super(NodeListScreenRoute.name, path: '');

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i14.DataNodeScreen]
class DataNodeScreenRoute extends _i6.PageRouteInfo<void> {
  const DataNodeScreenRoute() : super(DataNodeScreenRoute.name, path: '');

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i15.NftListScreen]
class NftListScreenRoute extends _i6.PageRouteInfo<void> {
  const NftListScreenRoute() : super(NftListScreenRoute.name, path: '');

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i16.SmartContractsScreen]
class SmartContractsScreenRoute extends _i6.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(SmartContractsScreenRoute.name, path: '');

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i17.DstsScreen]
class DstsScreenRoute extends _i6.PageRouteInfo<void> {
  const DstsScreenRoute() : super(DstsScreenRoute.name, path: '');

  static const String name = 'DstsScreenRoute';
}

/// generated route for
/// [_i18.AdnrScreen]
class AdnrScreenRoute extends _i6.PageRouteInfo<void> {
  const AdnrScreenRoute() : super(AdnrScreenRoute.name, path: '');

  static const String name = 'AdnrScreenRoute';
}

/// generated route for
/// [_i19.TopicListScreen]
class TopicListScreenRoute extends _i6.PageRouteInfo<void> {
  const TopicListScreenRoute() : super(TopicListScreenRoute.name, path: '');

  static const String name = 'TopicListScreenRoute';
}

/// generated route for
/// [_i20.TopicDetailScreen]
class TopicDetailScreenRoute
    extends _i6.PageRouteInfo<TopicDetailScreenRouteArgs> {
  TopicDetailScreenRoute({_i24.Key? key, required String topicUid})
      : super(TopicDetailScreenRoute.name,
            path: ':uid',
            args: TopicDetailScreenRouteArgs(key: key, topicUid: topicUid),
            rawPathParams: {'uid': topicUid});

  static const String name = 'TopicDetailScreenRoute';
}

class TopicDetailScreenRouteArgs {
  const TopicDetailScreenRouteArgs({this.key, required this.topicUid});

  final _i24.Key? key;

  final String topicUid;

  @override
  String toString() {
    return 'TopicDetailScreenRouteArgs{key: $key, topicUid: $topicUid}';
  }
}

/// generated route for
/// [_i21.CreateTopicScreen]
class CreateTopicScreenRoute extends _i6.PageRouteInfo<void> {
  const CreateTopicScreenRoute()
      : super(CreateTopicScreenRoute.name, path: 'create');

  static const String name = 'CreateTopicScreenRoute';
}

/// generated route for
/// [_i22.SmartContractCreatorMain]
class SmartContractCreatorMainRoute extends _i6.PageRouteInfo<void> {
  const SmartContractCreatorMainRoute()
      : super(SmartContractCreatorMainRoute.name, path: 'main');

  static const String name = 'SmartContractCreatorMainRoute';
}
