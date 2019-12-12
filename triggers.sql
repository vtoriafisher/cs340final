DELIMITER $$
CREATE TRIGGER `Before_Insert_Dog` BEFORE INSERT ON `Dog_Profile`
 FOR EACH ROW BEGIN
  IF (EXISTS(SELECT 1 FROM Dog_Profile d WHERE d.Username = NEW.Username)) THEN
SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';
END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER `Before_Insert_Hates` BEFORE INSERT ON `Hates`
 FOR EACH ROW 
BEGIN
  IF (EXISTS(SELECT 1 FROM Loves l WHERE l.Dog_ID = NEW.Dog_ID AND l.LovesDog_ID_2 = New.HatesDog_ID_2)) THEN
SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';
END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `Before_Insert_Loves` BEFORE INSERT ON `Loves`
BEGIN
  IF (EXISTS(SELECT 1 FROM Hates l WHERE l.Dog_ID = NEW.Dog_ID AND l.HatesDog_ID_2 = New.LovesDog_ID_2)) THEN
SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';
END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `Before_Insert_Visit` BEFORE INSERT ON `Visited`
 FOR EACH ROW BEGIN
  IF (EXISTS(SELECT 1 FROM Visited WHERE VisitedKey = NEW.VisitedKey)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to you already visiting it';
  END IF;
END$$
DELIMITER ;
