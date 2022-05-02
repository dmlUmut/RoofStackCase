package stepdefs;

import configs.TestConfig;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import models.CreateUserResponse;
import models.UserRequest;
import org.apache.http.HttpStatus;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.notNullValue;

public class UserStepDefs {

    private final BaseStepDefs baseDef;

    public UserStepDefs(BaseStepDefs baseDef) {
        this.baseDef = baseDef;
    }

    @Given("request data create with {}, {}, {}")
    public void requestDataCreateWith(String firstName, String lastName, String userName) {
        UserRequest requestModel = new UserRequest.Builder()
                .userName(userName)
                .firstName(firstName)
                .lastName(lastName)
                .password("123456Aa*")
                .build();

        String body = baseDef.toJson(requestModel);

        RequestSpecification request = baseDef.getRequest()
                .body(body);

        baseDef.setRequest(request);
    }

    @Given("create dummy user")
    public void createDummyUser() {

        // Request model'e dummy user yaratırken random verilerle yaratmak daha mantıklı fakat şuan servis buna izin vermemekte.
        UserRequest requestModel = new UserRequest.Builder()
                .userName("doejj")
                .firstName("jane")
                .lastName("doe")
                .password("123456Aa*")
                .build();

        String body = baseDef.toJson(requestModel);

        baseDef.setResponse(given()
                .accept(ContentType.JSON)
                .contentType(ContentType.JSON)
                .body(body)
                .when()
                .post(TestConfig.getProperty("USER_URL"))
                .then()
                .statusCode(HttpStatus.SC_OK)
                .extract()
                .response());

        CreateUserResponse responseModel = baseDef.getResponseModel(CreateUserResponse.class);
        baseDef.clearDataStore();
        baseDef.putDataStore("userId", responseModel.getUserId());
        baseDef.putDataStore("requestModel", requestModel);
    }


    @And("response contains the created user")
    public void responseFieldIsNotNull() {
        baseDef.getJson().body("find { it.id == '" + baseDef.getValueDataStore("userId") + "' }", notNullValue());
    }

    @Given("request url update with userId")
    public void requestDataCreateWithUserId() {
        RequestSpecification request = baseDef.getRequest()
                .basePath("{userId}")
                .pathParam("userId", baseDef.getValueDataStore("userId"));

        baseDef.setRequest(request);
    }

    @Then("response field is equal to created user")
    public void responseFieldIsEqualToCreatedUser() {
        UserRequest model = baseDef.getResponseModel(UserRequest.class);

        baseDef.getJson().body("username", equalTo(model.getUserName()));
        baseDef.getJson().body("firstName", equalTo(model.getFirstName()));
        baseDef.getJson().body("lastName", equalTo(model.getLastName()));
        baseDef.getJson().body("id", equalTo(baseDef.getValueDataStore("userId")));
    }

    @Given("request data with {} key and {} boolean params")
    public void patchRequestDataIsActive(String key, String value) {
        Map<String, Object> model = new HashMap<>();
        model.put(key, Boolean.valueOf(value));

        RequestSpecification request = baseDef.getRequest()
                .body(model);

        baseDef.setRequest(request);
    }

    @Given("firstName and lastName fields update with {} and {} values")
    public void patchRequestDataWithFirstNameLastName(String firstName, String lastName) {
        UserRequest model = new UserRequest.Builder()
                .firstName(firstName)
                .lastName(lastName)
                .build();

        RequestSpecification request = baseDef.getRequest()
                .body(baseDef.toJson(model));

        baseDef.setRequest(request);
    }
}


