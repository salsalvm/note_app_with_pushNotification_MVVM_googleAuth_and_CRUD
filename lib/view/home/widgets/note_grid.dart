import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/res/type.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/widgets/save_note.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/home_controller.dart';

class NotesGrid extends StatelessWidget {
  NotesGrid({
    Key? key,
    required this.note,
  }) : super(key: key);

  final List<DocumentChange<Map<String, dynamic>>> note;
  HomeController noteController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: note.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.2 / 1,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          '${note[index].doc['title']}',
                          style: KStyle.title(),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Flexible(
                        child: Text(
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          '${note[index].doc['desc']}',
                          style: KStyle.title(color: KColors.kGrey),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: KColors.kBlack,
                              context: context,
                              builder: (ctx) {
                                return SaveNote(
                                  type: ActionType.isView,
                                  desc: note[index].doc['desc'],
                                  title: note[index].doc['title'],
                                  id: note[index].doc.id,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: KColors.kWarnning,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Are You Confirm',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    titleTextStyle:
                                        const TextStyle(color: KColors.kWhite),
                                    backgroundColor:
                                        const Color.fromARGB(255, 58, 57, 57),
                                    content: const Text(
                                      'you want to remove',
                                    ),
                                    contentTextStyle:
                                        const TextStyle(color: Colors.yellow),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style:
                                              TextStyle(color: KColors.kWhite),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          noteController
                                              .deleteNotes(note[index].doc.id);
                                          noteController.update();
                                        },
                                        child: const Text(
                                          'Confirm',
                                          style:
                                              TextStyle(color: KColors.kWhite),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: KColors.kError,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
