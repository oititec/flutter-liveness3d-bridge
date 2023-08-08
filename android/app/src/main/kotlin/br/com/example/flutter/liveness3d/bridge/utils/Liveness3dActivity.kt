package br.com.example.flutter.liveness3d.bridge.utils

import android.content.Context
import android.content.Intent
import android.util.Log
import br.com.oiti.liveness3d.app.ui.HybridLiveness3DActivity
import br.com.oiti.liveness3d.app.ui.Liveness3DActivity
import br.com.oiti.liveness3d.data.model.ENVIRONMENT3D
import br.com.oiti.liveness3d.data.model.Liveness3DUser
import io.flutter.plugin.common.MethodChannel

class Liveness3dActivity(
    private var context: Context,
    private val result: MethodChannel.Result?,
    private val appKey: String?,
    private val isProd: Boolean?,
) {

    private fun getUser(): Liveness3DUser {
        val env: ENVIRONMENT3D = if (isProd == true) ENVIRONMENT3D.PRD else ENVIRONMENT3D.HML

        return Liveness3DUser(
            appKey = appKey!!,
            environment = env
        )
    }

    fun getIntent(): Intent {
        if (appKey.isNullOrBlank()) {
            throw InvalidAppKey()
        }

        val user = getUser()
        val endpoint = when(user.environment) {
            ENVIRONMENT3D.PRD -> "https://certiface.com.br"
            ENVIRONMENT3D.HML -> "https://comercial.certiface.com.br"
            else -> "https://comercial.certiface.com.br"
        }

        return Intent(context, Liveness3DActivity::class.java).apply {
            putExtra(Liveness3DActivity.PARAM_ENDPOINT, endpoint)
            putExtra(Liveness3DActivity.PARAM_LIVENESS3D_USER, user)
            putExtra(Liveness3DActivity.PARAM_DEBUG_ON, true)
        }
    }

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
        val errorMessage: String = data?.getStringExtra(HybridLiveness3DActivity.PARAM_RESULT_ERROR) ?: ""
        Log.d("TAG", errorMessage)
        result?.error(errorMessage, errorMessage, null)
    }

}
