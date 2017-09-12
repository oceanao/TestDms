

function GetAbsPosition(obj) 
{ 
var curleft = 0, curtop = 0; 
do { 
curleft += obj.offsetLeft; 
curtop += obj.offsetTop; 
} while (obj = obj.offsetParent); 
return [curleft,curtop]; 
} 
function ShowFloatingImage(image, width, height) 
{ 
var id = "trailimageid"; 
var newdiv = document.getElementById(id); 
if(newdiv == null) 
{ 
newdiv = document.createElement('div'); 
newdiv.setAttribute('id',id); 
newdiv.setAttribute('onmouseout', "HideElement('"+id+"');"); 
document.body.appendChild(newdiv); 
} 
newdiv.innerHTML = '<img src='+image.src+ ' width='+(image.width + width) + ' height=' + (image.height + height) + ' />'; 
var absPos = GetAbsPosition(image); 
newdiv.style.position = "absolute"; 
newdiv.style.posLeft = absPos[0] - width/2; 
newdiv.style.posTop = absPos[1] - height/2; 
newdiv.style.display="block"; 
} 
function HideElement(id) 
{ 
var elem = document.getElementById(id); 
elem.style.display="none"; 
} 

function zoom(obj,rate){ 
	obj.width=obj.width*rate; 
	obj.heigth=obj.heigth*rate; 
	} 