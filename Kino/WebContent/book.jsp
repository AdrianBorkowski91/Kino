<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/style.css" type="text/css" rel="stylesheet">
<style>
div.step{
	width: 23%;
	display: inline-table;
	border-style: solid;
	border-width: 2px 2px 2px 2px;
	border-color: rgb(100, 100, 100);
	border-radius: 3px;
}
div.active{
	background-color: rgb(40, 40, 40);
}
div.steps{
	display: inline-block; 
	border-bottom-color: black;
}
div.div-step{
	margin:auto; 
	margin-top:10px; 
	border-color: black; 
	width: 60%; 
	float: right;
}
div.div-summary{
	display: inline-block; 
	width: 100%;
}
button.next-button{
	width: 200px; 
	float: right;
}
input.next-button{
	width: 200px; 
	float: right;
}
div.div-reserved{
	margin:auto; 
	margin-top: 10px; 
	width: 200px; 
	height: 40px;
}
div.step-table{
	background-color: rgb(18, 18, 18);
}
select#select-tickets{
	background-color: rgb(30, 30, 30); 
	color: white;
	width: 250px;
}
input.personal-data{
	background-color: rgb(20, 20, 20);
}
ul.ul-type-data{
	width: 12rem; 
	display: inline-block; 
	margin-top: 20px;
}
li.li-type-data{
	border-color: black; 
	background-color: black; 
	text-align: left; 
	padding: 0px;
}
ul.ul-client-data{
	width: 33rem;
	display: inline-block;	
}
li.li-client-data{
	border-color: black; 
	background-color: black; 
	text-align: left; 
	padding: 0px; 
	font-style: italic;
}
div.communique{
	display: none; 
	width: 60%; 
	margin:auto; 
	margin-top: 10px;
}
/*Table ticketscom*/
td.ticket-name{
	width: 50%;
}
select.quantity-tickets{
	background-color: rgb(30, 30, 30); 
	color: white;
}
/*Table seats*/
td.seat-row{
	padding: 4px;
}
td.seat-point{
	padding: 2px;
	width: 25px; 
	height: 25px; 
}
button.seat-point{
	width: 25px;
	height: 25px;
	background-color: black; 
	color: white; 
	font-size: 8px; 
	margin:0px;
}
button.reserved{
	background-color: #cc0000;
}
button.selected{
	background-color: #0052cc;
}
td.seat-emptypoint{
	padding: 2px; 
	width: 25px; 
	height: 25px;
}
/*Table summary*/
table.table-summary{
	text-align: center; 
	font-size: 13px; 
	width: 90%; 
	margin: auto; 
	margin-bottom: 10px;
}
th.th-name{
	width: 40% ;
	text-align: center;
}
th.th-other{
	width: 20% ;
	text-align: center;
}
th.td-name{
	width: 40% ;
}
th.td-other{
	width: 20%;
}

</style>

