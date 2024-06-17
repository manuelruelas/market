import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/ui/contact_form/contact_form.dart';
import 'package:market/ui/contact_form/cubit/contact_form_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFormPage extends StatelessWidget {
  const ContactFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Icon(Icons.phone),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Llamar",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                InkWell(
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: "tel",
                        path: "+526681172112",
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Telefono",
                                style: Theme.of(context).textTheme.titleMedium),
                            const Text("+52 6681172112")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(Icons.mail),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Correo electrónico",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          child: Column(
                            children: [
                              BlocBuilder<ContactFormCubit, ContactFormState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    onChanged: (value) {
                                      context
                                          .read<ContactFormCubit>()
                                          .nameChanged(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Nombre",
                                      border: OutlineInputBorder(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              BlocBuilder<ContactFormCubit, ContactFormState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    onChanged: (value) {
                                      context
                                          .read<ContactFormCubit>()
                                          .emailChanged(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Correo contacto",
                                      border: OutlineInputBorder(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              BlocBuilder<ContactFormCubit, ContactFormState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    onChanged: (value) {
                                      context
                                          .read<ContactFormCubit>()
                                          .messageChanged(value);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Asunto",
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                context.read<ContactFormCubit>().submit();
                              },
                              label: const Text("Enviar"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
