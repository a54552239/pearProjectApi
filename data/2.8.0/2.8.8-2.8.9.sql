SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

update pear_project_menu set params = ':org' where id = 120;
update pear_project_node set is_auth = 0 where id = 512;

SET FOREIGN_KEY_CHECKS = 1;
