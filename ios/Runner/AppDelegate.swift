import UIKit
import Flutter
import FaceCaptcha

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterResult: FlutterResult? = nil

    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        //Registra o MethodChannel chamado "oiti_liveness3d"
        let controller = (window?.rootViewController as! FlutterViewController)
        let methodChannel =
        FlutterMethodChannel(name: "oiti_liveness3d", binaryMessenger: controller.binaryMessenger)
        methodChannel
            .setMethodCallHandler({ [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
               
                switch call.method {
                case "OITI.startLiveness3d":
                    self?.flutterResult = result
                    self?.startLiveness3d(arguments: call.arguments)
                default:
                    // 4
                    result(FlutterMethodNotImplemented)
                }
            })
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func startLiveness3d(arguments rawArguments: Any?) {
        let arguments = rawArguments as? Dictionary<String, Any>
        
        let appKey = arguments?["appkey"] as? String ?? ""
        let isProd = arguments?["isProd"] as? Bool ?? false
        
        //Consultar a documentação sobre Customização de Textos
        // https://devcenter.certiface.io/docs/customizacao-liveness3d-ios#customiza%C3%A7%C3%A3o-das-telas-de-textos
        let liveness3DTexts: [Liveness3DTextKey: String] = [
            .readyHeader1: "Prepare o seu",
            .readyHeader2: "reconhecimento facial",
        ]
        
        //Consultar a documentação sobre Guia de Uso e Integração
        // https://devcenter.certiface.io/docs/guia-de-uso-e-integracao-ios
        let user = Liveness3DUser(
            appKey: appKey,
            environment: isProd == true ? .PRD : .HML,
            texts: liveness3DTexts
        )
        
        let viewController = Liveness3DViewController(
            liveness3DUser: user,
            delegate: self,
            customInstructionView: InstructionCustomView() as? CustomInstructionView,
            customPermissionView: PermissionCustomView() as? CustomCameraPermissionView
        )
        
        viewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
        
    }
}
