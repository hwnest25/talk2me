# Specification: docs/UCs/UC-J01_RecordSpokenJournalEntry.md
@UC-J01
Feature: Record a spoken journal entry
  As a learner who has completed local onboarding
  I want to save a spoken journal entry with its transcript on my device
  So that I can review what I said.

  Background:
    Given the learner has completed local onboarding
    And the journaling screen is open

  @J01 @happy
  Scenario: Save a recording and its transcript locally
    Given microphone access, the local model and storage are ready
    And local transcription will return "Today I visited the park."
    When I select "Record"
    And I speak for 45 seconds and select "Stop and save"
    Then exactly one local entry contains the audio and transcript "Today I visited the park."
    And the saved transcript and audio playback are available
    And feedback can be requested separately
    And no audio or transcript has been transmitted

  @J02 @A1
  Scenario: Explain denied microphone access
    Given microphone permission is denied
    And the local model and storage are ready
    When I select "Record"
    Then the microphone permission problem is explained
    And recording has not started and no completed entry has been created

  @J03 @A5
  Scenario: Report a failed audio save
    Given microphone access, the local model and storage are ready
    And the next audio save will fail with the recording recoverable
    When I select "Record"
    And I speak for 45 seconds and select "Stop and save"
    Then a local save error is displayed without a success confirmation
    And the recoverable recording is retained and a local save retry is offered
    And existing entries are unchanged

  @J04 @A6
  Scenario: Keep saved audio when transcription finds no speech
    Given microphone access, the local model and storage are ready
    And local transcription will return no recognised speech
    When I select "Record"
    And I speak for 45 seconds and select "Stop and save"
    Then the saved audio remains in one entry marked as needing transcription
    And a transcription problem is explained with retry or leave options
    And feedback is unavailable until a non-empty transcript exists

  @J05 @A5
  Scenario: Report a failed transcript save
    Given microphone access, the local model and storage are ready
    And local transcription will return "Today I visited the park."
    And the next transcript save will fail with the transcript recoverable
    When I select "Record"
    And I speak for 45 seconds and select "Stop and save"
    Then a local save error is displayed without a success confirmation
    And the saved audio and recoverable transcript are retained for local save retry
    And existing entries are unchanged
