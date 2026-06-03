import java.util.*;
public class NumberGuessingGame {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        int randomNumber=(int)(Math.random()*100)+1;
        int guess;
        System.out.println("Guess the number between 1 and 100:");
       do{
        System.out.println("Enter your guess: ");
        guess=sc.nextInt();
        if(guess>randomNumber){
            System.out.println("Too high! Try again");
        }
        else if(guess<randomNumber){
            System.out.println("Too low! Try again");
        }
       }while(guess!=randomNumber);
       System.out.println("Congratulations! You guessed the number "+randomNumber);
       sc.close();
    }
}
