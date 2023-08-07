package com.example.flutter_liveness_bridge.utils

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.activity.result.ActivityResultLauncher
import androidx.annotation.NonNull
import br.com.oiti.liveness3d.app.ui.Liveness3DActivity
import br.com.oiti.liveness3d.data.model.ENVIRONMENT3D
import br.com.oiti.liveness3d.data.model.Liveness3DTextKey
import br.com.oiti.liveness3d.data.model.Liveness3DUser
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry

class Liveness3dActivity(var result: MethodChannel.Result): ActivityAware, PluginRegistry.ActivityResultListener {

    private lateinit var context: Context

    private var activity: Activity? = null;

    companion object {
        private const val L3_RESULT_REQUEST = 9564
    }



    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }
    override fun onDetachedFromActivity() {
        activity = null
    }
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }
    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    fun startLiveness3d(appKey: String?, isProd: Boolean?) {
        try {
            val user = getUser(appKey,isProd)
            val endpoint = when(user.environment) {
                ENVIRONMENT3D.PRD -> "https://certiface.com.br"
                ENVIRONMENT3D.HML -> "https://comercial.certiface.com.br"
                else -> "https://comercial.certiface.com.br"
            }
            val texts = hashMapOf<Liveness3DTextKey, String>(
                Liveness3DTextKey.READY_HEADER_1 to "Prepare-se para seu",
                Liveness3DTextKey.READY_HEADER_2 to "reconhecimento facial.",
                Liveness3DTextKey.READY_MESSAGE_1 to "Posicione o seu rosto na moldura, aproxime-se",
                Liveness3DTextKey.READY_MESSAGE_2 to "e toque em começar.",
                Liveness3DTextKey.READY_BUTTON to "Começar",
            )
            val intent = Intent(context, Liveness3DActivity::class.java).apply {
                putExtra(Liveness3DActivity.PARAM_ENDPOINT, endpoint)
                putExtra(Liveness3DActivity.PARAM_LIVENESS3D_USER, user)
                putExtra(Liveness3DActivity.PARAM_DEBUG_ON, false)
                putExtra(Liveness3DActivity.PARAM_TEXTS, texts)
            }
            activity?.startActivityForResult(intent, L3_RESULT_REQUEST)
        } catch (e: Liveness3dException) {
            result?.error(e.code, e.message, null)
        } catch (e: Exception) {
            result?.error("UNKNOWN_ERROR", e.message, e.stackTrace)
        }
    }

    private fun getUser(appKey: String?, isProd: Boolean?): Liveness3DUser {
        val env: ENVIRONMENT3D = if (isProd == true) ENVIRONMENT3D.PRD else ENVIRONMENT3D.HML

        return Liveness3DUser(
            appKey = appKey!!,
            environment = env
        )
    }


    private fun onLiveness3DResultSuccess(data: Intent?) {
        val response = mapOf<String, Any?>(
            "valid" to data?.getBooleanExtra(Liveness3DActivity.PARAM_RESULT_VALID, false),
            "cause" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_CAUSE),
            "codId" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_COD_ID),
            "protocol" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_PROTOCOL),
            "blob" to data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_SCAN),
        )

        result?.success(response)
    }

    private fun onLiveness3DResultCancelled(data: Intent?) {
        val errorMessage: String = data?.getStringExtra(Liveness3DActivity.PARAM_RESULT_ERROR) ?: ""
        Log.d("TAG", errorMessage)
        result?.error(errorMessage, errorMessage, null)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == L3_RESULT_REQUEST) {
            when(resultCode) {
                Activity.RESULT_OK -> onLiveness3DResultSuccess(data)
                Activity.RESULT_CANCELED -> onLiveness3DResultCancelled(data)
            }
            return true
        }
        return false
    }
}
