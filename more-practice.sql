-- Include your solutions to the More Practice problems in this file.

cars=# SELECT * FROM brands LIMIT 10
;
 brand_id |    name    | founded |            headquarters            | discontinued 
----------+------------+---------+------------------------------------+--------------
 for      | Ford       |    1903 | Dearborn, MI                       |             
 chr      | Chrysler   |    1925 | Auburn Hills, Michigan             |             
 cit      | Citroen    |    1919 | Saint-Ouen, France                 |             
 hil      | Hillman    |    1907 | Ryton-on-Dunsmore, England         |         1981
 che      | Chevrolet  |    1911 | Detroit, Michigan                  |             
 cad      | Cadillac   |    1902 | New York City, NY                  |             
 bmw      | BMW        |    1916 | Munich, Bavaria, Germany           |             
 aus      | Austin     |    1905 | Longbridge, England                |         1987
 fai      | Fairthorpe |    1954 | Chalfont St Peter, Buckinghamshire |         1976
 stu      | Studebaker |    1852 | South Bend, Indiana                |         1967
(10 rows)

cars=# SELECT * FROM models LIMIT 10;
 model_id | year | brand_id |       name       
----------+------+----------+------------------
        1 | 1909 | for      | Model T
        2 | 1926 | chr      | Imperial
        3 | 1948 | cit      | 2CV
        4 | 1950 | hil      | Minx Magnificent
        5 | 1953 | che      | Corvette
        6 | 1954 | che      | Corvette
        7 | 1954 | cad      | Fleetwood
        8 | 1955 | che      | Corvette
        9 | 1955 | for      | Thunderbird
       10 | 1956 | che      | Corvette
(10 rows)

-- Insert a Brand

cars=# INSERT INTO brands 
   VALUES ('sub', 'Subaru', 1953, 'Tokyo, Japan', NULL);


-- Insert Models

cars=# SELECT * FROM brands
cars-# WHERE name LIKE '%Chev%';
 brand_id |   name    | founded |   headquarters    | discontinued 
----------+-----------+---------+-------------------+--------------
 che      | Chevrolet |    1911 | Detroit, Michigan |             
(1 row)

cars=# INSERT INTO models (year, brand_id, name)
   VALUES (2015, 'che', 'Cheverolet Malibu'),
          (2015, 'sub', 'Subaru Outback'),
;
INSERT 0 1

-- Create an Awards Table

cars=# CREATE TABLE awards(
   id SERIAL PRIMARY KEY,
   name VARCHAR(30) NOT NULL,
   year INTEGER,
   winner_id INTEGER
      REFERENCES models(model_id)
   );
CREATE TABLE

cars=# SELECT * FROM awards;
 id | name | year | winner_id 
----+------+------+-----------
(0 rows)

-- Insert Awards

cars=# INSERT INTO awards (name, year, winner_id)
cars-#    VALUES ('IIHS Saftey Award', 2015, 48),
cars-#           ('IIHS Safety Award', 2015, 47),
cars-#           ('Best in Class', 2015, NULL);
INSERT 0 3

cars=# SELECT * FROM awards;
 id |       name        | year | winner_id 
----+-------------------+------+-----------
  1 | IIHS Saftey Award | 2015 |        48
  2 | IIHS Safety Award | 2015 |        47
  3 | Best in Class     | 2015 |          
(3 rows)