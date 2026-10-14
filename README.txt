MSKETO CARBON - corrected site
1. Upload all files together to GitHub repository root.
2. Connect GitHub repo to Netlify using existing site project settings when deploy credits are available.
3. For private customer records, run customers_setup.sql in MSKETO Supabase SQL Editor once.
4. Admin username MSKETO CARBON maps to Supabase Auth account; its actual password must be configured in Supabase Auth. The site does not embed a PIN.
5. Booking opens WhatsApp with the customer details; booking is not confirmed automatically.
6. Fixed customer editing: visit_date, payment_status, work_status now populate correctly.
