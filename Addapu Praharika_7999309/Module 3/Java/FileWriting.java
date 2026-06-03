import java.util.*;
import java.io.*;

public class FileWriting {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a string: ");
        String text = sc.nextLine();

        try {

            FileWriter writer = new FileWriter("output.txt");

            writer.write(text);
            writer.close();
            System.out.println("Data written successfully.");

        } catch (IOException e) {
            System.out.println("Error writing file.");
        }

        sc.close();
    }
}