import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GmailService {
  final Dio _dio = Dio();
  final String _username = 'mruelas.a1@gmail.com';
  final String _appPassword = dotenv.env['GMAIL_APP_PASSWORD']!;

  Future<void> sendEmail({
    required String to,
    required String subject,
    required String body,
  }) async {
    final emailContent = """
    To: $to
    Subject: $subject

    $body
    """;

    const smtpServer = 'smtp.gmail.com';
    const smtpPort = 587;

    try {
      final response = await _dio.post(
        'https://$smtpServer:$smtpPort',
        data: emailContent,
        options: Options(
          headers: {
            'Content-Type': 'text/plain',
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$_username:$_appPassword'))}',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Email sent successfully');
      } else {
        print(
            'Failed to send email: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
