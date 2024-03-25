import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',//titulo
      debugShowCheckedModeBanner: false,//para que no salga lo de la esquina
      theme: AppTheme(selectedColor: 6).theme(),//para elegir el tema
      home: ChatScreen(),
    );
  }
}