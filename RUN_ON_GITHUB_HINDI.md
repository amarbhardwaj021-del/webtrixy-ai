# GitHub par WEBTRIXY AI run kaise karein

## Short answer

WEBTRIXY AI ko **GitHub Pages par direct run nahi kiya ja sakta**, kyunki ye project PHP 8.2 aur MySQL 8 use karta hai. GitHub Pages sirf static HTML, CSS, aur JavaScript files serve karta hai; wo PHP execute nahi karta aur MySQL database provide nahi karta.

GitHub ka kaam yahan source code store karna, version control karna, aur deployment server tak code pahunchana hai. App run karne ke liye aapko Apache + PHP 8.2+ + MySQL 8 server chahiye.

## Option 1: Local computer par run karein

### Requirements

- PHP 8.2 ya newer
- Composer
- MySQL 8
- Apache ya PHP built-in development server

### Steps

```bash
git clone https://github.com/webtrixy-ai/webtrixy-ai.git
cd webtrixy-ai
composer install
cp .env.example .env
```

MySQL me database banayein:

```sql
CREATE DATABASE webtrixy_ai CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Migration aur seed import karein:

```bash
mysql -u root -p webtrixy_ai < database/migrations/001_initial_schema.sql
mysql -u root -p webtrixy_ai < database/seeders/001_seed.sql
```

`.env` file me database values set karein:

```dotenv
APP_URL=http://localhost:8080
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=webtrixy_ai
DB_USERNAME=root
DB_PASSWORD=webtrixy_local_password
```

Server start karein:

```bash
composer serve
```

Browser me open karein:

```text
http://localhost:8080
```

Default admin login:

```text
Email: admin@webtrixy.local
Password: AdminPassword123!
```

Login ke baad admin password turant change karein.

## Option 2: cPanel hosting par GitHub se run karein

1. cPanel me **Git Version Control** open karein.
2. GitHub repository clone karein.
3. Domain ya subdomain ka document root project ke `public` folder par set karein.
4. cPanel Terminal me project root par jaakar command chalayein:

```bash
composer install --no-dev --optimize-autoloader
cp .env.example .env
```

5. cPanel **MySQL Databases** me `webtrixy_ai` database aur database user banayein.
6. **phpMyAdmin** me ye files import karein:
   - `database/migrations/001_initial_schema.sql`
   - `database/seeders/001_seed.sql`
7. `.env` file me production database, mail, app URL, app key, aur AI API keys set karein.
8. `storage` folder writable hona chahiye.
9. Domain open karein aur admin account se login karein.

## Option 3: VPS / Ubuntu Apache server par run karein

Apache, PHP extensions, MySQL, Git, aur Composer install karein:

```bash
apt update
apt install -y apache2 mysql-server git unzip php8.2 php8.2-cli php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-gd
```

Repository clone karein:

```bash
git clone https://github.com/webtrixy-ai/webtrixy-ai.git /var/www/webtrixy-ai
cd /var/www/webtrixy-ai
composer install --no-dev --optimize-autoloader
cp .env.example .env
```

Apache virtual host ka document root `public` folder hona chahiye:

```apache
<VirtualHost *:80>
    ServerName webtrixy.example.com
    DocumentRoot /var/www/webtrixy-ai/public

    <Directory /var/www/webtrixy-ai/public>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

Apache rewrite enable karein aur service restart karein:

```bash
a2enmod rewrite
systemctl restart apache2
```

Database import karein:

```bash
mysql -u webtrixy_user -p webtrixy_ai < database/migrations/001_initial_schema.sql
mysql -u webtrixy_user -p webtrixy_ai < database/seeders/001_seed.sql
```

Permissions set karein:

```bash
chown -R www-data:www-data storage
chmod -R 775 storage
```

## GitHub Actions ka role

GitHub Actions se aap automated checks chala sakte hain, jaise Composer validation aur PHP linting. GitHub Actions app ko public website ki tarah host nahi karega; wo sirf CI/CD pipeline ke liye use hota hai.

Manual verification commands:

```bash
composer validate --no-check-publish --strict
find app config public resources routes plugins -name '*.php' -print0 | xargs -0 -n1 php -l
```
