SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearproject`.`pear_task_tag` ENGINE = InnoDB, COMMENT = '任务标签表', ROW_FORMAT = Compact;

ALTER TABLE `pearproject`.`pear_task_tag` DROP COLUMN `color_value`;

ALTER TABLE `pearproject`.`pear_task_to_tag` ENGINE = InnoDB, COMMENT = '任务标签映射表', ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS=1;
