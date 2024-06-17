import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/core/mailing/mailgun_service.dart';
import 'package:market/domain/entities/contact_message.dart';
import 'package:market/domain/repositories/email_sender_repository.dart';

class EmailSenderRepositoryImpl implements EmailSenderRepository {
  EmailSenderRepositoryImpl();

  @override
  Future<Either<Failure, bool>> sendEmail(ContactMessage message) async {
    try {
      await MailgunService.sendEmail(
        to: 'manuel.r.a@hotmail.com',
        from: message.email,
        subject: 'Mensaje de ${message.name}',
        text: message.message,
      );
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure("Error al enviar el correo"));
    }
  }
}