</head>
<body onload="step1()">

	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" style="color: black;">
	    <img src="resources/icon/main_icon.png" width="30" height="30" class="d-inline-block align-top" alt="">
	    Twoje KINO
	  </a>
	</nav>

	<div class="card text-center" style="border-bottom-color: black;">
	
	  <div class="card-header">
	    <h5>REPERTUAR</h5>
      </div>

   	  <div class="card steps">
	    <div class="step" id="step-1">KROK 1: Wybierz bilet</div>
	    <div class="step" id="step-2">KROK 2: Wybierz miejsce</div>
	    <div class="step" id="step-3">KROK 3: Wpisz dane</div>
	    <div class="step" id="step-4">KROK 4: Podsumowanie</div>    
	  </div>
	  
	  <div id="div-step-1" class="div-step">
	  	<table id="table-tickets" class="table table-inverse step-table"></table>
		
		<div>
	  		<button class="btn btn-primary next-button" onclick="step2()">Dalej</button>
	  	</div>
	  </div>
	  
	  <div id="div-step-2" class="div-step">
		<div style="margin-bottom: 10px;">
			<span>Wybierz miejsce dla biletu: </span>
		    <select id="select-tickets"></select>
		</div>
		
		<table id="table-seats" class="table table-inverse step-table"></table>

		<div>
	  		<button class="btn btn-primary next-button" onclick="step3()">Dalej</button>
	  	</div>
	  </div>
	  
	  <div id="div-step-3" class="div-step">
		<h6>Uzupełnij dane:</h6>
		<div class="input-group">
		  <input id="firstname" type="text" class="form-control personal-data" placeholder="imię">
		</div>
		<div class="input-group">
		  <input id="lastname" type="text" class="form-control personal-data" placeholder="nazwisko">
		</div>
		<div class="input-group">
		  <input id="e-mail" type="text" class="form-control personal-data"  placeholder="e-mail">
		</div>
		<div class="input-group">
		  <input id="phone-number" type="text" class="form-control personal-data" maxlength="9" placeholder="numer telefonu">
		</div>
		<div class="input-group">
		  <span class="input-group-addon" id="span-code"></span>
		  <input id="code" type="text" class="form-control personal-data" placeholder="wpisz kod">
		</div>
		
		<div style="margin-top: 10px;">
	  		<button class="btn btn-primary next-button" onclick="step4()">Dalej</button>
	  	</div>
	  </div>

	   <div id="div-step-4" class="div-step" >
	   
	   	<div class="card div-summary">
	   		<h6 id="title-summary"></h6>
		    <ul class="list-group list-group-flush ul-type-data">
			    <li class="list-group-item li-type-data">imię:</li>
			    <li class="list-group-item li-type-data">nazwisko:</li>
			    <li class="list-group-item li-type-data">e-mail:</li>
			    <li class="list-group-item li-type-data">numer telefonu:</li>
  			</ul>
  			 <ul class="list-group list-group-flush ul-client-data">
			    <li id="client-data-firstname" class="list-group-item li-client-data"></li>
			    <li id="client-data-lastname" class="list-group-item li-client-data"></li>
			    <li id="client-data-email" class="list-group-item li-client-data"></li>
			    <li id="client-data-numberPhone" class="list-group-item li-client-data"></li>
  			</ul>
  			
			<h6 style="padding: 10px;">Zarezerwowane bilety:</h6>
			
  			<table id="table-summary" class="table table-inverse step-table table-summary"></table>
	  		
		</div>
		<form method="post" action="Reservation">
			<div class="div-reserved" id="div-reserved">
		  		<input type="submit" class="btn btn-success next-button" value="Rezerwuj">
		  	</div>
	  	</form>
	  	
	 </div>
	  	  
	  <div id="communique" class="alert alert-danger communique" role="alert" >
 			Musisz wybrać przynajmniej jeden bilet, aby przejść dalej.
	  </div>	  
    </div>
    
<script>

var tickets = [ 
	{name:'Bilet normalny', price: 34, row: null, seat: null},
	{name:'Bilet dziecięcy', price: 20, row: null, seat: null},
	{name:'Bilet szkolny/studencki', price: 25, row: null, seat: null},
	{name:'Bilet emerycki', price: 22, row: null, seat: null}
	];

var reservation= {
		seance:{
			filmTitle:null,
			timeStart:null,
			date:null
		},
		client:{
		    firstname:null,
		    lastname:null,
		    email:null,
		    numberPhone:null
		},
	    tickets: [] 
};
var url = 'index.php?data='+encodeURIComponent(JSON.stringify({"json":[{"j":"son"}]}));

<c:forEach var="film" items="${listFilm}">		
<c:if test="${film.idFilm  == param['id']}">
	reservation.seance.filmTitle="${film.name}";
</c:if>					
</c:forEach> 	
<c:forEach var="seance" items="${listSeance}">					 
<c:if test="${seance.idSeance == param['seance']}">
	var timeStart = "${seance.timeStart}";
	reservation.seance.timeStart=timeStart.replace(':00', '');
	reservation.seance.date=findDate("${seance.day}");
</c:if>					
</c:forEach> 	

function findDate(day){
	var date = new Date();
	var dateForm;
	
	if(day!=1){
		date.setHours(24*(day-1));
	}

	var day = date.getDate();
	
	if(day < 10){
		day= '0'+day;		
	}
	
	var month = date.getMonth()+1;
		
	if(month < 10){
		month= '0'+month;		
	}
		
	var year = date.getFullYear();
		
	dateForm=day+"."+month+"."+year;
	return dateForm;
} 

