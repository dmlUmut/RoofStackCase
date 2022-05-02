Feature: Update User Scenario


  Background:
    Given create dummy user


  Scenario: Success update user control
    Given firstName and lastName fields update with jane and doe values
    * request url update with userId
    When a PUT request is send to USER_URL
    Then the status code is 200

  Scenario Outline: FirstName acceptance scenarios in put request

    Given firstName and lastName fields update with <firstName> and <lastName> values
    * request url update with userId
    When a PUT request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | firstName                                          | lastName | statusCode |
      | da                                                 | doe      | 200        |
      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasd | doe      | 200        |


  Scenario Outline: FirstName error scenarios in put request

    Given firstName and lastName fields update with <firstName> and <lastName> values
    * request url update with userId
    When a PUT request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | firstName                                           | lastName | statusCode |
      |                                                     | doe      | 400        |
      | dm333                                               | doe      | 400        |
      | dm**                                                | doe      | 400        |
      | j                                                   | doe      | 400        |
      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasdj | doe      | 400        |


  Scenario Outline: Lastname acceptance scenarios in put request

    Given firstName and lastName fields update with <firstName> and <lastName> values
    * request url update with userId
    When a PUT request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | firstName | lastName                                           | statusCode |
      | jane      | da                                                 | 200        |
      | jane      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasd | 200        |


  Scenario Outline: Lastname error scenarios in put request

    Given firstName and lastName fields update with <firstName> and <lastName> values
    * request url update with userId
    When a PUT request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | firstName | lastName                                            | statusCode |
      | jane      |                                                     | 400        |
      | jane      | dm333                                               | 400        |
      | jane      | dm**                                                | 400        |
      | jane      | j                                                   | 400        |
      | jane      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasdj | 400        |