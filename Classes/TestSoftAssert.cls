@isTest
private class TestSoftAssert 
{
    static testMethod void test1()
    {
		if(Test.disabled('TestSoftAssert.test1')) return;
		Test.softAssertEquals('apples', 'oranges');
		Test.softAssertEquals(5, 6);
		Test.softAssertEquals(5, null);
		Test.softAssertEquals('apples', 'apples');
		Test.softAssertEquals(Date.today(), 3.14159);
    }

    static testMethod void test2()
    {
		if(Test.disabled('TestSoftAssert.test2')) return;
		Test.softAssert((new Contact() === new Contact()), 'new Contact() !== new Contact()');
    }
    
	// Just to demonstrate the output in the debug log
    static testMethod void test3(){if(Test.disabled('TestSoftAssert.test3')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test4(){if(Test.disabled('TestSoftAssert.test4')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test5(){if(Test.disabled('TestSoftAssert.test5')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test6(){if(Test.disabled('TestSoftAssert.test6')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test7(){if(Test.disabled('TestSoftAssert.test7')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test8(){if(Test.disabled('TestSoftAssert.test8')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}
    static testMethod void test9(){if(Test.disabled('TestSoftAssert.test9')) return; Test.softAssertEquals('apples', 'oranges'); Test.softAssertEquals(true, false);}

	// Example: Enable to qualify major releases. Disable otherwise.
    static testMethod void loadTest()
    {
		if(Test.disabled('TestSoftAssert.loadTest')) return;
		system.debug('\n\nLoad test is running...\n');
    }
}