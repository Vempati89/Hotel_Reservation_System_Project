@regression
Feature: As a customer, I would verify the booking details on  booking confirmation screen

  Background:
    Given User logs into application

  Scenario: Verify Hotel, Location, room type, Total day, price per night on booking confirmation screen
    When User enters data from Hrp-6-01
    And User enters search hotel data
    And User is on booking confirmation page
    Then Itinerary on confirmation page matches the data entered

  Scenario: Verify final billed price is sum of total price and tax
    When User enters data from Hrp-6-02
    And User enters search hotel data
    And User is on booking confirmation page
    Then final billed price is sum of total price and tax

  Scenario: Verify displayed data for rooms is same as the selected data in book hotel page
    When User enters data from Hrp-6-03
    And User enters search hotel data
    And User is on booking confirmation page
    Then displayed data is same as the selected data in book hotel page

