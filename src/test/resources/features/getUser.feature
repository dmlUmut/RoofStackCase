Feature: Get User Scenario


  Background:
    Given create dummy user


  Scenario: Status code  check of user list request

    When a GET request is send to USER_URL
    Then the status code is 200


  Scenario: User List contains the created user

    When a GET request is send to USER_URL
    Then response contains the created user


  Scenario: Status code check of user detail request

    Given request url update with userId
    When a GET request is send to USER_URL
    Then the status code is 200


  Scenario: Response fields check of user detail request

    Given request url update with userId
    When a GET request is send to USER_URL
    Then response field is equal to created user