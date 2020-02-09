task :default do
    sh "curl https://raw.githubusercontent.com/kiang/pharmacies/master/json/points.json | tippecanoe -f -o pharmacies.mbtiles --base-zoom=2"
    sh "tile-join --output-to-directory=zxy --force --no-tile-compression --no-tile-size-limit pharmacies.mbtiles"
end
