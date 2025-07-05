
-- Enable Row Level Security
alter table if exists tasks enable row level security;
alter table if exists goals enable row level security;
alter table if exists journal_entries enable row level security;
alter table if exists transactions enable row level security;
alter table if exists workouts enable row level security;
alter table if exists meals enable row level security;
alter table if exists fasting_logs enable row level security;

-- Create all tables
create table if not exists tasks (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    title text,
    notes text,
    due_date date,
    is_recurring boolean,
    recurring_type text,
    completed boolean default false,
    streak int default 0,
    skip int default 0,
    goal_id uuid,
    created_at timestamp default now()
);

create table if not exists goals (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    title text,
    identity text,
    motivation text,
    deadline date,
    progress int default 0,
    created_at timestamp default now()
);

create table if not exists journal_entries (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    title text,
    content text,
    created_at timestamp default now()
);

create table if not exists transactions (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    type text,
    category text,
    amount numeric,
    description text,
    date date,
    created_at timestamp default now()
);

create table if not exists workouts (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    date date,
    type text,
    duration_minutes int,
    notes text,
    created_at timestamp default now()
);

create table if not exists meals (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    date date,
    meal_type text,
    name text,
    protein numeric,
    carbs numeric,
    fats numeric,
    created_at timestamp default now()
);

create table if not exists fasting_logs (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users on delete cascade,
    start_time timestamp,
    end_time timestamp,
    duration_minutes int,
    created_at timestamp default now()
);

-- RLS Policies
create policy "Users can access their own tasks" on tasks for all using (auth.uid() = user_id);
create policy "Users can access their own goals" on goals for all using (auth.uid() = user_id);
create policy "Users can access their own journal" on journal_entries for all using (auth.uid() = user_id);
create policy "Users can access their own transactions" on transactions for all using (auth.uid() = user_id);
create policy "Users can access their own workouts" on workouts for all using (auth.uid() = user_id);
create policy "Users can access their own meals" on meals for all using (auth.uid() = user_id);
create policy "Users can access their own fasting logs" on fasting_logs for all using (auth.uid() = user_id);
