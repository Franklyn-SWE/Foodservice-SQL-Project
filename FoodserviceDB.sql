---- Franklyn Oliha. Student ID: @ 00403552.  -------------- ---------Task 2  --------------------------------------------------------------------------------------------------------------------
CREATE DATABASE FoodserviceDB;

USE FoodserviceDB;
GO

--- Foreign keys added to the tables 
ALTER TABLE Ratings
ADD FOREIGN KEY (Consumer_ID) REFERENCES Consumers (Consumer_ID);

ALTER TABLE Ratings
ADD FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant (Restaurant_ID);
	  
ALTER TABLE Restaurant_Cuisines
ADD FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant (Restaurant_ID);


---1. Listing all restaurants with a medium range price with open area,serving Mexican food.

--a) joining Restaurant table with Cuisines table then filtered the required columns


SELECT r.Restaurant_ID,r.Name,r.Price,r.Area,rc.Cuisine
FROM Restaurants r INNER JOIN Restaurant_cuisines rc
ON r.Restaurant_ID=rc.Restaurant_ID
WHERE r.Price='Medium'AND  r.Area='Open' AND rc.Cuisine='Mexican';


--2. 
/**
SELECT Count(Restaurant_ID) as Total_Number_Of_Restaurant
FROM Restaurants ;  **/


SELECT COUNT (*)  as total_Numbers_of_Mexican_food_Restaurants
FROM ratings as t INNER JOIN restaurant_cuisines as c 
ON t.Restaurant_ID=c.Restaurant_ID
WHERE c.cuisine='mexican' AND t.overall_rating='1'

SELECT COUNT (*)  as Total_Numbers_of_Italian_food_Restaurants
FROM Ratings as t INNER JOIN Restaurant_Cuisines as c 
ON t.Restaurant_ID=c.Restaurant_ID
WHERE c.cuisine='Italian' AND t.overall_rating='1'

--- Dinstinct counting the numbers of Mexican  hotel with overall rating of 1.
SELECT  COUNT ( Distinct c.Restaurant_ID )
FROM ratings as t INNER JOIN restaurant_cuisines as c 
ON t.Restaurant_ID=c.Restaurant_ID
WHERE c.cuisine='mexican' AND t.overall_rating='1'

--- Dinstinct counting the numbers of Italian hotel with overall rating of 1.
SELECT COUNT (Distinct c.Restaurant_ID)  as 'Numbers of Italian Food Restuarants'
FROM ratings as t INNER JOIN restaurant_cuisines as c 
ON t.Restaurant_ID=c.Restaurant_ID
WHERE c.cuisine='Italian' AND t.overall_rating='1'
-----Question 3.

--Filtering consumer ages with 0 on service rating
SELECT r.Consumer_ID,(r.Age),p.Consumer_ID,p.Service_Rating
FROM Consumers r INNER JOIN Ratings p
ON r.Consumer_ID=p.Consumer_ID
WHERE p.Service_Rating='0';


-- Filtering consumer with average of  0 service rating
SELECT   AVG(r.Age) as 'Average Age of Consumer with 0 Rating on Service Rating'
FROM Consumers r INNER JOIN Ratings p
 ON r.Consumer_ID=p.Consumer_ID
 WHERE p.Service_Rating='0';


---------------------------------------------------------------------------------------------
-- Question 4.

--- Displaying the age of consumers rankings sorting results from the youngest 
SELECT r.Name,t.Food_Rating,c.Age
FROM consumers c INNER JOIN Ratings t
ON  c.Consumer_ID=t.Consumer_ID INNer JOIN Restaurants r
ON r.Restaurant_ID=t.Restaurant_ID
order BY Age asc

--- Showing the results of resurants ranked by the youngest consumers - sorting the results from high -low
SELECT r.Name,t.Food_Rating, c.Age as 'Min Age'
FROM consumers c INNER JOIN ratings t
ON  c.Consumer_ID=t.Consumer_ID INNER JOIN Restaurants r
ON r.Restaurant_ID=t.Restaurant_ID
WHERE c.Age = (select min(Age) from consumers)
order BY Food_Rating desc


--------------------------------------------------------
--Question 5.
  

 CREATE PROCEDURE updateServiceRating

AS
BEGIN
        
        UPDATE Ratings
        SET Service_Rating = '2'
		WHERE Restaurant_ID IN (SELECT r.Restaurant_ID
		FROM Restaurants r inner join Ratings t 
		ON r.Restaurant_ID = t.Restaurant_ID
        WHERE Parking= 'Public' OR Parking = 'Yes')		
    
END;
EXEC updateServiceRating;

-- Testing the store procedure query result to checl if yes and public in parking updated to 2. 
select t.Service_Rating, r.Parking
FROM Restaurants r INNER JOIN Ratings t
ON t. Restaurant_ID = r.Restaurant_ID
WHERE  Parking =  'Public' or Parking = 'Yes'


--- Question 6 - Solutions 
-- Using the Exists to filter the numbers of students with cars using nested or subqueries 
SELECT Count (*) Transportation_Method 
FROM consumers
WHERE EXISTS (SELECT * FROM  restaurants n WHERE n.Restaurant_ID = n.Restaurant_ID 
AND Transportation_Method = 'Car'  and Occupation = 'Student' );

--- Average of consumers that are older than 20 based on marital status and listed by oldest first. 
SELECT AVG (Age) AS 'Average age of consumers older than 20', Marital_Status 
FROM consumers
GROUP BY Marital_Status
HAVING AVG  (Age ) >20   Order by Marital_Status desc;

--- Checking restaurant with the public parking and the overall rating 1.
SELECT * FROM Ratings
 WHERE Restaurant_ID IN ( SELECT Restaurant_ID
                                               FROM restaurants
											   WHERE Parking = 'Public'  AND Overall_Rating=1);


--- Using the system function ISNULL to fill the null values in marital status column in the consumer's table. 
SELECT Consumer_ID, ISNULL( Marital_Status, 'Unknown') AS 'Marital_Status' FROM consumers; 

 --- A stored procedure that selects all tables for easier access
CREATE  PROCEDURE  SelectAllTables
AS 
BEGIN 
SELECT * FROM  consumers
SELECT * FROM Ratings
SELECT * FROM Restaurants
SELECT * FROM Restaurant_cuisines
END;

EXEC SelectAllTables;
