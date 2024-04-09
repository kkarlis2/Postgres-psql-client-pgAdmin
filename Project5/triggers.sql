/* TRIGGER NUMBER 1 */
CREATE OR REPLACE FUNCTION host_log() RETURNS TRIGGER AS $host_log$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
				UPDATE host
				SET calculated_listings_count=calculated_listings_count+1
				WHERE new.host_id=host.id;
		ELSEIF(TG_OP = 'DELETE') THEN
				UPDATE host
				SET calculated_listings_count=calculated_listings_count-1
				WHERE old.host_id=host.id;
        END IF;
        RETURN NULL;
    END;
$host_log$ LANGUAGE plpgsql;

CREATE TRIGGER host
AFTER INSERT OR UPDATE OR DELETE ON listing_copy
    FOR EACH ROW EXECUTE FUNCTION host_log();
	

/* Example 1 for insert */	
insert into listing_copy values(11111,'gg',1111111111111111,'2020-03-18','ff','gg','gg','gg','gg','','',',','','','','','','','',37177,'','','','',true,1,2,3,4,'2020-03-18',1,2,'','','','','',',','','','',true,'','',true,false,'',false,false,6,0,0,'0.22');
/* Example 1 for delete*/
delete from listing_copy where listing_copy.id=11111;

/* TRIGGER NUMBER 2*/


CREATE OR REPLACE FUNCTION review_summary_copy_log() RETURNS TRIGGER AS $review_summary_copy_log$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
			INSERT INTO review_summary_copy SELECT new.listing_id,CURRENT_DATE;
		ELSEIF(TG_OP = 'DELETE') THEN
			DELETE FROM review_summary_copy where listing_id=old.listing_id and date=old.date;
        END IF;
        RETURN NULL;
    END;
$review_summary_copy_log$ LANGUAGE plpgsql;

CREATE TRIGGER review_summary_copy
AFTER INSERT OR UPDATE OR DELETE ON review_copy
    FOR EACH ROW EXECUTE FUNCTION review_summary_copy_log();

/* Example 2 for insert */
INSERT INTO review_copy values(11111111,222222222,CURRENT_DATE,121212121,'Konstantinos','Very good apartment');

/* Example 2 for delete */
delete from review_copy
where review_copy.listing_id=11111111

