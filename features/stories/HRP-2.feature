Feature: As a customer, I would receive an error message when check in date is later than check out date

  Scenario: Hrp-2-01: Verify whether the check-out date field accepts a later date than check-in date
    Given User selects build_2
    And User enters data from Hrp-2-01
    When User enters a check in date later than the check out date field
    Then System reports an error message