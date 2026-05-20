create table if not exists public.perovskite_records (
  id uuid primary key default gen_random_uuid(),
  saved_at timestamptz not null default now(),
  formula text not null,
  n_pb_mmol numeric not null,
  input jsonb not null,
  rows jsonb not null
);

alter table public.perovskite_records enable row level security;

drop policy if exists "Anyone can read perovskite records" on public.perovskite_records;
create policy "Anyone can read perovskite records"
on public.perovskite_records
for select
to anon
using (true);

drop policy if exists "Anyone can insert perovskite records" on public.perovskite_records;
create policy "Anyone can insert perovskite records"
on public.perovskite_records
for insert
to anon
with check (true);
