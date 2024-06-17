part of 'contact_form_cubit.dart';

class ContactFormState extends Equatable {
  const ContactFormState({
    this.name = "",
    this.email = "",
    this.message = "",
    this.status = ContactFormStatus.initial,
  });

  final String name;
  final String email;
  final String message;
  final ContactFormStatus status;

  @override
  List<Object> get props => [
        name,
        email,
        message,
        status,
      ];

  ContactFormState copyWith({
    String? name,
    String? email,
    String? message,
    ContactFormStatus? status,
  }) {
    return ContactFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}

enum ContactFormStatus { initial, loading, success, error, sending }
