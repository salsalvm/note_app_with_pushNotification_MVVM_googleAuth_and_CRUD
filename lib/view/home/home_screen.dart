import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_notes_with_firebase_mvvm/main.dart';
import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/widgets/floating_action_button.dart';
import 'package:my_notes_with_firebase_mvvm/view/home/widgets/note_grid.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/authentication_controller.dart';
import 'package:my_notes_with_firebase_mvvm/view_model/home_controller.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    //  channel.description,
                    color: KColors.kPrimary,
                    playSound: true,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('a new on message opened app event published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? 'no title'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? 'no content')],
                ),
              ),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showNotificationCentere();
          },
          icon: const Icon(
            Icons.notification_add,
            color: KColors.kBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          '${authController.userName}  ${KString.myNotes}',
          style: KStyle.heading(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut(context: context);
              },
              icon: const Icon(
                Icons.logout,
                color: KColors.kBlack,
              ))
        ],
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => StreamBuilder(
            stream: FirebaseFirestore.instance.collection('notes').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final note = snapshot.data!.docChanges;

                return Stack(
                  children: [
                    NotesGrid(note: note),
                    const AddFolatingButton(),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: KColors.kWarnning,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void showNotificationCentere() {
    log('-------------clicked-----------');
    flutterLocalNotificationsPlugin.show(
        0,
        'Testing Notification',
        'How are You?',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                // channel.description,
                importance: Importance.high,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  AuthController authController = Get.put(AuthController());
}
