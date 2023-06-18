import 'package:flutter/material.dart';
import 'package:local_notifications/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  const MaterialApp(
       home: MyHomePage(),
     );
   }
 }
 class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key}) : super(key: key);

   @override
   State<MyHomePage> createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController=TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("local notification")
       ),
       body: Center(
         child: ElevatedButton(onPressed: (){
           LocalNotificationService.displayNotification("hosa message idu");
         }, child: const Text("Show Notification ")),
       ),
     );
   }
 }

