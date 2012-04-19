package com.projectbox;

//import android.app.Activity;
import android.os.Bundle;
import org.apache.cordova.DroidGap;

public class ProjectBoxActivity extends DroidGap {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.main);
        //super.loadUrl("file:///android_asset/www/index.html");
        //super.loadUrl("http://ec2-23-20-139-208.compute-1.amazonaws.com/");
        super.setIntegerProperty("loadUrlTimeoutValue", 60000); 
        //super.loadUrl("http://192.168.1.5:3000/mobile");
        super.loadUrl("http://ec2-23-21-28-8.compute-1.amazonaws.com/mobile");
    }
}