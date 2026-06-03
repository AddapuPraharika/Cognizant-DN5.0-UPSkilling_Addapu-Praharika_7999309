import java.util.*;
public class SimpleCalculator {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the value of a: ");
        double  a=sc.nextDouble();

        System.out.println("Enter the value of b: ");
        double b=sc.nextDouble();

       
        System.out.println("1. Addition");
        System.out.println("2. Subtraction");
        System.out.println("3. Multiplication");
        System.out.println("4. Division");

        System.out.println("Enter the operation: ");
        int operation=sc.nextInt();
        switch(operation){
            case 1:
                System.out.println("Addition is: "+(a+b));
                break;
            case 2:
                System.out.println("Substraction is "+(a-b));
                break;
            case 3:
                System.out.println("Multiplication is: "+(a*b));
                break;
            case 4:
                System.out.println("Division is: "+(a/b));
                break;
            default:
                System.out.println("Invalid Choice...");
        }
        sc.close();

    }
}
