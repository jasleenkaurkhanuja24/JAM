package com.mycompany.youtubee.helper;

import java.io.FileOutputStream;
import java.io.InputStream;

public class savefile 
{
    public boolean savingfile(InputStream is, String path)
    {
        boolean status = false;
        try
        {
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            
            fos.write(b);
            fos.flush();
            fos.close();
            
            status = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return status;
    }
}
