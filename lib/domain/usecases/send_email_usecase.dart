import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/core/usecases/usecase.dart';
import 'package:market/domain/entities/contact_message.dart';
import 'package:market/domain/repositories/email_sender_repository.dart';

class SendEmailUsecase extends UseCase<void, SendEmailParams> {
  SendEmailUsecase({required this.emailSenderRepository});

  final EmailSenderRepository emailSenderRepository;

  @override
  Future<Either<Failure, void>> call(SendEmailParams params) async {
    return emailSenderRepository.sendEmail(params.message);
  }
}

class SendEmailParams {
  SendEmailParams({required this.message});

  final ContactMessage message;
}
