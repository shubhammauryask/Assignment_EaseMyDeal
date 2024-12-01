import 'dart:ui';

class BuyContainerModel{
  final String title;
  final String subtitle;
  final String iconPath;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final VoidCallback onTap;
  BuyContainerModel({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.gradientEndColor,
    required this.gradientStartColor,
    required this.onTap
});
}