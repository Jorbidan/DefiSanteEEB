/*$(window).on('load', function(){​​​​ 
    console.log("allo1");
});*/
$(window).on('load', function () {
    ChargerLesCohortes();
    var modelSelect = $("#modele");
    modelSelect.on('change', function () {
        console.log("Pneu");
        console.log(modelSelect.val());
        ChargerPneuFromModele(modelSelect.val());
    });
    console.log("finLoad");
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
    cohortes.forEach(cohorte => {
        cohortesSelect.append("<option value='" + cohorte.id_cohorte + "'>" + cohorte.name + "</option>")
    });
}

function ChargerLesCohortes() {
    GetLesCohortes().then(function (response) {
        AfficherLesCohortes(response.cohortes);
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

function AfficherDefiFromCohorte(defi) {
    var defiDisplay = $("#defiDisplay");
    defiDisplay.empty();
    defi.append(defi.name);
}

function ChargerDefiFromCohorte(idCohorte) {
    GetDefiFromCohorte(idCohorte).then(function (response) { console.log(response);
        AfficherDefiFromCohorte(response.defi);
    });
}
