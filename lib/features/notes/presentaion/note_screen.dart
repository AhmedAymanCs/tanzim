import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/widgets/Information_card.dart';
import 'package:tanzim/core/widgets/custom_app_bar.dart';
import 'package:tanzim/generated/l10n.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            text: locale.notes,
            widget: InformationCard(
              text: "0",
              subText: locale.notes,
              textColor: ColorManager.blue,
              cardColor: Color(0xFFE3F2FD),
            ),
          ),
        ],
      ),
    );
  }
}
