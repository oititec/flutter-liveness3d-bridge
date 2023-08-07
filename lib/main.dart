import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_liveness_bridge/bridge/call_liveness3d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;

  var appKey = '';
  var isProd = false;

  var resultStatus = 'Jornada liveness não iniciada.';
  var resultContent =
      'Valid:  \nCodID: \nCause: \nProtocol: \nScan Result Blob: \n';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 150, bottom: 5),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await OitiLiveness3d.startLiveness(appKey, isProd)
                        .then((result) => _onLiveness3DSuccess(result));
                  } on PlatformException catch (error) {
                    _onLiveness3DError(error);
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text("Iniciar Livenees 3D"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Status: $resultStatus'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(resultContent),
            ),
            appKeySection(),
          ],
        )),
      ),
    );
  }

  Widget appKeySection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 45),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'App Key',
        ),
        obscureText: false,
        controller: _controller,
        onSubmitted: (value) => _pasteAppKey(),
      ),
    );
  }

  _pasteAppKey() {
    setState(() => appKey = _controller.text);
    _controller.text = '';
  }

  _onLiveness3DSuccess(LivenessSuccessResult result) {
    setState(() {
      resultStatus = 'Success';
      resultContent =
          'Valid: ${result.valid}\nCodID: ${result.codId}\nCause: ${result.cause}\nProtocol: ${result.protocol}\nScan Result Blob: ${result.scanResultBlob}\n';
    });
  }

  _onLiveness3DError(PlatformException error) {
    setState(() {
      resultStatus = 'Error';
      resultContent = 'Code: ${error.code}\nMessage: ${error.message}\n';
    });
  }
}

class LivenessSuccessResult {
  final bool valid;
  final String cause;
  final String codId;
  final String protocol;
  final String scanResultBlob;

  LivenessSuccessResult(
    this.valid,
    this.cause,
    this.codId,
    this.protocol,
    this.scanResultBlob,
  );
}
