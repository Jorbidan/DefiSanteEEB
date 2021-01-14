/*$(window).on('load', function(){​​​​ 
    console.log("allo1");
});*/
$(window).on('load', function () {
    ChargerLesCohortes();
    var cohorteSelect = $("#lesCohortes");
    cohorteSelect.on('change', function () {
        ChargerDefiFromCohorte(cohorteSelect.val());
    });
});

function GetLesCohortes() {
    return $.ajax({
        url: "/defis/cohortes",
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function AfficherLesCohortes(cohortes) {
    var cohortesSelect = $("#lesCohortes");
    cohortesSelect.empty();
    cohortesSelect.append("<option></option>");

    console.log(cohortes);

    cohortes.forEach(cohorte => {
        cohortesSelect.append('<option value="' + cohorte.id_cohorte + '" data-total="'+cohorte.km_total+'">' + cohorte.nom + '</option>')
    });
}

function ChargerLesCohortes() {
    GetLesCohortes().then(function (response) {
        AfficherLesCohortes(response.lesCohortes);
    });
}

//////////////////////////////////////////////////////////////////

function GetDefiFromCohorte(idCohorte) {
    return $.ajax({
        url: "/defis/leDefi/" + idCohorte,
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function AfficherDefiFromCohorte(lesDefis) {
    var defiDisplay = $("#defiDisplay");
    defiDisplay.empty();
    lesDefis.forEach(defi => {
        defiDisplay.append(
            '<div class="center" style="text-align: center">'+
                '<h2>'+defi.nom+'</h1>'+
            '</div>'+

            '<div class="container">'+
                '<div class="row">'+
                    '<div class="col">'+
                        '<div style="position: relative; left: 0; top: 0;">'+
                            '<img class="grayscale img-fluid" src="'+ defi.image_defi +'" alt="image defi" style="position: relative; left: 0; top: 0">'+
                            '<img class="img-fluid" src="'+ defi.image_defi +'" alt="image defi" style="position: absolute; left: 0; top: 0; clip-path: inset(0% 0% 0%  50%)">'+
                        '</div>'+
                    '</div>'+
                    '<div class="col">'+
                        '<span>Total de l\'equipe est de : '+
                            $("#lesCohortes").find(':selected').data('total')+
                        ' km!'+
                        '<form>'+
                            '<div class="input-group mb-3">'+
                                '<label class="input-group-text" for="dropdownAthletes">Qui êtes Vous?</label>'+
                                '<select class="form-control" id="dropdownAthletes">'+
                                    
                                '</select>'+
                            '</div>'+
                            '<div class="input-group mb-3">'+
                                '<input type="number" class="form-control" id="kmAjouter" placeholder="Entrez vos km ici" aria-label="Entrez vos km ici" aria-describedby="button_km">'+
                                '<button onclick="AjouterKm()" class="btn btn-success" type="button" id="button_km">Button</button>'+
                            '</div>'+
                        '</form>'+
                    '</div>'+
                '</div>'+
            '</div>'
        );
        ChargerLesAthletes(defi.id_cohorte)
    });
}

function ChargerDefiFromCohorte(idCohorte) {
    GetDefiFromCohorte(idCohorte).then(function (response) {
        console.log(response);
        AfficherDefiFromCohorte(response.leDefi);
    });
}

function GetLesAthletes(idCohorte){
    return $.ajax({
        url: "/defis/athletes/" + idCohorte,
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function ChargerLesAthletes(idCohorte) {
    GetLesAthletes(idCohorte).then(function (response) {
        console.log(response);
        AfficherLesAthletes(response.lesAthletes);
    });
}
function AfficherLesAthletes(lesAthletes){
    var dropdownAthletes = $("#dropdownAthletes");
    dropdownAthletes.empty();
    dropdownAthletes.append('<option disabled selected></option>');
    lesAthletes.forEach(athlete => {
        dropdownAthletes.append(
            "<option value='" + athlete.id_athlete + "'>" + athlete.prenom +" "+ athlete.nom + "</option>"
        );
    });
}

function AjouterKm(){
    var kmAjouter = $("#kmAjouter").value;
    var id = $("#dropdownAthletes").find(':selected').value;
        return $.ajax({
            url: "/defis/AjouterKm/" + id +','+ kmAjouter,
            methode: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        });
}

