import 'package:bwi_assignment/providers/auth_provider.dart';
import 'package:bwi_assignment/screens/home/home_page.dart';
import 'package:bwi_assignment/utils/show_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class OptVerificationPage extends StatefulWidget {
  const OptVerificationPage({Key? key}) : super(key: key);

  @override
  State<OptVerificationPage> createState() => _OptVerificationPageState();
}

class _OptVerificationPageState extends State<OptVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
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
                              child: Container(
                                  // color: Colors.amber,
                                  ),
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
                                        _buildPinInput(),
                                        const SizedBox(height: 15),
                                        const Text(
                                          "Resend code in 55s",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.redAccent),
                                        ),
                                        const SizedBox(height: 15),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<AuthProvider>()
                                                .signInWithPhoneNumber(context);
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
                                              child: value.isLoading
                                                  ? const CircularProgressIndicator()
                                                  : const Text(
                                                      'CONTINUE',
                                                      style: TextStyle(
                                                        letterSpacing: 1.01,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.white,
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
                                                style:
                                                    TextStyle(color: Colors.blue),
                                              ),
                                              TextSpan(
                                                text: " and ",
                                                style:
                                                    TextStyle(color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: "Privacy Policy",
                                                style:
                                                    TextStyle(color: Colors.blue),
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
                                        color: Colors.grey),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.password_rounded,
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
                        context
                            .read<AuthProvider>()
                            .signInAnonymously(context);
                      },
                      child: Text(
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

  _buildPinInput() {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 216, 215, 215))),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: const Border(bottom: BorderSide(color: Colors.black)),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: context.read<AuthProvider>().otpController,
      errorBuilder: (errorText, pin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Pin Verification failed"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return const Text("Pin Error");
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
      onCompleted: (pin) {
        print(pin);
      },
    );
  }
}
