INSERT INTO roles(name) VALUES ('super_admin'),('admin'),('editor'),('premium_user'),('free_user');
INSERT INTO permissions(name) VALUES ('manage_users'),('manage_plugins'),('manage_settings'),('view_analytics'),('run_tools'),('export_reports');
INSERT INTO plugins(name,slug,version,enabled,config) VALUES ('Content Tools','content-tools','1.0.0',1,JSON_OBJECT('tools',JSON_ARRAY('seo-analyzer','grammar-checker','readability-checker','content-optimizer')));
INSERT INTO users(name,email,password_hash,role,email_verified_at,credits) VALUES ('Super Admin','admin@webtrixy.local','$2y$12$6vNgcebkcr/nV9PskucmmODhBqqYU4GkLW3qL.Cq3hc2Oz1YbziRC','super_admin',NOW(),1000);
