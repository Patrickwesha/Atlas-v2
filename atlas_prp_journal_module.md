# 🧩 PRP-JOURNAL.md — Atlas Journal Module

### 📌 Module: Daily Journaling

**Purpose:** Provide a private, structured space for users to write reflections, thoughts, and mood entries. Entries are personal, searchable, and optionally taggable by mood, theme, or goal.

---

## 👤 User Stories

- As a user, I want to write a journal entry each day.
- As a user, I want to include a title, mood tag, and notes in my entry.
- As a user, I want to edit or delete past entries.
- As a user, I want to see entries grouped by week or month.
- As a user, I want to search journal entries by keyword or mood.
- As a user, I want to associate a journal entry with a specific goal (optional).

---

## 📦 Database Schema

```json
{
  "table": "journal_entries",
  "fields": [
    { "name": "id", "type": "uuid", "primary": true },
    { "name": "user_id", "type": "uuid", "foreign": "auth.users" },
    { "name": "title", "type": "text" },
    { "name": "entry", "type": "text" },
    { "name": "mood", "type": "text" },
    { "name": "goal_id", "type": "uuid", "foreign": "goals.id" },
    { "name": "date", "type": "date" },
    { "name": "created_at", "type": "timestamp" }
  ],
  "rls": "user_id = auth.uid()"
}
```

---

## 🧩 Pages & Components

- `JournalPage.tsx`: displays list of past entries grouped by date
- `JournalForm.tsx`: create/edit entry form (title, mood, content, goal\_id)
- `JournalCard.tsx`: condensed view for each entry with mood color indicator
- `MoodSelector.tsx`: mood input with emojis/colors (e.g., happy, sad, anxious)

---

## 🔧 Services

- `JournalService.ts`:
  - `getEntriesByUser(startDate, endDate)`
  - `createEntry(data)`
  - `updateEntry(id, data)`
  - `deleteEntry(id)`
  - `searchEntries(keyword, mood)`

---

## 📊 Logic / Behavior

- Mood tagging uses a fixed set of emojis or keywords
- Search filters allow combining mood + keyword + date
- Entries are private and encrypted at rest (optional Supabase row-level encryption)

---

## 🧠 Edge Cases

- What if a user forgets to submit a daily entry?
- What if a goal\_id is deleted — how should past entries behave?
- How should search handle partial matches or misspellings?

---

## ✅ Output Format Example

> Return a `JournalForm.tsx` form using:

- React + Tailwind
- Inputs for title, content, mood, optional goal tag
- Submit with Supabase `createEntry()`
- Form should auto-populate today’s date and reset on submit

---

Would you like to continue with `PRP-Goals.md`, `PRP-Auth.md`, or generate one of the journal components?

