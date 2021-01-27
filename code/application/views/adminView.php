<?php
    echo '<script type="text/javascript" src="/'.PATH_PUBLIC.'\js\adminView.js"></script>'
?>
<div class="card" style="background-color:#dda145;">
    <div class="card-body text-center" id="AdminCheck">
        <h5 class="card-title">Veuillez entrer le mot de passe administratif.</h5>
        <input type="password" id="adminPassword">
        <button class="btn btn-success" type="button" id="adminSend">Envoyer</button>
    </div>
    <div id="test" hidden>
        <form>
        <h3>Entrer un athlète à la fois</h3>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prenom</label>
                <input type="text" class="form-control" id="prenom">
            </div>
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Check me out</label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

    </div>
</div>