import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/cubits/add_notes_cubit.dart';
import 'package:project/cubits/notes_cubit.dart';
import 'package:project/views/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddNotesCubit(),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) => {
            if (state is AddNotesFailure) {},
            if (state is AddNotesSuccess)
            
             {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes(),          
              Navigator.pop(context)}
          },
          builder: (context, state) {
         return   AbsorbPointer(
          absorbing:state is AddNotesLoading?true:false ,
           child:  Padding(
                padding: EdgeInsets.only(left: 16.0,
                right:16,
                bottom:MediaQuery.of(context).viewInsets.bottom,),
                child:const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              ),
         );
          },
        ));
  }
}
