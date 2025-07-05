# 🧠 Atlas App Context Engineering Template

This template is designed to guide the **Context Engineering** process for building the **Atlas** all-in-one productivity app — and make it **reusable** across other complex LLM-powered projects. Inspired by modern context engineering principles, it ensures that any AI assistant (like those used in Bolt.diy) has **everything it needs to accomplish a task** — without being limited by the model’s token window.

---

## 📘 Overview

**App Name:** Atlas\
**Purpose:** A full-stack, modular productivity app that combines task tracking, goal setting, journaling, finance tracking, fitness progress, meal planning, calendar view, dashboard summary, and app settings into one cohesive user experience.\
**Stack:** React (with Tailwind CSS) + Supabase (with RLS) + Typescript + Expo (optional mobile support)\
**Design Pillars:** Clean. Modular. Motivational. Identity-Based.

---

## 🔧 Context Engineering System

Rather than a single static prompt, we split context into **modular layers**:

### 1. 🧱 Core App Context Block

Include this **in every major prompt** — it's the anchor that keeps the AI grounded:

```
BEGIN_CORE_CONTEXT
App: Atlas
Type: Modular productivity app (Tasks, Goals, Journal, Finance, Fitness, Meals, Calendar, Dashboard, Settings)
Tech Stack: React + Supabase + Tailwind + TypeScript + Expo
Database: Supabase with RLS (user_id ownership)
UI Rules: Clean, minimal, mobile-first, modular code files
Design Identity: Motivational, habit-based, progress-focused
Naming Conventions: camelCase for vars, PascalCase for components
END_CORE_CONTEXT
```

This core block acts like **persistent long-term memory**. Paste it at the top of each prompt.

---

### 2. 🧩 Module-Specific Context Blocks

Break your PRP into **smaller, scoped blocks** like:

- `PRP-Tasks.md`
- `PRP-Goals.md`
- `PRP-Journal.md`
- `PRP-Finance.md`
- `PRP-Fitness.md`
- `PRP-Meals.md`
- `PRP-Calendar.md`
- `PRP-Dashboard.md`
- `PRP-Auth.md`
- `PRP-Settings.md`

Each should contain:

- Module description and purpose
- User stories (as bullet points)
- Required schema (tables + fields + RLS rules)
- Expected frontend pages/components
- APIs or service files expected
- Edge case notes

👉 Keep each under 3K tokens if possible. Load them **only when relevant**.

---

### 3. 🧠 Short-Term Memory / State

Bolt or the AI agent should maintain state like:

- Files already generated (e.g., GoalForm.tsx)
- Styling structure used
- Previously created DB schema
- Navigation structure created

You can simulate this by:

- Pasting previous outputs back into prompts
- Summarizing them as bullet points

---

### 4. 🔍 Tools & Capabilities

List any tools the agent can "use" or simulate:

```json
TOOLS_AVAILABLE = [
  "generate_schema",
  "create_component",
  "refactor_code",
  "validate_rls_policy",
  "write_service_file",
  "route_navigation",
  "analyze_user_context"
]
```

This orients the model to understand what **actions it can take**.

---

### 5. 📤 Output Structure Instructions

For code prompts, be very clear on what the format should be. Example:

> "Output a single React component using TypeScript and TailwindCSS. Keep each file under 150 lines. Use named exports. Do not include explanations or comments."

Or:

> "Return JSON formatted schema with table name, fields, types, and RLS rule in this format: { table: 'goals', fields: [...], rls: '...' }"

---

## ✅ Reusability Across Projects

This system works for other LLM-powered apps by:

- Swapping out `BEGIN_CORE_CONTEXT` to fit a new app
- Creating new `PRP-[Module].md` files scoped to that app
- Reusing tool definitions and output formatting instructions

---

## 🧠 TL;DR: How to Use This

In any AI request (e.g. Bolt.diy prompt):

1. Always paste the **Core App Context Block**
2. Then add the **Module-Specific PRP Block**
3. Re-include summaries of previous outputs if needed
4. Define the **expected action/output structure**
5. Add tools the model can use (if needed)

This ensures the model is never guessing, always working from **complete, scoped, and structured context**.

---

