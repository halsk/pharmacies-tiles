task :default do
    sh "curl https://raw.githubusercontent.com/kiang/pharmacies/master/json/points.json | tippecanoe -f -o mbtiles/pharmacies.mbtiles"
    sh "tile-join --output-to-directory=zxy --force --no-tile-compression --no-tile-size-limit mbtiles/pharmacies.mbtiles"
end