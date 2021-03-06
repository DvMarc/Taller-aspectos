import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect logger {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut transaction() : call(* moneyMake*(..));
    after() : transaction() {
        try {
        	FileWriter data = new FileWriter(file.getPath(), true);
        	try {
				data.write("**** Transaction Complete **** "+ Calendar.getInstance().getTime()+"\n");
			} catch (Exception e) {
				e.printStackTrace();
			}
        	data.close();
        }catch(IOException e){
        	e.printStackTrace();
        }
    	System.out.println("**** Transaction Complete **** "+ Calendar.getInstance().getTime());
    }
    
    pointcut withdraw() : call(* moneyWith*(..));
    after() : withdraw() {
        try {
        	FileWriter data = new FileWriter(file.getPath(), true);
        	try {
				data.write("**** Withdraw Complete **** "+ Calendar.getInstance().getTime()+"\n");
			} catch (Exception e) {
				e.printStackTrace();
			}
        	data.close();
        }catch(IOException e){
        	e.printStackTrace();
        }
    	System.out.println("**** Withdraw Complete **** "+ Calendar.getInstance().getTime());
    }
}
