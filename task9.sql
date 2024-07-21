select * from sales

------ FUR-CH-10000454,	FUR-CH-10000454


select distinct product_id from sales

	



create or replace function total_data(product_id_p varchar)
returns table (
    total_sales double precision,
    total_profit double precision,
    profit_percentage double precision
) AS $$
declare
	total_sales double precision;
    total_profit double precision;
    profit_percentage double precision;
begin
    select SUM(sales), SUM(profit) INTO total_sales, total_profit
    from sales as s where s.product_id = product_id_p;
    
    if total_sales > 0 then
        profit_percentage := (total_profit / total_sales) * 100;
    else
        profit_percentage := 0;
    end if;

    RETURN query
    select total_sales, total_profit, profit_percentage;
END;
$$ LANGUAGE plpgsql;

select * from total_data('FUR-CH-10000454')

SELECT * FROM total_data('OFF-BI-10003429');



select distinct product_id from sales

SELECT SUM(sales) AS totalsales
FROM sales
WHERE product_id = 'FUR-CH-10000454';

SELECT SUM(profit) AS totalprofit
FROM sales
WHERE product_id = 'FUR-CH-10000454';





