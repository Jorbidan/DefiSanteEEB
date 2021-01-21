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
    cohortesSelect.append("<option disabled selected></option>");

    console.log(cohortes);

    cohortes.forEach(cohorte => {
        cohortesSelect.append('<option value="' + cohorte.id_cohorte + '">' + cohorte.nom + '</option>')
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
        var percentImage = 100 - (defi.km_cumul * 100 / defi.km_defi);
        if (defi.image_defi == null) {
            defi.image_defi = 'http://zone.eebeauce.com/zone/EEB_LOGO_MOBILE.png';
            percentImage = 0;
        }
        defiDisplay.append(
            '<div class="center" style="text-align: center">'+
                '<h2>'+defi.nom+'</h2>'+
                '<h4> Un défi de '+defi.km_defi+' km</h4>'+
            '</div>'+
            
            '<div class="container">'+
                '<div class="row">'+
                    '<div class="col">'+
                        '<div style="position: relative; left: 0; top: 0;">'+
                            '<img class="grayscale img-fluid" src="'+ defi.image_defi +'" alt="image defi" style="position: relative; left: 0; top: 0">'+
                            '<img class="img-fluid" src="'+ defi.image_defi +'" alt="image defi" style="position: absolute; left: 0; top: 0; clip-path: inset(0% 0% 0%  '+ percentImage +'%)">'+
                        '</div>'+
                    '</div>'+
                    '<div class="col">'+
                        '<span>Le total de l\'equipe est de : '+
                            defi.km_cumul +
                        ' km!'+
                        '<form>'+
                            '<div class="input-group mb-3">'+
                                '<label class="input-group-text" for="dropdownAthletes">Qui êtes Vous?</label>'+
                                '<select class="form-control" id="dropdownAthletes">'+
                                    
                                '</select>'+
                            '</div>'+
                            '<div class="input-group mb-3">'+
                                '<input type="number" class="form-control" id="kmAjouter" placeholder="Entrez vos km ici" aria-label="Entrez vos km ici" aria-describedby="button_km">'+
                                '<button onclick="AjouterKm()" class="btn btn-success" type="button" id="button_km">Ajouter!</button>'+
                            '</div>'+
                        '</form>'+
                        '<div class="card" style="background-color:#dda145;">'+
                            '<div class="card-body">'+
                                '<h5 class="card-title">Tableau de distance</h5>'+
                                    '<p class="card-text">'+
                                        'Course: distance réelle<br>'+
                                        'Marche: distance réelle<br>'+
                                        'Crossfit ou entraînement au gym: 1 heure = 10 km<br>'+
                                        'Vélo de route: 1 heure = distance / 2<br>'+
                                        'Donc si vous faites 20 km, vous inscrivez 10 km<br>'+
                                        'Vélo de montagne avec dénivelé: distance réelle<br>'+
                                        'Yoga: 1 heure = 6 km<br>'+
                                        'Sports d\'équipe: 1 heure = 8 km'+
                                    '</p>'+
                            '</div>'+
                        '</div>'+
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

//////////////////////////////////////////////////////////////////

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
            '<option value="' + athlete.id_athlete + '" data-fullname="'+ athlete.prenom +' '+ athlete.nom +'">' + athlete.prenom +' '+ athlete.nom + '</option>'
        );
    });
}

//////////////////////////////////////////////////////////////////

function AjouterKm(){
    var athlete = document.getElementById("dropdownAthletes");
    var km = document.getElementById("kmAjouter");
    var id_cohorte = document.getElementById("lesCohortes");

    if (confirm('Voulez-vous vraiment ajouter ' + String(km.value) + ' km a ' + athlete.options[athlete.selectedIndex].text + '?')) {
    // Save it!
        var data = {
            athlete: athlete.value, 
            km: km.value,
            cohorte: id_cohorte.value
        };
        ChargerDefiFromCohorte(id_cohorte.value);
        return $.ajax({
            method: "POST",
            url: "/defis/AjouterKm",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON"
        }); 
    } else {
    // Do nothing!
    console.log('Thing was not saved to the database.');
    }
}

