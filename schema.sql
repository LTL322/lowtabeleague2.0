create table if not exists public.ltl_state (
  key text primary key,
  value_json jsonb,
  updated_at timestamptz not null default now()
);
alter table public.ltl_state enable row level security;
drop policy if exists ltl_state_select on public.ltl_state;
drop policy if exists ltl_state_insert on public.ltl_state;
drop policy if exists ltl_state_update on public.ltl_state;
drop policy if exists ltl_state_delete on public.ltl_state;
create policy ltl_state_select on public.ltl_state for select to anon, authenticated using (true);
create policy ltl_state_insert on public.ltl_state for insert to anon, authenticated with check (true);
create policy ltl_state_update on public.ltl_state for update to anon, authenticated using (true) with check (true);
create policy ltl_state_delete on public.ltl_state for delete to anon, authenticated using (true);
alter publication supabase_realtime add table public.ltl_state;
