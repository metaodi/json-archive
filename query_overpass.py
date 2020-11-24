# -*- coding: utf-8 -*-
"""
Query OpenStreetMap data from OverPass API
This script reads a query from stdin and writes the resulting GeoJSON to stdout

Example:
    cat queries/defis_stadt_zh.txt | python query_overpass.py > data/defis_stadt_zh.geojson
"""

import os
import sys
import traceback
import json
import overpass
from dotenv import load_dotenv, find_dotenv
load_dotenv(find_dotenv())


try:
    API_ENDPOINT = os.getenv('OVERPASS_API_ENDPOINT', 'http://overpass.osm.ch/api/interpreter')
    api = overpass.API(endpoint=API_ENDPOINT)

    query = "".join(sys.stdin.readlines())
    results = api.get(query)
    print(json.dumps(results, sort_keys=True, indent=2))
except Exception as e:
    print("Error: %s" % e, file=sys.stderr)
    print(traceback.format_exc(), file=sys.stderr)
    sys.exit(1)
