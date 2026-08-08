# WEBTRIXY AI Installation Guide

## Important GitHub note

GitHub is for source control and CI. GitHub Pages cannot run this PHP/MySQL SaaS application because it only serves static files. Run the application on Apache with PHP 8.2+ and MySQL 8.

## Hindi quick answer

GitHub Pages par ye PHP/MySQL app direct run nahi hota. GitHub ko code storage ke liye use karen; app chalane ke liye Apache + PHP 8.2+ + MySQL 8 hosting chahiye. Repository server par clone karen, `composer install` chalayein, database SQL import karein, `.env` configure karein, aur Apache document root `public/` par point karein.

## Local setup

1. Clone the repository from GitHub.
2. Run `composer install`.
3. Copy `.env.example` to `.env`.
4. Create a MySQL database named `webtrixy_ai`.
5. Import `database/migrations/001_initial_schema.sql`.
6. Import `database/seeders/001_seed.sql`.
7. Set database, SMTP, app URL, app key, and AI provider keys in `.env`.
8. Run `composer serve`.
9. Open `http://localhost:8080`.

## Production Apache setup

1. Upload, clone, or pull the repository onto the server.
2. Run `composer install --no-dev --optimize-autoloader`.
3. Configure the Apache document root to the `public/` directory.
4. Enable Apache rewrite support so `public/.htaccess` can route requests to `public/index.php`.
5. Create a MySQL 8 database and import the migration and seeder SQL files.
6. Configure `.env` with production database, SMTP, APP_URL, APP_KEY, and AI provider credentials.
7. Ensure `storage/` is writable by the Apache user.
8. Restart Apache.
9. Sign in with `admin@webtrixy.local` and password `AdminPassword123!`, then immediately rotate the credentials.

## Verification commands

Run these from the repository root before deploying:

```bash
composer validate --no-check-publish --strict
find app config public resources routes plugins -name '*.php' -print0 | xargs -0 -n1 php -l
```
