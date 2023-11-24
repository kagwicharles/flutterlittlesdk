package com.craftsilicon.flutterlittlesdk

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterlittlesdkPlugin */
class FlutterlittlesdkPlugin: FlutterPlugin, MethodCallHandler {

    private val CHANNEL = "flutter.native/helper"
    private lateinit var channel: MethodChannel
    private var pref: SharedPreferences? = null
    private var userPhone: String? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        pref = this.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        userPhone = pref?.getString("customerMobile", "")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, _ ->
            if (call.method == "getLittleProduct") {
                val littleProduct: String = call.argument<String>("littleProduct").toString()
                getLittleProduct(littleProduct)
            }
        }
    }

    private fun getLittleProduct(screen: String) {
        userPhone = "254712464436";
        Log.e("User Phone", userPhone.toString())
        LittleSdk.Builder(this).LittleApiKey(Little.apiKey)
                .LittlePublicKey(Little.publicKey)
                .LittlePrivateKey(Little.privateKey)
                .inProduction(false)
                .showLogs(true)
                .GoogleApiKey(Little.google_api_key)
                .UserFirstName(Little.firstName)
                .UserLastName(Little.lastName).UserPhone(userPhone).UserWallets(JSONArray().put("Bank Account"))
                .Screen(screen)
                .ScreenTimeoutTime(Little.screenTimeout)
                .PaymentAuthorizationClass(LittlePayment::class.java)
                .init()
    }
}
