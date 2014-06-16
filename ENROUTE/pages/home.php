<div class='container'>
    <div class="frame"></div>
    <div id="church"></div>
    <div id="tower"></div>
    <div class="corner topleft"></div>
    <div class="corner topright"></div>
    <div class="corner bottomleft"></div>
    <div class="corner bottomright"></div>

    <section id='home'>
      <a id="btngarden" href="http://localhost/zentrijk/index.php?page=grid">grid</a>
      <header id="headerhome">
        <hgroup>
          <h1 class="centercontent"><span class="invisible">Zentrijk</span></h1>
          <h2 class="centercontent">
            De stad is meer zen dan je denkt. </br>
            Vind de innerlijke geest van Kortrijk !
          </h2>
        </hgroup>
      </header>

      <p id="centerparagraph">
        Zentrijk is een app in samenwerking met En Route die jongeren </br>
        tussen 12 en 18 jaar de innerlijke geest van Kortrijk laat waarnemen </br>
        tijdens een interactieve dag. </br>
      </p>
      <a id="btndiscover" class="centercontent" href="#zentrijk">Ontdek En Route</a>
    </section>
</div>

<div class="container">
    <div class  ="frame"></div>
    <div class="corner topleft"></div>
    <div class="corner topright"></div>
    <div class="corner bottomleft"></div>
    <div class="corner bottomright"></div>

    <section id='enroute'>
      <header id="headerenroute">
        <hgroup> 
          <h1><span class='invisible'>En Route</span></h1>
          <h2 id"centerparagraph">
            En Route organiseert de hele zomer lang elke dag </br>
            een kans om jongeren tussen 12 en 18 de stad te laten waarnemen. </br>
            Deze zomer ontdekken we de innerlijke zen in Kortrijk. </br>
          </h2>
        </hgroup>
      </header>
      <div id="erleft">
        <img src="images/mapicon.png" />
        <h3>Zenspots</h3>
        <p>In kortrijk zijn er heel wat rustige plaatsen waar je terug zen kan worden. Het is aan onze leerlingen om deze plaatsen te vinden en op de map te plaatsen, zodat iedereen hier kan van genieten!</p>
      </div>
      <div id="erright">
        <img src="images/listicon.png" />
        <h3>Opdrachten</h3>
        <p>Aan de hand van enkele heel leuke opdrachten zullen we samen met de leerlingen het zengevoel van Kortrijk terugvinden. Met alle verzamelde foto’s van de opdrachten maken we samen een zengarden!</p>
      </div>
      <div class="clear"></div>
      <a id="btndiscover" href="#zentrijk">Ontdek Zentrijk</a> 
    </section>
</div>

<div class="container">
    <div class  ="frame"></div>
    <div class="corner topleft"></div>
    <div class="corner topright"></div>
    <div class="corner bottomleft"></div>
    <div class="corner bottomright"></div>
    <section id='zentrijk'>
        <header>
          <hgroup>
            <h1 id="headermap"><span class='invisible'>Kortrijk, de zen spots.</span></h1>
            <h2>Ontdek Zentrijk. Bezoek een van deze spots en word helemaal zen.</h2>
          </hgroup>
        </header>
      <div id='mapbox'></div>
      <script>
        var map = new L.mapbox.map('mapbox', 'mathlambrecht.ifcpbmpe').setView([50.826248, 3.262802999999991], 15);          

        <?php
          foreach($arrSpots as $spot)
          {?>
            var pinLayer = L.mapbox.featureLayer().addTo(map);

            var geoJson = [{ 
              "type": "Feature",
              "geometry":
              {
                "type": "Point",
                "coordinates": 
                [
                  Number(<?php echo $spot["latitude"]?>),
                  Number(<?php echo $spot["longitude"]?>)
                ]
              },
              "properties": 
              {
                "title": "<?php echo $spot['title']?>",
                "description": "<?php echo $spot['subtitle']?>",
                "icon":
                {
                  "iconUrl": "images/pin.png",
                  "iconSize": [32, 61],
                  "iconAnchor": [50, 50],
                  "popupAnchor": [0, -55],
                  "className": "dot"
                },
              }
            }];

            pinLayer.on('layeradd', function(e) 
            {
              var marker = e.layer,
                  feature = marker.feature;

              marker.setIcon(L.icon(feature.properties.icon));
          });

          pinLayer.setGeoJSON(geoJson);

          <?php } ?>
      </script>
    </section>
  </div>
</div>