import java.util.*;
public class LambdaExample {
    public static void main(String[] args) {
        List<String> names=Arrays.asList("Ravi", "Anil", "Kiran", "Bhanu");
        Collections.sort(names,(a,b)->a.compareTo(b));
        System.out.println(names);
    }
}
