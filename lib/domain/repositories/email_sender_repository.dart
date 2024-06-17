import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/domain/entities/contact_message.dart';

abstract class EmailSenderRepository {
  Future<Either<Failure, bool>> sendEmail(ContactMessage message);
}
