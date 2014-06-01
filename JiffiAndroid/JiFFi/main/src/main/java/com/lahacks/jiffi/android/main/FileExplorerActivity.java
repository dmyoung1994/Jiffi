package com.lahacks.jiffi.android.main;

import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.io.File;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Stan on 31/05/14.
 * Will collect all pdf paths on the phone and present them in a list
 */
public class FileExplorerActivity extends ListActivity {
    private static final String TAG = FileExplorerActivity.class.getCanonicalName();
    File dataDirectory, downloadDirectory, externalStorage;
    ArrayList<String> pdfNames;
    ArrayList<String> pdfPaths;
    ProgressDialog dialog;
    TextView status;
    Context c;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fileexplorer);
        c = this;
        dataDirectory = Environment.getDataDirectory();
        downloadDirectory = Environment.getDownloadCacheDirectory();
        pdfNames = new ArrayList<String>();
        pdfPaths = new ArrayList<String>();
        String extState = Environment.getExternalStorageState();
        //you may also want to add (...|| Environment.MEDIA_MOUNTED_READ_ONLY)
//if you are only interested in reading the filesystem
        if (extState.equals(Environment.MEDIA_MOUNTED)) {
            externalStorage = Environment.getExternalStorageDirectory();
        }
        status = (TextView) findViewById(R.id.tv_currentPath);
        FindAllPDF task = new FindAllPDF();
        task.execute();
    }

    @Override
    protected void onListItemClick(ListView l, View v, int position, long id) {
        super.onListItemClick(l, v, position, id);
        Intent intent = new Intent(this, PdfViewActivity.class);
        intent.putExtra(PdfViewActivity.EXTRA_PDFFILENAME, pdfPaths.get(position));
        startActivity(intent);
    }

    private class FindAllPDF extends AsyncTask<Void, Boolean, Boolean> {


        @Override
        protected Boolean doInBackground(Void... params) {

            if (dataDirectory != null) {
                getPDFPaths(dataDirectory);
            }
            if (downloadDirectory != null) {
                getPDFPaths(downloadDirectory);
            }
            if (externalStorage != null) {
                getPDFPaths(externalStorage);
            }
            return true;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            setUpLoadingSpinner(c);
            dataDirectory = Environment.getDataDirectory();
            downloadDirectory = Environment.getDownloadCacheDirectory();
            externalStorage = Environment.getExternalStorageDirectory();
        }

        @Override
        protected void onPostExecute(Boolean b) {
            super.onPostExecute(b);
            dialog.dismiss();
            if (pdfNames != null && pdfNames.size() > 0) {
                ArrayAdapter adapter = new ArrayAdapter(c, R.layout.fileexploreritem, R.id.tv_file_item, pdfNames);
                setListAdapter(adapter);
            } else {
                status.setText("You have no PDF files to read!");
            }
        }
    }

    public void getPDFPaths(File node) {
        if (node != null) {
            Log.d(TAG, "Visiting: " + node.getAbsolutePath());
            if (node.canRead() && node.getName().contains(".pdf")) {
                Log.d(TAG, "PDF Found: " + node.getName());
                pdfNames.add(node.getName());
                pdfPaths.add(node.getAbsolutePath());
            }
            if (node.listFiles() != null) {
                for (File f : node.listFiles()) {
                    getPDFPaths(f);
                }
            }
        }
    }

    public void setUpLoadingSpinner(Context context) {
        if (dialog == null) {
            dialog = new ProgressDialog(context);
        }
        dialog.setIndeterminate(true);
        dialog.setTitle("One Moment Please!");
        dialog.setMessage("Retrieving your PDF's...");
        dialog.show();
    }
}
