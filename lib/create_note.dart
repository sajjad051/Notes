import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_notes/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key, required this.onNewNoteCreated}) : super(key: key);

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Notes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){
            if(titleController.text.isEmpty){
              const Text('Title Required');
              return ;
            }
            if(bodyController.text.isEmpty){
              return;
            }

            final note = Note(
              body: bodyController.text,
              title: titleController.text,
            );
            widget.onNewNoteCreated(note);
            Navigator.of(context).pop();
          }, icon: Icon(Icons.save), color: Colors.black)
        ],

        centerTitle: true,
        backgroundColor: Colors.tealAccent,

      ),
     body:Padding(
    padding: const EdgeInsets.all(10),
     child: Column(
          children: [
          TextFormField(
            controller: titleController,
            style: const TextStyle(
              fontSize: 27
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Title"
            ),
          ),
        const SizedBox(height: 15),
          TextFormField(
            controller: bodyController,
            style: const TextStyle(
                fontSize: 18
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Content"
            ),
          )
        ],
      ),
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(titleController.text.isEmpty){
            const Text('Title Required');
            return ;
          }
          if(bodyController.text.isEmpty){
            return;
          }

          final note = Note(
            body: bodyController.text,
            title: titleController.text,
          );
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child:  const Icon(Icons.save,),

      ),
    );
  }
}
