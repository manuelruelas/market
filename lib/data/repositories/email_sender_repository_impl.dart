import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/core/mailing/mailer_service.dart';
import 'package:market/domain/entities/contact_message.dart';
import 'package:market/domain/repositories/email_sender_repository.dart';

class EmailSenderRepositoryImpl implements EmailSenderRepository {
  EmailSenderRepositoryImpl();

  @override
  Future<Either<Failure, bool>> sendEmail(ContactMessage message) async {
    try {
      final emailBody = '''
SE RECIBIO UN COMENTARIO DESDE EL SISTEMA DE ANUNCIOS EMPRESARIALES CON LA SIGUIENTE INFORMACÓN DE CONTACTO
NOMBRE: ${message.name}
CORREO CONTACTO: ${message.email}
MENSAJE: ${message.message}
''';
      await EmailService().sendEmail(
        subject: 'Mensaje de ${message.name}',
        to: message.from,
        body: emailBody,
      );
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure("Error al enviar el correo"));
    }
  }
}
