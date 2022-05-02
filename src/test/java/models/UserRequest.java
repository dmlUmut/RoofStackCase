package models;

public class UserRequest {
    private final String firstName;
    private final String lastName;
    private final String username;
    private final String password;

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUserName() {
        return username;
    }

    private UserRequest(Builder builder) {
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.username = builder.username;
        this.password = builder.password;
    }

    public static class Builder {
        private String firstName;
        private String lastName;
        private String username;
        private String password;

        public Builder firstName(String firstName) {
            this.firstName = firstName;
            return this;
        }

        public Builder lastName(String lastName) {
            this.lastName = lastName;
            return this;
        }

        public Builder userName(String username) {
            this.username = username;
            return this;
        }

        public Builder password(String password) {
            this.password = password;
            return this;
        }

        public UserRequest build() {
            UserRequest model = new UserRequest(this);
            return model;
        }
    }
}
