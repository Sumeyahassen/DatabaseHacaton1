CREATE DATABASE ecommerce_db;
-- Create brand tables
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create product_category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Create product_image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- Create size_category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create size_option table
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create product_item table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    size_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- Create product_variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Create attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('text', 'number', 'boolean') NOT NULL
);

-- Create product_attribute table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
INSERT INTO brand (name, description) VALUES
('Apple', 'Technology company specializing in electronics.'),
('Nike', 'Sportswear and athletic footwear brand.'),
('Samsung', 'Electronics and home appliances.'),
('Adidas', 'Footwear and clothing company.'),
('Dell', 'Computer technology company.');
INSERT INTO product_category (category_name) VALUES
('Electronics'),
('Footwear'),
('Clothing'),
('Accessories');
INSERT INTO product (name, base_price, brand_id, category_id) VALUES
('iPhone 14', 999.99, 1, 1),
('Nike Air Max 90', 150.00, 2, 2),
('Samsung Galaxy S23', 899.00, 3, 1),
('Adidas Ultraboost Shoes', 180.00, 4, 2),
('Dell XPS 13 Laptop', 1200.00, 5, 1),
('Apple Watch Series 9', 399.00, 1, 1),
('Adidas Hoodie', 70.00, 4, 3),
('Nike Sports Bag', 55.00, 2, 4);
INSERT INTO product_image (product_id, image_url) VALUES
(1, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-front'),
(1, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-back'),
(2, 'https://static.nike.com/a/images/t_prod/nike-air-max-90-side.jpg'),
(2, 'https://static.nike.com/a/images/t_prod/nike-air-max-90-top.jpg'),
(3, 'https://images.samsung.com/is/image/samsung/p6pim/galaxy-s23_front.jpg'),
(3, 'https://images.samsung.com/is/image/samsung/p6pim/galaxy-s23_back.jpg'),
(4, 'https://assets.adidas.com/images/w_600/ultraboost_black_shoes.jpg'),
(5, 'https://i.dell.com/sites/imagecontent/products/PublishingImages/xps-13-9315-laptop/dell-laptops-xps-13-9315-hero-504x350.jpg'),
(6, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/apple-watch-series-9-black'),
(7, 'https://assets.adidas.com/images/w_600/adidas-hoodie-black.jpg'),
(8, 'https://static.nike.com/a/images/t_prod/nike-sports-bag.jpg');
INSERT INTO color (color_name) VALUES
('Red'),
('Black'),
('White'),
('Blue'),
('Gray');
INSERT INTO size_category (name) VALUES
('Storage Size'),
('Shoe Size'),
('Clothing Size'),
('Device Size');
INSERT INTO size_option (size_category_id, size_value) VALUES
(1, '128GB'),
(1, '256GB'),
(2, '42'),
(2, '43'),
(3, 'S'),
(3, 'M'),
(3, 'L'),
(4, '38mm'),
(4, '42mm');
-- iPhone 14
INSERT INTO product_item (product_id, size_id, color_id) VALUES
(1, 1, 1),
(1, 2, 2),

-- Nike Air Max 90
(2, 3, 2),
(2, 4, 3),

-- Samsung Galaxy S23
(3, 1, 4),
(3, 2, 5),

-- Dell XPS 13
(5, 2, 5),

-- Apple Watch Series 9
(6, 8, 2),

-- Adidas Hoodie
(7, 5, 2),
(7, 6, 3),
(7, 7, 4),

-- Nike Sports Bag
(8, NULL, 2); -- No size for bag
-- iPhone 14 variations
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(1, 1, 1),
(1, 2, 2);

-- Nike shoes variations
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(2, 2, 3),
(2, 3, 4);

-- Samsung S23 variations
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(3, 4, 1),
(3, 5, 2);

-- Dell Laptop variation
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(5, 5, 2);

-- Apple Watch variations
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(6, 2, 8);

-- Hoodie variations
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(7, 2, 5),
(7, 3, 6),
(7, 4, 7);

-- Bag
INSERT INTO product_variation (product_id, color_id, size_id) VALUES
(8, 2, NULL);
INSERT INTO attribute_category (name) VALUES
('Technical'),
('Physical'),
('Fashion');
INSERT INTO attribute_type (type_name) VALUES
('text'),
('number'),
('boolean');
-- iPhone 14 attributes
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value) VALUES
(1, 1, 2, 'Battery Life (hours)', '20'),
(1, 2, 2, 'Weight (grams)', '172'),
(1, 1, 3, 'Water Resistant', 'true'),

-- Samsung Galaxy S23
(3, 1, 2, 'Battery Life (hours)', '22'),
(3, 2, 2, 'Weight (grams)', '168'),
(3, 1, 3, 'Water Resistant', 'true'),

-- Dell XPS 13
(5, 1, 2, 'RAM (GB)', '16'),
(5, 1, 2, 'Storage (GB)', '512'),
(5, 2, 2, 'Weight (grams)', '1200'),

-- Apple Watch
(6, 1, 2, 'Battery Life (hours)', '18'),
(6, 2, 2, 'Weight (grams)', '32'),

-- Adidas Hoodie
(7, 3, 1, 'Material', 'Cotton'),
(7, 3, 2, 'Weight (grams)', '500'),

-- Nike Sports Bag
(8, 3, 1, 'Material', 'Polyester'),
(8, 2, 2, 'Capacity (Liters)', '30');












