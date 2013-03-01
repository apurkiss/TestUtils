The Test class Uses JSON in the Settings static resource to control unit 
test behavior in Apex. The format is a simple key/value JSON block:

{
    "SoftAssert": "on",
    "TestSoftAssert.test1": "on",
    "TestSoftAssert.test2": "on",
    "TestSoftAssert.loadTest": "on"
}

If SoftAssert is on, all failing assertions in Test.softAssert or 
Test.softAssertEquals will result in output to the debug log but no hard 
assertion failures will occur. When SoftAssert is off, failing assertions
will act like normal, immediately stopping test execution with an error.
SoftAssert defaults to off, so if the SoftAssert entry is removed from the 
static resource, assertions will fire as usual. 

In tests, replace:
system.assertEquals(val1, val2); 
with
Test.softAssertEquals(val1, val2);

Additionally, although tests are enabled by default, individual tests can 
be disabled by adding an entry for the test name, like this:

"TestClassName.testName": "off"

Then, begin all tests with the following code:

if(Test.disabled('TestClassName.testName')) return;

This is to permit disabling long running tests or broken tests, even when
the tests are being executed from within a managed package.
