// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_electronics/presentation/pages/payment/payment_failed_page.dart';
import 'package:e_commerce_electronics/presentation/pages/payment/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SnapWidget extends StatefulWidget {
  const SnapWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<SnapWidget> createState() => _SnapWidgetState();
}

class _SnapWidgetState extends State<SnapWidget> {
  WebViewController? _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        //navigationdelegate ini berfungsi untuk handle tampilan yang akan datang untuk menampung nya.
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            //handle response page success or failed
            print('onPageStarted $url');
            if (url.contains('status_code=202&transaction_status=deny')) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentFailedPage();
                  },
                ),
              );
            }
            if (url.contains('status_code=200&transaction_status=settlement')) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentSuccessPage();
                  },
                ),
              );
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller!),
    );
  }
}
