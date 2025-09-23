@isTest
public class AccountControllerTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i, Phone = '123456789' + i));
        }
        insert accounts;
    }

    @isTest
    static void testInsertAccounts() {
        List<Account> newAccounts = new List<Account>{
            new Account(Name = 'Inserted Account 1', Phone = '1111111111'),
            new Account(Name = 'Inserted Account 2', Phone = '2222222222')
        };
        Test.startTest();
        List<Account> inserted = AccountController.insertAccounts(newAccounts);
        Test.stopTest();
        System.assertEquals(2, inserted.size());
        for (Account acc : inserted) {
            System.assertNotEquals(null, acc.Id);
        }
    }

    @isTest
    static void testInsertAccount() {
        Account acc = new Account(Name = 'Single Insert', Phone = '3333333333');
        Test.startTest();
        Account inserted = AccountController.insertAccount(acc);
        Test.stopTest();
        System.assertNotEquals(null, inserted.Id);
        System.assertEquals('Single Insert', inserted.Name);
    }

    @isTest
    static void testGetAccounts() {
        Test.startTest();
        List<Account> accounts = AccountController.getAccounts();
        Test.stopTest();
        System.assert(accounts.size() >= 3, 'Should return at least 3 accounts from testSetup');
    }

    @isTest
    static void testPrintAccount() {
        // Just ensure no exceptions are thrown
        Test.startTest();
        AccountController.printAccount();
        Test.stopTest();
    }

    @isTest
    static void testGetAccountSize() {
        Test.startTest();
        Integer size = AccountController.getAccountSize();
        Test.stopTest();
        System.assertEquals(AccountController.getAccounts().size(), size);
    }
}