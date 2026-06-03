import java.util.*;
import java.util.stream.*;

record Person(String name, int age) {}

public class RecordDemo {
    public static void main(String[] args) {

        List<Person> people = List.of(
            new Person("Ravi", 25),
            new Person("Anil", 17),
            new Person("Kiran", 30)
        );

        people.forEach(System.out::println);

        System.out.println("\nAdults:");

        people.stream().filter(p -> p.age() >= 18).forEach(System.out::println);
    }
}