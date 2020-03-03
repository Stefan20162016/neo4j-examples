#!/usr/bin/bash

#export DATA=/Users/markneedham/projects/yelp-graph-algorithms/data/
export DATA=/home/bm/code/neo4j/yelp-graph-algorithms/data/

echo $DATA

neo4j-admin import \
    --max-memory=16G \
    --database=yelp5 \
    --nodes=Business=$DATA/business_header.csv,$DATA/business.csv \
    --nodes=Category=$DATA/category_header.csv,$DATA/category.csv \
    --nodes=User=$DATA/user_header.csv,$DATA/user.csv \
    --nodes=Review=$DATA/review_header.csv,$DATA/review.csv \
    --nodes=City=$DATA/city_header.csv,$DATA/city.csv \
    --nodes=Area=$DATA/area_header.csv,$DATA/area.csv \
    --nodes=Country=$DATA/country_header.csv,$DATA/country.csv \
    --relationships=IN_CATEGORY=$DATA/business_IN_CATEGORY_category_header.csv,$DATA/business_IN_CATEGORY_category.csv \
    --relationships=FRIENDS=$DATA/user_FRIENDS_user_header.csv,$DATA/user_FRIENDS_user.csv \
    --relationships=WROTE=$DATA/user_WROTE_review_header.csv,$DATA/user_WROTE_review.csv \
    --relationships=REVIEWS=$DATA/review_REVIEWS_business_header.csv,$DATA/review_REVIEWS_business.csv \
    --relationships=IN_CITY=$DATA/business_IN_CITY_city_header.csv,$DATA/business_IN_CITY_city.csv \
    --relationships=IN_AREA=$DATA/city_IN_AREA_area_header.csv,$DATA/city_IN_AREA_area.csv \
    --relationships=IN_COUNTRY=$DATA/area_IN_COUNTRY_country_header.csv,$DATA/area_IN_COUNTRY_country.csv \
    --skip-bad-relationships=true
    #--ignore-missing-nodes=true #\
#    --multiline-fields=true
# IMPORT DONE in 4m 13s 653ms
#Imported:
#  8518170 nodes
#  29142158 relationships
#  24297548 properties

# failed FRIENDS relationships:~ 61 million rows in: 6,8G /var/lib/neo4j/data/databases/import.report
