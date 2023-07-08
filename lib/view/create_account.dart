import 'package:assignment_asiatic/controller/create_account.dart';
import 'package:assignment_asiatic/controller/fetch_domains.dart';
import 'package:assignment_asiatic/controller/get_token.dart';
import 'package:assignment_asiatic/view/user_info.dart';
import 'package:get/get.dart';
import 'package:assignment_asiatic/widget/custom_button.dart';
import 'package:assignment_asiatic/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? email;
  String? password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? domainName;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)),
                child: domainList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
              child: CustomTextField(
                isObsecure: false,
                controller: emailController,
                hintText: "Username",
                labelText: "username@availabledomain",
                labelStyle: TextStyle(color: Colors.redAccent),
                validator: (val) {
                  if (val!.isEmpty) {
                    Get.snackbar("Empty Username", "Enter username",
                        backgroundColor: Colors.white70);
                  } else if (!val.contains("@${domainName}")) {
                    Get.snackbar(
                        "Invalid Domain Name", "Please add $domainName at last",
                        backgroundColor: Colors.white70,
                        colorText: Colors.black);
                  }
                  return null;
                },
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: CustomTextField(
                  controller: passwordController,
                  isObsecure: true,
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.redAccent),
                  validator: (val) {
                    if (val!.isEmpty) {
                      Get.snackbar("Empty password", "Enter 10 digits at least",
                          backgroundColor: Colors.white70);
                      return "Empty password";
                    } else if (val.length < 10) {
                      Get.snackbar(
                          "Too short password", "Enter 10 digits at least",
                          backgroundColor: Colors.white70);
                      return null;
                    }
                    return null;
                  },

                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                text: "Create",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String email = emailController.text;
                    String password = passwordController.text;
                    final responseData =
                        await AccountService.createAccount(email, password);
                    String? jwtToken =
                        await TokenService.getJwtToken(email, password);
                    emailController.clear();
                    print(jwtToken);
                    if (jwtToken != null) {
                      // Use the JWT token as needed
                    } else {
                      // Handle the case when the token retrieval fails
                    }

                    if (responseData != null) {
                      final accountId = responseData['id'] as String;
                      final address = responseData['address'] as String;
                      final createdAt = responseData['createdAt'] as String;

                      if (password.length >= 10) {
                        Get.to(UserInfoPage(accountId, address, createdAt, jwtToken!));
                      }
                    } else {
                      // Handle the case when account creation fails
                      Get.snackbar(
                        "Unavailable Username",
                        "Try another username",
                        backgroundColor: Colors.white70,
                        colorText: Colors.black,
                      );
                    }

                  } else {
                    // Display snackbar using Get.snackbar
                    // Get.snackbar(
                    //   "Validation Error",
                    //   "Please fill in the required fields correctly.",
                    //   snackPosition: SnackPosition.BOTTOM,
                    //   backgroundColor: Colors.red,
                    //   colorText: Colors.white,
                    // );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  domainList() {
    return GetBuilder<DomainsController>(
      init: DomainsController(),
      builder: (controller) {
        return FutureBuilder<List<String>>(
          future: controller.fetchDomains(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final domainNames = snapshot.data;
              return ListView.builder(
                itemCount: domainNames!.length,
                itemBuilder: (context, index) {
                  final domain = domainNames[index];
                  domainName = domain;
                  return ListTile(
                    title: Text(
                      'Available Domain: ${domain}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
