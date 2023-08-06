//
//  OiLiveness3d.swift
//  Runner
//
//  Created by Gabriel Catelli Goulart on 06/08/23.
//

import UIKit
import Flutter
import FaceCaptcha

public class OitiLiveness3d: NSObject {
    func startLiveness3d(arguments rawArguments: Any?) throws {
        let arguments = rawArguments as? Dictionary<String, Any>
        
        let appKey = arguments?["appkey"] as? String ?? ""
        let isProd = arguments?["isProd"] as? Bool ?? false
        
        //Consultar a documentação sobre customização de textos
        let liveness3DTexts: [Liveness3DTextKey: String] = [
            .readyHeader1: "Prepare o seu",
            .readyHeader2: "reconhecimento facial",
        ]
        
        //Consultar a documentação sobre Guia de Uso e Integração
        let user = Liveness3DUser(
            appKey: appKey,
            environment: isProd == true ? Environment.PRD : Environment.HML,
            texts: liveness3DTexts
        )
        
        let viewController = Liveness3DViewController(
            liveness3DUser: user,
            delegate: self
        )
        
        viewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
}
