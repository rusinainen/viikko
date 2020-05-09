<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/main.css">
</head>
<body>
<form id="tiedot">
<table>
	<thead>
		<tr>
			<th colspan="5" class="oikealle"><span id="takaisin">Takaisin listaukseen</span></th>
		</tr>
		<tr>
			<th>Asiakasnumero</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sposti</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="text" name="asiakas_id" id="asiakas_id"></td>
			<td><input type="text" name="etunimi" id="etunimi"></td>
			<td><input type="text" name="sukunimi" id="sukunimi"></td>
			<td><input type="text" name="puhelin" id="puhelin"></td> 
			<td><input type="text" name="sposti" id="sposti"></td> 
			<td><input type="submit" id="tallenna" value="Lis��"></td>
		</tr>
	</tbody>
</table>
</form>
<span id="ilmo"></span>
<script>
$(document).ready(function(){
		
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
		
	$("#tiedot").validate({						
		rules: {
			asiakas_id:  {
				required: true,
				number: true,
				minlength: 1				
			},	
			etunimi:  {
				required: true,
				minlength: 2,
				maxlength: 50
			},
			sukunimi:  {
				required: true,
				minlength: 2,
				maxlength: 50
			},	
			puhelin:  {
				required: true,
				minlength: 4,
				maxlength: 20
			},
			sposti:  {
				required: true,
				minlength: 5,
				maxlength: 100
			}
		},
		messages: {
			asiakas_id: {     
				required: "Puuttuu",
				number: "Ei kelpaa"
			},
			etunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			},
			sposti:  {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitk�"
			}
		},			
		submitHandler: function(form) {	
			lisaaTiedot();
		}		
	});   
	$("#asiakas_id").focus();
});
function lisaaTiedot(){
	$.post({url:"LisaaAsiakas", data:$("#tiedot").serialize(), success:function(result) {  //Tiedot kulkevat palvelimelle POST-metodilla
        if(result==0){
        	$("#ilmo").html("Asiakkaan lis��minen ep�onnistui.");
        }else if(result==1){
			//document.location="listaaasiakkaat.jsp";
        	$("#ilmo").html("Asiakkaan lis��minen onnistui.");
        	$("#asiakas_id, #etunimi, #sukunimi, #puhelin, #sposti").val("");
		}
    }});	
}
</script>
</body>
</html>