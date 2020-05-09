<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/main.css">
<title>Asiakkaiden listaus</title>
</head>
<body>
	<table id="listaus">
		<thead>	
			<tr>
			<th colspan="5"> <input type="button" id="lisaa" value="Lisää uusi asiakas"></th>		
			</tr>
			<tr>
				<th colspan="2" class="oikealle">Hakusana:</th>
				<th><input type="text" id="hakusana"></th>
				<th><input type="button" id="hae" value="Hae"></th>
				<th></th>	
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>			
				<th>&nbsp;</th>	
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script>

	$(document).ready(function(){	
		
		$("#lisaa").click(function(){
			document.location="lisaaasiakas.jsp";
		});
		$(document.body).on("keydown", function(event){
			  if(event.which==13){ //Enteriä painettu, ajetaan haku
				  haeTiedot();
			  }
		});	
		$("#hae").click(function(){	
			haeTiedot();
		});
		$("#hakusana").focus();//viedään kursori hakusana-kenttään sivun latauksen yhteydessä
		haeTiedot();
		});
	
function haeTiedot(){	
	$("#listaus tbody").empty();
	//$.getJSON on $.ajax:n alifunktio, joka on erikoistunut jsonin hakemiseen. Kumpaakin voi tässä käyttää.
	$.getJSON({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
	//$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>"; 
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>"; 
        	htmlStr+="<td><span class='poista' onclick=poista("+field.asiakas_id+")>Poista</span></td>"; 
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });
    }});	
}


function poista(asiakas_id) {
	if (confirm("Poista asiakas?")) {
	$.ajax({url:"asiakkaat/"+asiakas_id, type:"DELETE", dataType:"json", success:function(result) {
		if(result.response==0) {
			// Tarvitsee ehkä vaihtaa 
			alert("Asiakkaan poisto epäonnistui.");
		}else if(result.response==1) {
			alert("Asiakkaan poisto onnistui.");
			haeTiedot();
			}
		}});
	}
}
</script>
</body>
</html>