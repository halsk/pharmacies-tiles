[![CircleCI](https://circleci.com/gh/halsk/pharmacies-tiles.svg?style=svg)](https://circleci.com/gh/halsk/pharmacies-tiles)

# Vector Tile version of real time mask inventry data in Taiwan.
Vector tile version of mask inventries of the pharmacies.

# How to use

You can access vector tiles from below URL.

```
https://halsk.github.io/pharmacies-tiles/zxy/{z}/{x}/{y}.pbf
```

If you are using Mapbox-GL JS, here is the sample code of getting the data.

```
map.on('load', function() {
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
            // make circles larger as the user zooms from z12 to z22
            'circle-radius': 5,
            "circle-stroke-width": 1,
            // color circles by ethnicity, using a match expression
            'circle-color': [
                "case",
                [
                    ">",
                    ["get", "mask_adult"],
                    200
                ],
                "hsl(252, 91%, 42%)",
                [
                    ">",
                    ["get", "mask_adult"],
                    100
                ],
                "hsl(65, 97%, 57%)",
                [
                    "<",
                    ["get", "mask_adult"],
                    101
                ],
                "hsl(0, 98%, 53%)",
                "#000000"
            ]
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
And this repository's files are updated every five minutes by CircleCI. (But I'm not sure if [the data is actually refreshed](https://github.com/halsk/pharmacies-tiles/issues/7).)

Please see details [here](https://g0v.hackmd.io/@kiang/mask-info) about this datasets.


# License

[MIT License](LICENSE.txt)


# Additional resources

[tile-join を使って重たい geojson を XYZ tile に変換し GitHub でホストする方法|Qiita](https://qiita.com/hal_sk/items/eb59cb474b0e5d37dde0) (Japanese)
