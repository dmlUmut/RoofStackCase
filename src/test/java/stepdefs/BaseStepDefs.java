package stepdefs;

import com.google.gson.Gson;
import configs.TestConfig;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.response.ValidatableResponse;
import io.restassured.specification.RequestSpecification;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.notNullValue;

public class BaseStepDefs {

    private Response response;
    private ValidatableResponse json;
    private RequestSpecification request;

    private final Gson gson = new Gson();
    private final Map<String, Object> datastore = new HashMap<>();

    public void setResponse(Response response) {
        this.response = response;
    }

    public ValidatableResponse getJson() {
        return json;
    }

    public void setRequest(RequestSpecification request) {
        this.request = request;
    }

    public RequestSpecification getRequest() {
        if (request == null) {
            request = given()
                    .accept(ContentType.JSON)
                    .contentType(ContentType.JSON);
        }

        return request;
    }

    protected <T> T getResponseModel(Class<T> classType) {
        return response.body().as(classType);
    }

    protected void clearDataStore() {
        datastore.clear();
    }

    protected void putDataStore(String key, Object value) {
        datastore.put(key, value);
    }

    protected Object getValueDataStore(String key) {
        return datastore.get(key);
    }

    public String toJson(Object model) {
        return gson.toJson(model);
    }

    @When("a {word} request is send to {word}")
    public void sendPostRequest(String requestType, String urlKey) {

        String url = TestConfig.getProperty(urlKey);
        getRequest().log().all().baseUri(url);

        switch (requestType) {
            case "POST":
                response = getRequest().when().post();
                break;
            case "PUT":
                response = getRequest().when().put();
                break;
            case "GET":
                response = getRequest().when().get();
                break;
            case "PATCH":
                response = getRequest().when().patch();
                break;
            case "DELETE":
                response = getRequest().when().delete();
                break;
        }

        json = response.then();

        System.out.println("response: " + response.prettyPrint());
    }

    @Then("the status code is {int}")
    public void verifyStatusCode(int statusCode) {
        json = response.then().statusCode(statusCode);
    }

    @And("response field {word} is not empty")
    public void responseFieldIsNotNull(String responseFields) {
        json.body(responseFields, notNullValue());
    }
}


