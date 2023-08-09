# Configuração do FlutterEngine e MethodChannel no iOS

## Passo 1: Importe os Pods

- [Acessar arquivo de exemplo](../../ios/Runner/AppDelegate.swift).

```swift
import UIKit
import Flutter
import FaceCaptcha
```

## Passo 2: Result

Adicione logo no inicio da classe AppDelegate o FlutterResult para controle de callbacks

```swift
var flutterResult: FlutterResult? = nil
```

## Passo 3: configureFlutterEngine()

No arquivo `AppDelegate.swift` na pasta `ios/Renner`, adicione a função `configureFlutterEngine()` do FlutterAppDelegate dentro da func application():

- [Acessar arquivo de exemplo](../../ios/Runner/AppDelegate.swift).

```swift
let controller = (window?.rootViewController as! FlutterViewController)
let methodChannel =
    FlutterMethodChannel(name: "oiti_liveness3d", binaryMessenger: controller.binaryMessenger)
        methodChannel
            .setMethodCallHandler({ [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                self?.flutterResult = result
                switch call.method {
                case "OITI.startLiveness3d":
                    self?.startLiveness3d(arguments: call.arguments)
                default:
                    result(FlutterMethodNotImplemented)
                }
            })
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
```

## Passo 4:

Ainda no mesmo arquivo você deve iniciar a função startLiveness3d criada no `passo 3` dentro da classe FlutterMethodChannel.

- [Acessar arquivo de exemplo](../../ios/Runner/AppDelegate.swift).

```swift
func startLiveness3d(arguments rawArguments: Any?) {
        let arguments = rawArguments as? Dictionary<String, Any>

        let appKey = arguments?["appkey"] as? String ?? ""
        let isProd = arguments?["isProd"] as? Bool ?? false

        let liveness3DTexts: [Liveness3DTextKey: String] = [
            .readyHeader1: "Prepare o seu",
            .readyHeader2: "reconhecimento facial",
        ]

        let user = Liveness3DUser(
            appKey: appKey,
            environment: isProd == true ? .PRD : .HML,
            texts: liveness3DTexts
        )

        let viewController = Liveness3DViewController(
            liveness3DUser: user,
            delegate: self
        )

        viewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)

    }
```
