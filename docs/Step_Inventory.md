# Week 5 — step inventory

Shared parameterised definitions are in [talk2me.steps.js](../../features/step_definitions/talk2me.steps.js). All implementation bodies are **pending**. These are project-owned registrations using the Cucumber Expressions library, not imported canned Selenium steps.

| Keyword | Expression | Implementation status |
| --- | --- | --- |
| Given | `no completed local learner profile exists` | Pending app integration |
| Given | `the profile form is open` | Pending app integration |
| Given | `local profile storage is available` | Pending app integration |
| When | `I choose target language {string} and level {string}` | Pending app integration |
| When | `I select {string}` | Pending app integration |
| When | `I read the privacy notice and select {string}` | Pending app integration |
| Then | `exactly one completed profile is saved with language {string} and level {string}` | Pending app integration |
| Then | `the empty journaling screen is displayed` | Pending app integration |
| Then | `no learner data has been transmitted` | Pending app integration |
| When | `I choose level {string} without a target language` | Pending app integration |
| Then | `the target language field shows a validation error` | Pending app integration |
| Then | `the level remains {string} and no profile has been saved` | Pending app integration |
| Then | `the form retains language {string} and level {string}` | Pending app integration |
| Given | `the next profile save will fail` | Pending app integration |
| Then | `{string} is displayed and setup remains incomplete` | Pending app integration |
| Then | `the choices are retained for another local save attempt` | Pending app integration |
| When | `local profile storage becomes available` | Pending app integration |
| When | `I leave setup` | Pending app integration |
| Then | `no completed local profile exists and existing data is unchanged` | Pending app integration |
| Given | `the learner has completed local onboarding` | Pending app integration |
| Given | `entry {string} has saved audio and a non-empty transcript` | Pending app integration |
| Given | `entry {string} has no saved feedback` | Pending app integration |
| Given | `the device is online and local feedback storage is available` | Pending app integration |
| Given | `the feedback service will return valid grammar and vocabulary suggestions` | Pending app integration |
| When | `I request feedback for entry {string}` | Pending app integration |
| Then | `grammar and vocabulary suggestions are displayed for entry {string}` | Pending app integration |
| Then | `one feedback result is saved and learning patterns are applied once` | Pending app integration |
| Then | `only the transcript and compact profile summary were submitted` | Pending app integration |
| Then | `the original audio and transcript are unchanged` | Pending app integration |
| Given | `entry {string} already has saved feedback` | Pending app integration |
| Given | `the device is offline` | Pending app integration |
| Then | `the saved feedback is displayed for entry {string}` | Pending app integration |
| Then | `no new feedback request or learner profile update occurs` | Pending app integration |
| Then | `the need for internet access is explained with retry or leave options` | Pending app integration |
| Then | `no feedback request has been sent and no result is marked available` | Pending app integration |
| Given | `the feedback service will return an unusable response` | Pending app integration |
| Then | `a feedback failure is shown with {string} and {string}` | Pending app integration |
| Then | `no feedback result or learning pattern update is saved` | Pending app integration |
| Given | `the feedback service will return valid empty grammar and vocabulary lists` | Pending app integration |
| Then | `feedback is saved for entry {string}` | Pending app integration |
| Then | `both categories explicitly show that no suggestions were returned` | Pending app integration |
| Then | `no corrections or claim of error-free speech are invented` | Pending app integration |
| Given | `the device is online` | Pending app integration |
| Given | `the next feedback save will fail with the result recoverable` | Pending app integration |
| Then | `the received feedback is marked as unsaved and a local save retry is offered` | Pending app integration |
| Then | `the previous learner profile and original entry are unchanged` | Pending app integration |
| Given | `the journaling screen is open` | Pending app integration |
| Given | `microphone access, the local model and storage are ready` | Pending app integration |
| Given | `local transcription will return {string}` | Pending app integration |
| When | `I speak for {int} seconds and select {string}` | Pending app integration |
| Then | `exactly one local entry contains the audio and transcript {string}` | Pending app integration |
| Then | `the saved transcript and audio playback are available` | Pending app integration |
| Then | `feedback can be requested separately` | Pending app integration |
| Then | `no audio or transcript has been transmitted` | Pending app integration |
| Given | `microphone permission is denied` | Pending app integration |
| Given | `the local model and storage are ready` | Pending app integration |
| Then | `the microphone permission problem is explained` | Pending app integration |
| Then | `recording has not started and no completed entry has been created` | Pending app integration |
| Given | `the next audio save will fail with the recording recoverable` | Pending app integration |
| Then | `a local save error is displayed without a success confirmation` | Pending app integration |
| Then | `the recoverable recording is retained and a local save retry is offered` | Pending app integration |
| Then | `existing entries are unchanged` | Pending app integration |
| Given | `local transcription will return no recognised speech` | Pending app integration |
| Then | `the saved audio remains in one entry marked as needing transcription` | Pending app integration |
| Then | `a transcription problem is explained with retry or leave options` | Pending app integration |
| Then | `feedback is unavailable until a non-empty transcript exists` | Pending app integration |
| Given | `the next transcript save will fail with the transcript recoverable` | Pending app integration |
| Then | `the saved audio and recoverable transcript are retained for local save retry` | Pending app integration |
