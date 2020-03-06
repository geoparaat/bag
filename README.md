# Handleiding

De volgende stappen zijn nodig om zelf een GeoPackage te genereren:

1) Installeer een GeoDMS versie 7.202 of recenter via http://wiki.objectvision.nl/index.php/GeoDms_Setups

2) Installeer de tool: ogr2org bijvoorbeeld via: https://live.osgeo.org/en/download.html

3) Download or clone the scripts van: https://github.com/geoparaat/bag

4) Download de BAG van: http://geodata.nationaalgeoregister.nl/inspireadressen/atom/inspireadressen.xml. Gebruik het script: cfg/Xml2FSS.dms om hiervan een FSS database te maken,
zie de beschrijving op: http://www.objectvision.nl/geodms/projects/bag-toolkit/bag-xml-2-fss.
Afhankelijk van de machine zal dit tussen de 30 en 60 minuten duren.

5) Maak een snapshot van de BAG voor de gewenste datum, ruimtelijke selectie en status selectie, met het behulpd van het script: cfg/MakeSnapshot.dms.
Zie de beschrijving op http://www.objectvision.nl/geodms/projects/bag-toolkit/make-snapshot voor hoe een snapshot te maken.
Afhankelijk van de machine en de omvavng van de snapshot zal dit tussen de 5 en 60 minuten duren.

6) Pas nu bovenin het script: cfg/SnapshotFSS2ShapeFiles.dms, de volgende regel aan:

	parameter<string> SnapshotFSSDir := '%SourceDataDir%/BAG/snapshots.ext/20200101', 

Laat deze verwijzen naar de folder waarin de snapshot fss bestanden van stap 5 in zijn weggeschreven.

7) Open vervolgens dit aangepaste script in de GeoDMS en activeer het item: ExporteerAlleShapeFiles (bijvoorbeeld via een dubbelklik)
Afhankelijk van de machine en de omvang van de snapshot zal dit tussen de 15 en 45 minuten duren.
De resulterende shape files zijn nu weggeschreven in de folder: %LocalData%/BAG_shapes/%SnapshotFSSDate%. Zie in de GeoDMSGUI bij Tools > Options > naar welke fysieke folder de %LocalData% placeholder verwijst.

8) Kopieer nu het bat/shp2gp.bat bestand naar dezelfde folder als bij 7, waar de shape files in te vinden zijn.

9) Activeer de OSGeo4W Shell of op een andere wijze een command prompt, waarbij ogr2ogr in het pad gevonden kan worden.

10) Ga met de MsDOS prompt naar de folder waarin je bij 8 het shp2gp.bat bestand hebt neergezet.

11) Run de batch file: shp2gp.bat, er wordt nu in dezelfde folder een GeoPackage bestand gemaakt, afhankelijk van de machine en de omvang van snapshot zal dit proces tussen de 15 en 45 minuten duren.
