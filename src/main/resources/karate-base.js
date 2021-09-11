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
        generateEmail: function(baseEmail) {
            var user = baseEmail.split('@');
            return user[0] + Date.now() + "@" + user[1];
        }
    };

    if (env == 'qa') {
        // do qa config here
    }

    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);
    return config;
}