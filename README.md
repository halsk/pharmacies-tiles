[![CircleCI](https://circleci.com/gh/halsk/pharmacies-tiles.svg?style=svg)](https://circleci.com/gh/halsk/pharmacies-tiles)

# Vector Tile version of real time inventry data in Taiwan.
Vector tile version of mask inventries of the pharmacies.

# How to use

You can access vector tiles from below URL.

```
https://halsk.github.io/pharmacies-tiles/zxy/{z}/{x}/{y}.pbf
```

If you are using Mapbox-GL JS, here is the sample code of getting the data.

```
map.on('load', function() {
  // Add Pharmacy sequence layer.
  map.addLayer({
        "id": "pharmacies",
        "type": "circle",
        "source": {
            "type": "vector",
            "tiles": ["https://halsk.github.io/pharmacies-tiles/zxy/{z}/{x}/{y}.pbf"],
            "maxzoom": 14
        },
        "source-layer": "pharmacies",
        "paint": {
            "circle-radius": 3,
            "circle-color": "#000000",
            "circle-stroke-width": 1
        }
    })
});
```

Please see [index.html](https://halsk.github.io/pharmacies-tiles/index.html) to see a full example.


# About data

The data itself is located in the `gh-pages` branch and hosted by the GitHub Pages function.

This vector tile is based on @kiang's GeoJson file.

- GeoJson: https://raw.githubusercontent.com/kiang/pharmacies/master/json/points.json
- GitHub: https://github.com/kiang/pharmacies

The @kiang's data is created from [Taiwan government data](https://data.gov.tw/dataset/116285). The original data source is updated every 30 seconds.
And this repository's files are updated every minutes by CircleCI.

Please see details [here](https://g0v.hackmd.io/@kiang/mask-info) about this datasets.

# License

[MIT License](LICENSE.txt)