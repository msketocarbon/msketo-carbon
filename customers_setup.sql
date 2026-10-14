-- Run only in the MSKETO-CARBON project, SQL Editor.
-- Customer records are private and accessible only to authorized admins.
create table if not exists public.customers (
 id bigint generated always as identity primary key,
 name text not null,
 phone text not null default '',
 car text not null default '',
 model text not null default '',
 plate text not null default '',
 visit_date date,
 service text not null default '',
 price numeric(12,2) check (price is null or price >= 0),
 payment_status text not null default 'unpaid' check (payment_status in ('unpaid','partial','paid')),
 work_status text not null default 'booked' check (work_status in ('booked','in_progress','done')),
 notes text not null default '',
 created_at timestamptz not null default now()
);
alter table public.customers enable row level security;
revoke all on public.customers from anon;
grant select,insert,update,delete on public.customers to authenticated;
grant usage,select on sequence public.customers_id_seq to authenticated;
drop policy if exists "MSKETO admins only customer records" on public.customers;
create policy "MSKETO admins only customer records" on public.customers
 for all to authenticated
 using (exists (select 1 from public.admin_users a where a.user_id = (select auth.uid())))
 with check (exists (select 1 from public.admin_users a where a.user_id = (select auth.uid())));
