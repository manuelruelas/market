import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/di.dart';
import 'package:market/ui/contact_form/cubit/contact_form_cubit.dart';
import 'package:market/ui/contact_form/pages/contact_form_page.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ContactFormCubit>(),
      child: const ContactFormPage(),
    );
  }
}
