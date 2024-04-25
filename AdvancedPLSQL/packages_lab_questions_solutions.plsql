--Advanced PL/SQL Lab 2
--Packages Lab 

--1-Create a package specification and body called LOC_PKG, containing a copy of your ADD_LOC procedure and Query_LOC, function as well as your GET_LOC function.


-- Package Spec
CREATE OR REPLACE PACKAGE loc_pkg IS

PROCEDURE add_loc(v_loc_id number, v_city varchar2);
PROCEDURE add_loc(v_loc_id number, v_street_address varchar2, v_postal_code varchar2, v_city varchar2, v_state_province varchar2, v_country_id char);

FUNCTION query_loc (loc_id number) RETURN varchar2;

FUNCTION get_loc(loc_city out varchar2, loc_id number) RETURN varchar2;

END;


-- Package Body
CREATE OR REPLACE PACKAGE BODY loc_pkg IS
PROCEDURE add_loc(v_loc_id number, v_street_address varchar2, v_postal_code varchar2, v_city varchar2, v_state_province varchar2, v_country_id char) IS

unique_exception EXCEPTION;
foreign_exception EXCEPTION;

PRAGMA EXCEPTION_INIT(foreign_exception, -02291);
PRAGMA EXCEPTION_INIT(unique_exception, -00001);

BEGIN
    
    INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
        VALUES (v_loc_id, v_street_address, v_postal_code, v_city, v_state_province, v_country_id);


EXCEPTION

    WHEN unique_exception THEN
        dbms_output.put_line(' There us a unique value constraint, kindly change the value');

   WHEN foreign_exception THEN
         dbms_output.put_line(' There is a foreign key constraint, Kindly consider the values');
END;

FUNCTION query_loc (loc_id number) RETURN varchar2 IS


    v_location_id number(8,2);
    v_street_address varchar2(50);
    v_postal_code varchar2(50);
    v_city varchar2(50);
    v_country_name varchar2(50);
    v_region_name varchar2(50);
    
  new_loc varchar2(1000);

BEGIN


    SELECT loc.location_id, loc.street_address, loc.postal_code, LOC.CITY, C.COUNTRY_NAME, REG.REGION_NAME
    INTO v_location_id, v_street_address, v_postal_code, v_city, v_country_name, v_region_name
    FROM locations loc INNER JOIN countries c
    ON LOC.COUNTRY_ID = C.COUNTRY_ID 
    INNER JOIN regions reg
    ON C.REGION_ID = REG.REGION_ID
    WHERE loc.location_id = loc_id;

    
    new_loc := v_region_name || ' ' || v_country_name || ' ' || v_location_id || '  ' || v_street_address || '  ' || v_postal_code || '  ' || v_city;
    return new_loc;

END;

FUNCTION get_loc(loc_city out varchar2, loc_id number) RETURN varchar2 IS

loc_street_address varchar2(100);
v_city varchar2(100);
new_loc varchar2(100);
BEGIN

    SELECT street_address, city
    INTO loc_street_address, v_city
    FROM locations
    WHERE location_id = loc_id;

new_loc := loc_street_address || v_city;
return new_loc;

END;

end;

--2-Copy and modify the code for the LOC_PKG package that you created and overload the ADD_LOC procedure.  As you can insert only city only, and use sequence to insert location_id.


-- Package Body
CREATE OR REPLACE PACKAGE BODY loc_pkg IS
PROCEDURE add_loc(v_loc_id number, v_city varchar2) IS

BEGIN
    
    INSERT INTO locations (location_id, city)
        VALUES (loc_pkg_seq.nextval, v_city);

END;


PROCEDURE add_loc(v_loc_id number, v_street_address varchar2, v_postal_code varchar2, v_city varchar2, v_state_province varchar2, v_country_id char) IS

unique_exception EXCEPTION;
foreign_exception EXCEPTION;

PRAGMA EXCEPTION_INIT(foreign_exception, -02291);
PRAGMA EXCEPTION_INIT(unique_exception, -00001);

BEGIN
    
    INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
        VALUES (loc_pkg_seq.nextval, v_street_address, v_postal_code, v_city, v_state_province, v_country_id);


