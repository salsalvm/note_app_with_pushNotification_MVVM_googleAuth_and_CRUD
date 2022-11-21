import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/type.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/widgets/save_note.dart';

class AddFolatingButton extends StatelessWidget {
  const AddFolatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 10),
      child: Container(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: KColors.kBlack,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: KColors.kBlack,
              context: context,
              builder: (ctx) {
                return SaveNote(
                  type: ActionType.isAdd,
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
