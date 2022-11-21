import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/components/custom_text.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/res/type.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/home_controller.dart';

class SaveNote extends StatelessWidget {
  final ActionType type;
  final String? title;
  final String? desc;
  final String? id;
  SaveNote({Key? key, required this.type, this.title, this.desc, this.id})
      : super(key: key);

  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  HomeController noteController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    if (type == ActionType.isView) {
      titleController.text = title!;
      descController.text = desc!;
    }
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: KColors.kGrey,
              ),
            ),
            Text(
              'Add New Notes',
              style: KStyle.heading(color: KColors.kGrey),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final desc = descController.text.trim();

                    if (type == ActionType.isAdd) {
                      if (title.isEmpty || desc.isEmpty) {
                        Get.snackbar('No Content', 'Please write Anything',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: KColors.kWhite);
                        return;
                      } else {
                        noteController.addNotes(title, desc);
                        titleController.clear();
                        descController.clear();
                      }
                    } else {
                      noteController.updateNotes(id!, title, desc);
                      titleController.clear();
                      descController.clear();
                    }
                    noteController.update();
                  },
                  icon: const Icon(
                    Icons.save,
                    color: KColors.kWhite,
                  )),
            )
          ],
        ),
        SizedBox(
          height: size.height * .9,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  controller: titleController,
                  text: 'Title',
                  style: KStyle.title(color: KColors.kWhite),
                  mLength: 45,
                ),
                Expanded(
                  child: CustomText(
                    controller: descController,
                    text: 'Description',
                    style: KStyle.content(color: KColors.kGrey),
                    mLine: null,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
