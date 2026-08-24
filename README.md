# LTL — GitHub + Vercel + Supabase PostgreSQL + Realtime

1. Create a Supabase project.
2. Supabase → SQL Editor → run `schema.sql`.
3. Supabase → Project Settings → API: copy Project URL and the `anon` public key.
4. Put them into `supabase-config.js`:

```js
window.LTL_SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
window.LTL_SUPABASE_ANON_KEY = 'YOUR_ANON_PUBLIC_KEY';
```

Never put a `service_role` key in the browser.

Upload the repository files to GitHub, then import the repository into Vercel. Vercel automatically deploys connected GitHub pushes. The HTML talks directly to Supabase; no persistent Node server is needed.

Shared `nexus_*` state is stored in PostgreSQL and delivered to open browsers with Supabase Realtime. The online counter uses Realtime Presence.

The original account system is client-side and stores passwords in `nexus_users`. This package preserves that existing functionality, but it is not production-grade authentication. For a public production deployment, migrate login/registration/roles to Supabase Auth + a protected profiles/roles table and never expose passwords.
