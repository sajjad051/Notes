import 'package:flutter/material.dart';
import 'package:new_notes/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView(this.note, this.index, this.onNoteDeleted, {Key? key}) : super(key: key);

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note View'),
        actions: [
          IconButton(onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return  AlertDialog(
                    title: const Text("Delete This ?"),
                    content:  Text("Note ' ${note.title} ' will be deleted!"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                        onNoteDeleted(index);
                        Navigator.of(context).pop();
                      },
                          child: Text("Delete")
                      ),

                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                          child: Text("Cancel") ),
                    ],
                  );
                });
          }, icon: const Icon(Icons.delete))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 28
              ),
            ),
            const SizedBox(height: 20),
            Text(
              note.body,
              style: const TextStyle(
                  fontSize: 18
              ),
            ),
          ],
        ),
      ),
    );
  }
}
