import 'package:chat_firebase/domain/controller/controladduser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ControlAuth extends GetxController{
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _email = "".obs;
  final Rx<dynamic> _mensajes = "".obs;

  String get emailr => _email.value;
  String get uid => _uid.value;

 Future< void> reiniciar() async{
  _email.value = "";
  _email.refresh();
 }

  Future<void> addUser(String u, String p, String nu) async{
    ControlAddUser cau = Get.find();
    try {

      UserCredential usuario =
       await  auth.createUserWithEmailAndPassword(
        email: u, password: p);

       // print(usuario);

      _uid.value = usuario.user!.uid;
      _email.value = usuario.user!.email;

      dynamic datos  = {
        'email': _email.value,
        'nombre': nu,
        'fecha': DateTime.now(),
        'uid': _uid.value
      };
      cau.crearUsuarios(datos, uid);
    } on FirebaseException catch (e) {
      if(e.code== 'weak-password'){

        return Future.error('Contraseña debil');

      }else if (e.code=='email-already-in-use'){

        return Future.error('Email ya esta en uso');

      }
    }

  }

  Future<void> ingresarEmail(String u, String p) async{

    try {
      UserCredential usuario =
        await auth.signInWithEmailAndPassword(email: u, password: p);
      
      _uid.value = usuario.user!.uid;
      _email.value = usuario.user!.email;

    } on FirebaseException catch (e) {
      if(e.code== 'user-not-found'){

        return Future.error('Usuario no encontrado');

      } else if (e.code=='wrong-password'){

        return Future.error('Contraseña incorrecta');

      }
    }

  }
}