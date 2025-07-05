# 🧩 PRP-CALENDAR.md — Atlas Calendar Module

### 📌 Module: Calendar View & Integration
**Purpose:** Provide users with a visual calendar that integrates tasks, goals, workouts, journal entries, and financial events in one place.

---

## 👤 User Stories
- As a user, I want to see my tasks, goals, and journal entries on a calendar view.
- As a user, I want to click on a date to create or view entries.
- As a user, I want to filter the calendar by module (e.g., show only tasks).
- As a user, I want recurring tasks to appear on all relevant dates.
- As a user, I want to view my fitness activity by date.
- As a user, I want to see financial transactions by date (optional).

---

## 📦 Database Considerations
> This module references existing tables:
- `tasks.due_date`
- `journal_entries.date`
- `goals.deadline`
- `transactions.date`
- `workouts.date`

No new table is required, but unified query logic will be needed for date-based grouping.

---

## 🧩 Pages & Components
- `CalendarPage.tsx`: full-page calendar with filters and event dots
- `CalendarDayModal.tsx`: modal for viewing/creating entries per day
- `CalendarFilters.tsx`: toggle between task, journal, fitness, finance, goals
- `CalendarLegend.tsx`: explains colors/icons per entry type

---

## 🔧 Services
- `CalendarService.ts`:
  - `getCalendarData(startDate, endDate)`
    - Fetches all date-based entries grouped by type
  - `groupByDateAndType(data)`

---

## 📊 Logic / Behavior
- Recurring tasks must be expanded into the view per rule
- Color-code per module: tasks (blue), journal (green), fitness (purple), finance (red), goals (gold)
- Clicking a date opens a modal with filtered entries

---

## 🧠 Edge Cases
- How to handle overlapping data (e.g., 3+ types on same day)?
- What if a user disables a module (e.g., no finance)?
- How to display long-range goals (multi-day span vs single date)?

---

## ✅ Output Format Example
> Return a `CalendarPage.tsx` component using:
- React + Tailwind
- Data fetched from `CalendarService.getCalendarData()`
- Render monthly grid view with click-to-open behavior

---

All modules must provide a `date` field and respect `user_id = auth.uid()` to work with the calendar view.

Would you like a visual mockup of the calendar or start generating `CalendarPage.tsx` next?

