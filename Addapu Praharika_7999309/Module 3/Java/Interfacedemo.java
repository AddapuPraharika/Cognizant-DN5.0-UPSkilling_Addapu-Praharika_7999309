interface playable{
    void play();
}
class Guitar implements playable{
    public void play(){
    System.out.println("playing Guitar");
    }
}
class Piano implements playable{
    public void play(){
        System.out.println("playing Piano");
    }
}
public class Interfacedemo {
    public static void main(String[] args) {
        Guitar g=new Guitar();
        Piano p=new Piano();

        g.play();
        p.play();
    }
}
