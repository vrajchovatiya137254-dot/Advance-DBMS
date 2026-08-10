SET SERVEROUTPUT ON;

DECLARE
BEGIN
    UPDATE empl_update
    SET NEW_SAL = NEW_SAL+ (NEW_SAL * 10 / 100)
    WHERE DEPTNO = 10;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            SQL%ROWCOUNT || ' employee(s) updated successfully.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'No employee found in department 10.'
        );
    END IF;

    COMMIT;
END;
/