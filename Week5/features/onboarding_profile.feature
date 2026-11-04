# Specification: docs/UCs/UC-O01_SetUpLearnerProfile.md
@UC-O01
Feature: Set up a learner profile
  As a new learner setting up Talk2Me on this device
  I want to create a local learner profile
  So that I am ready to start journaling.

  Background:
    Given no completed local learner profile exists
    And the profile form is open

  @O01 @happy
  Scenario: Save a valid initial profile
    Given local profile storage is available
    When I choose target language "English" and level "Intermediate"
    And I select "Continue"
    And I read the privacy notice and select "Finish setup"
    Then exactly one completed profile is saved with language "English" and level "Intermediate"
    And the empty journaling screen is displayed
    And no learner data has been transmitted

  @O02 @A1
  Scenario: Correct a missing target language before saving
    Given local profile storage is available
    When I choose level "Intermediate" without a target language
    And I select "Continue"
    Then the target language field shows a validation error
    And the level remains "Intermediate" and no profile has been saved
    When I choose target language "English" and level "Intermediate"
    And I select "Continue"
    And I read the privacy notice and select "Finish setup"
    Then exactly one completed profile is saved with language "English" and level "Intermediate"

  @O03 @A3
  Scenario: Change unsaved choices from the privacy notice
    Given local profile storage is available
    When I choose target language "English" and level "Beginner"
    And I select "Continue"
    And I select "Back"
    Then the form retains language "English" and level "Beginner"
    When I choose target language "English" and level "Intermediate"
    And I select "Continue"
    And I read the privacy notice and select "Finish setup"
    Then exactly one completed profile is saved with language "English" and level "Intermediate"

  @O04 @A5
  Scenario: Retry a failed profile save
    Given the next profile save will fail
    When I choose target language "English" and level "Intermediate"
    And I select "Continue"
    And I read the privacy notice and select "Finish setup"
    Then "Profile not saved" is displayed and setup remains incomplete
    And the choices are retained for another local save attempt
    When local profile storage becomes available
    And I select "Try again"
    Then exactly one completed profile is saved with language "English" and level "Intermediate"
    And no learner data has been transmitted

  @O05 @A5 @A4
  Scenario: Leave setup after a failed profile save
    Given the next profile save will fail
    When I choose target language "English" and level "Intermediate"
    And I select "Continue"
    And I read the privacy notice and select "Finish setup"
    Then "Profile not saved" is displayed and setup remains incomplete
    When I leave setup
    Then no completed local profile exists and existing data is unchanged
