import java.util.*;
public class ArrayListExamples {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        ArrayList<String> students=new ArrayList<>();
        System.out.println("How many students?");
        int n=sc.nextInt();
        sc.nextLine();

        for(int i=0;i<n;i++){
            System.out.println("Enter name: ");
            students.add(sc.nextLine());
        }
        System.out.println("Students names: ");
        for(String name:students){
            System.out.println(name);
        }
        sc.close();
    }
}
