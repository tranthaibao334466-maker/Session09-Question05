CREATE PROCEDURE calculate_total_sales(
    start_date DATE,
    end_date DATE,
    OUT total NUMERIC
)
LANGUAGE plpgsql AS
$$
    BEGIN
        SELECT SUM(amount) INTO total 
        FROM sales WHERE sale_date BETWEEN start_date AND end_date;
    END;
$$;

DO
$$
    DECLARE 
        result NUMERIC; 
    BEGIN 
        CALL calculate_total_sales('2024-01-01' , '2024-03-01', result );
        RAISE NOTICE 'The total sales from Jan to Mar is: %', result;
    END;
$$;