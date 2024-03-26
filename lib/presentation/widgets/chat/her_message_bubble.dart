
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {

final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,//para que aparezca al principio
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,//color
            borderRadius: BorderRadius.circular(20)//el borde de la forma
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),//el separado
            child: Text(message.text, style: const TextStyle( color: Colors.white),),//el texto y el color
          ),
        ),

        const SizedBox(height: 5,),//la separacion

        _ImageBubble(message.imageUrl!),//aqui e habla al metodo

        const SizedBox( height: 10,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble( this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,//la imagen del meme
      width: size.width * 0.7,//tamaño
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress ==  null) return child;

        return Container(
          width: size.width * 0.7,//tamaño
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi amor esta enviando una imagen'),//esto es el mensaje que sale mientras se carga el meme
        );
      },
      )
    );
  }
}

//esta clase lo que hace son los mensaje de respuesta de la otra persona