import java.util.*;
public class Fibonacci {
    static int fibonacci(int n){
        if(n==0){
            return 0;
        }
        if(n==1){
            return 1;
        }
        return fibonacci(n-1)+fibonacci(n-2);
    }
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the fibonacci number: ");
        int n=sc.nextInt();
        
        System.out.println("The Fibonacci Series of"+ n +" is: "+fibonacci(n));
        
        sc.close();
    }
}
