Feature: Delete User Scenario


  Background:
    Given create dummy user


  Scenario: Status check of deleted user
    #Status code normalde 204 dönmeli fakat sistem gerekliliği 200 kontrolü yaptım
    Given request url update with userId
    When a DELETE request is send to USER_URL
    Then the status code is 204


  Scenario: Deletion status check of non-existent user

    Given request url update with userId
    When a DELETE request is send to USER_URL
    * a DELETE request is send to USER_URL
    Then the status code is 403


  Scenario: Accessibility check for non-existent user

    Given request url update with userId
    When a DELETE request is send to USER_URL
    * a GET request is send to USER_URL
    Then the status code is 403