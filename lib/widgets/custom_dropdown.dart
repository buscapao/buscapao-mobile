import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/data/models/list_cities.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/text.dart';

class CustomDropdown extends StatelessWidget {
  final ListCities selectedCity;
  final List<ListCities> cities;
  final Function(ListCities?) onCityChanged;

  const CustomDropdown({
    super.key,
    required this.selectedCity,
    required this.cities,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.mapPin, color: AppColors.white),
          SizedBox(width: 5),
          InkWell(
            onTap: () {
              _showDropdown(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedCity.name,
                  style: AppTextStyles.size14Bold.copyWith(color: AppColors.white),
                ),
                SizedBox(width: 2),
                Icon(LucideIcons.chevronDown, color: AppColors.white, size: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          builder:
              (context) => ListView.builder(
                padding: AppPadding.all20,
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      cities[index].name,
                      style: TextStyle(color: AppColors.black),
                    ),
                    onTap: () {
                      onCityChanged(cities[index]);
                      Navigator.pop(context);
                    },
                    selected: cities[index].id == selectedCity.id,
                    selectedTileColor: AppColors.primaryColor.withAlpha(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    visualDensity: VisualDensity.compact,
                  );
                },
              ),
        );
      },
    );
  }
}
