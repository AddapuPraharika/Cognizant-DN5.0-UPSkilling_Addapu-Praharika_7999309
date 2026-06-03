import java.util.*;
public class ArraySumandAverage {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of Array: ");
        int n=sc.nextInt();
        
        int arr[]=new int[n];
        System.out.println("Enter the Array Elements: ");
        int sum =0;
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
            sum+=arr[i];
        }
        System.out.println("The sum of the Array Elements: "+sum);
        int average=(sum)/n;
        System.out.println("The average of the given array: "+average);
        sc.close();
    }
}
