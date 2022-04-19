public with sharing class DataLord {
    public DataLord() {

    }

    public Integer NumAccounts() {
        Integer num_accounts = [SELECT COUNT() FROM Account];
        System.debug(num_accounts);
        return num_accounts;
    }

    public Integer NumHot() {
        Integer hot_accounts = [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
        System.debug(hot_accounts);
        return hot_accounts;
    }

    public Integer NumComplex() {
        Integer complex_accounts = [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
        return complex_accounts;
    }

    public List<Account> BigFive() {
        List<Account> big_five = [SELECT Name, AnnualRevenue FROM Account WHERE NOT AnnualRevenue = null ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 5];
        return big_five;
    }

    public Opportunity LastBigOpportunity() {
        Opportunity big_opp = [SELECT Name, Amount, CloseDate FROM Opportunity WHERE amount > 100000 ORDER BY CloseDate DESC NULLS LAST LIMIT 1];
        return big_opp;
    }

    public List<Contact> MajorPlayers() {
        List<Contact> major_players = [SELECT Account.name FROM Contact WHERE Account.Rating = 'Hot'];
        return major_players;
    }

    public String MostPopularAccount() {
        AggregateResult pop_account = [SELECT Account.name FROM Contact GROUP BY Account.name ORDER BY COUNT(ID) DESC LIMIT 1];
        return (String)pop_account.get('Account.name');
    }

    public List<List<sObject>> get_tom_contacts_leads() {
        return [FIND 'Tom' IN Name FIELDS RETURNING Contact(name), Lead(name)];
    }

    public List<Account> get_a_o_accounts() {
        List<sObject> ao_account = [FIND '*a*o*' IN All FIELDS RETURNING Account(name)];
        return ao_account;
    }

    public void SpawnContacts() {
        List<Contact> contacts_to_add = new List<Contact>();
        String lastNamePrefix = 'billy';
        for (Integer i = 0; i < 200; i++) {
            contacts_to_add.add(new Contact(lastName = lastNamePrefix + String.valueOf(i)));
        }
        Database.Insert(contacts_to_add, false);
    }

    public void CreateHomes() {
        List<Account> new_account_list = new List<Account>();
        String accountNamePrefix = 'Business';
        for (Integer i = 0; i < 3; i++) {
            new_account_list.add(new Account(name = accountNamePrefix + String.valueOf(i)));
        }
        Database.Insert(new_account_list);
    }

    public void Relocate() {
        List<Contact> relocate_contacts = [SELECT Name FROM Contact WHERE Name LIKE 'billy %' ORDER BY CreatedDate DESC LIMIT 50];
        Delete relocate_contacts;
    }
}
