import java.io.*;
public class FileReading {
    public static void main(String[] args){
        try{
            BufferedReader reader=new BufferedReader(new FileReader("output.txt"));
            String line;
            while((line=reader.readLine())!=null){
                System.out.println(line);
            }
            reader.close();
        }catch(IOException e){
            System.out.println("Error reading file..");
        }
    }
}
