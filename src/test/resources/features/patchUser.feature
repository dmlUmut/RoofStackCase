@all
Feature: Patch User Scenario


  Background:
    Given create dummy user


  Scenario Outline: isActive acceptance scenarios in patch request

    Given request data with isActive key and <isActive> boolean params
    * request url update with userId
    When a PATCH request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | isActive | statusCode |
      | true     | 200        |
      | false    | 200        |


  Scenario Outline: isActive error scenarios in patch request
    Given request data with isActive key and <isActive> boolean params
    * request url update with userId
    When a PATCH request is send to USER_URL
    Then the status code is <statusCode>
    Examples:
      | isActive | statusCode |
      |          | 400        |
      | deneme   | 400        |