CREATE OR REPLACE TRIGGER VPI.TRG_WASH_CYCLE
BEFORE INSERT OR UPDATE ON VPI.WASH_CYCLE
FOR EACH ROW
DECLARE
	tCycle_ID		VARCHAR2(32) := UPPER(TRIM(:new.CYCLE_ID));
	tProcedure_Name	VARCHAR2(61) := UPPER(TRIM(:new.PROCEDURE_NAME));
BEGIN
	IF tCycle_ID != :new.CYCLE_ID THEN
		:new.CYCLE_ID	:= tCycle_ID;
	END IF;

	IF tProcedure_Name != :new.PROCEDURE_NAME THEN
		:new.PROCEDURE_NAME	:= tProcedure_Name;
	END IF;

	IF INSERTING THEN
		INSERT INTO VPI.CACHE_CONTROL(CACHE_ID, DESCRIPTION_)
		VALUES (tCycle_ID, 'WASH_CYCLE.CACHE_ID');
	ELSIF UPDATING('CYCLE_ID') THEN
		UPDATE	VPI.CACHE_CONTROL
		SET		CACHE_ID	= tCycle_ID
		WHERE	CACHE_ID	= :old.CYCLE_ID;
	END IF;
END;
/
