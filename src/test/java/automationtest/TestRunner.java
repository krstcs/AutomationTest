package automationtest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {
    @Test
    Karate registerAndLogin() {
        return Karate.run("classpath:features/register-and-login.feature");
    }

    @Test
    Karate invalidLogin() {
        return Karate.run("classpath:features/invalid-login.feature");
    }
}
