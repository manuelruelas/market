import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/domain/entities/contact_message.dart';
import 'package:market/domain/usecases/send_email_usecase.dart';

part 'contact_form_state.dart';

class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit({required this.sendEmailUsecase})
      : super(const ContactFormState());

  final SendEmailUsecase sendEmailUsecase;

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void messageChanged(String message) {
    emit(state.copyWith(message: message));
  }

  void submit() {
    emit(state.copyWith(status: ContactFormStatus.sending));
    final message = ContactMessage(
      name: state.name,
      email: state.email,
      message: state.message,
      from: state.email,
    );

    sendEmailUsecase(SendEmailParams(message: message)).then((result) {
      result.fold(
        (failure) => emit(state.copyWith(status: ContactFormStatus.error)),
        (_) => emit(state.copyWith(status: ContactFormStatus.success)),
      );
    });
  }
}
