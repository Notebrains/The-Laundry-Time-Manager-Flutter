
/// item_name : "BLAZER/JACKET"
/// item_qty : "2"
/// item_image : "https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"
/// non_offer_item_id : "1"
/// non_offer_item_category : "https://mridayadevstudio.com/tlt_dev/uploads/blazer-jacket1.png"
/// non_offer_item_price : "10.00"

class Offer_items {
  String _itemName;
  String _itemQty;
  String _itemImage;
  String _nonOfferItemCategory;
  String _nonOfferItemPrice;
  String _nonOfferItemId;

  String get itemName => _itemName;
  String get itemQty => _itemQty;
  String get itemImage => _itemImage;
  String get nonOfferItemCategory => _nonOfferItemCategory;
  String get nonOfferItemPrice => _nonOfferItemPrice;
  String get nonOfferItemId => _nonOfferItemId;

  Offer_items({
    String itemName,
    String itemQty,
    String itemImage,
    String nonOfferItemCategory,
    String nonOfferItemPrice,
    String nonOfferItemId,
  }){
    _itemName = itemName;
    _itemQty = itemQty;
    _itemImage = itemImage;
    _nonOfferItemCategory = nonOfferItemCategory;
    _nonOfferItemPrice = nonOfferItemPrice;
    _nonOfferItemId = nonOfferItemId;
  }

  Offer_items.fromJson(dynamic json) {
    _itemName = json["item_name"];
    _itemQty = json["item_qty"];
    _itemImage = json["item_image"];
    _nonOfferItemCategory = json["non_offer_item_category"];
    _nonOfferItemPrice = json["non_offer_item_price"];
    _nonOfferItemId = json["non_offer_item_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_name"] = _itemName;
    map["item_qty"] = _itemQty;
    map["item_image"] = _itemImage;
    map["non_offer_item_category"] = _nonOfferItemCategory;
    map["non_offer_item_price"] = _nonOfferItemPrice;
    map["non_offer_item_id"] = _nonOfferItemId;
    return map;
  }

}