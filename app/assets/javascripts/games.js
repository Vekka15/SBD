
var number =0;

function loadDoc(button,val,war) {

  var przyciski = document.getElementsByClassName("button");
  for(i=0;i<przyciski.length;i++){
      przyciski[i].id=i; //id jako ze przyciski maja byc rozpoznawane unikatowo
  }
  var x =button.id; //sprawdzamy jakie id ma ten przycisk

  //wyswietlamy badz nie
  var ele=document.getElementsByClassName("present");
  if(ele[x].style.display == '' || ele[x].style.display == 'none'){ //musi byc or bo na poczatku wartosc najwidoczniej jest ''
      ele[x].style.display = 'inline';
    }else{
    ele[x].style.display = 'none';
  }

}
