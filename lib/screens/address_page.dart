import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/widgets/custom_appbar.dart';
import 'package:projeto_/widgets/custom_textfield.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});

  final List<Map<String, dynamic>> _addressItems = [
    {
      'label': 'Rua',
      'hintText': 'Rua 1',
      'keyboardType': TextInputType.text,
      'icon': 'street',
    },
    {
      'label': 'Número',
      'hintText': '123',
      'keyboardType': TextInputType.number,
      'icon': null, // <- sem ícone
    },
    {
      'label': 'Bairro',
      'hintText': 'Bairro 1',
      'keyboardType': TextInputType.text,
      'icon': 'neighborhood',
    },
    {
      'label': 'Cidade',
      'hintText': 'Guartinha - MG',
      'keyboardType': TextInputType.text,
      'icon': 'city',
    },
    {
      'label': 'CEP',
      'hintText': '00000-000',
      'keyboardType': TextInputType.number,
      'formatter': <TextInputFormatter>[],
      'icon': 'cep',
    },
  ];

  IconData? _getLucideIcon(String? iconName) {
    switch (iconName) {
      case 'street':
        return LucideIcons.map;
      case 'number':
        return LucideIcons.mapPin;
      case 'neighborhood':
        return LucideIcons.building2;
      case 'city':
        return LucideIcons.building;
      case 'cep':
        return LucideIcons.mailbox;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(title: 'Meus Endereços'),
      body: Padding(
        padding: AppPadding.symmetricHorizontal20.copyWith(top: 20),
        child: Column(
          children: [

            // Primeira linha com Rua e Número lado a lado
            Row(
              children: [
                // Campo Rua
                Expanded(
                  flex: 4,
                  child: ProfileTextField(
                    enableText: false,
                    labelText: _addressItems[0]['label'],
                    hintText: _addressItems[0]['hintText'],
                    keyboardType: _addressItems[0]['keyboardType'],
                    inputFormater: _addressItems[0]['formatter'],
                    icon: _getLucideIcon(_addressItems[0]['icon']),
                  ),
                ),
                SizedBox(width: 20),

                // Campo Número
                Expanded(
                  flex: 1,
                  child: ProfileTextField(
                    textAlign: TextAlign.center,
                    enableText: false,
                    labelText: _addressItems[1]['label'],
                    hintText: _addressItems[1]['hintText'],
                    keyboardType: _addressItems[1]['keyboardType'],
                    inputFormater: _addressItems[1]['formatter'],
                    icon: null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Campos: Bairro, Cidade e CEP
            ..._addressItems
                .sublist(2)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ProfileTextField(
                      enableText: false,
                      labelText: item['label'],
                      hintText: item['hintText'],
                      keyboardType: item['keyboardType'],
                      inputFormater: item['formatter'],
                      icon: _getLucideIcon(item['icon']),
                    ),
                  ),
                ),

            // Botão Salvar
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
