import java.util.*;
public class TryCatchDemo {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the first number: ");
        int a=sc.nextInt();
        System.out.println("Enter the second number: ");
        int b=sc.nextInt();

        try{
            int res=a/b;
            System.out.println("Result: "+res);
        }
        catch(ArithmeticException e){
            System.out.println("Cannot not be divisible by zero!!");
        }
        sc.close();
    }
}
