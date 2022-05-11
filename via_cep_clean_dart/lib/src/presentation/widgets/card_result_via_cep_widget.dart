import 'package:flutter/material.dart';
import 'package:via_cep_clean_dart/src/theme/app_theme.dart';

class CardResultViaCepWidget extends StatelessWidget {
  final String localidade;
  final String uf;
  const CardResultViaCepWidget({
    Key? key,
    required this.localidade,
    required this.uf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shadowColor: AppTheme.colors.primary,
        elevation: 5,
        color: AppTheme.colors.primary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            '$localidade - $uf',
            style: AppTheme.textStyles.button,
          ),
        ),
      ),
    );
  }
}
