import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  final String username = 'mruelas.a1@gmail.com';
  final String password = dotenv.env['GMAIL_APP_PASSWORD']!;

  Future<void> sendEmail({
    required String to,
    required String subject,
    required String body,
  }) async {
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Manuel')
      ..recipients.add(to)
      ..subject = subject
      ..text = body;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent. \n${e.toString()}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
