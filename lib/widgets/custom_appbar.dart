import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/radius.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/widgets/custom_searchbar.dart';
import 'package:projeto_/data/models/list_cities.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/widgets/custom_dropdown.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late ListCities selectedCity;

  @override
  void initState() {
    super.initState();
    selectedCity = listCities.firstWhere(
      (city) => city.id == '1',
      orElse: () => ListCities(id: '1', name: 'São Sebastião do Paraíso'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      actionsPadding: const EdgeInsets.only(right: 10),
      title: Image.asset(Img.logoNameWhite, height: 55, fit: BoxFit.cover),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(LucideIcons.bell, size: 25)),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // custom dropdown
              Container(
                alignment: Alignment.centerLeft,
                child: CustomDropdown(
                  selectedCity: selectedCity,
                  cities: listCities,
                  onCityChanged: (ListCities? newValue) {
                    setState(() {
                      selectedCity = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SecondAppBar({super.key});

  @override
  State<SecondAppBar> createState() => _SecondAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}

class _SecondAppBarState extends State<SecondAppBar> {
  late ListCities selectedCity;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomSearchBar( iconSerach: LucideIcons.search, label: 'Busque por um produto ou categoria',),
      ),
      bottom: PreferredSize(preferredSize: const Size.fromHeight(20), child: SizedBox(height: 20)),
    );
  }
}


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      backgroundColor: AppColors.primaryColor,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.container,
          borderRadius: AppRadius.border8,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.black,
            child: Icon(
              LucideIcons.user,
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            'Nome usuário',
            style: AppTextStyles.size18Medium.copyWith(
              color: AppColors.black,
            ),
          ),
          subtitle: Text(
            'Email',
            style: AppTextStyles.size14Medium.copyWith(
              color: AppColors.black.withValues(alpha: 0.7),
            ),
          ),

          trailing: Icon(
            LucideIcons.chevronRight,
            color: AppColors.black,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: const SizedBox(height: 30),
      ),
    );
  }
}


class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: const Text('Meu perfil'),
      leading: IconButton(
        color: AppColors.black,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(LucideIcons.chevronLeft),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}