import 'package:chat_firebase/domain/controller/controlchat.dart';
import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:chat_firebase/ui/chat/mensajes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaChat extends StatefulWidget {
  const SalaChat({super.key});

  @override
  State<SalaChat> createState() => _SalaChatState();
}

class _SalaChatState extends State<SalaChat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mensaje = TextEditingController();
    ControlAuth ca = Get.find();
    ControlChat cc = Get.find();
    return Scaffold(
      appBar: AppBar(

        title: Text('Chat Grupal - ${ca.emailr}'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded (child:  Mensaje()),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensaje,
                    decoration: 
                    const InputDecoration(hintText: 'Ingrese un mensaje'),
                            ),
                ),
                IconButton(onPressed: (){
                  if(mensaje.text.isNotEmpty){
                  final datos ={
                    'email': ca.emailr,
                    'fecha': DateTime.now(),
                    'mensaje': mensaje.text
                  };
                  cc.crearChat(datos);
                  mensaje.clear();
                  }
                },
                 icon: const Icon(Icons.send))
              ],
            ),

            
          ],
        ),
      ),

    );
  }
}