function step1(){
	elementDisplay(1);
	tableTickets();
}
function tableTickets(){
	var table= document.getElementById('table-tickets');
	
	for(var i=0; i<tickets.length; i++){
		var row = document.createElement('tr');
		
		var td1 = document.createElement('td');
		td1.className='ticket-name';
		td1.innerHTML=tickets[i].name;
		
		var td2= document.createElement('td');
		td2.innerHTML=tickets[i].price+'.00 zł';
		
		var td3= document.createElement('td');
		var select= document.createElement('select');
		select.id='ticket'+(i+1);
		select.className='quantity-tickets';
		for (var j=0; j<10; j++){
			var option= document.createElement('option');
			option.innerHTML=j;
			select.appendChild(option);		
		}
		td3.appendChild(select);
		
		row.appendChild(td1);
		row.appendChild(td2);
		row.appendChild(td3);
		table.appendChild(row);
	}
}
function step2(){	
	var sum=0;
	var index=0;
	
	for(var i=0; i<4; i++){
		var s= document.getElementById('ticket'+(i+1)).value;
		for(var j=1; j<=s; j++){
			reservation.tickets.push({name: tickets[i].name, price: tickets[i].price, row: null, seat: null});
			++index;
		}
		sum+=new Number(s);
	}
	
	if(sum==0){
		communique(2, 'block');
	}
	else{
		communique(2, 'none');
		elementDisplay(2);
		createSelect();
		tableSeats();
	}
}
function createSelect(){
	var select= document.getElementById('select-tickets');
	for(var i=0; i<reservation.tickets.length; i++){
		var option = document.createElement('option');
		option.innerHTML=reservation.tickets[i].name+': ';
		select.appendChild(option);		
	}
}
function tableSeats(){	
	var table= document.getElementById('table-seats');
	
	for(var j=1; j<=10; j++){
		
	var row = document.createElement('tr');
	var index=1;
	
		for(var i=1; i<=31; i++){
			var td = document.createElement('td');
			
			if(i!=1 && !(i>=12 && i<=16)){
				td.className='seat-point';
				var button = document.createElement('button');
				button.id='r'+j+'s'+index;
				button.innerHTML=index++;
						
				button.className='seat-point';
				button.setAttribute('onClick', 'reserveSeat(this)');
				
				td.appendChild(button);
			}
			else if(i==1){
				td.className='seat-row';
				td.innerHTML=j;
			}
			else{
				td.className='seat-emptypoint';		
			}
			row.appendChild(td);
		}
		
	table.appendChild(row);
	}
	
    <c:forEach var="seats" items="${listSeat}">					 
	 	<c:if test="${seats.idSeance == param['seance']}">
	 		<c:forEach var="seat" items="${seats.listSeats}">		
	 			var button= document.getElementById('r'+"${seat.row}"+'s'+"${seat.seat}");	
				button.disabled='true';
				button.className='seat-point reserved';
			</c:forEach> 	
		</c:if>					
    </c:forEach> 		
	
}

