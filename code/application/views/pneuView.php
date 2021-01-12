<?php
    echo '<script type="text/javascript" src="/'.PATH_PUBLIC.'\js\pneuView.js"></script>'
?>

<div class="form-group">
    <label for="marqueVoiture">Marque de voiture</label>
    <select class="form-control" name="marqueVoiture" id="marqueVoiture">
    </select>
</div>
<div class="form-group">
    <label for="modele">Modele de voiture</label>
    <select class="form-control" name="modele" id="modele">
    </select>
</div>

<h2>Choix disponible</h2>
<div id="pneuDisplay">
</div>