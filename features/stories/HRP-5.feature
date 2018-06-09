@regression
Feature: As a customer, I would verify the price of the rooms as per the given data

  Background:
    Given User logs into application

  Scenario Outline: Verify whether the total price is calculated as per rooms and price
    And User enters data from <datafile>
    When User enters search hotel data
    Then total price is calculated as price per night and no of nights and no of rooms

    Examples:
      | datafile |
      | Hrp-5-01 |
      | Hrp-5-02 |
