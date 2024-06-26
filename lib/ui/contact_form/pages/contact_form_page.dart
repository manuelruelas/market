import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/contact_form/contact_form.dart';
import 'package:market/ui/contact_form/cubit/contact_form_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFormPage extends StatelessWidget {
  ContactFormPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactFormCubit, ContactFormState>(
      listener: (context, state) {
        if (state.status == ContactFormStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Mensaje enviado"),
              backgroundColor: Colors.green,
            ),
          );
          context.go('/product-list');
        }
        if (state.status == ContactFormStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error al enviar el mensaje"),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Contacto"),
        ),
        body: SafeArea(
          child: BlocBuilder<ContactFormCubit, ContactFormState>(
            builder: (context, state) {
              return state.status == ContactFormStatus.sending
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Telefono",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          BlocBuilder<ContactFormCubit,
                                              ContactFormState>(
                                            builder: (context, state) {
                                              return TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "El nombre es requerido";
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  context
                                                      .read<ContactFormCubit>()
                                                      .nameChanged(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: "Nombre",
                                                        border:
                                                            OutlineInputBorder(),
                                                        icon:
                                                            Icon(Icons.person)),
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          BlocBuilder<ContactFormCubit,
                                              ContactFormState>(
                                            builder: (context, state) {
                                              return TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "El correo es requerido";
                                                  }
                                                  if (!EmailValidator.validate(
                                                      value)) {
                                                    return "Correo inválido";
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  context
                                                      .read<ContactFormCubit>()
                                                      .emailChanged(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Correo contacto",
                                                  border: OutlineInputBorder(),
                                                  icon: Icon(Icons.mail),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          BlocBuilder<ContactFormCubit,
                                              ContactFormState>(
                                            builder: (context, state) {
                                              return TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "El mensaje es requerido";
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  context
                                                      .read<ContactFormCubit>()
                                                      .messageChanged(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Asunto",
                                                  border: OutlineInputBorder(),
                                                ),
                                                keyboardType:
                                                    TextInputType.multiline,
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
                                        FilledButton.icon(
                                          icon: const Icon(Icons.send),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<ContactFormCubit>()
                                                  .submit();
                                            }
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
                    );
            },
          ),
        ),
      ),
    );
  }
}
