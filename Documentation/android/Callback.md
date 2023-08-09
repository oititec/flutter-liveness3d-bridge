# Como Enviar para o Flutter os Responses/Callback no Android

## Passo 1: Liveness3DDelegate

Crie um grupo chamado Extensions para chamar o Delegate do SDK e retornar os resultados de erro ou de sucesso da seguinte forma:

- [Acessar arquivo de exemplo](../../android/app/src/main/kotlin/br/com/example/flutter/liveness3d/bridge/MainActivity.kt).

```kotlin
override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
    super.onActivityResult(requestCode, resultCode, data)
    when (requestCode) {
        L3_RESULT_REQUEST -> {
            when (resultCode) {
                Activity.RESULT_OK -> onLiveness3DResultSuccess(data)
                Activity.RESULT_CANCELED -> .onLiveness3DResultCancelled(data)
            }
        }
    }
}
```

## Passo 2: Crie as funçõs para tratar os retornos

- [Acessar arquivo de exemplo](../../android/app/src/main/kotlin/br/com/example/flutter/liveness3d/bridge/utils/Liveness3dActivity.kt).

```kotlin
fun onLiveness3DResultSuccess(data: Intent?) {
    val response = mapOf<String, Any?>(
        "valid" to data?.getBooleanExtra(Liveness3DActivity.PARAM_RESULT_VALID, false),
        "cause" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_CAUSE),
        "codId" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_COD_ID),
        "protocol" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_PROTOCOL),
        "blob" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_SCAN),
    )

    result?.success(response)
}

fun onLiveness3DResultCancelled(data: Intent?) {
    val errorMessage: String = data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_ERROR) ?: ""
    Log.d("TAG", errorMessage)
    result?.error(errorMessage, errorMessage, null)
}
```
