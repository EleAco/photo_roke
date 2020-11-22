// ボタンを押した時の処理
document.getElementById("get-position-btn").onclick = function(){
  // 位置情報を取得する
  navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
};

// 取得に成功した場合の処理
function successCallback(position){
  // 緯度を取得し画面に表示
  var latitude = position.coords.latitude;
  document.getElementById("latitude").innerHTML = latitude;
  document.getElementById("latitude-form").value = latitude;
  // 経度を取得し画面に表示
  var longitude = position.coords.longitude;
  document.getElementById("longitude").innerHTML = longitude;
  document.getElementById("longitude-form").value = longitude;

  var latlng = new google.maps.LatLng(latitude, longitude);

  var marker = new google.maps.Marker({
    map: map,
    position: latlng
  });

  map.setCenter(latlng);
};

// 取得に失敗した場合の処理
function errorCallback(error){
  alert("位置情報が取得できませんでした");
};

(function() {
  console.log("OK");
});