package configs;

public class TestConfig {
    private final static String USER_URL = "https://3e3d2990-3fca-4144-8b26-1538cf135a09.mock.pstmn.io/users/";

    public static String getProperty(String key) {
        switch (key) {
            case "USER_URL":
                return USER_URL;
            default:
                return null;
        }
    }
}