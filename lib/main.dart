import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/cubits/notes_cubit.dart';
import 'package:project/models/note_model.dart';
import 'package:project/simple_bloc_opserver.dart';
import 'package:project/views/notes_view.dart';
import 'package:project/views/widgets/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocOpserver();
  await Hive.initFlutter();
   Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
 

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
        ),
        home: NotesView(),
      ),
    );
  }
}
