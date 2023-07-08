import 'package:assignment_asiatic/view/create_account.dart';
import 'package:assignment_asiatic/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                  text: "Create Account",
                  onPressed: () {
                    Get.to(() => CreateAccount());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
