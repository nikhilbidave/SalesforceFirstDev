public class AccountController {
    public AccountController() {

    }

    public static List<Account> insertAccounts(list<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }

    public static Account insertAccount(Account accountToInsert) {
        insert accountToInsert;
        return accountToInsert;
    }

    public static List<Account> getAccounts() {
        List<Account> accounts = [Select Name, Phone From Account];
        return accounts;
    }

    public static void printAccount() {
        List<Account> accounts = getAccounts();
        for (Account acc : accounts) {
            System.debug('Account Name: ' + acc.Name + ', Phone: ' + acc.Phone);
        }
    }

    public static Integer getAccountSize() {
        return getAccounts().size();
    }
}