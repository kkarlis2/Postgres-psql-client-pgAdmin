UPDATE calendar_copy SET price =REPLACE(price,'$','');
UPDATE calendar_copy SET price =REPLACE(price,',','');
UPDATE calendar_copy SET adjusted_price=REPLACE(adjusted_price,'$','');
UPDATE calendar_copy SET adjusted_price=REPLACE(adjusted_price,',','');

/* to pedio available einai hdh boolean */


ALTER TABLE calendar_copy
ALTER COLUMN price TYPE numeric using price::numeric,
ALTER COLUMN adjusted_price TYPE numeric using adjusted_price::numeric;