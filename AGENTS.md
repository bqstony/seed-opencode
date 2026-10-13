# AGENTS.md

## General Rules
- Only Modify files in this workspace git repository
- Interact with the user in german, write all documentation, code and comments, handbook in englisch.
- Read, edit, review, and test code. Make the smallest change that correctly satisfies the request while preserving the repository's existing conventions. The next engineer to read this diff is the primary audience.
- Always read files in `specs` directory before implementing
- Always read files in `docs/architecture` directory before implementing
- Never implement without acceptance criteria
- Code should be simple and readable
- Avoid overengineering
- Reuse existing implementation in base class or same class when possible
- Preserve existing patterns, naming, structure, and module boundaries. Match nearby code over generic style.
- Keep server/client boundaries strict. Do not mix server-only and client-safe exports; do not import server-only modules into client code.
- Never introduce or move secrets into source, logs, or version control. Load config and secrets from the environment. If a secret appears to be committed, stop and flag it.
- Treat all external input as untrusted at the boundary. Use parameterized queries and safe builders; never concatenate untrusted input into SQL, shell, paths, or markup.
- Never add, upgrade, or remove a dependency without explicit confirmation. When a change appears to require one, stop and ask, proposing the minimal, already-vetted option and stating why it is needed. Apply it only after approval and note it in the summary.
- Handle errors explicitly. Do not swallow exceptions or leave empty catch blocks. Propagate with context; do not leak secrets or PII into error text.
- Inline comments only when logic is non-obvious, short, and in English. Comment the why, not the what. Do not leave commented-out code.
- Do not delete or rewrite unrelated code, tests, or comments to make a change fit.

## Operating loop

Work in phases. Do not jump to editing.

1. **Understand.** Read before editing. Start from the nearest owning file, the relevant test, or the failing behavior. Trace the actual code path rather than assuming. If the request is ambiguous in a way that changes the design (contract, failure semantics, scope of the change), state the assumption and pick the safer interpretation; stop and ask only when the choice is expensive to reverse.
2. **Locate the seam.** Identify the minimal set of files that must change and the tests that cover them. Note existing patterns, naming, and module boundaries to match.
3. **Change.** Prefer the smallest correct diff. No speculative refactors, no abstraction for its own sake, no drive-by reformatting of untouched lines. Preserve existing patterns, naming, structure, and module boundaries. Treat repo conventions as higher priority than generic style advice.
4. **Test.** Add or update tests for new behavior and for every bug fix (a regression test that fails before the fix and passes after). Cover the happy path, the boundaries, and the failure modes of the touched slice.
5. **Validate.** Run the repository's established format, lint, type-check, test, and build workflows for the affected area. Validate the touched slice first, then broaden only if a change could have wider impact. Do not claim success without running the checks.
6. **Summarize.** Report what changed and why, concisely and diff-oriented. Produce the commit message.


## Testing
- Prioritize coverage of acceptance criteria
- Tests should be clear and straightforward

## Constraints
- Do not invent requirements that are not described
- Do not change behavior without updating the spec and tasks

## Output style

Concise, factual, diff-oriented, no filler. Report the checks you ran and their result. State any assumption taken and any deliberate omission.

see .editorconfig for formatting rules.

## Spec folder structure

- For ech spec create a folder under `spec` directory with prefixed increment number `[00]-[shortdescription]`. 
- In the folder create a file named like `[shortdescription]-v1.md`. Example: `specs/01-my-feature/my-feature-v1.md`
- In the same folder place the tasks md file like `tasks-v1.md`
