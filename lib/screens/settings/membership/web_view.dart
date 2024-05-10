import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/library/checkout/checkout.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'nav_controls.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp(
      {super.key,
      required this.url,
      required this.amount,
      required this.fromcart});

  final String url;
  final int amount;
  final bool fromcart;

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    debugPrint(widget.url);
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      ).catchError((a) {
        debugPrint("h");
        debugPrint(a);
      });
    debugPrint(controller.printError.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          NavigationControls(controller: controller),
          //  Menu(controller: controller),               // ADD
        ],
      ),
      body: WebViewStack(
        amount: widget.amount,
        controller: controller,
        fromcart: widget.fromcart,
      ),
    );
  }
}

class WebViewStack extends ConsumerStatefulWidget {
  const WebViewStack(
      {required this.controller,
      super.key,
      required this.amount,
      required this.fromcart}); // MODIFY
  final int amount;
  final WebViewController controller;

  // ADD
  final bool fromcart;

  @override
  ConsumerState<WebViewStack> createState() => _WebViewStackConsumerState();
}

class _WebViewStackConsumerState extends ConsumerState<WebViewStack> {
  var loadingPercentage = 0;

  // REMOVE the controller that was here
  int count = 0;

  @override
  void initState() {
    super.initState();
    // Modify from here...
    widget.controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (a) {
          //success navigation

          if (a.url == "https://freshpage.in/") {
            if (widget.fromcart && count == 0) {
              place();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => SubscriptionSuccess(
              //             widget.amount,
              //           )),
              // );
              count++;
            }
          }
        },
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ),
    );
    // ...to here.
  }

  place() {
    var state = ref.watch(checkOutProvider);
    state.placeOrderWithSuccess(widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    //var state = ref.watch(checkOutProvider);
    // widget.controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller, // MODIFY
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
