# n8n-inggodb-backups

GitHub Actions workflow that automatically backs up a Supabase database on a daily schedule.

This repository also hosts the **n8n-AI public landing pages** used for Google OAuth branding
verification (see below).

---

## Database backup workflow

| File | Description |
|------|-------------|
| `.github/workflows/backup.yaml` | Supabase DB backup — runs daily at midnight |
| `prisma/backups/` | Latest backup files (roles, schema, data) |

### Required secrets / variables

| Name | Type | Description |
|------|------|-------------|
| `SUPABASE_DB_URL` | Secret | Full Supabase connection string |
| `BACKUP_ENABLED` | Variable | Set to `true` to enable backups |

---

## Public landing pages

A minimal Express.js web server serves two public pages required for Google OAuth
consent-screen branding verification.

| Path | Description |
|------|-------------|
| `/` | Public home page — describes n8n-AI, no login required |
| `/privacy` | Privacy policy page, no login required |

### Running locally

```bash
npm install
npm start
# → http://localhost:3000/
# → http://localhost:3000/privacy
```

### Deploying on Render

1. Connect this repository to a new **Web Service** on [Render](https://render.com).
2. Render will detect `render.yaml` and configure the service automatically.
3. Set your custom domain (e.g. `yourdomain.com`) in the Render dashboard and update DNS.
4. In Google Cloud Console → **OAuth consent screen**:
   - **Home page URL**: `https://yourdomain.com/`
   - **Privacy Policy URL**: `https://yourdomain.com/privacy`
   - **Authorized domain**: `yourdomain.com`

> **Note:** The contact email placeholder `support@n8n-inggo.onrender.com` in the HTML files
> should be replaced with a real address you control before submitting for Google verification.

---

## License

MIT
