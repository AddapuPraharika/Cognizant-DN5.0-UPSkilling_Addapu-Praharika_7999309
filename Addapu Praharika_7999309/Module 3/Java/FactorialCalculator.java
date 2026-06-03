import java.util.*;
public class FactorialCalculator {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the number: ");
        int n=sc.nextInt();
        System.out.println("The Factorial of number "+n);
        int fact=1;
        for(int i=1;i<=n;i++){
            fact*=i;
        }
        System.out.println(fact);
        sc.close();
    }
}
