
--------------- Sites table -----------------------
-- Add the Geometry column into the sites table 
SELECT AddGeometryColumn('sites','geom','4326','POINT','2')


--------------- Cruises table -----------------------
-- Add the Geometry column into the cruises table 
SELECT AddGeometryColumn('cruises','geom','4326','LINESTRING','2')

-- This function receives a 'cruise_id' and searchs for
-- the sites of that cruise and updates its 'path'
CREATE OR REPLACE FUNCTION createCruisePath(text) RETURNS void AS $$
	
	UPDATE cruises 
	SET geom = (
	SELECT St_MakeLine(sites.track) AS cruisePath FROM(
		SELECT geometry(s.geom) as track
		FROM 
		events as e JOIN activities as a ON e.activity_id = a.activity_id
		JOIN cruises as c ON c.activity_id = a.activity_id
		JOIN sites as s ON s.site_id = e.site_id
		WHERE c.cruise_id = $1 and s.geom <> ''
		ORDER BY e.event_date
	) AS sites)
	WHERE cruise_id = $1

$$ LANGUAGE SQL;



------------------------ VIEWS ------------------
--- This view has all the cruises
CREATE OR REPLACE VIEW all_cruises AS 
SELECT (ROW_NUMBER() OVER (ORDER BY c.cruise_id ASC)) % 10 as color,
    c.cruise_id as id, c.depart_date as dep, 
    c.return_date as ret, c.geom,
    p.first_name || ' ' || p.last_name as name
FROM cruises as c
JOIN people as p on c.chief_scientist = p.people_id
WHERE c.geom <> ''


-- This view has all the sites and all the events
-- realized on each site. The results are order by date
CREATE OR REPLACE VIEW sites_events AS 
SELECT a.activity_id,       e.event_type_id,        s.name as site, 
       e.event_id as event, e.event_date as date,   et.name as event_type, 
       s.geom
FROM sites as s 
JOIN events as e on e.site_id = s.site_id
JOIN eventtype as et on e.event_type_id = et.event_type_id
JOIN activities as a on a.activity_id = e.activity_id
WHERE s.geom <> ''
ORDER BY e.event_date DESC
