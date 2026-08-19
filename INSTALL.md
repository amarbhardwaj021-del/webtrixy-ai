# WEBTRIXY AI Installation

1. Upload the project to an Apache virtual host with document root set to `public/`.
2. Run `composer install --no-dev --optimize-autoloader`.
3. Create a MySQL 8 database and import `database/migrations/001_initial_schema.sql`, then `database/seeders/001_seed.sql`.
4. Copy `.env.example` to `.env` and set database, mail, app URL, app key, and AI provider keys.
5. Ensure `storage/` is writable by the web server.
6. Sign in with `admin@webtrixy.local` and password `AdminPassword123!`, then immediately rotate credentials.
