@regression
Feature: As a customer, I want to verify the titles buttons and links

  Background:
    Given User selects build_2

  Scenario: Verify title of login page
    When User enters data from Hrp-8-01
    Then title of the login page is displayed

  Scenario: Verify title of booking page
    When User enters data from Hrp-8-02
    And User clicks booked itinerary
    Then title of the booking page is displayed

  Scenario: Verify title of the select hotel page
    When User enters data from Hrp-8-03
    And User enters search hotel data
    Then title of the select hotel page is displayed

  Scenario: Verify title of the confirmation page
    When User enters data from Hrp-8-04
    And User enters search hotel data
    And User is on booking confirmation page
    Then title of the confirmation page is displayed