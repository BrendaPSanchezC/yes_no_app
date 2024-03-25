
import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:   EdgeInsets.all(4.0),//separacion
          child: CircleAvatar(//para que sea circular
            backgroundImage: NetworkImage('https://at-cdn-s03.audiotool.com/2024/01/13/documents/fv121mkkvg/0/cover256x256-79fba9440ee54085a7e342dbc43351c7.jpg'),//imagen del icono
          ),
        ), 
        title: const Text('Mi amor'),//el texto que sale alado 
      ),
      body: _ChatView(),//llama a la clase
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),//la separacion
        child: Column(
          children: [
            Expanded(child: 
            ListView.builder(//la lista
              itemCount: 100,
              itemBuilder: (context, index){
                return (index % 2 == 0)//este es para dividir para que salga nuestro mensaje y la respuesta de la otra persona
                ? const HerMessageBubble()
                : const MyMessageBubble();
            })
            ),

            //Caja de texto
           const MessageFieldBox(),//aqui llama al message
        
          ],
        ),
      ),
    );
  }
}