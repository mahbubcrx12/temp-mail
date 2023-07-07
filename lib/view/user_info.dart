import 'package:assignment_asiatic/style/text_style.dart';
import 'package:assignment_asiatic/view/email_inbox.dart';
import 'package:assignment_asiatic/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserInfoPage extends StatelessWidget {
  final String accountId;
  final String address;
  final String createdAt;
  final String? jwtToken;

  UserInfoPage(this.accountId, this.address, this.createdAt, this.jwtToken);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'User Information',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepOrange,
                child: Text(
                  '${address[0].toUpperCase()}',
                  style: TextStyle(color: Colors.white70, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Text(
                      'Account ID: $accountId',
                      style: subtitleStyle,
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Text(
                      'Email Address: ${address}',
                      style: subtitleStyle,
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: .5,
                  color: Colors.white70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Created at: ',
                            style: subtitleStyle,
                          ),
                          Text(DateFormat('MMM dd, yyyy HH:mm')
                              .format(DateTime.parse('${createdAt}'))),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: CustomButton(
                    text: "Check Inbox",
                    onPressed: () {
                      Get.to(() => EmailInbox(
                            accessToken: jwtToken,
                          ));
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
