SET NAMES UTF8;
DROP DATABASE IF EXISTS xz;
CREATE DATABASE xz CHARSET=UTF8;
USE xz;
#商品详情图标(xz_laptop_pic)
CREATE TABLE xz_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,
  #FOREIGN KEY(laptop_id) REFERENCES xz_laptop(lid),
  sm VARCHAR(128),
  md VARCHAR(128),
  lg VARCHAR(128)
 );
#商品类别表(xz_laptop_family)
CREATE TABLE xz_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32)
 );
 #商品表(xz_laptop)
 CREATE TABLE xz_laptop(
   lid INT PRIMARY KEY AUTO_INCREMENT,
   family_id INT,
   FOREIGN KEY(family_id) REFERENCES xz_laptop_family(fid),
   product_id INT,
   title VARCHAR(128),
   subtitle VARCHAR(128),
   price DECIMAL(10,2)
 );
#用户购物手册(xz_shopping_cart)
CREATE TABLE xz_shopping_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  #FOREIGN KEY(user_id) REFERENCES xz_user(uid),
  product_id INT,
  FOREIGN KEY(product_id) REFERENCES xz_laptop(lid),
  count INT
  );
#用户信息表(xz_user)
CREATE TABLE xz_user(
  uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  unane VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(32),
  phone VARCHAR(32) NOT NULL UNIQUE,
  avatar VARCHAR(128),
  user_name VARCHAR(128),
  gender INT
);
#用户地址表(xz_receiver_address)
CREATE TABLE xz_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  FOREIGN KEY(user_id) REFERENCES xz_user(uid),
  receiver VARCHAR(16),
  province VARCHAR(16),
  city VARCHAR(16),
  county VARCHAR(16),
  adsress VARCHAR(128),
  cellphone VARCHAR(16),
  fixedphone VARCHAR(16),
  postcode CHAR(6),
  tag VARCHAR(16),
  is_default BOOLEAN
);
#用户订单表(xz_order)
CREATE TABLE xz_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  FOREIGN KEY(user_id) REFERENCES xz_user(uid),
  address_id INT,
  FOREIGN KEY(address_id) REFERENCES xz_receiver_address(aid),
  status INT,
  order_time BIGINT,
  pay_time BIGINT,
  deliver_time BIGINT,
  received_time BIGINT
);
#用户订单详情表(xz_order_detail)
CREATE TABLE xz_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  FOREIGN KEY(order_id) REFERENCES xz_order(aid),
  product_id INT,
  FOREIGN KEY(product_id) REFERENCES xz_laptop(lid),
  count INT
);
#首页轮播图标(xz_index_carousel)
CREATE TABLE xz_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
#首页商品栏目表(xz_index_product)
CREATE TABLE xz_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic  VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);
