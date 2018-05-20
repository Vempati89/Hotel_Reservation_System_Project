@regression
Feature: As a customer, I would like to verify my login details

  Scenario: Hrp-1-01: Verify that user is able to login into build 1 application
    Given User enters data from Hrp-1-01
    When User logs into application
    Then Username is displayed on the screen

  Scenario: Hrp-1-02: Verify that user is able to login into build 2 application
    Given User selects build_2
    And User enters data from HRP-1-02
    When User logs into application
    Then Username is displayed on the screen