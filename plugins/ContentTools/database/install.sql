INSERT INTO plugins(name,slug,version,enabled,config) VALUES ('Content Tools','content-tools','1.0.0',1,JSON_OBJECT()) ON DUPLICATE KEY UPDATE enabled=1,version=VALUES(version);
