# Scenario coverage

The 16 scenarios describe intended behaviour. Step implementations are pending, so this is **specification coverage, not passed application tests**. Scenario tags match the notes on the activity diagrams.

| Use case / narrative | ID | Flow | Expected outcome |
| --- | --- | --- | --- |
| [UC-O01](../use_cases/UC-O01_SetUpLearnerProfile.md) / [feature](../../features/onboarding_profile.feature) | O01 | Basic | Save one initial profile and open the journal. |
| | O02 | A1 → basic | Correct a missing language without losing the level choice. |
| | O03 | A3 → basic | Change unsaved choices after returning from the notice. |
| | O04 | A5 → basic | Retry a failed save; create one profile. |
| | O05 | A5 → A4 | Leave failed setup without a completed profile. |
| [UC-J01](../use_cases/UC-J01_RecordSpokenJournalEntry.md) / [feature](../../features/record_journal_entry.feature) | J01 | Basic | Save audio and transcript locally; send neither. |
| | J02 | A1 | Explain denied microphone access; do not record. |
| | J03 | A5, audio save | Retain recoverable audio and offer a local retry. |
| | J04 | A6 | Keep saved audio when no speech is recognised. |
| | J05 | A5, transcript save | Keep audio and recoverable transcript for retry. |
| [UC-F01](../use_cases/UC-F01_ReceiveLanguageFeedback.md) / [feature](../../features/receive_language_feedback.feature) | F01 | Basic | Save feedback and update learning patterns once. |
| | F02 | A1 | Read saved feedback offline without another request. |
| | F03 | A3 | Defer new feedback while offline. |
| | F04 | A4 | Reject unusable feedback without updating the profile. |
| | F05 | A5 → basic | Accept valid empty suggestion lists. |
| | F06 | A6 | Mark received feedback as unsaved after a storage failure. |

## Limits

The diagrams show principal paths. Onboarding draws its retry loop; journaling and feedback scenarios check recovery offers, not complete retry loops. Other alternatives, interruptions, duration boundaries and late responses remain documented in the use cases for later coverage.

English, Intermediate, a 45-second recording and `entry-1` are sample fixtures. Future app tests need independent local state and controlled transcription/feedback responses; these are not measured model outputs.

[scenario-map.json](scenario-map.json) supplies the existing automated check. It is supporting test data; this page is the reading guide.
