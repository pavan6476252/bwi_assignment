import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                color: Colors.amber,
              ))
          // login container
          ,
          Container(
            height: 350,
            width: double.maxFinite,
            // color: Colors.brown,
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
                                color: const Color.fromARGB(255, 224, 224, 224),
                                width: 0.5)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: "Enter your mobile number",
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    suffixIcon: Icon(Icons.call_outlined)),
                              ),
                              const SizedBox(height: 50),

                              // button

                              GestureDetector(
                                  child: Container(
                                height: 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 19, 47, 78)),
                                child: const Center(
                                  child: Text(
                                    'CONTINUE',
                                    style: TextStyle(
                                        letterSpacing: 1.01,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              )),

                              const SizedBox(height: 10),
                              // Terms and conditions

                              RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                      text: "By continuing you agree to our \n",
                                      style: TextStyle(),
                                      children: [
                                        TextSpan(
                                            text: "Terms & Conditions",
                                            style:
                                                TextStyle(color: Colors.blue)),
                                        TextSpan(
                                            text: " and ",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        TextSpan(
                                            text: "Privacy Policy",
                                            style:
                                                TextStyle(color: Colors.blue))
                                      ]))
                            ]),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          const BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0,
                              color: Colors.grey)
                        ]),
                    child: const Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
