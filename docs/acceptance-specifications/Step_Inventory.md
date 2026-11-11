# Step definitions

The three [feature files](../../features) share [talk2me.steps.js](../../features/step_definitions/talk2me.steps.js). All 68 registered expressions currently return **pending**: application actions and assertions still need implementation.

| Part | Purpose |
| --- | --- |
| `Given` | Establish independent profile, entry, storage or service conditions. |
| `When` | Perform a learner action, such as choosing a value or requesting feedback. |
| `Then` | Check an observable result, stored data or privacy condition. |
| `{string}` / `{int}` | Reuse an expression with different text or numeric inputs. |

The definitions are project-owned Cucumber Expressions, not an imported Selenium step library. Read the source for the complete expression list; duplicating it here would require maintaining it twice.

Before adding a step, reuse a matching expression where its meaning fits. New implementations must perform a real action or assertion, reset scenario state, and identify any mocked services. Empty passing bodies must not stand in for unfinished work.

From the repository root, run `npm run check` and `npm run bdd:dry-run`. These validate the specifications and bindings, not the app.
