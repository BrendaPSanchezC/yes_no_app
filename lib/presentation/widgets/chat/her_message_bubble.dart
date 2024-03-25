
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),//el separado
            child: Text('Hola Mundo', style: TextStyle( color: Colors.white),),//el texto y el color
          ),
        ),

        const SizedBox(height: 5,),//la separacion

        _ImageBubble(),//aqui e habla al metodo

        const SizedBox( height: 10,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif',//la imagen del meme
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