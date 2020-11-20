# JSON Archiv

Sammlung von Overpass Abfragen und deren JSON Files.
Abgelegt in der Ordnerstruktur und nach Datum der Abfrage sortiert.

**Wichtig**
Die Daten sind direkt aus OSM exportiert.

## Sinn und Zweck

Sinn dieses Archivs ist es, Datenveränderungen später nachzuvollziehen. Grundsätzlich werden nicht jeden Monat immer alle GeoJSON gezogen, es besteht noch kein Automatismus dazu. Issue dazu wird noch erstellt.
Die JSON Datensammlung soll stetig wachsen und und so ein sauberes Archiv generieren.

## Overpass Abfragen

Nicht abschliessend und laufend erweitert.

<details><summary>Abfragen ausklappen</summary>
<p>

## Spitäler und Altersheime

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
nwr["social_facility"="nursing_home"]["name"!~"^$"](area.searchArea);
nwr["social_facility"="group_home"]["name"!~"^$"](area.searchArea);
nwr["amenity"="hospital"]["name"!~"^$"](area.searchArea);
nwr["amenity"="nursing_home"]["name"!~"^$"](area.searchArea);
nwr["healthcare"="hospital"]["name"!~"^$"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```

### Stadt Zürich

```
[out:json];
// [out:csv( ::type, ::id, ::lat, ::lon, name)];
// fetch area “Dispogebiet SRZ” to search in
(
{{geocodeArea:Zurich}};
)->.searchArea;
// gather results
(
nwr["social_facility"="nursing_home"]["name"!~"^$"](area.searchArea);
nwr["social_facility"="group_home"]["name"!~"^$"](area.searchArea);
nwr["amenity"="hospital"]["name"!~"^$"](area.searchArea);
nwr["amenity"="nursing_home"]["name"!~"^$"](area.searchArea);
nwr["healthcare"="hospital"]["name"!~"^$"](area.searchArea);
);
// print results
out body;
>;
out skel qt;
```

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

</p>
</details>

## Automation