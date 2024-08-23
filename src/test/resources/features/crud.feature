@report=true
Feature: Realizar crud a diferentes metodos en restful-booker.herokuapp.com

  @bookingIds
  Scenario: booking GET
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method GET
    Then status 200

  @createBookingPost
  Scenario: Create booking POST
    * def booking =
      """
        {
            "firstname" : "Jim",
            "lastname" : "Brown",
            "totalprice" : 111,
            "depositpaid" : true,
            "bookingdates" : {
                "checkin" : "2018-01-01",
                "checkout" : "2019-01-01"
            },
            "additionalneeds" : "Breakfast"
        }
      """
    Given url 'https://restful-booker.herokuapp.com'
    And path 'booking'
    And header Content-Type = 'application/json;'
    And request booking
    When method POST
    Then status 200

  @createToken
  Scenario: Create Token POST
    Given url 'https://restful-booker.herokuapp.com'
    And path 'auth'
    And header Content-Type = 'application/json;'
    And request { "username" : "admin","password" : "password123"}
    When method POST
    Then status 200


  @updateBooking
  Scenario: Update booking PUT
    * def booking =
      """
      {
          "firstname" : "James",
          "lastname" : "Brown",
          "totalprice" : 111,
          "depositpaid" : true,
          "bookingdates" : {
              "checkin" : "2020-01-01",
              "checkout" : "2020-01-01"
          },
          "additionalneeds" : "Breakfast"
      }
      """
    Given url 'https://restful-booker.herokuapp.com'
    And path 1
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request booking
    When method PUT
    Then status 200