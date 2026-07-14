
Do not run bazel commands directly.


When launching a subagent, run in the background unless there is a specific reason not to.
It never makes sense to launch a single subagent in the foreground.

## Git and github

Do not attempt to sign commits. You won't have access to my keys. Also, use `--no-verify` to commit and push.

When creating a PR, create as a draft, not "ready for review".

Use the pr-descrition skill when creating a PR.
Keep it concise! Describe the changes at a high level, not every detail. Focus on intent, not a description of the code.
If the description has a Test Plan/testing section it should not describe having run all things enforced in CI (ty, ruff, unit tests).
Instead it should only describe the added added/updated that are relevant, very briefly AND if manual tests are recommend, list them as checkboxes.

Generally, do not comment as me on github without my explicit approval of the message. 
When you are asked to auto reply to a PR, comments/replies should have a heading like ```### Coding agent```
If a github reply references changes, those changes should be pushed before the reply is made.


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

## Writing sytle

To more accurately depict my voice when writing (e.g. docs, comments in code, reviews/replies, emails, etc.):

* Be accurate, but concise.
  * Do not misrepresent facts of the matter but in some places, brevity is important (e.g. high level design, pull request description).
  * The amount of detail depends on the context (e.g. section of the doc or a summary) and the audience (for execs or the implementing engineer).
* Use lists (ordered and unordered) as appropriate. Using : or - to split an item's name from its description is good.
* Prefer simple sentences with periods and commas. Some parenthesis are OK (e.g. when citing a source). Avoid using em dashes.
