require 'json'
require 'open-uri'

DISTANCE_API = "http://vldb.gsi.go.jp/sokuchi/surveycalc/surveycalc/bl2st_calc.pl?"

def distance(lat1, lng1, lat2, lng2)
  req_params = {
    outputType: "json",    # 出力タイプ
    ellipsoid:  "bessel",  # 楕円体
    latitude1:  lat1,      # 出発点緯度
    longitude1: lng1,      # 出発点経度
    latitude2:  lat2,      # 到着点緯度
    longitude2: lng2       # 到着点経度
  }
  req_param = req_params.map { |k, v| "#{k}=#{v}" }.join("&")
  result = JSON.parse(open(DISTANCE_API + req_param).read)
  result["OutputData"]["geoLength"]
end

p dist = distance(38.2446966, 140.9180064, 38.251535, 140.920777)

if dist.to_f > 50
    p "OK"
end

distdist = 38.2446966

if 38.26889 < distdist
end
