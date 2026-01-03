package com.example.report_generation_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.google.android.gms.common.GoogleApiAvailability

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        GoogleApiAvailability.getInstance()
            .isGooglePlayServicesAvailable(this)
    }
}