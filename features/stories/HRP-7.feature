@regression
Feature: As a customer, I would check and verify bookings with order number

  Background:
    Given User selects build_2

  Scenario: Verify the order number is generated after booking is confirmed
    When User enters data from Hrp-7-01
    And User enters search hotel data
    And User is on booking confirmation page
    And User completes the booking confirmation
    Then Order number is generated

  Scenario: Verify whether the search order id query works and displays the relevant details
    When User enters data from Hrp-7-02
    And User clicks booked itinerary
    And user searches with order id
    Then relevant details are displayed

  @not_regression
  Scenario: Verify displayed data fields are not editable
    When User enters data from Hrp-7-03
    And User clicks booked itinerary
    And user searches with order id
    Then all fields are non editable

  Scenario: Verify that the order is cancelled after cancel order number link is clicked
    When User enters data from Hrp-7-04
    And User clicks booked itinerary
    And user searches with order id
    And User completes cancellation
    Then Order number is cancelled and no longer exists

