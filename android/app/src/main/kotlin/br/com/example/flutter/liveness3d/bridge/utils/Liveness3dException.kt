package br.com.example.flutter.liveness3d.bridge.utils

open class Liveness3dException(val code: String, message: String) : Exception(message) {}

class InvalidAppKey(code: String = "INVALID_APP_KEY", message: String = "INVALID_APP_KEY") :
    Liveness3dException(code, message) {}
