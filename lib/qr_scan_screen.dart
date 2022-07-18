import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  _QrScanScreenState createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {

  // qr 'ın okunduktan sonraki metni
  String data = "";

  // ana sayfaya kamera uygulamasını açar ve qr dinlemesi yapar
  void scanQrCode() {
    FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.QR).then((value) {
      setState(() {
        // qr bulunursa data değişkenine atanır
        data = value;
      });
    });
  }

  // init, qr camera uygulaması başlatılır
  @override
  void initState() {
    super.initState();
    scanQrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qr Code Tarat"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // görünürlik widegeti
              // qr okunursa data ekrana bastırılır
              Visibility(visible: data != "", child: Text(data != "-1" ? data : "Qr Kode Bulunamadı" )),
              ElevatedButton(
                // yeniden taratma butonu, tıklanırsa tekrardan qr camera açılır.
                onPressed: () => scanQrCode(),
                child: const Text(" Yeniden Tara"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
