-- SQL script to create a stored procedure AddBonus that adds a new correction for a student.
-- Procedure AddBonus takes 3 inputs: user_id, project_name, and score.

-- Drop the existing AddBonus procedure if it exists
DROP PROCEDURE IF EXISTS AddBonus;

-- Change the delimiter to handle the procedure definition
DELIMITER $$

-- Create the AddBonus procedure
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT )
BEGIN
    IF NOT EXISTS(SELECT name FROM projects WHERE name=project_name) THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id from projects WHERE name=project_name), score);
END$$

-- Reset the delimiter to the default
DELIMITER ;
