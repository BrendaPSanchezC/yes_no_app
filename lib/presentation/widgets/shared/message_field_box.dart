import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(//este es paarq ue no se este repitiendo lo mism varias veces y mejor solo llamamos a esta variable para que se utilice
      borderSide: const BorderSide(color: Colors.transparent),//color de la barra
      borderRadius: BorderRadius.circular(40)//el borde
    );
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',//esto va ver si termina con el sigo y vera que es una pregunta
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: 
        IconButton(
          icon: const Icon(Icons.send_outlined),//icono de enviar
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            textController.clear();//cuando se apreta el icono e enviar se elimina de ahi y como que se envia
          },
        )//icono de enviar
      );

    return TextFormField(//para que se pueda escribir
    onTapOutside: (event) {//para cuando se aprete afuera se cierre el teclado
      focusNode.unfocus();
    },
    focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        print('submit value $value');
        textController.clear();//cuando apretemos done se borrara el texto 
        focusNode.requestFocus();//esto hara que no se cierre el teclado cuando se aprete el done
      },
      

    );
  }
}

//esta clase es para la barra de escribir que sale abajo del chat