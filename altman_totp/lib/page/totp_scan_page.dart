import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TotpScanPage extends StatefulWidget {
  const TotpScanPage({super.key});

  @override
  State<TotpScanPage> createState() => _TotpScanPageState();
}

class _TotpScanPageState extends State<TotpScanPage> {
  bool _handled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('扫描 TOTP 二维码')),
      body: MobileScanner(
        onDetect: (capture) {
          if (_handled) return;
          final code = capture.barcodes.isNotEmpty
              ? capture.barcodes.first.rawValue
              : null;
          if (code == null || code.isEmpty) return;
          _handled = true;
          Navigator.of(context).pop(code);
        },
      ),
    );
  }
}
