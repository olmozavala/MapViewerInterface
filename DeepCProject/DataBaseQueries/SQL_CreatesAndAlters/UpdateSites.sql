UPDATE sites SET geog = ST_GeogFromText('SRID=4326;POINT('|| longitude ||' '|| latitude ||')') 
