<entity-engine-xml>

    <ProdCatalog prodCatalogId="TOP_TRENDING" catalogName="TOP-TRENDING PRODUCT" useQuickAdd="Y"/>
    <ProductCategory productCategoryId="SUMMER_COLLECTION" productCategoryTypeId="CATALOG_CATEGORY" categoryName="Summer Collection"/>
    <ProductCategory productCategoryId="WOMEN_WEAR" productCategoryTypeId="CATALOG_CATEGORY" categoryName="Women Wear"/>
    <ProductCategory productCategoryId="MEN_WEAR" productCategoryTypeId="CATALOG_CATEGORY" categoryName="Men Wear"/>
    <ProductCategory productCategoryId="ELECTRONIC" productCategoryTypeId="CATALOG_CATEGORY" categoryName="Electronic"/>
    <ProductCategoryRollup parentProductCategoryId="SUMMER_COLLECTION" productCategoryId="WOMEN_WEAR" fromDate="2024-01-01 00:00:00.0"/>
    <ProductCategoryRollup parentProductCategoryId="SUMMER_COLLECTION" productCategoryId="MEN_WEAR" fromDate="2024-01-01 00:00:00.0"/>
    <ProductCategoryRollup parentProductCategoryId="SUMMER_COLLECTION" productCategoryId="ELECTRONIC" fromDate="2024-01-01 00:00:00.0"/>
    <ProdCatalogCategory prodCatalogId="TOP_TRENDING" productCategoryId="SUMMER_COLLECTION" fromDate="2024-01-01 00:00:00.0" sequenceNum="1" prodCatalogCategoryTypeId="PCCT_BROWSE_ROOT"/>
    
    <!-- Authentic Products -->
    <Product productId="W-AURA-WATCH" productTypeId="FINISHED_GOOD" internalName="Aura Rose Gold Smartwatch" isVirtual="N" isVariant="N"/>
    <Product productId="W-CLOUD-RUNNER" productTypeId="FINISHED_GOOD" internalName="CloudStride Women's Runners" isVirtual="N" isVariant="N"/>
    <Product productId="M-URBAN-CAP" productTypeId="FINISHED_GOOD" internalName="Urban Classic Snapback" isVirtual="N" isVariant="N"/>
    <Product productId="M-OXFORD-SHOES" productTypeId="FINISHED_GOOD" internalName="Oxford Premium Leather Shoes" isVirtual="N" isVariant="N"/>
    <Product productId="NEXUS-PRO-15" productTypeId="FINISHED_GOOD" internalName="Nexus Pro Gaming Laptop 15" isVirtual="N" isVariant="N"/>
    <Product productId="QUANTUM-STUDIO" productTypeId="FINISHED_GOOD" internalName="Quantum Studio Workstation" isVirtual="N" isVariant="N"/>
    
    <ProductPrice productId="W-AURA-WATCH" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="299.00"/>
    <ProductPrice productId="W-CLOUD-RUNNER" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="129.50"/>
    <ProductPrice productId="M-URBAN-CAP" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="34.99"/>
    <ProductPrice productId="M-OXFORD-SHOES" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="185.00"/>
    <ProductPrice productId="NEXUS-PRO-15" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="1499.99"/>
    <ProductPrice productId="QUANTUM-STUDIO" productPricePurposeId="PURCHASE" productPriceTypeId="DEFAULT_PRICE" currencyUomId="USD" productStoreGroupId="_NA_" fromDate="2024-01-01 00:00:00.0" price="2450.00"/>

    <ProductCategoryMember productCategoryId="WOMEN_WEAR" productId="W-AURA-WATCH" fromDate="2024-01-01 00:00:00.0" sequenceNum="1"/>
    <ProductCategoryMember productCategoryId="WOMEN_WEAR" productId="W-CLOUD-RUNNER" fromDate="2024-01-01 00:00:00.0" sequenceNum="2"/>
    <ProductCategoryMember productCategoryId="MEN_WEAR" productId="M-URBAN-CAP" fromDate="2024-01-01 00:00:00.0" sequenceNum="1"/>
    <ProductCategoryMember productCategoryId="MEN_WEAR" productId="M-OXFORD-SHOES" fromDate="2024-01-01 00:00:00.0" sequenceNum="2"/>
    <ProductCategoryMember productCategoryId="ELECTRONIC" productId="NEXUS-PRO-15" fromDate="2024-01-01 00:00:00.0" sequenceNum="1"/>
    <ProductCategoryMember productCategoryId="ELECTRONIC" productId="QUANTUM-STUDIO" fromDate="2024-01-01 00:00:00.0" sequenceNum="2"/>
    
    <ProductStoreCatalog productStoreId="9000" prodCatalogId="TOP_TRENDING" fromDate="2024-01-01 00:00:00.0" sequenceNum="2"/>

</entity-engine-xml>
