function fn() {
    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev'; // a custom 'intelligent' default
    }
    var config = { // base config JSON
        sleep: function(ms) {
            java.lang.Thread.sleep(ms);
        },
        fire: function(locator, events) {
            if (typeof events == 'undefined') {
                events = ['change'];
            } else if (!Array.isArray(events)) {
                events = [events];
            }
            for (var event in events) {
                script(locator, "_.dispatchEvent(new Event('" + event + "'))");
            }
            return locator;
        },
        valueAndFire: function(locator, value, events) {
            script(locator, "_.value = " + value);
            this.fire(locator, events);
            return locator;
        },
        generateEmail: function(baseEmail) {
            var user = baseEmail.split('@');
            return user[0] + Date.now() + "@" + user[1];
        }
    };

    if (env == 'qa') {
        config.bcBaseUrl = "<put qa url here>";
        // over-ride only those that need to be
    } else if (env == 'shadow') {
        config.bcBaseUrl = "<put shadow url here>";
        // over-ride only those that need to be
    } else if (env == 'prod') {
        config.bcBaseUrl = "<put prod url here>";
        // over-ride only those that need to be
    }
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);
    return config;
}