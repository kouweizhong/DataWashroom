CREATE TABLE VPI.WASH_ISTR_MERGE
(
	ISTR_ID			VARCHAR2(32)		NOT NULL,
	SRC_VIEW		VARCHAR2(61)		NOT NULL,	-- Source View (must include schema.view/table)
	SRC_FILTER		VARCHAR2(1024),
	DST_TABLE		VARCHAR2(61)		NOT NULL,	-- Destination Table (must include schema.table)
	JOIN_COLUMNS	VARCHAR2(1024)		NOT NULL,
	UPDATE_COLUMNS	VARCHAR2(1024),
	INSERT_COLUMNS	VARCHAR2(1024),

	CONSTRAINT PK_WASH_ISTR_MERGE PRIMARY KEY (ISTR_ID),
	CONSTRAINT FK_WASH_ISTR_MERGE FOREIGN KEY (ISTR_ID) REFERENCES VPI.WASH_ISTR (ISTR_ID) ON DELETE CASCADE,
	CONSTRAINT CK_WASH_ISTR_MERGE_S CHECK (INSTR(SRC_VIEW, '.') > 0),
	CONSTRAINT CK_WASH_ISTR_MERGE_D CHECK (INSTR(DST_TABLE, '.') > 0),
	CONSTRAINT CK_WASH_ISTR_MERGE_M CHECK (UPDATE_COLUMNS IS NOT NULL OR INSERT_COLUMNS IS NOT NULL)
);