[out:json];
// [out:csv( ::type, ::id, ::lat, ::lon, name)];
// fetch area “Dispogebiet SRZ” to search in
(
area[name="Zürich"]["wikipedia"="de:Zürich"];
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
