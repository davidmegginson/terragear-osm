#!/bin/sh

INPUT=north-america-latest.osm.pbf
BOUNDS=-80,40,-70,50
OUTPUT=w080n40.o5m

osmconvert source/$INPUT -b=$BOUNDS --complete-ways --complex-ways -o=tiles/$OUTPUT

