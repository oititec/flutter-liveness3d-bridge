# Tratamento de Responses/Callback

Aqui fica a seção de controle dos callbacks

## Passo 1: Importar dependências do arquivo

- [Acessar arquivo de exemplo](../../lib/main.dart).

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_liveness_bridge/bridge/call_liveness3d.dart';
```

## Passo 2: Criar Objeto de LivenessSuccessResult

- [Acessar arquivo de exemplo](../../lib/main.dart).

```dart
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
```

## Passo 3: Criar Botão com onPressed

Dentro do `onPressed` você deve iniciar uma função assíncrona utilizando a classe tipada de result criada no `passo 2` e utilizar a classe `PlatformException` para efetuar tratativas de erros vindo das plataformas nativa.

- [Acessar arquivo de exemplo](../../lib/main.dart).

```dart
try {
    await OitiLiveness3d.startLiveness(appKey, isProd)
        then((result) => _onLiveness3DSuccess(result));
} on PlatformException catch (error) {
    _onLiveness3DError(error);
} catch (error) {
    print(error);
}
```

## Passo 4: Criar Funções para Tratar os Dados de Callback

- [Acessar arquivo de exemplo](../../lib/main.dart).

```dart
_onLiveness3DSuccess(LivenessSuccessResult result) {
    setState(() {
      resultStatus = 'Success';
      resultContent =
          'Valid: ${result.valid}\nCodID: ${result.codId}\nCause: ${result.cause}\nProtocol: ${result.protocol}\nScan Result Blob: ${result.scanResultBlob}\n';
    });
}
```

- [Acessar arquivo de exemplo](../../lib/main.dart).

```dart
_onLiveness3DError(PlatformException error) {
    setState(() {
      resultStatus = 'Error';
      resultContent = 'Code: ${error.code}\nMessage: ${error.message}\n';
    });
  }
```
