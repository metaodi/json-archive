import overpass
from pprint import pprint
import json

# use the Swiss Overpass
api = overpass.API(endpoint="http://overpass.osm.ch/api/interpreter")

# Adapted Overpass Query from https://github.com/Schutz-Rettung-Zurich/json-archive
defi_zurich = """
area[name="Zürich"]["wikipedia"="de:Zürich"]->.zurich;
// gather results
(
  node["emergency"="defibrillator"](area.zurich);
  way["emergency"="defibrillator"](area.zurich);
  relation["emergency"="defibrillator"](area.zurich);
);
// print results
out body;
>;
out skel qt;
"""
results = api.get(defi_zurich)
with open('data/defis_stadt_zh.geojson', 'w') as t:
    t.write(json.dumps(results, sort_keys=True, indent=2))
