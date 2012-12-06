--ALTER TABLE cruises ADD COLUMN geog geography(LINESTRING)
--SELECT * FROM 

--DROP FUNCTION getCruisePath(text)
CREATE OR REPLACE FUNCTION createCruisePath(text) RETURNS void AS $$
	
	UPDATE cruises 
	SET geog = (
	SELECT St_MakeLine(sites.track) AS cruisePath FROM(
		SELECT geometry(s.geog) as track
		FROM 
		events as e JOIN activities as a ON e.activity_id = a.activity_id
		JOIN cruises as c ON c.activity_id = a.activity_id
		JOIN sites as s ON s.site_id = e.site_id
		WHERE c.cruise_id = $1
		ORDER BY e.event_date
	) AS sites)
	WHERE cruise_id = $1

$$ LANGUAGE SQL;

SELECT createCruisePath(cruise_id) FROM cruises

--Creates a view that contains the sites and events, and SQL to select events'
--CREATE VIEW sites_events AS SELECT site_id,name,geog, '#SELECT * FROM events WHERE site_id = '||name||'#' as Events FROM sites
--CREATE VIEW sites_events AS SELECT site_id,name,geog FROM sites
--WHERE site_id > 

--CREATE VIEW sites_events AS 
--SELECT s.name as site, e.event_id as event, s.geog
--FROM sites as s JOIN events as e on e.site_id = s.site_id