EXCEPTION

    WHEN unique_exception THEN
        dbms_output.put_line(' There us a unique value constraint, kindly change the value');

   WHEN foreign_exception THEN
         dbms_output.put_line(' There is a foreign key constraint, Kindly consider the values');
END;

FUNCTION query_loc (loc_id number) RETURN varchar2 IS


    v_location_id number(8,2);
    v_street_address varchar2(50);
    v_postal_code varchar2(50);
    v_city varchar2(50);
    v_country_name varchar2(50);
    v_region_name varchar2(50);
    
  new_loc varchar2(1000);

BEGIN


    SELECT loc.location_id, loc.street_address, loc.postal_code, LOC.CITY, C.COUNTRY_NAME, REG.REGION_NAME
    INTO v_location_id, v_street_address, v_postal_code, v_city, v_country_name, v_region_name
    FROM locations loc INNER JOIN countries c
    ON LOC.COUNTRY_ID = C.COUNTRY_ID 
    INNER JOIN regions reg
    ON C.REGION_ID = REG.REGION_ID
    WHERE loc.location_id = loc_id;

    
    new_loc := v_region_name || ' ' || v_country_name || ' ' || v_location_id || '  ' || v_street_address || '  ' || v_postal_code || '  ' || v_city;
    return new_loc;

END;

FUNCTION get_loc(loc_city out varchar2, loc_id number) RETURN varchar2 IS

loc_street_address varchar2(100);
v_city varchar2(100);
new_loc varchar2(100);
BEGIN

    SELECT street_address, city
    INTO loc_street_address, v_city
    FROM locations
    WHERE location_id = loc_id;

new_loc := loc_street_address || v_city;
return new_loc;

END;

end;

--3-Create a package specification and body called DEPT_PKG, be creating ADD_DEPT ( 4 params ) , UPD_DEPT ( 4 params ), and DEL_DEPT(1 param) procedures as well as your GET_DEPT function( 1 param ) return dept_name only

-- PACKAGE SPEC
CREATE OR REPLACE PACKAGE dept_pkg IS

PROCEDURE add_dpt (dep_id number, dep_name varchar2, dep_manager_id number, dep_loc_id number);

PROCEDURE upd_dept (dep_id number, dep_name varchar2, dep_manager_id number, dep_loc_id number);

PROCEDURE del_dept (dep_id number);

FUNCTION get_dept (dep_name varchar2) RETURN departments%rowtype;
FUNCTION get_dept(dep_id number) RETURN varchar2;

END;
-- Package body
CREATE OR REPLACE PACKAGE BODY dept_pkg IS

PROCEDURE add_dpt (dep_id number, dep_name varchar2, dep_manager_id number, dep_loc_id number) IS



BEGIN

    INSERT INTO departments VALUES
    (dep_id, dep_name, dep_manager_id, dep_loc_id);


END;

PROCEDURE upd_dept (dep_id number, dep_name varchar2, dep_manager_id number, dep_loc_id number) IS



BEGIN

    UPDATE departments
    SET department_id = dep_id,
            department_name = dep_name,
            manager_id = dep_manager_id,
            location_id = dep_loc_id
     WHERE department_id = dep_id;


END;

PROCEDURE del_dept (dep_id number) IS



BEGIN

    DELETE FROM departments
    WHERE department_id = dep_id;


END;

FUNCTION get_dept(dep_id number) RETURN varchar2 IS

dep_name varchar2(100);
BEGIN


    SELECT department_name
    INTO dep_name
    FROM departments
    WHERE department_id = dep_id;
    
    RETURN dep_name;
    
END;
end;


-- 4. Modify DEPT_PKG by adding GET_DEPT function overloading that accepts DEPT_name, and return %departments row type.

CREATE OR REPLACE FUNCTION get_dept (dep_name varchar2) RETURN departments%rowtype  IS

dep_record departments%rowtype;

BEGIN


    SELECT *
    INTO dep_record
    FROM departments
    WHERE department_name = dep_name;
    
    return dep_record;
END;
