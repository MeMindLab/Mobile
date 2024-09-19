import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';

class EmailSend {
  EmailSend();

  static Future<void> send({
    required String body,
    required String subject,
    List<String>? attachments,
  }) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: ["tpgus19@gmail.com"],
      attachmentPaths: attachments,
      cc: ["tpgus19@gmail.com"],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      print(error);
    }
  }
}
