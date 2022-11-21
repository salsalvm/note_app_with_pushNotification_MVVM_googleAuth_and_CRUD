import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  addNotes(String title, String desc) async {
    await FirebaseFirestore.instance.collection('notes').add(
      {
        'title': title,
        'desc': desc,
      },
    );

    update();
    Get.back();
  }

  deleteNotes(String id) async {
    await FirebaseFirestore.instance.collection('notes').doc(id).delete();

    update();
    Get.back();
  }

  updateNotes(String id, String title, String desc) async {
    await FirebaseFirestore.instance.collection('notes').doc(id).update(
      {
        'title': title,
        'desc': desc,
      },
    );

    update();
    Get.back();
  }
}
