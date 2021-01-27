<?php
    echo '<script type="text/javascript" src="/'.PATH_PUBLIC.'\js\defisView.js"></script>'
?>
<div class="card" style="background-color:#dda145;">
    <div class="card-body">
        <h5 class="card-title">Fonctionnement</h5>
        <p class="card-text">
            Sélectionnez votre cohorte pour voir votre défi et entrez vos km parcourus selon le tableau ci-bas.
             Vous pourrez aussi voir votre équipe et combien de Km vous avez parcouru. Bon succès!
        </p>
    </div>
</div>
<div class="form-group">
    <label for="lesCohortes">Choissisez votre cohorte</label>
    <select class="form-control" name="lesCohortes" id="lesCohortes">
    </select>
</div>

<h2>Votre défi</h2>
<div id="defiDisplay">
</div>