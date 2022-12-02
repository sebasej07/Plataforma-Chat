import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controller/controlchat.dart';
import '../../domain/controller/controlchatprivado.dart';
import '../../domain/controller/controluser.dart';
import 'mensajeprivado.dart';

class SalaPrivada extends StatefulWidget {
  const SalaPrivada({super.key});

  @override
  State<SalaPrivada> createState() => _SalaPrivadaState();
}

class _SalaPrivadaState extends State<SalaPrivada> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mensaje = TextEditingController();
    ControlAuth ca = Get.find();
    ControlChat cc = Get.find();
    ControlChatPrivado ccp = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('WaCHAT - ${ccp.emaildestino}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: MensajePrivado()),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensaje,
                    decoration:
                        const InputDecoration(hintText: 'Ingrese un mensaje'),// ${ca.emailr} para ${ccp.emaildestino}'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        final datos = {
                          'email_origen': ca.emailr,
                          'email_destino': ccp.emaildestino,
                          'fecha': DateTime.now(),
                          'mensaje': mensaje.text
                        };
                        ccp.crearChatPrivado(datos);
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