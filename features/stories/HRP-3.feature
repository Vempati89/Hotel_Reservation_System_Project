@regression
Feature: As a customer, I would receive an error message when check out date is in the past

  Scenario: Hrp-3-01: Verify if error is reported if check-out date field is in the past
    Given User selects build_2
    And User enters data from Hrp-3-01
    When User enters dates as past dates
    Then System reports an error message for checkin