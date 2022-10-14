// ignore_for_file: constant_identifier_names

const APP_VERSION = "beta2.1.8-TN";
const REFRESH_TIMEOUT_SECONDS = 10;
const REFRESH_TIMEOUT_SECONDS_INACTIVE = 300;
const ALLOW_DOUBLE_MINTES = false;
const MIN_RBX_FOR_SC_ACTION = 0.1;
const DELETE_DRAFT_ON_MINT = true;
const USD_TO_RBX = 5.0;
const WEB_APP_VERSION = "beta1.0.2";
const ADNR_COST = 1.0;
const MAX_COMPILE_QUANTITY = 10;
const MAX_ASSET_BYTES = 157286400;

class TxType {
  static const int rbxTransfer = 0;
  static const int node = 1;
  static const int nftMint = 2;
  static const int nftTx = 3;
  static const int nftBurn = 4;
  static const int nftSale = 5;
  static const int adnr = 6;
  static const int dstShop = 7;
  static const int voteTopic = 8;
  static const int vote = 9;
}
