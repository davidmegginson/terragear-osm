#!/bin/sh
########################################################################
# General Shapefile layers from OSM data
########################################################################

INPUT=w080n40.o5m
LAYERS="natural waterway highway railway landuse place boundary power"

for LAYER in $LAYERS; do
    echo Extracting $LAYER ...
    osmfilter "tiles/$INPUT" --keep= --keep-nodes="$LAYER=" --keep-ways="$LAYER=" --keep-relations="$LAYER=" -o=tmp/$LAYER.osm
    echo Converting $LAYER to Shapefile ...
    rm -rf shapefiles/$LAYER
    ogr2ogr --config OSM_CONFIG_FILE config/osmconf.ini -skipfailures -f 'ESRI Shapefile' shapefiles/$LAYER tmp/$LAYER.osm
    rm -f tmp/$LAYER.osm
done
