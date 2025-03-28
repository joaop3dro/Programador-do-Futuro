function alterarBotao(nome){ 
    var element = document.getElementById(nome);
    element.classList.remove("x-btn-default-large"); 
    element.classList.remove("x-btn"); 
    element.classList.add("btn"); 
    element.classList.add("btn-danger"); 
//	element.classList.add("aDinos");
}


function addBordaEdit(nome){
	var element = document.getElementById(nome); 
	element.classList.add("form-check-input"); 	
}