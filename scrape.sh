#!/bin/bash

#given an AliExpress site, output info in the format:
#[Product Name], [Price], [Sale %]

PAGE=$1

wget -O alipage -q "$PAGE"

PRODNAME=`cat alipage | grep "product-name"      | sed 's/.*">//' | sed 's/<.*//'`

FULLPRICE=`cat alipage | grep "j-sku-price"       | sed 's/.*">//' | sed 's/<.*//'`

SALEPRICE=`cat alipage | grep "itemprop"          | sed 's/.*itemprop="price">//' | sed 's/<.*//'`

SALEPERCENT=`cat alipage | grep "p-discount-rate" | sed 's/.*">-//' | sed 's/<.*//'`

rm alipage

echo $PRODNAME","$FULLPRICE","$SALEPRICE","$SALEPERCENT
