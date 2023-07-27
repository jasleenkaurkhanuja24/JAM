
package com.mycompany.youtubee.helper;

import java.io.File;

public class deletefile 
{
    public boolean deletingfile(String path)
    {
        boolean status = false;
        try{
            File file = new File(path);
            status = file.delete();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return status;
    }
}
