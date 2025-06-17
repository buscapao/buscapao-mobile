import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
                radius: 30,
              ),
              title: Text('Drawer Header'),
              subtitle: Text('Drawer Subtitle'),
            ),
          ),

          //drawer items
          DrawerButton(icon: LucideIcons.mapPin, title: 'Meus Endereços', onTap: () {}),
          DrawerButton(icon: LucideIcons.store, title: 'Mercados', onTap: () {}),
          DrawerButton(icon: LucideIcons.shoppingBag, title: 'Pedidos', onTap: () {}),
          DrawerButton(icon: LucideIcons.ticketPercent, title: 'Meus Cupons', onTap: () {}),
          DrawerButton(icon: LucideIcons.circleHelp, title: 'Home', onTap: () {}),
          DrawerButton(icon: LucideIcons.settings, title: 'Home', onTap: () {}),

          Divider(),

          DrawerButton(icon: LucideIcons.logOut, title: 'Sair da Conta', onTap: () {}),

        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;
  const DrawerButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      splashColor: Colors.blue[100],
      onTap: onTap,
      child: ListTile(leading: Icon(icon), title: Text(title)),
    );
  }
}
