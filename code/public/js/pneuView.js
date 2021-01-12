/*$(window).on('load', function(){​​​​ 
    console.log("allo1");
});*/
$(window).on('load', function () {
    ChargerMarqueVoiture();
    var marqueSelect = $("#marqueVoiture");
    marqueSelect.on('change', function () {
        console.log("Model");
        ChargerModelFromMarque(marqueSelect.val());
    });
    var modelSelect = $("#modele");
    modelSelect.on('change', function () {
        console.log("Pneu");
        console.log(modelSelect.val());
        ChargerPneuFromModele(modelSelect.val());
    });
    console.log("finLoad");
});

function GetMarqueVoiture() {
    return $.ajax({
        url: "/pneu/marque",
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function AfficherMarques(marques) {
    var marqueSelect = $("#marqueVoiture");
    marqueSelect.empty();
    marqueSelect.append("<option></option>");
    marques.forEach(marque => {
        marqueSelect.append("<option value='" + marque.id_marque_voiture + "'>" + marque.name + "</option>")
    });
}

function ChargerMarqueVoiture() {
    GetMarqueVoiture().then(function (response) {
        AfficherMarques(response.marques);
    });
}

//////////////////////////////////////////////////////////////////

function GetModelFromMarque(idMarque) {
    return $.ajax({
        url: "/pneu/marque/" + idMarque,
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function AfficherModelFromMarque(lesModels) {
    var modelSelect = $("#modele");
    modelSelect.empty();
    modelSelect.append("<option></option>");
    lesModels.forEach(model => {
        modelSelect.append("<option value='" + model.id_modele + "'>" + model.name + "</option>")
    });
}

function ChargerModelFromMarque(idMarque) {
    GetModelFromMarque(idMarque).then(function (response) {
        AfficherModelFromMarque(response.model);
    });
}

//////////////////////////////////////////////////////////////////

function GetPneuFromModele(idModel) {
    return $.ajax({
        url: "/pneu/modele/" + idModel,
        methode: "GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    });
}

function AfficherPneuFromModele(lesPneus) {
    var pneuDisplay = $("#pneuDisplay");
    pneuDisplay.empty();
    lesPneus.forEach(pneu => {
        pneuDisplay.append(pneu.largeur+"/"+pneu.rapport+"/"+pneu.diametre+"</br>");
    });
}

function ChargerPneuFromModele(idModel) {
    GetPneuFromModele(idModel).then(function (response) { console.log(response);
        AfficherPneuFromModele(response.pneu);
    });
}