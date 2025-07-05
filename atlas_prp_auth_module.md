# 🧩 PRP-AUTH.md — Atlas Auth Module

### 📌 Module: User Authentication

**Purpose:** Securely manage user sign-up, login, logout, and profile state across the app. All app data must be scoped to the authenticated `user_id`.

---

## 👤 User Stories

- As a new user, I want to sign up with email and password.
- As a returning user, I want to log in and be redirected to my dashboard.
- As a logged-in user, I want to log out securely.
- As a user, I want my data to be scoped to my `user_id` so others can’t access it.
- As a user, I want to update my profile (optional feature).

---

## 📦 Database Schema

### Table: `profiles`

```json
{
  "table": "profiles",
  "fields": [
    { "name": "id", "type": "uuid", "primary": true, "foreign": "auth.users" },
    { "name": "email", "type": "text" },
    { "name": "full_name", "type": "text" },
    { "name": "avatar_url", "type": "text" },
    { "name": "created_at", "type": "timestamp" }
  ],
  "rls": "id = auth.uid()"
}
```

> ⚠️ The `id` field in `profiles` must match the `auth.users.id` and be used as `user_id` across all other tables.

### 🔒 RLS Policy Consistency

Ensure **all tables** in other modules:

- Include a `user_id` UUID column
- Have RLS enabled: `user_id = auth.uid()`

This applies to:

- `tasks`
- `journal_entries`
- `transactions`
- `goals`
- Any future module using user-owned data

---

## 🧩 Pages & Components

- `SignInPage.tsx`: login form with email/password
- `SignUpPage.tsx`: register form with validation
- `AccountPage.tsx`: optional user profile and settings
- `AuthProvider.tsx`: React context for session state
- `ProtectedRoute.tsx`: wrapper to restrict access to authenticated users

---

## 🔧 Services

- `AuthService.ts`:
  - `signUp(email, password)`
  - `signIn(email, password)`
  - `signOut()`
  - `getUser()`
  - `updateProfile(data)`

---

## 🔄 Logic / Behavior

- Auth context watches Supabase session state
- On login, redirect to `/dashboard`
- On logout, clear session and redirect to `/`
- All data fetching must filter by `user_id = auth.uid()`

---

## 🧠 Edge Cases

- How to handle duplicate sign-ups or email already in use?
- How to show auth errors (e.g. invalid login)?
- What happens if `user_id` is missing from a table insert?
- How to enforce RLS on `insert`, `select`, `update`, and `delete`?

---

## ✅ Output Format Example

> Return a `SignUpPage.tsx` form using:

- Supabase auth client
- Inputs: email, password
- Submit triggers `AuthService.signUp()`
- On success, redirect to dashboard

---

Would you like a `UserAuthDiagram.svg` to visualize the flow next or move on to component generation?

