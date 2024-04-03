DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `role`;

CREATE table `role` (
  id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `role` VARCHAR(255)
);

CREATE table `user` (
  id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  login VARCHAR(255),
  `password` VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  fio VARCHAR(255),
  role_id INT UNSIGNED,
  FOREIGN KEY (role_id) REFERENCES `role`(id)
);

CREATE TABLE `status` (
  id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `status` VARCHAR(255)
);

CREATE TABLE report (
  id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `number` VARCHAR (127),
  `description` TEXT,
  user_id INT UNSIGNED,
  status_id INT UNSIGNED,
  FOREIGN KEY (user_id) REFERENCES `user`(id),
  FOREIGN KEY (status_id) REFERENCES `status`(id)
);

INSERT INTO `role` (id, `role`) VALUES (1, "Администратор"), (2, "Пользователь");
INSERT INTO `status` (id, `status`) VALUES (1, "Новое"), (2, "Подтверждено"), (3, "Отклонено");
INSERT INTO `user` (
  id,
  login,
  password,
  email,
  phone,
  fio,
  role_id
) VALUES (
  1,
  "user",
  "psswd",
  "user@test.com",
  "+79998887766",
  "User User User",
  2
), (
  2,
  "admin",
  "psswd",
  "admin@test.com",
  "+79998887765",
  "Admin Admin Admin",
  1
);
INSERT INTO report (
  number,
  description,
  user_id,
  status_id
) VALUES (
  "ХX123X73",
  "Не притормозил перед пешеходным переходом",
  1,
  1
), (
  "AA124A49",
  "Проехал на красный",
  1,
  2
), (
  "ХX123X73",
  "Припарковался в неположенном месте",
  1,
  3
);
