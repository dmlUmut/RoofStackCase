# RoofStack Case Study

## Tech stack & Open-Source Libraries

- Java8
- Cucumber
- Cucumber Reporting
- RestAssured
- Gson

## Usage

First generate test reports.

` mvn clean test `

After the command is complete you can show the reports in the ` {projectDir}/reports ` folder

## Test Cases

>Since the test cases are mocked, I have specified the status codes that the cases 
>should normally encounter in the table below.
>
>Some test cases fail because they do not meet the expectations.


### Create User Requirements
| Field | Type | Restriction | 
|-------| ------ | ------| 
| firstName | alpha only  | required, min:2, max:50 |
| lastName | alpha only  | required, min:2, max:50 |
| username | Alphanumeric | required, min:2, max:50 |

-Since a requirement for the password was not specifically specified, separate test cases were not written and were statically embedded in the code.


### Create User Scenarios
| Name | Description | Priority | Status Code |
|-------| ------ | ------| ------ | 
| Create user scenarios | Success create user control  | p1 | 200 |
| FirstName acceptance scenarios | Min:2 character control | p1 | 200 |
| FirstName acceptance scenarios | Max:50 character control | p1 | 200 |
| FirstName error scenarios | Null character control | p1 | 400 |
| FirstName error scenarios | Numeric character control | p1 | 400 |
| FirstName error scenarios | Below the minimum character control | p1 | 400 |
| FirstName error scenarios | Alphanumeric character control | p1 | 400 |
| FirstName error scenarios | Above the maximum character control | p1 | 400 |
| LastName acceptance scenarios | Min:2 character control | p1 | 200 |
| LastName acceptance scenarios | Max:50 character control | p1 | 200 |
| LastName error scenarios | Null character control | p1 | 400 |
| LastName error scenarios | Numeric character control | p1 | 400 |
| LastName error scenarios | Below the minimum character control | p1 | 400 |
| LastName error scenarios | Alphanumeric character control | p1 | 400 |
| LastName error scenarios | Above the maximum character control | p1 | 400 |
| UserName acceptance scenarios | Min:4 character control | p1 | 200 |
| UserName acceptance scenarios | Max:12 character control | p1 | 200 |
| UserName acceptance scenarios | Numeric character control | p1 | 200 |
| UserName acceptance scenarios | Alphanumeric character control | p1 | 200 |
| UserName error scenarios | Null character control | p1 | 400 |
| UserName error scenarios | Below the minimum character control | p1 | 400 |
| UserName error scenarios | Above the maximum character control | p1 | 400 |

### Get User Scenarios
| Name | Description | Priority | Status Code |
|-------| ------ | ------| ------ | 
| Get user list scenarios | Status code check of user list request | p2 | 200 |
| Get user list scenarios | User list the contains the created user | p2 | 200 |
| Get user by id scenarios | Status code check of user detail request | p1 | 200 |
| Get user by id scenarios | Response fields check of user detail request | p1 | 200 |
| Get user by id scenarios |Status code check of wrong user detail request | p3 | 400 |

### Remove User Scenarios
| Name | Description | Priority | Status Code |
|-------| ------ | ------| ------ | 
| Remove user scenarios | Status check of deleted user | p1 | 204 |
| Remove user scenarios | Deletion status check of non-existent user | p2 | 403 |
| Remove user scenarios | Accessibility check for non-existent user | p2 | 403 |


### Switch User Activity Requirements
| Field | Type | Restriction | 
|-------| ------ | ------| 
| isActive | boolean  | required, true/false |


### Switch User Activity Scenarios
| Name | Description | Priority | Status Code |
|-------| ------ | ------| ------ | 
| isActive acceptance scenarios | Check for field to be true | p1 | 200 |
| isActive acceptance scenarios |  Check for field to be false | p1 | 200 |
| isActive error scenarios | Null character control  | p1 | 400 |
| isActive error scenarios | Wrong character control | p1 | 400 |


### Update User Info Requirements
| Field | Type | Restriction | 
|-------| ------ | ------| 
| firstName | alpha only  | required, min:2, max:50 |
| lastName | alpha only  | required, min:2, max:50 |


### Update User Info Scenarios
| Name | Description | Priority | Status Code |
|-------| ------ | ------| ------ | 
| Update user scenarios | Success update user control  | p1 | 200 |
| FirstName acceptance scenarios | Min:2 character control | p1 | 200 |
| FirstName acceptance scenarios | Max:50 character control | p1 | 200 |
| FirstName error scenarios | Null character control  | p1 | 400 |
| FirstName error scenarios | Numeric character control | p1 | 400 |
| FirstName error scenarios | Alphanumeric character control | p1 | 400 |
| FirstName error scenarios | Below the minimum character control | p1 | 400 |
| FirstName error scenarios | Above the maximum character control | p1 | 400 |
| Lastname acceptance scenarios | Min:2 character control | p1 | 200 |
| Lastname acceptance scenarios | Max:50 character control | p1 | 200 |
| Lastname error scenarios | Null character control  | p1 | 400 |
| Lastname error scenarios | Numeric character control | p1 | 400 |
| Lastname error scenarios | Alphanumeric character control | p1 | 400 |
| Lastname error scenarios | Below the minimum character control | p1 | 400 |
| Lastname error scenarios | Above the maximum character control | p1 | 400 |


## Test Reports
<img width="1185" alt="Screen Shot 2022-05-03 at 00 08 23" src="https://user-images.githubusercontent.com/8267050/166328221-4033dd85-7e89-411d-938a-6f36c6167c23.png">
<img width="1190" alt="Screen Shot 2022-05-03 at 00 07 54" src="https://user-images.githubusercontent.com/8267050/166328257-2a623004-b481-4e4e-ae62-66e0bfd6cf34.png">
