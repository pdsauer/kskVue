<template>

    <div class="row mt-4">

        <div class="col-lg-2 col-md-3 col-sm-12 mt-2">
            <button class="btn btn-block btn-success" @click="$emit('day-save')">Tag speichern</button>
        </div>

<!--        <div class="col-lg-8 col-md-6 col-sm-12">
            <div class="form-group row">
                <label for="colFormLabelSm" class="col-form-label col-form-label-sm">Stundensumme</label>
                <div class="col-3">
                    <input type="text" class="form-control form-control-sm" id="colFormLabelSm" placeholder="0" disabled>
                </div>
            </div>
        </div>-->

        <div class="col-lg-8 col-md-6 col-sm-0 mt-2"></div>

        <div class="col-lg-2 col-md-3 col-sm-12 mt-2">
                <button class="btn btn-outline-danger btn-block" @click="$emit('day-delete')">Tag löschen</button>
        </div>

    </div>
</template>


<script>




</script>
