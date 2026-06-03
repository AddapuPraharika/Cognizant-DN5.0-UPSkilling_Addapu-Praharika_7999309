import java.io.*;
import java.net.*;

public class Server {

    public static void main(String[] args) {

        try {

            ServerSocket serverSocket =new ServerSocket(5000);

            System.out.println("Server is waiting...");

            Socket socket =serverSocket.accept();

            System.out.println("Client Connected!");

            BufferedReader in =new BufferedReader(new InputStreamReader(socket.getInputStream()));

            PrintWriter out =new PrintWriter(socket.getOutputStream(),true);

            String message =in.readLine();

            System.out.println("Client: " + message);

            out.println("Hello Client!");

            socket.close();
            serverSocket.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}