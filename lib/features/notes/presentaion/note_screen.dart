import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tanzim/generated/l10n.dart';
import 'package:tanzim/presentation/shared_widgets.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);
    return Scaffold(
      body: Column(children: [CustomAppBar(text: locale.notes)]),
    );
  }
}
