package br.com.example.flutter.liveness3d.bridge

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import br.com.example.flutter.liveness3d.bridge.utils.Liveness3dActivity
import br.com.example.flutter.liveness3d.bridge.utils.Liveness3dException
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result


class MainActivity: FlutterActivity() {

    companion object {
        private const val L3_RESULT_REQUEST = 9564
    }

    private var resultFlutter: Result? = null
    private var manager: Liveness3dActivity? = null

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

    fun startLiveness3d(appKey: String?, isProd: Boolean?) {
        try {
            manager = Liveness3dActivity(context, resultFlutter, appKey, isProd)
            val intent = manager?.getIntent()
            activity?.startActivityForResult(intent, L3_RESULT_REQUEST)
        } catch (e: Liveness3dException) {
            resultFlutter?.error(e.code, e.message, null)
        } catch (e: Exception) {
            resultFlutter?.error("UNKNOWN_ERROR", e.message, e.stackTrace)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            L3_RESULT_REQUEST -> {
                when (resultCode) {
                    Activity.RESULT_OK -> manager?.onLiveness3DResultSuccess(data)
                    Activity.RESULT_CANCELED -> manager?.onLiveness3DResultCancelled(data)
                }
            }
        }
    }

}
