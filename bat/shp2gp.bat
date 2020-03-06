REM ////////////////////////////////////////////////////////////////////////////////////////
REM //                                                                                    //
REM //                                                                                    //
REM //                   Configuratie voor project: GeoParaat                             //
REM //                                                                                    //
REM //                              Object Vision 2020                                    //
REM //                                                                                    //
REM ////////////////////////////////////////////////////////////////////////////////////////
REM //                                                                                    //
REM // Dit betreft de batch file die met ogr2ogr de geopackage maakt op basis van een     //
REM // verzameling shape files en dbf bestanden                                           //
REM //                                                                                    //
REM ////////////////////////////////////////////////////////////////////////////////////////

ogr2ogr -f GPKG bag_snapshot.gpkg ligplaats.shp -sql "SELECT ID AS identificatie, NUM_ID AS nummeraanduiding_id, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM ligplaats" -a_srs "EPSG:28992"
ogr2ogr -f GPKG bag_snapshot.gpkg ligplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg standplaats.shp -sql "SELECT ID AS identificatie, NUM_ID AS nummeraanduiding_id, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM standplaats" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg standplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg pand.shp -sql "SELECT ID AS identificatie, bouwjaar,woontype AS WoningType, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM pand" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg pand_status_code.dbf -append
ogr2ogr -f GPKG bag_snapshot.gpkg pand_woningtype.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg vbo.shp -sql "SELECT ID AS identificatie, nummer_id AS nummeraanduiding_identificatie, oppervl AS oppervlakte,pand_id as pand_identificatie, bijeen AS heeft_bijeenkomst_functie, cel AS heeft_cel_functie, gezondheid AS heeft_gezondheids_functie, industrie AS heeft_industrie_functie, kantoor AS heeft_kantoor_functie, logies AS heeft_logies_functie, onderwijs AS heeft_onderwijs_functie, overig AS heeft_overig_functie, sport AS heeft_sport_functie, winkel AS heeft_winkel_functie,woon AS heeft_woon_functie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM vbo" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg vbo_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg nummeraanduiding.dbf -sql "SELECT ID AS identificatie, huisnummer, huisletter, toevoeging, postcode, typeAO as typeAdresseerbaarObject, openbar_id as openbareruimte_identificatie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM nummeraanduiding" -append
ogr2ogr -f GPKG bag_snapshot.gpkg nummeraanduiding_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg openbareruimte.dbf -sql "SELECT ID AS identificatie, naam, type, woonplaats_id as woonplaats_identificatie, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM openbareruimte" -append
ogr2ogr -f GPKG bag_snapshot.gpkg openbareruimte_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg woonplaats.shp -sql "SELECT ID AS identificatie, naam as woonplaatsNaam, STATUS_rel AS StatusCode, BEGINDAT AS begindatum, EINDDAT AS einddatum, IS_OND AS Is_Onderzoek, IS_COR AS Is_Correctie, IS_INA AS Is_Inactief, IS_OFF AS Is_Officeel FROM woonplaats" -a_srs "EPSG:28992" -append
ogr2ogr -f GPKG bag_snapshot.gpkg woonplaats_status_code.dbf -append

ogr2ogr -f GPKG bag_snapshot.gpkg adres.shp -sql "SELECT id AS nummeraanduiding_identificatie, straatnaam,  huisnummer, huisletter, toevoeging, postcode, woonplaats as woonplaatsNaam FROM adres" -a_srs "EPSG:28992" -append
