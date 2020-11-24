#!/bin/bash

set -e
set -o pipefail

function cleanup {
  exit $?
}
trap "cleanup" EXIT

DIR="$(cd "$(dirname "$0")" && pwd)"


# Defibrillatoren Dispogebiet SRZ
echo -ne "Query Defibrillatoren Dispogebiet SRZ...         "
cat $DIR/queries/defis_dispo_srz.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/defis_dispo_srz.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Defibrillatoren Stadt Zürich
echo -ne "Query Defibrillatoren Stadt Zürich...            "
cat $DIR/queries/defis_stadt_zh.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/defis_stadt_zh.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Defibrillatoren Kanton Zürich
echo -ne "Query Defibrillatoren Kanton Zürich...           "
cat $DIR/queries/defis_kt_zh.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/defis_kt_zh.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Spitäler und Altersheime Dispogebiet SRZ
echo -ne "Query Spitäler und Altersheime Dispogebiet SRZ..."
cat $DIR/queries/facilities_dispo_srz.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/facilities_dispo_srz.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Spitäler und Altersheime Stadt Zürich
echo -ne "Query Spitäler und Altersheime Stadt Zürich...  "
cat $DIR/queries/facilities_stadt_zh.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/facilities_stadt_zh.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Rettungswachen Dispogebiet SRZ
echo -ne "Query Rettungswachen Dispogebiet SRZ...           "
cat $DIR/queries/ambulancestation_dispo_srz.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/ambulancestation_dispo_srz.geojson
echo -ne "\t\t - Done.\r"
echo ""

# Feuerwehrwachen Kanton Zürich
echo -ne "Query Feuerwehrwachen Kanton Zürich...           "
cat $DIR/queries/firestation_kt_zh.txt | python $DIR/overpass_query.py | osmtogeojson > $DIR/data/firestation_kt_zh.geojson
echo -ne "\t\t - Done.\r"
echo ""
