CREATE TABLE combined_sku (
    fullSkuId String,
    region LowCardinality(String),
    webPurchasable LowCardinality(String),
    dropship LowCardinality(String),
    itemNumber String,
    colorCode LowCardinality(String),
    itemDescription String,
    department LowCardinality(String),
    sellToCountryRegionCode LowCardinality(String),
    mddFabric LowCardinality(Nullable(String)),
    mddColor LowCardinality(Nullable(String)),
    mddFunction LowCardinality(Nullable(String)),
    mddDetail LowCardinality(Nullable(String)),
    mddFrame LowCardinality(Nullable(String)),
    mddDepth LowCardinality(Nullable(String)),
    mddItemSize LowCardinality(Nullable(String)),
    mddFill LowCardinality(Nullable(String)),
    mddSecondaryColor LowCardinality(Nullable(String)),
    mddItemStyle LowCardinality(Nullable(String)),
    mddCollection LowCardinality(Nullable(String)),
    countryCode LowCardinality(String),
    currencyCode LowCardinality(String),
    sellToCountryRegion LowCardinality(String),
    memberPrice Float64,
    contractPrice Float64,
    tradePrice Float64,
    saleStatus LowCardinality(String),
    listPrice Float64,
    salePrice Float64,
    memberListPrice Float64,
    retailOriginalPrice Float64,
    retailCurrentPrice Float64,
    outletOriginalPrice Float64,
    price Float64,
    effectiveStartDate String,
    locations Nested (
        dcId Int32,
        onHand Int32,
        madeToOrder Int32,
        onOrder Nested (
            quantity Int32,
            poNumber String
        ),
        allowable bool,
        availablityStatus LowCardinality(String),
        availablityStatusMsg LowCardinality(String)
    ),
    inStock bool,
    availablityStatus LowCardinality(String),
    availablityStatusMsg LowCardinality(String)
) ENGINE = MergeTree()
PRIMARY KEY(fullSkuId, region)
ORDER BY (fullSkuId, region, department, colorCode, mddCollection, mddFabric, mddColor, mddFunction, mddItemStyle, mddFill, mddItemSize, mddDepth)
SETTINGS allow_nullable_key = 1;