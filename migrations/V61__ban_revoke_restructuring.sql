ALTER TABLE ban
  ADD COLUMN revoke_reason TEXT,
  ADD COLUMN revoke_author_id MEDIUMINT UNSIGNED,
  ADD COLUMN revoke_time TIMESTAMP NULL DEFAULT NULL,
  ADD CONSTRAINT ban_revoke_author FOREIGN KEY (author_id) REFERENCES login (id);

UPDATE ban
  JOIN ban_revoke ON ban.id = ban_revoke.ban_id
SET ban.revoke_reason  = ban_revoke.reason,
  ban.revoke_author_id = ban_revoke.author_id,
  ban.revoke_time      = ban_revoke.create_time;

DROP TABLE ban_revoke;