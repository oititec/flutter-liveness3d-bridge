package com.example.flutter_liveness_bridge

import androidx.annotation.NonNull
import com.example.flutter_liveness_bridge.utils.Liveness3dActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result

class MainActivity: FlutterActivity() {

    private val CHANNEL = "oiti_liveness3d"
    private lateinit var result: Result
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            this.result = result
            if (call.method == "OITI.startLiveness3d") {
                val appkey: String? = call.argument("user");
                val isProd: Boolean? = call.argument("isProd");
                Liveness3dActivity(result).startLiveness3d(appkey, isProd)
            } else {
                result.notImplemented()
            }
        }
    }
}
