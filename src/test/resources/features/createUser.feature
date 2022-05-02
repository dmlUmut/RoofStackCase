Feature: Create User Scenario


  Scenario: Success create user control

    Given request data create with jane, doe, doejj
    When a POST request is send to USER_URL
    Then the status code is 200
    * response field "userId" is not empty


  Scenario Outline: FirstName acceptance scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>
    * response field "userId" is not empty

    Examples:
      | firstName                                          | lastName | userName | statusCode |
      | da                                                 | doe      | doejj    | 200        |
      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasd | doe      | doejj    | 200        |


  Scenario Outline: FirstName error scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>

	# Senario Outline çıktısı 400 olması gerekirken caseStudy'de 200 verildiği için case hata'ya düşmektedir.
    Examples:
      | firstName                                           | lastName | userName | statusCode |
      |                                                     | doe      | doejj    | 400        |
      | 123                                                 | doe      | doejj    | 400        |
      | d                                                   | doe      | doejj    | 400        |
      | qd*f                                                | doe      | doejj    | 400        |
      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasdw | doe      | doejj    | 400        |


  Scenario Outline: LastName acceptance scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>
    * response field "userId" is not empty

    Examples:
      | firstName | lastName                                           | userName | statusCode |
      | jane      | da                                                 | doejj    | 200        |
      | jane      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasd | doejj    | 200        |


  Scenario Outline: LastName error scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>

	# Senario Outline çıktısı 400 olması gerekirken caseStudy'de 200 verildiği için case hata'ya düşmektedir.
    Examples:
      | firstName | lastName                                            | userName | statusCode |
      | jane      |                                                     | doejj    | 400        |
      | jane      | 123                                                 | doejj    | 400        |
      | jane      | d                                                   | doejj    | 400        |
      | jane      | qd*f                                                | doejj    | 400        |
      | jane      | qwertyuıopffasdfghflşkffhhdggdvbbcfdjfksdsadasdasdw | doejj    | 400        |


  Scenario Outline: Username acceptance scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>
    * response field "userId" is not empty

    Examples:
      | firstName | lastName | userName     | statusCode |
      | jane      | doe      | doej         | 200        |
      | jane      | doe      | doejjdoejjdd | 200        |
      | jane      | doe      | dd65jjj      | 200        |
      | jane      | doe      | dd65j*j      | 200        |


  Scenario Outline: Username error scenarios in create request

    Given request data create with <firstName>, <lastName>, <userName>
    When a POST request is send to USER_URL
    Then the status code is <statusCode>

    Examples:
      | firstName | lastName | userName      | statusCode |
      | jane      | doe      |               | 400        |
      | jane      | doe      | doe           | 400        |
      | jane      | doe      | doejjdoejjddt | 400        |