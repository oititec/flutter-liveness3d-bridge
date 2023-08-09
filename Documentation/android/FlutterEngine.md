# Configuração do FlutterEngine e MethodChannel no Android

## Passo 1: Result

Adicione logo no inicio da classe `MainActivity` o `FlutterResult` para controle de callbacks

- [Acessar arquivo de exemplo](../../android/app/src/main/kotlin/br/com/example/flutter/liveness3d/bridge/MainActivity.kt).

```kotlin
private var resultFlutter: Result? = null
```

## Passo 2: configureFlutterEngine()

No arquivo `MainActivity.kt`, adicione a função `configureFlutterEngine()` do FlutterActivity para chamar o método correto.

- [Acessar arquivo de exemplo](../../android/app/src/main/kotlin/br/com/example/flutter/liveness3d/bridge/MainActivity.kt).

```kotlin
private val CHANNEL = "oiti_liveness3d"

override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
        resultFlutter = result
        if (call.method == "OITI.startLiveness3d") {
            val appKey: String? = call.argument("appkey");
            val isProd: Boolean? = call.argument("isProd");
            startLiveness3d(appKey, isProd)
        } else {
            result.notImplemented()
        }
    }
}
```

## Passo 3:

Ainda no mesmo arquivo você deve iniciar a função que chamamos na classe MethodChannel criada no `passo 2`.

- [Acessar arquivo de exemplo](../../android/app/src/main/kotlin/br/com/example/flutter/liveness3d/bridge/MainActivity.kt).

```kotlin
fun startLiveness3d(appKey: String?, isProd: Boolean?) {
    try {
        manager = Liveness3dActivity(context, resultFlutter, appKey, isProd)
        val intent = manager?.getIntent()
        activity.startActivityForResult(intent, L3_RESULT_REQUEST)
    } catch (e: Liveness3dException) {
        resultFlutter?.error(e.code, e.message, null)
    } catch (e: Exception) {
        resultFlutter?.error("UNKNOWN_ERROR", e.message, e.stackTrace)
    }
}
```
