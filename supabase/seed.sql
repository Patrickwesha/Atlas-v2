
-- Optional seed data for testing
insert into tasks (user_id, title, notes, due_date, is_recurring, recurring_type)
values
  ('00000000-0000-0000-0000-000000000000', 'Write PRP', 'Finish planning document', current_date, true, 'daily');

insert into goals (user_id, title, identity, motivation)
values
  ('00000000-0000-0000-0000-000000000000', 'Become Fit', 'Healthy Person', 'Look good, feel good.');

insert into journal_entries (user_id, title, content)
values
  ('00000000-0000-0000-0000-000000000000', 'Gratitude', 'Thankful for progress.');

insert into transactions (user_id, type, category, amount, description, date)
values
  ('00000000-0000-0000-0000-000000000000', 'expense', 'groceries', 52.75, 'Walmart trip', current_date);

insert into workouts (user_id, date, type, duration_minutes, notes)
values
  ('00000000-0000-0000-0000-000000000000', current_date, 'strength', 45, 'Upper body split');

insert into meals (user_id, date, meal_type, name, protein, carbs, fats)
values
  ('00000000-0000-0000-0000-000000000000', current_date, 'lunch', 'Chicken Salad', 30, 10, 15);

insert into fasting_logs (user_id, start_time, end_time, duration_minutes)
values
  ('00000000-0000-0000-0000-000000000000', current_timestamp - interval '16 hours', current_timestamp, 960);
