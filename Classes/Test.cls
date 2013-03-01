public with sharing class Test
{
	// Cache static resource values
	private static Map<String, String> keyValueMap = new Map<String, String>();
	
	// If soft assert is on, prevent hard failure
	public static void softAssertEquals(Object o1, Object o2)
	{
		if(o1 == o2) return;
		
		debug(o1 + ' != ' + o2);
		if(getValue('SoftAssert') != 'on')
			system.assert(o1 == o2);
	}
	
	// If soft assert is on, prevent hard failure
	// (works with x === y / exact equality comparisons)
	public static void softAssert(Boolean condition, String msg)
	{
		if(condition == true) return;
		
		debug(msg);
		if(getValue('SoftAssert') != 'on') 
			system.assert(condition);
	}

	private static void debug(String message)
	{
		system.debug('\nSoft Assert Failed: [' + message + ']\n');
	}
	
	// Is test method disabled?
	public static Boolean disabled(String name)
	{
		Boolean retVal = (getValue(name) == 'off');
		if(!retVal) system.debug('\n\nSTART TEST: ' + name + '\n----------------------------------------------');
		return retVal;
	}

	// Get value from Settings static resource OR from cached value
	public static String getValue(String name)
	{
		String retVal = keyValueMap.get(name);
		if(retVal == null)
		{
			try
			{
				Map<String, String> keyValues = (Map<String, String>)
					JSON.deserialize([SELECT Body FROM StaticResource WHERE Name = 'Settings' LIMIT 1].Body.toString(), 
					Map<String, String>.class);
				retVal = keyValues.get(name);
				keyValueMap.put(name, retVal);
			}
			catch(Exception e){}
		}
		
		return retVal;
	}
}