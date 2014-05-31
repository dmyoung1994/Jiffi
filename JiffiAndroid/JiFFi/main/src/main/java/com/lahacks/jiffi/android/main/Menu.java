package com.lahacks.jiffi.android.main;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;

/**
 * Created by Stan on 31/05/14.
 */
public class Menu extends Activity {
    Button choosePDF, imageScanner, voiceToSpritz, savedFiles;
    Context c;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.menu);
        choosePDF = (Button) findViewById(R.id.b_chooseapdf);
        imageScanner = (Button) findViewById(R.id.b_imagescanner);
        voiceToSpritz = (Button) findViewById(R.id.b_voicetospritz);
        savedFiles = (Button) findViewById(R.id.b_savedfiles);
        c = this;
        choosePDF.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(c,FileExplorerActivity.class);
                startActivity(i);
            }
        });

        imageScanner.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(c,ImageScannerActivity.class);
                startActivity(i);
            }
        });
        voiceToSpritz.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(c,VoiceToSpritzActivity.class);
                startActivity(i);
            }
        });

        savedFiles.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(c,SavedFilesActivity.class);
                startActivity(i);
            }
        });
    }
}
