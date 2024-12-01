class ItemModel{
  final bool? priceDrop;
  final String itemName;
  final String imageUrl;
  ItemModel({
    required this.itemName,
    required this.imageUrl,
    this.priceDrop,
});
}