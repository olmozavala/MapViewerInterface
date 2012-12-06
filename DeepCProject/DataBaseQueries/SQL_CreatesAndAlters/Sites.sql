-- Add the Geometry column into the sites table 
SELECT AddGeometryColumn('sites','geom','4326','POINT','2')

-- Update the geom column with 
UPDATE sites SET geom = ST_GeomFromText('SRID=4326;POINT('|| longitude ||' '|| latitude ||')') 
SELECT DropGeometryColumn('sites','geom')


-------- OLD VERSION WITH GEOG column ------------
UPDATE sites SET geog = ST_GeogFromText('SRID=4326;POINT('|| longitude ||' '|| latitude ||')') 

--- Delete geography columns
ALTER TABLE sites DROP COLUMN geog CASCADE  
