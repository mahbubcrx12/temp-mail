import 'package:assignment_asiatic/controller/email_controller.dart';
import 'package:assignment_asiatic/model/email_model.dart';
import 'package:assignment_asiatic/style/text_style.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailInbox extends StatefulWidget {
  final String? accessToken;

  const EmailInbox({super.key, required this.accessToken});

  @override
  _EmailInboxState createState() => _EmailInboxState();
}

class _EmailInboxState extends State<EmailInbox> {
  final EmailController _emailController = Get.put(EmailController());

  @override
  void initState() {
    super.initState();
    fetchEmailsAndListen();
  }

  @override
  void didUpdateWidget(covariant EmailInbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.accessToken != widget.accessToken) {
      fetchEmailsAndListen();
    }
  }

  Future<void> fetchEmailsAndListen() async {
    await _emailController.fetchEmails(widget.accessToken);
    setState(() {}); // Refresh the widget after fetching emails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          'Email Inbox',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _emailController.emails.length,
          itemBuilder: (context, index) {
            final EmailModel email = _emailController.emails[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From: ${email.from?['address']}',
                        style: titleStyle,
                      ),
                      Text(DateFormat('MMM dd, yyyy HH:mm')
                          .format(DateTime.parse('${email.createdAt}'))),
                      ListTile(
                        title: Text(
                          'Sub: ${email.subject}' ?? '',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text('Intro: ${email.intro}' ?? ''),
                        onTap: () {
                          // Handle email item tap
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchEmailsAndListen,
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
