# 📦 Atlas — All-in-One Productivity App

**Atlas** is a modular, full-stack productivity app built using React, Supabase, TailwindCSS, and TypeScript. It integrates task tracking, journaling, goal setting, financial logging, fitness tracking, and a unified calendar — all scoped per user with secure row-level permissions.

---

## ⚙️ Tech Stack

* **Frontend:** React + TypeScript + TailwindCSS
* **Backend:** Supabase (PostgreSQL, Auth, RLS)
* **Mobile:** Expo (optional)
* **Visualization:** Recharts / Chart.js

---

## 🧱 Directory Structure

```bash
atlas/
├── public/                       # Static assets
├── src/
│   ├── auth/                    # SignIn, SignUp, AuthProvider, ProtectedRoute
│   ├── components/              # Shared UI components (Button, Card, etc.)
│   ├── context/                 # Global app context (Auth, Theme, etc.)
│   ├── modules/                 # Feature modules grouped by domain
│   │   ├── tasks/
│   │   │   ├── TasksPage.tsx
│   │   │   ├── TaskForm.tsx
│   │   │   ├── TaskService.ts
│   │   ├── journal/
│   │   │   ├── JournalPage.tsx
│   │   │   ├── JournalForm.tsx
│   │   ├── goals/
│   │   │   ├── GoalsPage.tsx
│   │   │   ├── GoalForm.tsx
│   │   ├── finance/
│   │   │   ├── FinancePage.tsx
│   │   │   ├── TransactionForm.tsx
│   │   ├── fitness/
│   │   │   ├── FitnessPage.tsx
│   │   │   ├── WorkoutForm.tsx
│   │   ├── meals/
│   │   │   ├── MealsPage.tsx
│   │   │   ├── MealForm.tsx
│   │   │   ├── FastingLogForm.tsx
│   │   ├── calendar/
│   │   │   ├── CalendarPage.tsx
│   │   ├── settings/
│   │   │   ├── SettingsPage.tsx
│   ├── services/                # Reusable Supabase and utility services
│   ├── utils/                   # Date helpers, schema validators, etc.
│   ├── styles/                  # Tailwind config and global styles
│   └── App.tsx
├── supabase/
│   ├── schema.sql               # DB schema (tables, RLS policies)
│   └── seed.sql                 # Optional seed data
├── .env.local                  # Supabase keys
├── tailwind.config.js
├── tsconfig.json
├── package.json
└── README.md
```

---

## 🔐 Authentication & RLS

All tables use Supabase Auth with Row-Level Security (RLS):

```sql
CREATE POLICY "Users can access their own data"
  ON public.tasks
  USING (user_id = auth.uid());
```

Ensure each table has a `user_id` column linked to `auth.users.id`.

---

## 📖 Available Modules

* ✅ Tasks
* ✅ Goals
* ✅ Journaling
* ✅ Finance
* ✅ Fitness
* ✅ Meals
* ✅ Dashboard
* ✅ Settings
* ✅ Calendar (cross-module visual integration)
* ✅ Auth (sign in / sign up / RLS support)

---

## 🚀 Get Started

```bash
git clone https://github.com/YOUR_USERNAME/atlas.git
cd atlas
npm install
npm run dev
```

Add your Supabase project URL and anon key to `.env.local`

---

## 🧠 Roadmap

* [ ] Notification system
* [ ] Mobile optimization via Expo
* [ ] Dark mode toggle
* [ ] AI-powered insights per module

---

## 📜 License

MIT License © 2025 Patrick Kwesha

---