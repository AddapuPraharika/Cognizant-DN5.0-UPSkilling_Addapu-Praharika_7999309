import java.util.*;
public class HashMapExample {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);

        HashMap<Integer,String> students=new HashMap<>();
        System.out.println("How many Students ?");
        int n=sc.nextInt();

        sc.nextLine();

        for(int i=0;i<n;i++){
            System.out.print("Enter the ID: ");
            int id=sc.nextInt();
            sc.nextLine();

            System.out.println("Enter Name: ");
            String name=sc.nextLine();
            students.put(id,name);
        }
        System.out.print("Enter ID to search: ");
        int searchid=sc.nextInt();

        if(students.containsKey(searchid)){
            System.out.println("Student Name: "+students.get(searchid));

        }
        else{
            System.out.println("ID not found.");
        }
        sc.close();
    }
}
