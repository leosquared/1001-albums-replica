# Ralph Agent Instructions

## Your Task

1. Read `scripts/ralph/prd.json`
2. Read `scripts/ralph/progress.txt`
   (check Codebase Patterns first)
3. Check you're on the correct branch
4. Pick highest priority story 
   where `passes: false`
5. Implement that ONE story
6. Run typecheck and tests
7. Update AGENTS.md files with learnings
8. Commit: `feat: [ID] - [Title]`
9. Update prd.json: `passes: true`
10. Append learnings to progress.txt

## Project Context

This is a simple PDF to plain text converter app.
- Stack: Node.js with Express backend, vanilla HTML/JS frontend
- Keep it minimal - no unnecessary dependencies
- Use pdf-parse for PDF extraction

## Progress Format

APPEND to progress.txt:

```
## [Date] - [Story ID]
- What was implemented
- Files changed
- **Learnings:**
  - Patterns discovered
  - Gotchas encountered
---
```

## Codebase Patterns

Add reusable patterns to the TOP 
of progress.txt:

```
## Codebase Patterns
- File uploads: Use multer with memory storage
- PDF parsing: pdf-parse returns { text, numpages, info }
```

## Stop Condition

If ALL stories pass, reply:
<promise>COMPLETE</promise>

Otherwise end normally.