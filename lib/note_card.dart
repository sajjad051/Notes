import 'package:flutter/material.dart';
import 'package:new_notes/note_model.dart';
import 'package:new_notes/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key, required this.note, required this.index, required this.onNoteDeleted}) : super(key: key);

  final Note note;
  final int index;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteView(note, index,onNoteDeleted,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
