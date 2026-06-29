Generally, do not comment as me on github without my explicit approval of the message. 
When you are asked to auto reply to a PR, comments/replies should have a heading like ```### Coding agent```
If a github reply references changes, those changes should be pushed before the reply is made.

Do not run bazel commands directly.

When creating a PR, create as a draft, not "ready for review".

Use the pr-descrition skill when creating a PR.
Keep it concise! Describe the changes at a high level, not every detail.
If the description has a Test Plan/testing section it should not describe having run all things enforced in CI (ty, ruff, unit tests).
Instead it should only describe the added added/updated that are relevant, very briefly AND if manual tests are recommend, list them as checkboxes.

When launching a subagent, run in the background unless there is a specific reason not to.
It never makes sense to launch a single subagent in the foreground.


## Coding style

Code should be self-documenting and readable.
To that end, docstrings on public methods/functions/classes are OK, but inline comments should be avoided unless something is confusing without them.

* Avoid inline comments unless they are necessary to clarify something unusual. A comment is an apology for unclear code.
* Be concise. Avoid superfluous local variables. When unclear, use kwargs instead of positional.

```python
# Bad
shoe = make_shoe(insole, outsole, laces)
options = {'height': 100, 'width': 50}
render_shoe(shoe, options)
# Good
render_shoe(make_shoe(insole, outsole, laces), options={'height': 100, 'width': 50})
```
