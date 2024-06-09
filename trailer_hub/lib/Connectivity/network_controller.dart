// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool _isDialogShown = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    print('Connectivity changed: $connectivityResult'); // Debug print
    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog(Get.context!); // Pass context to the dialog
    } else {
      if (_isDialogShown) {
        Get.back(); // Closes the dialog if shown
        _isDialogShown = false;
      }
    }
  }

  void retryConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _showNoInternetDialog(BuildContext context) {
    if (!_isDialogShown) {
      _isDialogShown = true;
      showCustomAlertDialog(context); // Use the custom alert dialog method
    }
  }

  void showCustomAlertDialog(BuildContext context) {
    Get.dialog(
      // ignore: deprecated_member_use
      WillPopScope(
        onWillPop: () async => false, // Prevent dialog from closing
        child: AlertDialog(
          title: Image.asset(
            'assets/images/internet_error_icon.png',
            height: 100,
            width: 100,
          ),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                const Text(
                  'Internet Connection Lost',
                  style: TextStyle(color: Colors.purple, fontSize: 20.5),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.pink),
                    backgroundColor: WidgetStateProperty.all(
                      const Color(0xFF8F00FF),
                    ),
                  ),
                  onPressed: () {
                    Get.find<NetworkController>().retryConnection();
                  },
                  child: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Note: Please Connect to The Internet',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
