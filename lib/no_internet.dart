import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoInternetScreen extends ConsumerStatefulWidget {
  const NoInternetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NoInternetScreenState();
}

class _NoInternetScreenState extends ConsumerState<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   "assets/icons/no_internet.svg",
          //   height: 250,
          //   width: 250,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(height: 32),
          Text(
            "Ooops!",
            style: TextStyle(
                color: Color(0xffc74225),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "No internet connection found.\n Check your connection.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(height: 42),
          // Text(
          //   "App will start working as",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(color: Colors.black,fontSize: 18),

          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     // context.go('/splash');
          //   },
          //   style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          //         padding: MaterialStateProperty.all(
          //             const EdgeInsets.symmetric(horizontal: 72, vertical: 15)),
          //       ),
          //   child: Text("Retry"),
          // )
        ],
      ),
    ));
  }
}
