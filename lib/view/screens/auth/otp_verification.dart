// import 'dart:async';
//
// import 'package:iskaanowner/Blocs/App%20Theme/app_theme_cubit.dart';
// import 'package:iskaanowner/Blocs/Verify%20Otp/verify_otp_cubit.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pinput/pinput.dart';
//
// import '../../Blocs/Send OTP/send_otp_cubit.dart';
// import '../../Utils/utils.dart';
//
// class OtpVerificationPage extends StatefulWidget {
//   const OtpVerificationPage({super.key});
//
//   @override
//   State<OtpVerificationPage> createState() => _OtpVerificationPageState();
// }
//
// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   int _secondsRemaining = 60; // Initial time in seconds
//   late Timer _timer;
//
//   @override
//   void initState() {
//     startTimer();
//     super.initState();
//   }
//
//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsRemaining >= 0) {
//           _secondsRemaining--;
//         } else {
//           _timer.cancel(); // Stop the timer when it reaches 0
//         }
//       });
//     });
//   }
//
//   void resetTimer() {
//     setState(() {
//       _secondsRemaining = 60;
//     });
//     _timer.cancel(); // Cancel the timer if it's running
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel(); // Dispose the timer to avoid memory leaks
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String? email = ModalRoute.of(context)?.settings.arguments as String?;
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
//         builder: (context, state) {
//           return Scaffold(
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Builder(
//                 builder: (context) {
//                   if (state.loadingState == LoadingState.loading) {
//                     return const SizedBox(height: 50, child: CustomLoader());
//                   }
//                   return CustomButton(
//                       text: "Verify",
//                       function: () {
//                         context
//                             .read<VerifyOtpCubit>()
//                             .verifyOTP(context, email ?? "");
//                       });
//                 },
//               ),
//             ),
//             body: SafeArea(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: const DashboardPage().appBar(context,
//                         text: "Verification", enableTrailing: false),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               const CustomText(
//                                 text: "OTP sent to Mail",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                               LottieBuilder.asset(
//                                 "assets/otp.json",
//                                 width: 200,
//                               ),
//                               const Gap(20),
//                               const CustomText(
//                                   text:
//                                       "A Six digit OTP message has been sent to the mail you provided earlier"),
//                               const Gap(20),
//                               Pinput(
//                                 length: 6,
//                                 androidSmsAutofillMethod:
//                                     AndroidSmsAutofillMethod.smsUserConsentApi,
//                                 enabled:
//                                     state.loadingState == LoadingState.loading
//                                         ? false
//                                         : true,
//                                 onChanged: (value) {
//                                   context
//                                       .read<VerifyOtpCubit>()
//                                       .onChangeOtp(value);
//                                 },
//                               ),
//                               const Gap(20),
//                               BlocBuilder<SendOtpCubit, SendOtpState>(
//                                 builder: (context, state) {
//                                   return CustomButton(
//                                     width:
//                                         MediaQuery.of(context).size.width / 2,
//                                     text: "Resend Code",
//                                     invert: true,
//                                     function: () {
//                                       if (_secondsRemaining > 0) {
//                                         return;
//                                       }
//                                       context
//                                           .read<SendOtpCubit>()
//                                           .sendOTP(context, pushPage: false)
//                                           .then((value) {
//                                         if (value == true) {
//                                           resetTimer();
//                                           startTimer();
//                                         }
//                                       });
//                                     },
//                                     buttonColor: (_secondsRemaining > 0)
//                                         ? kGrey
//                                         : context
//                                             .read<AppThemeCubit>()
//                                             .state
//                                             .primaryColor,
//                                     textColor: (_secondsRemaining > 0)
//                                         ? kGrey
//                                         : context
//                                             .read<AppThemeCubit>()
//                                             .state
//                                             .primaryColor,
//                                     icon: state.loadingState ==
//                                             LoadingState.loading
//                                         ? const SizedBox(
//                                             height: 20,
//                                             width: 20,
//                                             child: CustomLoader())
//                                         : (_secondsRemaining > 0)
//                                             ? CustomText(
//                                                 text: "($_secondsRemaining) ",
//                                                 color: kGrey,
//                                               )
//                                             : null,
//                                   );
//                                 },
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
