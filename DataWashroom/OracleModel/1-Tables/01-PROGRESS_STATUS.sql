CREATE TABLE VPI.PROGRESS_STATUS
(
	PROGRESS_ID		NUMBER(9)		NOT NULL,
	TOTAL_STEPS		NUMBER(5)		DEFAULT 1				NOT NULL,
	CREATED_TIME	TIMESTAMP(3)	DEFAULT SYSTIMESTAMP	NOT NULL,
	LAST_LOG_TIME	TIMESTAMP(3)	DEFAULT SYSTIMESTAMP	NOT NULL,
	CURRENT_STEP	NUMBER(5)		DEFAULT 0				NOT NULL,
	CURRENT_STATUS	VARCHAR2(256),
	ERROR_MESSAGE	VARCHAR2(512),

	CONSTRAINT PK_PROGRESS_STATUS PRIMARY KEY (PROGRESS_ID)
);

COMMENT ON TABLE VPI.PROGRESS_STATUS
	IS 'Monitor the progress of a processing, can be used for polling the status of a running batch by UI.';

COMMENT ON COLUMN VPI.PROGRESS_STATUS.CREATED_TIME
	IS 'LAST_LOG_TIME - CREATED_TIME = SPENT_TIME';
COMMENT ON COLUMN VPI.PROGRESS_STATUS.TOTAL_STEPS
	IS 'How many steps the batch will totally have?';
COMMENT ON COLUMN VPI.PROGRESS_STATUS.LAST_LOG_TIME
	IS 'The latest log time.';
COMMENT ON COLUMN VPI.PROGRESS_STATUS.CURRENT_STEP
	IS 'Current processing step, UI can use this value to estimate the % of progress (PROGRESS_STEP/TOTAL_STEPS).';
COMMENT ON COLUMN VPI.PROGRESS_STATUS.CURRENT_STATUS
	IS 'What''s current step doing?';
