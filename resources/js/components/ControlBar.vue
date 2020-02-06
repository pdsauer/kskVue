<template>

    <div class="row mt-4">
        <div class="col-lg-2 col-md-2">
            <input class="btn btn-success" type="submit" value="Tag Speichern">
        </div>

        <div class="col-lg-8 col-md-">
            <div class="form-group row">
                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Stundensumme</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control form-control-sm" id="colFormLabelSm" placeholder="0" disabled>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-md-2">
            <form method="POST">
                <input class="btn btn-outline-danger" type="submit" value="Tag löschen">
            </form>
        </div>

    </div>
</template>