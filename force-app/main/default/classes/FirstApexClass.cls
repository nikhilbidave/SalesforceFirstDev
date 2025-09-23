public class FirstApexClass{

    public FirstApexClass(){
        System.debug('First Constructor Statement');
    }

    public void firstMethod(){
        System.debug('Hello World!');
    }
    
    @InvocableMethod
    public static void firstAnnotationMenthod(){
        System.debug('Called From Process Builder.');
    }
    
    public Integer addition(Integer number1, Integer number2){
        return number1 + number2;
    }
    
    public Integer multiplication(Integer number1, Integer number2){
        return number1 * number2;
    }
    
    public Integer devision(Integer number1, Integer number2){
        return number1 / number2;
    }
    
    public Integer subtraction(Integer number1, Integer number2){
        return number1 - number2;
    }
}