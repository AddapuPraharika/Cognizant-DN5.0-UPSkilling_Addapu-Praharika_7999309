class Car{

    //attributes
    String make;
    String model;
    int year;
    
    //method
    void displaDetails(){
        System.out.println("make: "+make);
        System.out.println("model: "+model);
        System.out.println("year: "+year);
    }
}
public class CarDemo {
    public static void main(String[] args){
       Car car1=new Car();
       car1.make="Toyota";
       car1.model="carmer";
       car1.year=2024;

       car1.displaDetails();
    }
}
