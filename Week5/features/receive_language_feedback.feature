# Specification: docs/UCs/UC-F01_ReceiveLanguageFeedback.md
@UC-F01
Feature: Receive language feedback
  As a learner who has completed local onboarding
  I want to receive grammar and vocabulary feedback for a saved journal entry
  So that I can understand possible improvements to my language use.

  Background:
    Given the learner has completed local onboarding
    And entry "entry-1" has saved audio and a non-empty transcript

  @F01 @happy
  Scenario: Save and display new language feedback
    Given entry "entry-1" has no saved feedback
    And the device is online and local feedback storage is available
    And the feedback service will return valid grammar and vocabulary suggestions
    When I request feedback for entry "entry-1"
    Then grammar and vocabulary suggestions are displayed for entry "entry-1"
    And one feedback result is saved and learning patterns are applied once
    And only the transcript and compact profile summary were submitted
    And the original audio and transcript are unchanged

  @F02 @A1 @read
  Scenario: Read saved feedback while offline
    Given entry "entry-1" already has saved feedback
    And the device is offline
    When I request feedback for entry "entry-1"
    Then the saved feedback is displayed for entry "entry-1"
    And no new feedback request or learner profile update occurs

  @F03 @A3
  Scenario: Defer new feedback while offline
    Given entry "entry-1" has no saved feedback
    And the device is offline
    When I request feedback for entry "entry-1"
    Then the need for internet access is explained with retry or leave options
    And no feedback request has been sent and no result is marked available
    And the original audio and transcript are unchanged

  @F04 @A4
  Scenario: Reject an unusable feedback response
    Given entry "entry-1" has no saved feedback
    And the device is online and local feedback storage is available
    And the feedback service will return an unusable response
    When I request feedback for entry "entry-1"
    Then a feedback failure is shown with "Try again" and "Back to journal"
    And no feedback result or learning pattern update is saved
    And the original audio and transcript are unchanged

  @F05 @A5
  Scenario: Accept valid feedback with empty suggestion lists
    Given entry "entry-1" has no saved feedback
    And the device is online and local feedback storage is available
    And the feedback service will return valid empty grammar and vocabulary lists
    When I request feedback for entry "entry-1"
    Then feedback is saved for entry "entry-1"
    And both categories explicitly show that no suggestions were returned
    And no corrections or claim of error-free speech are invented
    And the original audio and transcript are unchanged

  @F06 @A6
  Scenario: Mark received feedback as unsaved after a storage failure
    Given entry "entry-1" has no saved feedback
    And the device is online
    And the feedback service will return valid grammar and vocabulary suggestions
    And the next feedback save will fail with the result recoverable
    When I request feedback for entry "entry-1"
    Then the received feedback is marked as unsaved and a local save retry is offered
    And the previous learner profile and original entry are unchanged
