package com.lahacks.jiffi.android.main;

import android.app.AlertDialog;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Spinner;

import java.io.File;
import java.util.Hashtable;
import java.util.List;

/**
 * Created by Stan on 31/05/14.
 * Will collect all pdf paths on the phone and present them in a list
 */
public class FileExplorerActivity extends ListActivity {
    private static final String TAG = FileExplorerActivity.class.getCanonicalName();
    File node;
    List< String> pdfNames;
    List<String> pdfPaths;
    ProgressDialog dialog;
    Context c;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        c=this;
        node = Environment.getRootDirectory();
        setUpLoadingSpinner(this);
        FindAllPDF task = new FindAllPDF();
        task.execute(node);
    }

    @Override
    protected void onListItemClick(ListView l, View v, int position, long id) {
        super.onListItemClick(l, v, position, id);
        Intent intent = new Intent(this, PdfViewActivity.class);
        intent.putExtra(PdfViewActivity.EXTRA_PDFFILENAME, pdfPaths.get(position));
        startActivity(intent);
    }

    private class FindAllPDF extends AsyncTask<File, Boolean, Boolean> {

        @Override
        protected Boolean doInBackground(File... params) {
            getPDFPaths(node);
            return true;
        }

        @Override
        protected void onPostExecute(Boolean b) {
            super.onPostExecute(b);
            dialog.dismiss();
            ArrayAdapter adapter = new ArrayAdapter(c,R.layout.fileexploreritem,R.id.tv_file_item,pdfNames);
            setListAdapter(adapter);
        }
    }

    public void getPDFPaths(File node) {
        Log.d(TAG, "Visiting: " + node.getAbsolutePath());
        if (node.canRead() && node.getName().contains(".pdf")) {
            Log.d(TAG, "PDF Found: " + node.getName());
            pdfNames.add(node.getName());
            pdfPaths.add(node.getAbsolutePath());
        }
        for (File f : node.listFiles()) {
            getPDFPaths(f);
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
