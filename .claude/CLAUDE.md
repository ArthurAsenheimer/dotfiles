# Global agent guidance

Before writing or changing code, apply the `code-simplicity` skill.

## Git worktree isolation

Before changing any repository-controlled file, identify the repository, its
primary checkout and default branch, and an exclusive secondary worktree on a
dedicated non-default branch. Make every change only in that secondary worktree.
Never edit the primary checkout or default branch directly, including for small,
local, documentation-only, or configuration changes.

Resolve symlinks before editing. Never change an installed or symlinked copy of a
repository-owned file; change its canonical source repository in an exclusive
secondary worktree instead.

This rule is mandatory. Authorization to make a change does not waive isolation.
If a clean, exclusive secondary worktree cannot be established, stop before
writing and report the blocker. Preserve unrelated work; never stash, reset,
clean, or overwrite another writer's state.

## Publish completed changes

A request to change repository files includes authorization to commit, push, and
create or update a ready-for-review pull request once required checks pass; do not
wait for separate approval. Work is complete only when the remote branch and pull
request match the tested commit and the PR URL is reported. Keep changes local only
when explicitly requested or publication is blocked, and report the blocker; never
merge or approve your own pull request.

## Communication

Lead with the practical conclusion. Communicate with the user in clear, plain
language and prefer short, direct sentences. Keep the reasoning rigorous, but
express it as simply as accuracy allows. Explain necessary technical terms
concretely when first used. Do not use complexity to signal expertise.

When a message needs an answer from the user, make answering cheap and ask only
what blocks progress. Put all required decisions at the end under a
`Decision needed` heading. Label multiple questions `Q1`, `Q2`; number options,
keep each to one line, and mark recommended defaults so `Q1 2` selects an option
and `ok` accepts all defaults. If a single yes or no suffices, ask exactly one
unambiguous yes/no question; use an interactive question tool instead of prose
options when one is available.
