@regression
Feature: As a customer, I would like to verify the details according to my search criteria

  Background:
    Given User logs into application

  Scenario: Hrp-4-01: Verify whether locations in Select Hotel page are displayed according to the location selected in Search Hotel
    And User enters data from Hrp-4-01
    When User enters search hotel data
    Then location is displayed in Select Hotel should be the same as selected in search hotel form

  Scenario: Hrp-4-02: Verify whether check in and check out dates are displayed in Select Hotel page according to the dates selected in Search Hotel
    And User enters data from Hrp-4-02
    When User enters search hotel data
    Then check in and check out dates are displayed in select Hotel page according to the dates selected in Search Hotel

  Scenario: Hrp-4-03: Verify whether no of rooms in Select Hotel page are displayed according to the location selected in Search Hotel
    And User enters data from Hrp-4-03
    When User enters search hotel data
    Then no_of_rooms is displayed in Select Hotel should be the same as selected in search hotel form

  Scenario: Hrp-4-04: Verify whether room type in Select Hotel page is displayed according to the location selected in Search Hotel
    And User enters data from Hrp-4-04
    When User enters search hotel data
    Then room_type is displayed in Select Hotel should be the same as selected in search hotel form
