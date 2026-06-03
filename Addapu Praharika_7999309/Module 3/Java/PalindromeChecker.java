import java.util.*;
public class PalindromeChecker {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);

        System.out.print("Enter the String: ");
        String str=sc.nextLine();
        str=str.replaceAll("[^a-zA-Z0-0]","").toLowerCase();
        String rev="";
        for(int i=str.length()-1;i>=0;i--){
            rev+=str.charAt(i);
        }
        if(rev.equals(str)){
            System.out.println(str+" is a Palindrome");
        }
        else{
            System.out.println(str+" not a Palindrome");
        }
        sc.close();
    }
}
