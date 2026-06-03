
public class MethodOverloading {
    static int add(int a, int b) {
        return a+b;
    }
    static double add(double a, double b){
        return a+b;
    } 
    static int add(int a, int b, int c){
        return a+b+c;
    }
    public static void main(String[] args){
        System.out.println("Addition of 2 Integers: "+add(5,4));
        System.out.println("Addition of 2 Doubles: "+add(6.4,2.8));
        System.out.println("Addition of 3 Integers:"+add(4,5,6));

    }
}
