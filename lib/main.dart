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

  var appKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiNjAzQTg5MDBCMDQ0MzA0MDJCODczMzlEQzVERkM2M0IwfG1vYmlsZS5hcGlnbG9iYWwiLCJlbXBDb2QiOiIwMDAwMDAwNjc5IiwiZmlsQ29kIjoiMDAwMDAwMjc3NCIsImNwZiI6IjAwODAxMzkzMTA4Iiwibm9tZSI6IjY2NjMwNjkyRDYyRDA5RjhBMjU1RTQ2MTJBMzBDMUIzQzlFNTAyMzMwQ0UyMDA4MUNFNUI3MUU0MEREMDkwMEU2MzNGODZGMkZGMTc4QTQwNEI1Q0YwMzdCOTNCMjc5NzFGMUQxODNDRTk3RTMwMTMwMDM0RjZEOUVENzlBOUU3MTg1NEExMkR8SU9TIERFVkVMT1BFUiIsIm5hc2NpbWVudG8iOiIwMy8wNy8yMDAxIiwiZWFzeS1pbmRleCI6IkFBQUFFcWRhcDh3SFljQ211MEM1eFEvRkkzd2VYWmV3ZUNFdlBEc2pZOWg0M09nSXZSMmg0d3VQNGU5YTNnPT0iLCJrZXkiOiJRV0pzWlNCaGJpQm9iM0JsSUc5bUlHSnZaSGt1SUVGdWVTQnVZWGtnYzJoNWJtVT0iLCJleHAiOjE2OTE3Nzg2NjIsImlhdCI6MTY5MTc3ODM2Mn0.vHpZjorNC7bH0y27m_BlxSAkdMqL6PbSjqfbqFfuQM4';
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
                    await OitiLiveness3d.startLiveness3d(appKey, isProd)
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

//TextField para adicionar a App Key gerada no backend do cliente Oiti.
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
        onChanged: (value) => _pasteAppKey(),
      ),
    );
  }

  _pasteAppKey() {
    setState(() => appKey = _controller.text);
  }

  _onLiveness3DSuccess(LivenessSuccessResult result) {
    print(result.toString());
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
