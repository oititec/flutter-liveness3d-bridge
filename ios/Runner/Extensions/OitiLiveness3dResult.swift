//
//  OitiLiveness3dPlugin+Liveness3DDelegate.swift
//  Runner
//
//  Created by Gabriel Catelli Goulart on 06/08/23.
//

import Foundation
import Flutter
import FaceCaptcha


extension AppDelegate: Liveness3DDelegate {
    public func handleLiveness3DValidation(validateModel: Liveness3DSuccess) {
        let response: Dictionary<String, Any> = [
            "cause": validateModel.cause ?? "",
            "codId": String(validateModel.codID ?? 0.0),
            "protocol": validateModel.protocolo ?? "",
            "blob": validateModel.scanResultBlob ?? "",
            "valid": validateModel.valid ?? false
        ]
        
        flutterResult?(response)
    }
    
    public func handleLiveness3DError(error: Liveness3DError) {
        finishChannel(error: error, result: flutterResult)
    }
    
    func finishChannel(error: Liveness3DError, result: FlutterResult?) {
        let flutterError = FlutterError(
            code: String(error.code),
            message: error.message,
            details: nil
        )
        result?(flutterError)
    }
    
}
