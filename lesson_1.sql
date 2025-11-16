
-- 1. Drop foreign_key ở bảng favorite_food để sửa cột person_id
ALTER TABLE favorite_food DROP FOREIGN KEY fk_fav_food_person_id;

-- 2. Modify cột person_id với auto_increment
ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT


-- 3. Thêm lại foreign key
ALTER TABLE favorite_food
ADD CONSTRAINT fk_fav_food_person_id
FOREIGN KEY (person_id) REFERENCES person(person_id);


-- 4. Insert dữ liệu vào bảng favorite_food
INSERT INTO favorite_food(person_id, food) VALUES (1, 'pizza');
INSERT INTO favorite_food(person_id, food) VALUES (1, 'cookies');
INSERT INTO favorite_food(person_id, food) VALUES (1, 'tacos');

-- 5. Query to retrieves favorite foods in alphabetical order using `order by` clause where Person with id = 1
SELECT favorite_food.food FROM favorite_food WHERE person_id = 1 ORDER BY food;

-- 6. Insert another person
INSERT INTO person(person_id, first_name, last_name, gender, birth_date, street, city, state, country, postal_code) VALUES (null, 'Susan','Smith', 'F', '1975-11-02',
'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

-- 7. Updating data
UPDATE person SET
street = '171 Bach mai',
city = 'Hanoi',
state = 'Mien Bac',
country = 'Vietnam',
postal_code = '100012'
WHERE person.person_id = 1;

-- 8. Deleting Data
DELETE FROM person WHERE person.person_id = 2

-- 9. Drop table
DROP TABLE favorite_food;
DROP TABLE person;