function reserveSeat(element){
	var idButton=element.id;
	var selectedIndex= document.getElementById('select-tickets').selectedIndex;
	var select= document.getElementById('select-tickets')[selectedIndex].value;

	var reg= idButton.split(/(\D+)/);
	var row= new Number(reg[2]);
	var seat= new Number(reg[4]);
	
	var reg2= select.split(/(\D+)/);
	var row2= new Number(reg2[2]);
	var seat2= new Number(reg2[4]);

	reservation.tickets[selectedIndex].row= row;
	reservation.tickets[selectedIndex].seat= seat;
	
	var option= document.getElementById('select-tickets').options[selectedIndex];
	option.setAttribute("selected", "selected");
	if(row2==0){
		option.innerHTML= select +" "+row+"-"+seat;
	}
	else{
		option.innerHTML= reg2[1] +" "+row+"-"+seat;
		document.getElementById('r'+row2+'s'+seat2).className='seat-point';
	}

	element.className='seat-point selected';
}
function step3(){
	if(isNotReservedAll()){
		communique(3, 'block');
	}
	else{
		communique(3, 'none');
		elementDisplay(3);
		createCode();
	}
}
function isNotReservedAll(){
	for(var i=0; i<reservation.tickets.length; i++){
		if(reservation.tickets[i].seat==null && reservation.tickets[i].row==null){
			return true;
		}
	}
	return false;
}
function createCode(){
	var code='';
	for(var i=1; i<=5; i++){
		var n= Math.floor(Math.random() * 10) +48;  
		var l= Math.floor(Math.random() * 26) +97; 

		if(i==1 || i==3){	
			var c2= String.fromCharCode(n);
			code+=c2;
		}
		else{
			var c1= String.fromCharCode(l);
			code+=c1;
		}
	}
	document.getElementById('span-code').innerHTML=code;
}
function step4(){
	  var firstname= document.getElementById('firstname').value;
	  var lastname= document.getElementById('lastname').value;
	  var email= document.getElementById('e-mail').value;
	  var phoneNumber= document.getElementById('phone-number').value;
	  var spanCode= document.getElementById('span-code').innerHTML;
	  var code= document.getElementById('code').value;
	  
	  if(isDataCorrect(firstname, lastname, email, phoneNumber, spanCode, code)){
		reservation.client.firstname= firstname;
		reservation.client.lastname= lastname;
		reservation.client.email= email;
		reservation.client.numberPhone= phoneNumber;

		communique(4, 'none');
		elementDisplay(4);
		
		dateClientSummary(); 
		tableTicketsSummary();
		setParams();
	  }
	  else{
		communique(4, 'block');
	  }
}
function isDataCorrect(firstname, lastname, email, phoneNumber, spanCode, code){
	var number=0;
	
	number+= isName(firstname, 'firstname');
	number+= isName(lastname, 'lastname');
	number+= isEmail(email);
	number+= isPhoneNumber(phoneNumber);
	number+= isCode(spanCode, code);
	
	if(number==0)
		return true;
	return false;
}
function isName(name, id){
	if(name==null || name==''){
		document.getElementById(id).style.borderColor = "red";
		return 1;
	}
	else{
		document.getElementById(id).style.borderColor = "black";
	}
	return 0;
}
function isEmail(email){
	var regEmail = /\S+@\S+\.\S+/;
	if(!regEmail.test(email)){
		document.getElementById('e-mail').style.borderColor = "red";
		return 1;
	}
	else{
		document.getElementById('e-mail').style.borderColor = "black";
	}
	return 0;
}
function isPhoneNumber(phoneNumber){
	var regPhoneNumber = /\d{9}/;
	if(!regPhoneNumber.test(phoneNumber)){
		document.getElementById('phone-number').style.borderColor = "red";
		return 1;
	}
	else{
		document.getElementById('phone-number').style.borderColor = "black";
	}
	return 0;
}
function isCode(spanCode, code){
	if(spanCode!=code){
		document.getElementById('code').style.borderColor = "red";
		return 1;
	}
	else{
		document.getElementById('code').style.borderColor = "black";
	}
	return 0;
}
function dateClientSummary(){
	document.getElementById('client-data-firstname').innerHTML =reservation.client.firstname;
	document.getElementById('client-data-lastname').innerHTML =reservation.client.lastname;
	document.getElementById('client-data-email').innerHTML =reservation.client.email;
	document.getElementById('client-data-numberPhone').innerHTML =reservation.client.numberPhone;
}
function tableTicketsSummary(){ 
	var title= document.getElementById('title-summary');
	title.innerHTML=reservation.seance.filmTitle+' ('+reservation.seance.date+' o godzinie '+reservation.seance.timeStart+')';
	
	var table= document.getElementById('table-summary');
	
	var rowTh = document.createElement('tr');
	
	var thName = document.createElement('th');
	thName.className='th-name';
	thName.innerHTML='Nazwa biletu';
	rowTh.appendChild(thName);
	
	var thRow = document.createElement('th');
	thRow.className='th-other';
	thRow.innerHTML='Rząd';
	rowTh.appendChild(thRow);
	
	var thSeat = document.createElement('th');
	thSeat.className='th-other';
	thSeat.innerHTML='Miejsce';
	rowTh.appendChild(thSeat);
	
	var thPrice = document.createElement('th');
	thPrice.className='th-other';
	thPrice.innerHTML='Cena';
	rowTh.appendChild(thPrice);
	
	table.appendChild(rowTh);
	
	var sumPrice=0;
	
	for(var i=0; i<reservation.tickets.length; i++){		
		var row = document.createElement('tr');
		
		var tdName = document.createElement('td');
		tdName.className='td-name';
		tdName.innerHTML=reservation.tickets[i].name;
		row.appendChild(tdName);
		
		var tdRow = document.createElement('td');
		tdRow.className='td-other';
		tdRow.innerHTML=reservation.tickets[i].row;
		row.appendChild(tdRow);
		
		var tdSeat = document.createElement('td');
		tdSeat.className='td-other';
		tdSeat.innerHTML=reservation.tickets[i].seat;
		row.appendChild(tdSeat);
		
		var tdPrice = document.createElement('td');
		tdPrice.className='td-other';
		tdPrice.innerHTML=reservation.tickets[i].price+'.00 zł';
		row.appendChild(tdPrice);
		
		sumPrice+=reservation.tickets[i].price;
		
		table.appendChild(row);
	}
	
	var rowFooter= document.createElement('tr');

	var tdPriceTogether = document.createElement('td');
	tdPriceTogether.colSpan = '3';
	tdPriceTogether.style.textAlign='right';
	tdPriceTogether.innerHTML= 'RAZEM: ';
	rowFooter.appendChild(tdPriceTogether);
	
	var tdPriceSum = document.createElement('td');
	tdPriceSum.innerHTML= sumPrice+'.00 zł';
	rowFooter.appendChild(tdPriceSum);
	
	table.appendChild(rowFooter);		
}
function elementDisplay(number){
	for (var i=1; i<=4; i++){
		if(number==i){
			document.getElementById('div-step-'+i).style.display= 'block';
			document.getElementById('step-'+i).className= 'step active';
		}
		else{
			document.getElementById('div-step-'+i).style.display= 'none';
			document.getElementById('step-'+i).className= 'step';			
		}
	}
	
}
function communique(step, display){
	if(step==2){
		document.getElementById('communique').style.display=display;
		document.getElementById('communique').innerHTML='Musisz wybrać przynajmniej jeden bilet, aby przejść dalej.';
	}
	else if(step==3){
		document.getElementById('communique').style.display=display;
		document.getElementById('communique').innerHTML='Musisz wybrać miejsce w sali kinowej dla wszystkich biletów, aby przejść dalej.';
	}
	else if(step==4){
		document.getElementById('communique').style.display=display;
		document.getElementById('communique').innerHTML='Musisz uzupełnić lub poprawić dane w oznaczonych okienkach, aby przejść dalej.';
	}
}
function setParams(){
	var reserved= document.getElementById('div-reserved');
	
	for(var i=1; i<=7; i++){
		var inputHidden = document.createElement('input');
		inputHidden.setAttribute("type", "hidden");
		
		switch (i) {
	    case 1:
	    	inputHidden.setAttribute("name", "seance-filmTitle");
	    	inputHidden.setAttribute("value", reservation.seance.filmTitle);
	        break;
	    case 2:
	    	inputHidden.setAttribute("name", "seance-timeStart");
	    	inputHidden.setAttribute("value", reservation.seance.timeStart);
	        break;
	    case 3:
	    	inputHidden.setAttribute("name", "seance-date");
	    	inputHidden.setAttribute("value", reservation.seance.date);
	        break;
	    case 4:
	    	inputHidden.setAttribute("name", "client-firstname");
	    	inputHidden.setAttribute("value", reservation.client.firstname);
	        break;
	    case 5:
	    	inputHidden.setAttribute("name", "client-lastname");
	    	inputHidden.setAttribute("value", reservation.client.lastname);
	        break;
	    case 6:
	    	inputHidden.setAttribute("name", "client-email");
	    	inputHidden.setAttribute("value", reservation.client.email);
	        break;
	    case 7:
	    	inputHidden.setAttribute("name", "client-numberPhone");
	    	inputHidden.setAttribute("value", reservation.client.numberPhone);
	    	break;
		}
		reserved.appendChild(inputHidden);
	}
	for (var i=1; i<=reservation.tickets.length; i++){	
		for(var j=1; j<=4; j++){
			var inputHidden = document.createElement('input');
			inputHidden.setAttribute("type", "hidden");
				switch (j) {
			    case 1:
			    	inputHidden.setAttribute("name", "tickets-"+i+"-name");
			    	inputHidden.setAttribute("value", reservation.tickets[i-1].name);
			        break;
			    case 2:
			    	inputHidden.setAttribute("name", "tickets-"+i+"-price");
			    	inputHidden.setAttribute("value", reservation.tickets[i-1].price);
			        break;
			    case 3:
			    	inputHidden.setAttribute("name", "tickets-"+i+"-row");
			    	inputHidden.setAttribute("value", reservation.tickets[i-1].row);
			        break;
			    case 4:
			    	inputHidden.setAttribute("name", "tickets-"+i+"-seat");
			    	inputHidden.setAttribute("value", reservation.tickets[i-1].seat);
			        break;
				}
			reserved.appendChild(inputHidden);
		}
	}
}
</script>

	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>