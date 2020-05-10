SET FOREIGN_KEY_CHECKS=0;

update pear_project_menu set url = 'project/list', file_path = 'project/list', params = ':type', `values` = 'deleted' where id = 152;
update pear_project_menu set url = 'project/list', file_path = 'project/list', params = ':type', `values` = 'archive' where id = 159;


SET FOREIGN_KEY_CHECKS=1;
