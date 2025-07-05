# 🧩 PRP-FITNESS.md — Atlas Fitness Module

### 📌 Module: Fitness Tracking

**Purpose:** Allow users to log workouts, track progress, and visualize strength and health improvements over time.

---

## 👤 User Stories

- As a user, I want to log workouts with type, duration, and notes.
- As a user, I want to track strength metrics like bench, squat, and deadlift.
- As a user, I want to see graphs of progress over time.
- As a user, I want to set fitness goals (optional).
- As a user, I want to filter workouts by date range or type.

---

## 📦 Database Schema

### Table: `workouts`

```json
{
  "table": "workouts",
  "fields": [
    { "name": "id", "type": "uuid", "primary": true },
    { "name": "user_id", "type": "uuid", "foreign": "auth.users" },
    { "name": "type", "type": "text" }, // cardio, strength, etc.
    { "name": "duration_minutes", "type": "int" },
    { "name": "note", "type": "text" },
    { "name": "date", "type": "date" },
    { "name": "created_at", "type": "timestamp" }
  ],
  "rls": "user_id = auth.uid()"
}
```

### Table: `fitness_metrics`

```json
{
  "table": "fitness_metrics",
  "fields": [
    { "name": "id", "type": "uuid", "primary": true },
    { "name": "user_id", "type": "uuid", "foreign": "auth.users" },
    { "name": "bench", "type": "numeric" },
    { "name": "squat", "type": "numeric" },
    { "name": "deadlift", "type": "numeric" },
    { "name": "weight", "type": "numeric" },
    { "name": "body_fat", "type": "numeric" },
    { "name": "date", "type": "date" },
    { "name": "created_at", "type": "timestamp" }
  ],
  "rls": "user_id = auth.uid()"
}
```

---

## 🧩 Pages & Components

- `FitnessPage.tsx`: dashboard showing workouts + metrics
- `WorkoutForm.tsx`: form for logging new workouts
- `MetricsForm.tsx`: form for logging strength/body data
- `ProgressChart.tsx`: charts for lifting/weight/body fat over time

---

## 🔧 Services

- `FitnessService.ts`:
  - `getWorkoutsByUser()`
  - `createWorkout(data)`
  - `getFitnessMetrics()`
  - `createFitnessMetric(data)`

---

## 📊 Logic / Behavior

- Visualizations show 30-day, 90-day, or custom range
- Metrics may auto-compare current vs. previous records
- Group workouts by week for summary insights

---

## 🧠 Edge Cases

- What if a user logs duplicate metrics on the same day?
- How should missing fields be handled in metrics?
- How to show progress for non-lifters (e.g., walking, yoga)?

---

## ✅ Output Format Example

> Return a `WorkoutForm.tsx` using:

- React + Tailwind
- Inputs: type, duration, note, date
- Submits to Supabase `createWorkout()`

---

Would you like to continue with `PRP-Calendar.md` now?

