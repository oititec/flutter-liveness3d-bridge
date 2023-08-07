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
  var appKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiOTMyNzcwMTVBMjEyODUyMTMzQjk1NDUyNjA2NDQzRDY5fG1vYmlsZS5hcGlnbG9iYWwiLCJlbXBDb2QiOiIwMDAwMDAwNjc5IiwiZmlsQ29kIjoiMDAwMDAwMjc3NCIsImNwZiI6IjU0MjczOTY2MDg1Iiwibm9tZSI6IjFGNUZGRDcxQkQ1QTFBMDJBREVCOTg3M0JDNkUxMjg3MkM4RURBMjM2MzE5REMwNTUzQ0MxREJCNkE4RTZBOTA5MjU4OTMyODVFQTEwRjcwODJEODc3NUFCREZFNDUzMENCQ0M3NkM2MTU1RUFEMzRDRTk4QjdDNTcwNDIyOTZGfEFTSEFVQVMgQVNVSEFTSFUgQVNVSCIsIm5hc2NpbWVudG8iOiIwOC8xMC8xOTkxIiwiZWFzeS1pbmRleCI6IkFBQUFFcU1adjdmNXJhUFVMMU1qaGVjb2lKTERLK2VOL3V5dFBjaHJKTW9CbGl3alJSVnAxNks2eHNCYXN3PT0iLCJrZXkiOiJRV0pzWlNCaGJpQm9iM0JsSUc5bUlHSnZaSGt1SUVGdWVTQnVZWGtnYzJoNWJtVT0iLCJleHAiOjE2OTEzMjExNDMsImlhdCI6MTY5MTMyMDg0M30.B3cfoUgQdSLyqj6R3Z-OvjHoBjzMomWrRdhUiHUefZs';
  var isProd = false;

  var resultStatus = 'Jornada liveness não iniciada.';
  var resultContent =
      'Valid:  \nCodID: \nCause: \nProtocol: \nScan Result Blob: \n';

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
          ],
        )),
      ),
    );
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
