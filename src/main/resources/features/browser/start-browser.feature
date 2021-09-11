@ignore
Feature: starts the browser from given browserName and navigates to the given startUrl

Scenario: get the driver path for the given browserName and navigate to startUrl
    * def configs = read('this:browser-configs.json') 
    
    * def internalStartUrl = typeof startUrl == "undefined" ? "https://www.google.com/" : startUrl
    * def internalBrowserName = typeof browserName == "undefined" ? "chromeapi" : browserName
    * def internalDriverConfig = typeof driverConfig == "undefined" ? configs[internalBrowserName] : driverConfig
    
    * eval if(internalDriverConfig.type != "chrome") internalDriverConfig.executable = df.getDriverPath(internalBrowserName)
    
    * configure driver = internalDriverConfig
    
    * driver internalStartUrl
