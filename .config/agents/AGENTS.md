Do not comment as me on github without my explicit approval of the message. 
If a github reply references changes, those changes should be pushed before the reply is made.

Do not run bazel commands directly.

When generating PR descriptions, use the skill AND put it in clipboard with pbcopy.
PR descriptions must be concise: focus on the key changes, not every detail.
If the deccription has a Test Plan/testing section it should not describe having run all things enforced in CI (ty, ruff, unit tests).
Instead it should only describe the added added/updated that are relevant, very briefly AND if manual tests are recommend, create a checklist.

When creating a PR, create as a draft, not "ready for review".

When launching a subagent, run in the background unless there is a specific reason not to.
It never makes sense to launch a single subagent in the foreground.
