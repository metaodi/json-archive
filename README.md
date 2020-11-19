# JSON Archiv

Sammlung von Overpass Abfragen und deren JSON Files.
Abgelegt in der Ordnersatruktur und nach Datum der Abfrage sortiert.

* Wichtig *
Die Daten sind direkt aus OSM exportiert.

# Overpass Abfragen

## Spitäler und Altersheime im Dispogebiet SRZ

## Defibrillatoren

### Dispogebiet SRZ

```
[out:json];
// [out:csv( ::type, ::id, ::lat, ::lon, name)];
// fetch area “Dispogebiet SRZ” to search in
(
{{geocodeArea:CH-ZH}};
{{geocodeArea:CH-SZ}};
{{geocodeArea:CH-SH}};
{{geocodeArea:CH-ZG}};
)->.searchArea;

// gather results
(
nwr["emergency"="defibrillator"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```

### Kanton ZH

```
[out:json][timeout:25];
// fetch area “CH-ZH” to search in
{{geocodeArea:CH-ZH}}->.searchArea;
// gather results
(
  // query part for: “emergency=defibrillator”
  node["emergency"="defibrillator"](area.searchArea);
  way["emergency"="defibrillator"](area.searchArea);
  relation["emergency"="defibrillator"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```

### Stadt ZH

```

[out:json][timeout:25];
// fetch area “Zurich” to search in
{{geocodeArea:Zurich}}->.searchArea;
// gather results
(
  // query part for: “emergency=defibrillator”
  node["emergency"="defibrillator"](area.searchArea);
  way["emergency"="defibrillator"](area.searchArea);
  relation["emergency"="defibrillator"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```
