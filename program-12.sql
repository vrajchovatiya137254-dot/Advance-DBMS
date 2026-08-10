BEGIN

    UPDATE empl_update
    SET new_sal = new_sal * 1.05
    WHERE deptno = 20;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found in Department 20.');
    ELSE

        INSERT INTO empl_update
            (empid, old_sal, new_sal, deptno)
        SELECT
            empid,
            old_sal,
            new_sal,
            deptno
        FROM empl_update
        WHERE deptno = 20;

        DBMS_OUTPUT.PUT_LINE(
            'Salary updated for ' || SQL%ROWCOUNT || ' employee(s).'
        );

    END IF;

END;
/