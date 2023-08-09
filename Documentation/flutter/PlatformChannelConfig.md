# Configuração do Platform Channels

Neste projeto, vamos criar um aplicativo Flutter simples que ao clicar no botão "Iniciar Liveness 3D" iniciamos a SDK da Oiti na parte nativa e obtemos as respostas necessárias para podermos finalizar a jornada do usuário.
<br><br>

## Passo 1: Criar Pasta `bridge`

Crie uma pasta chamada de `bridge` para adicionar todos os arquivos de configuração listados abaixo.

- [Acessar pasta de exemplo](../../lib/bridge/).
  <br>

## Passo 2: MethodChannel

Para iniciar a criação da conexão com o nativo utilizamos a classe MethodChannel para criar o método chamado com seus respectivos parâmetros.

Crie um arquivo chamado `method_channel.dart` na pasta `bridge` contendo o código abaixo.

- [Acessar arquivo de exemplo](../../lib/bridge/method_channel.dart).

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import './platform_interface.dart';

class MethodChannelOitiLiveness3d extends OitiLiveness3dPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('oiti_liveness3d');

  @override
  Future startLiveness(
    String appKey,
    bool isProd,
  ) async {
    return await methodChannel.invokeMapMethod(
      'OITI.startLiveness3d',
      {
        'appkey': appKey,
        'isProd': isProd,
      },
    );
  }
}
```

<br>

## Passo 3: PlatformInterface

Este pacote de classe fornece funcionalidade comum para interfaces de plataforma, a fim de garantir a checagem de que as Futures estão implementadas corretamente.

Crie um arquivo chamado `platform_interface.dart` na pasta `bridge` contendo o código abaixo.

- [Acessar arquivo de exemplo](../../lib/bridge/platform_interface.dart).

```dart
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import './method_channel.dart';

abstract class OitiLiveness3dPlatform extends PlatformInterface {

  OitiLiveness3dPlatform() : super(token: _token);

  static final Object _token = Object();

  static OitiLiveness3dPlatform _instance = MethodChannelOitiLiveness3d();

  static OitiLiveness3dPlatform get instance => _instance;

  static set instance(OitiLiveness3dPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future startLiveness(String appKey, bool isProd) {
    throw UnimplementedError('Liveness3D() has not been implemented.');
  }
}
```

<br>

## Passo 4: Invocar a Future para iniciar o Liveness3D

Precisamos criar a classe responsável por chamar o método criado no passo 3, passando os parâmetros necessários para iniciar o SDK.

Crie um arquivo chamado `call_liveness3d.dart` na pasta `bridge` contendo o código abaixo.

- [Acessar arquivo de exemplo](../../lib/bridge/call_liveness3d.dart).

```dart
import './platform_interface.dart';

class OitiLiveness3d {
  static Future startLiveness(
    String appKey,
    bool isProd,
  ) async {
    return await OitiLiveness3dPlatform.instance.startLiveness(appKey, isProd);
  }
}

```
