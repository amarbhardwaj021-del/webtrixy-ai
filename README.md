# WEBTRIXY AI

AI Powered SEO, GEO & Content Intelligence Platform built with Core PHP 8.2, Pure MVC, PDO, MySQL 8, Bootstrap 5, TinyMCE, Chart.js, PHPMailer, and DomPDF.

## Can this run directly on GitHub?

No. GitHub stores the code and can run CI checks, but GitHub Pages does not execute PHP or MySQL applications. To run WEBTRIXY AI you need a PHP 8.2+ server with Apache and MySQL 8, such as a VPS, cPanel hosting, Plesk hosting, Docker host, or local XAMPP/Laragon/MAMP environment.

## Run locally after cloning from GitHub

```bash
git clone https://github.com/webtrixy-ai/webtrixy-ai.git
cd webtrixy-ai
composer install
cp .env.example .env
```

Create a MySQL database named `webtrixy_ai`, then import:

```bash
mysql -u root -p webtrixy_ai < database/migrations/001_initial_schema.sql
mysql -u root -p webtrixy_ai < database/seeders/001_seed.sql
```

Update `.env` with your local database credentials:

```dotenv
APP_NAME="WEBTRIXY AI"
APP_URL=http://localhost:8080
APP_ENV=production
APP_KEY=replace-with-a-64-character-random-secret-generated-for-your-install
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=webtrixy_ai
DB_USERNAME=root
DB_PASSWORD=webtrixy_local_password
```

Start the PHP development server:

```bash
composer serve
```

Open `http://localhost:8080` in your browser. The first seeded admin account is:

- Email: `admin@webtrixy.local`
- Password: `AdminPassword123!`

Change the seeded admin email and password immediately after first login.

## Deploy from GitHub to Apache hosting

1. Push this repository to GitHub.
2. On your hosting server, clone or pull the repository:

```bash
git clone https://github.com/webtrixy-ai/webtrixy-ai.git /var/www/webtrixy-ai
cd /var/www/webtrixy-ai
composer install --no-dev --optimize-autoloader
cp .env.example .env
```

3. Point the Apache virtual host document root to:

```text
/var/www/webtrixy-ai/public
```

4. Create a MySQL 8 database and import the migration and seed files:

```bash
mysql -u webtrixy_user -p webtrixy_ai < database/migrations/001_initial_schema.sql
mysql -u webtrixy_user -p webtrixy_ai < database/seeders/001_seed.sql
```

5. Edit `.env` on the server with production values, including `APP_URL`, database credentials, SMTP credentials, and AI provider keys.
6. Make storage writable by the web server:

```bash
chown -R www-data:www-data storage
chmod -R 775 storage
```

7. Restart Apache:

```bash
systemctl restart apache2
```

## Deploy on cPanel from GitHub

1. In cPanel, open **Git Version Control** and clone your GitHub repository.
2. Set the domain or subdomain document root to the repository `public` folder.
3. Open **Terminal** in cPanel and run `composer install --no-dev --optimize-autoloader` from the repository root.
4. Create a database in **MySQL Databases** and import both SQL files using **phpMyAdmin**.
5. Copy `.env.example` to `.env` and set your real production database, mail, and AI credentials.
6. Confirm the `storage` directory is writable by the hosting account.


## Hindi quick answer: GitHub par run kaise karen?

GitHub Pages par ye project direct run nahi hoga, kyunki ye PHP aur MySQL SaaS app hai. GitHub par code push karen, phir hosting server ya cPanel par repository clone karen, Composer dependencies install karen, MySQL database import karen, `.env` configure karen, aur domain ka document root `public/` folder par set karen. Local testing ke liye `composer serve` chalakar `http://localhost:8080` open karen.

## Useful commands

```bash
composer validate --no-check-publish --strict
find app config public resources routes plugins -name '*.php' -print0 | xargs -0 -n1 php -l
composer serve
```
