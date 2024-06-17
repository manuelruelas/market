import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MailgunService {
  static String mailgunDomain = dotenv.env['MAILGUN_DOMAIN']!;
  static String mailgunApiKey = dotenv.env['MAILGUN_API_KEY']!;

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.mailgun.net/v3',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('api:$mailgunApiKey'))}',
    },
  ));

  static Future<void> sendEmail({
    required String from,
    required String to,
    required String subject,
    required String text,
  }) async {
    final String url = 'https://api.mailgun.net/v3/$mailgunDomain/messages';

    try {
      final response = await _dio.post(
        url,
        data: FormData.fromMap({
          'from': from,
          'to': to,
          'subject': subject,
          'text': text,
        }),
        options: Options(
          headers: {
            'Authorization':
                'Basic ${base64Encode(utf8.encode('api:$mailgunApiKey'))}',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Email sent successfully');
      } else {
        print('Failed to send email: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
