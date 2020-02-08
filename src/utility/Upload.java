package utility;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Upload {
     public static String saveFileToServer(String path, InputStream inputStream, String ext)
    {
        System.out.println(ext);
        File f = new File(path);
        if (!f.exists()) {
            f.mkdir();
        }
        if(!(ext.equalsIgnoreCase(".jpg") || ext.equalsIgnoreCase(".png")))
        {
            return "False";
        }
        String filePath=""+path + File.separator + DateTimeString.getString() + ext;
        try(FileOutputStream fos = new FileOutputStream(filePath))
        {
           int n = inputStream.read();
           while (n != -1) 
           {
              fos.write(n);
              n = inputStream.read();
           }
           inputStream.close();
           
        } catch (IOException ex) {    
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
            return "False";
        }
         return filePath;
    }
}
