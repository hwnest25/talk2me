# Week 5 — scenario-to-diagram mapping

These 16 scenarios specify the existing Week 4 behaviour. They are acceptance specifications, not evidence that the app is implemented. Tags identify each scenario in its `.feature` file and match the diagram coverage notes.

| ID | Use case | Scenario | Source flow | Activity-diagram path | Expected result |
| --- | --- | --- | --- | --- | --- |
| O01 | UC-O01 | Save a valid initial profile | Basic 1–9 | Form → valid → Finish setup → save succeeds → profile ready | One local profile; journal opens |
| O02 | UC-O01 | Correct a missing target language before saving | A1 → basic flow | Valid choices? [no] A1 → form → [yes] → save | Field error, retained level; corrected profile saved |
| O03 | UC-O01 | Change unsaved choices from the privacy notice | A3 → basic flow | Learner choice [Back] A3 → form → Finish setup → save | Changed unsaved selections used in one new profile |
| O04 | UC-O01 | Retry a failed profile save | A5 → basic flow | Save succeeded? [no] A5 → Try again → save [yes] | No false success; retry creates one profile |
| O05 | UC-O01 | Leave setup after a failed profile save | A5 → A4 | Save succeeded? [no] A5 → [leave] → setup incomplete | No completed profile; prior data unchanged |
| J01 | UC-J01 | Save a recording and its transcript locally | Basic 1–8 | Ready [yes] → audio saved [yes] → transcript non-empty [yes] → transcript saved [yes] | One entry; local playback/transcript; no transmission |
| J02 | UC-J01 | Explain denied microphone access | A1 | Ready to record? [no] → explain permission problem → not started | No recording or completed entry |
| J03 | UC-J01 | Report a failed audio save | A5 at step 5 | Ready [yes] → Audio saved? [no] → save error | Recoverable audio retained; retry offered; attempt incomplete |
| J04 | UC-J01 | Keep saved audio when transcription finds no speech | A6 | Audio saved [yes] → Non-empty transcript? [no] → transcript pending | Saved audio retained; feedback unavailable; retry/leave offered |
| J05 | UC-J01 | Report a failed transcript save | A5 at step 7 | Audio saved [yes] → Non-empty transcript [yes] → Transcript saved? [no] | Saved audio retained; transcript-save retry offered |
| F01 | UC-F01 | Save and display new language feedback | Basic 1–8 | Saved feedback [no] → online [yes] → usable [yes] → local save [yes] | New feedback saved/displayed; profile updated once |
| F02 | UC-F01 | Read saved feedback while offline | A1 | Saved feedback available? [yes] A1/R → display/read saved feedback | No network request or repeated profile update |
| F03 | UC-F01 | Defer new feedback while offline | A3 | Saved feedback [no] → Online? [no] → offline message → deferred | No new request or available result |
| F04 | UC-F01 | Reject an unusable feedback response | A4 | Saved feedback [no] → Online [yes] → Usable response? [no] | Failure message; no saved feedback/profile update |
| F05 | UC-F01 | Accept valid feedback with empty suggestion lists | A5 → basic 6–8 | Usable response? [yes, empty lists valid] → save [yes] → display empty categories | Saved valid empty result; no invented corrections |
| F06 | UC-F01 | Mark received feedback as unsaved after a storage failure | A6 | Usable response [yes] → Local save succeeded? [no] → unsaved result | Recoverable result; local retry offered; prior profile intact |

## Coverage boundaries

The diagrams show the principal paths of one attempt. Journaling/feedback failures end that attempt after offering recovery; the feature files do not pretend their retry loops are drawn. Onboarding explicitly draws and tests its retry loop.

The existing specifications retain further behaviour for later scenarios: onboarding A2/A6/A7 and interruption recovery; journaling A2/A3/A4, additional readiness failures, retry and two-minute automatic-stop behaviour; feedback A2/A7, timeouts, retry and late-response handling. This week's files are representative coverage, not a claim of exhaustive testing.

Test data: English, Intermediate, a 45-second recording, and `entry-1` are illustrative fixtures. The 45-second recording avoids changing the documented duration boundaries. A fixed transcription and controlled feedback responses will be supplied by the future test adapter; they are not outputs measured from a live model. Each scenario must start from independent local state.
