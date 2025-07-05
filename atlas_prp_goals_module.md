# 🧩 PRP-TASKS.md — Atlas Tasks Module

### 📌 Module: Task Management

**Purpose:** Enable users to create, view, update, and complete daily tasks. Tasks are identity-based, time-aware, and progress-tracked.

---

## 👤 User Stories

- As a user, I want to create tasks with a title, notes, and optional due date.
- As a user, I want to mark a task as complete or skipped.
- As a user, I want to set recurring tasks (daily, weekly, etc.).
- As a user, I want to track task streaks and completion stats.
- As a user, I want to view all my tasks for today or this week.
- As a user, I want to associate tasks with goals (optional foreign key).

---

## 📦 Database Schema

```json
{
  "table": "tasks",
  "fields": [
    { "name": "id", "type": "uuid", "primary": true },
    { "name": "user_id", "type": "uuid", "foreign": "auth.users" },
    { "name": "title", "type": "text" },
    { "name": "notes", "type": "text" },
    { "name": "due_date", "type": "date" },
    { "name": "is_recurring", "type": "boolean" },
    { "name": "recurring_type", "type": "text" },
    { "name": "completed", "type": "boolean" },
    { "name": "streak", "type": "int" },
    { "name": "skip", "type": "int" },
    { "name": "goal_id", "type": "uuid", "foreign": "goals.id" },
    { "name": "created_at", "type": "timestamp" }
  ],
  "rls": "user_id = auth.uid()"
}
```

---

## 🧩 Pages & Components

- `TasksPage.tsx`: shows today's tasks, grouped by status
- `TaskForm.tsx`: create/edit task form with validation
- `TaskCard.tsx`: renders individual task with streak/skip/complete actions
- `TaskStats.tsx`: optional widget to show current streak, completion %, etc.

---

## 🔧 Services

- `TaskService.ts`:
  - `getTasksByUser(date)`
  - `createTask(taskData)`
  - `updateTask(taskId, updates)`
  - `resetRecurringTasks()`

---

## 🔄 Logic / Behavior

- If a task is completed, `streak` increases by 1 and `skip` remains 0.
- If a task is skipped, `skip` increases by 1 and `streak` resets to 0.
- If a task is not completed by 12am (based on due\_date), `skip` increases by 1.
- At midnight, completed recurring tasks are reset via Supabase SQL trigger or serverless function.

---

## 🧠 Edge Cases

- What if a user changes a task to recurring after completion?
- What if a goal\_id reference is broken?
- How should skipped tasks show visually?

---

## ✅ Output Format Example

> Return a functional component `TaskForm.tsx` using:

- React + Tailwind
- Form with title, notes, due date, and recurrence
- Submit handler that calls `TaskService.createTask()`
- Use Supabase client with async/await

---

Would you like to continue with `PRP-Finance.md` or generate `TaskForm.tsx` next?

