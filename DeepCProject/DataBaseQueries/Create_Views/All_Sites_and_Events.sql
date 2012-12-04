-- This view has all the sites and all the events
-- realized on each site. The results are order by date
CREATE OR REPLACE VIEW sites_events AS 
SELECT a.activity_id,       e.event_type_id,        s.name as site, 
       e.event_id as event, e.event_date as date,   et.name as event_type, 
       s.geog
FROM sites as s 
JOIN events as e on e.site_id = s.site_id
JOIN eventtype as et on e.event_type_id = et.event_type_id
JOIN activities as a on a.activity_id = e.activity_id
ORDER BY e.event_date DESC
