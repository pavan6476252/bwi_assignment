import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pinput.dart';

class OptVerificationPage extends StatefulWidget {
  const OptVerificationPage({super.key});

  @override
  State<OptVerificationPage> createState() => _OptVerificationPageState();
}

class _OptVerificationPageState extends State<OptVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          SizedBox(
              width: double.maxFinite,
              child: Text(
                "Skip",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              )),
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
                              // const TextField(
                              //   decoration: InputDecoration(
                              //       focusedBorder: UnderlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.black)),
                              //       hintText: "Enter your mobile number",
                              //       border: UnderlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.grey)),
                              //       suffixIcon: Icon(Icons.call_outlined)),
                              // ),
                              _buildPinInput(),
                              SizedBox(height: 15),
                              Text(
                                "Resend code in 55s",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              const SizedBox(height: 15),

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
                      Icons.password_rounded,
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

  _buildPinInput() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      // textStyle: TextStyle(
      //     fontSize: 20,
      //     color: Color.fromRGBO(30, 60, 87, 1),
      //     fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 216, 215, 215))),
        // borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border(bottom: BorderSide(color: Colors.black)),
      // borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      errorBuilder: (errorText, pin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Pin Verificatioin failed"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return Text("Pin Error");
      },
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
