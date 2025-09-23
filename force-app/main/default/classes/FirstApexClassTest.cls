@isTest
public class FirstApexClassTest {

    @isTest
    public static void additionTest(){
        FirstApexClass obj = new FirstApexClass();
        Integer additionResult = obj.addition(12, 4);
        System.assertEquals(16, additionResult, 'Additoin result not matching.');
    }
    
    @isTest
    public static void devisionTest(){
        FirstApexClass obj = new FirstApexClass();
        Integer devisionResult = obj.devision(12, 4);
        System.assertEquals(3, devisionResult, 'Devision result not matching.');
    }
    
    @isTest
    public static void multiplicationTest(){
        FirstApexClass obj = new FirstApexClass();
        Integer multiplicationResult = obj.multiplication(12, 4);
        System.assertEquals(48, multiplicationResult, 'Multiplication result not matching.');
    }
    
    @isTest
    public static void subtractionTest(){
        FirstApexClass obj = new FirstApexClass();
        Integer subtractionResult = obj.subtraction(12, 4);
        System.assertEquals(8, subtractionResult, 'Subtraction result not matching.');
    }
}