import 'package:chat_firebase/domain/controller/controladduser.dart';
import 'package:chat_firebase/domain/controller/controlchat.dart';
import 'package:chat_firebase/domain/controller/controlchatprivado.dart';
import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:chat_firebase/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  GetPlatform.isWeb

      ? await Firebase.initializeApp(

          options: const FirebaseOptions(

            apiKey: "AIzaSyDAtzeNKVSJcnzC6LhekfwpHguDyVsycuY",
            authDomain: "chatfirebase-b2647.firebaseapp.com",
            projectId: "chatfirebase-b2647",
            storageBucket: "chatfirebase-b2647.appspot.com",
            messagingSenderId: "937211936001",
            appId: "1:937211936001:web:b15297a98bd09af6c66f00"))

      : await Firebase.initializeApp();
  Get.put(ControlChat());
  Get.put(ControlAuth());
  Get.put(ControlAddUser());
  Get.put(ControlChatPrivado());
  runApp(const App());

}
