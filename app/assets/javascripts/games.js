
var number =0;
function loadDoc(button,val,war) {
   if (button.className==''){
     button.className=number;
     number=number+1;
   }
  var i =button.className;
  var ele=document.getElementsByClassName("present");
  if(ele[i].style.display == '' || ele[i].style.display == 'none'){ //musi byc or bo na poczatku wartosc najwidoczniej jest ''
      ele[i].style.display = 'inline';
    }else{
    ele[i].style.display = 'none';
  }

}
