import 'package:flutter/material.dart';
import 'package:project/cubits/notes_cubit.dart';
import 'package:project/models/note_model.dart';
import 'package:project/views/widgets/Notes_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(vertical: 4.0),
                  child: NotesItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
