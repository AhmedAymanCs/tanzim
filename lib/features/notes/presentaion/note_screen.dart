import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanzim/core/manager/color_manager.dart';
import 'package:tanzim/core/widgets/Information_card.dart';
import 'package:tanzim/core/widgets/custom_app_bar.dart';
import 'package:tanzim/features/notes/presentaion/shared_widget.dart';
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
              cardColor: const Color(0xFFE3F2FD),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 5.w,
                childAspectRatio: 2.h,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return NoteCard();
              },
            ),
          ),
          CustomButton(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => Dialog(
                  backgroundColor: ColorManager.background,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
