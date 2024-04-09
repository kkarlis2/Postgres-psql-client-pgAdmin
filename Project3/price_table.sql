CREATE TABLE public.Price
AS(SELECT id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
  FROM listings_copy);


UPDATE price  SET weekly_price = REPLACE(weekly_price,'$','');
UPDATE price SET weekly_price = REPLACE(weekly_price,',','')
UPDATE price SET price=REPLACE (price,'$','');
UPDATE price SET price=REPLACE (price,',','');
UPDATE price SET monthly_price= REPLACE (monthly_price,'$','');
UPDATE price SET monthly_price = REPLACE (monthly_price,',','');
UPDATE price SET security_deposit= REPLACE (security_deposit,'$','');
UPDATE price SET security_deposit = REPLACE (security_deposit,',','');
UPDATE price SET cleaning_fee = REPLACE (cleaning_fee,'$','');
UPDATE price SET extra_people =REPLACE (extra_people,'$','');



ALTER TABLE Public.Price
ALTER COLUMN price TYPE numeric using price::numeric,
ALTER COLUMN weekly_price TYPE numeric using weekly_price::numeric,
ALTER COLUMN monthly_price TYPE numeric using monthly_price::numeric,
ALTER COLUMN security_deposit TYPE numeric using security_deposit::numeric,
ALTER COLUMN cleaning_fee TYPE numeric using cleaning_fee::numeric,
ALTER COLUMN extra_people TYPE numeric using extra_people::numeric,
ALTER COLUMN minimum_nights_avg_ntm TYPE numeric using minimum_nights_avg_ntm::numeric,
ALTER COLUMN maximum_nights_avg_ntm TYPE numeric using maximum_nights_avg_ntm::numeric;



ALTER TABLE public.listings_copy
DROP COLUMN price
DROP COLUMN weekly_price,
DROP COLUMN monthly_price,
DROP COLUMN security_deposit,
DROP COLUMN cleaning_fee,
DROP COLUMN guests_included,
DROP COLUMN extra_people,
DROP COLUMN minimum_nights,
DROP COLUMN maximum_nights,
DROP COLUMN minimum_minimum_nights,
DROP COLUMN maximum_minimum_nights,
DROP COLUMN minimum_maximum_nights,
DROP COLUMN maximum_maximum_nights,
DROP COLUMN minimum_nights_avg_ntm,
DROP COLUMN maximum_nights_avg_ntm;

ALTER TABLE public.Price
ADD PRIMARY KEY (id);

ALTER TABLE public.Price
ADD FOREIGN KEY(id)
REFERENCES listings_copy(id);




