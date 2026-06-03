import java.util.concurrent.*;
public class ExecutorDemo {
    public static void main(String[] args) throws Exception{
       
            ExecutorService executor=Executors.newFixedThreadPool(3);
            Callable<Integer> t1=()->10+20;
            Callable<Integer> t2=()->30+40;
            Future<Integer> f1=executor.submit(t1);
            Future<Integer> f2=executor.submit(t2);

            System.out.println(f1.get());
            System.out.println(f2.get());
            executor.shutdown();
        
    }
}
