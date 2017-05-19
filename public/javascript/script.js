image = document.getElementById('imageForLayout');
navbar = document.getElementById('navBar');

image.addEventListener("mouseover",function(){
  navbar.style.display= "block";
})

image.addEventListener("click",function(){
  navbar.style.display= "none";
})
