
import 'dart:ui';

class OfferModel{
  final String bankIcon;
  final String offerAmount;
  final String bankName;
  final String description;
  final String? additionalInfo;
  final Color backgroundColor;
  final VoidCallback? onTap;
  OfferModel({
   required this.bankName,
   required this.offerAmount,
   required this.description,
   required this.additionalInfo,
   required this.backgroundColor,
   required this.onTap,
   required this.bankIcon,
});
}