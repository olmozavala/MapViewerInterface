
--------------- Sites table -----------------------

-- Update the geom column with 
UPDATE sites SET geom = ST_GeomFromText('SRID=4326;POINT('|| longitude ||' '|| latitude ||')') 


--------------- Cruises table -----------------------

-- Updates the path of all cruises
SELECT createCruisePath(cruise_id) FROM cruises

