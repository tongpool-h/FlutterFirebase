import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/components/task_widgets.dart';
import 'package:onboarding_screen/screens/add_note_screen.dart';
import 'login_screen.dart';
import '../components/firestore.dart';
import '../components/stream_note.dart';

//Step1: Create container
// child: Container(
//             width: double.infinity,
//             height: 130,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//           ),
// Step2 : Create child container
// child: Row(
//   children: [
//     Container( --- Extrac these code ot todolist widgets
//       width: 100,
//       height: 130,
//       decoration: const BoxDecoration(
//         color: Colors.amber,
//         image: DecorationImage(
//           image: AssetImage('assets/images/1.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//   ],
// ),
// Note: wrap row with padding
// Step3: Extract containner from step2 to todolist widgets

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final user = FirebaseAuth.instance.currentUser;
  bool show = true;

  //sign user in method
  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    const SignInScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        centerTitle: true,
        title: Text(
          "Task management.",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOutUser,
            icon: const Icon(
              Icons.login,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddNoteScreen()));
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              StreamNote(false),
              Text(
                'isDone',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold),
              ),
              StreamNote(true),
            ],
          ),
        ),
      ),
    );
  }
}
