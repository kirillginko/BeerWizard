function change() {
   var img1 = "heart_stroke.svg",
       img2 = "heart_full.svg";
   var imgElement = document.getElementById('test');

imgElement.src = (imgElement.src === img1) ? img2 : img1;

}
