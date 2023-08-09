# Como Enviar para o Flutter os Responses/Callback no iOS

## Passo 1: Liveness3DDelegate

Crie um grupo chamado Extensions para chamar o Delegate do SDK e retornar os resultados de erro ou de sucesso da seguinte forma:

- [Acessar arquivo de exemplo](../../ios/Runner/Extensions/OitiLiveness3dResult.swift).

```swift
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
```
