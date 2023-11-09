import 'package:bwi_assignment/providers/auth_provider.dart'; 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, _, child) {
        // if (value.authStatus == AuthStatus.Success) {
        //   // showScaffoldMsg(context: context, msg: "Code sent");
        //   Future.delayed(Duration(seconds: 0), () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => OptVerificationPage(),
        //       ),
        //     );
        //   });
        // }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://img.freepik.com/premium-vector/hair-salon-logo-design-crown-salon_290562-205.jpg?w=740',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor:
                                  const Color.fromARGB(255, 235, 235, 235),
                              child: Container(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 350,
                        width: double.maxFinite,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            SizedBox(
                              height: 330,
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 224, 224, 224),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextField(
                                          controller: context
                                              .read<AuthProvider>()
                                              .phoneNumberController,
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText:
                                                "Enter your number with +91",
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            suffixIcon:
                                                Icon(Icons.call_outlined),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        Consumer<AuthProvider>(
                                          builder: (context, valuexx, child) =>
                                              InkWell(
                                            onTap: () {
                                              context
                                                  .read<AuthProvider>()
                                                  .verifyPhoneNumber(context);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color.fromARGB(
                                                    255, 19, 47, 78),
                                              ),
                                              child: Center(
                                                child: _.isLoading == true
                                                    ? const CircularProgressIndicator()
                                                    : const Text(
                                                        'CONTINUE',
                                                        style: TextStyle(
                                                          letterSpacing: 1.01,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: const TextSpan(
                                            text:
                                                "By continuing you agree to our \n",
                                            style: TextStyle(),
                                            children: [
                                              TextSpan(
                                                text: "Terms & Conditions",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              TextSpan(
                                                text: " and ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: "Privacy Policy",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //skip
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthProvider>().signInAnonymously(context);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
