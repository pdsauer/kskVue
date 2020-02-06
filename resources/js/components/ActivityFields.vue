<template>
    <div>
                            <div class="row">
                                <div class="col-lg-11 col-md-8">
                                    <h4 class="pl-3">Tätigkeiten</h4>
                                </div>
                                <div class="col-lg-1 col-md-4">
                                    <button class="btn btn-light">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="container bg-light p-3">

                                <div class="form-row">

                                    <div class="col-lg-2 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="auftrags_id">Auftragsnummer</label>
                                            <select class="form-control" id="auftrags_id">
                                                <option disabled selected value> Auftrag auswählen </option>
                                                <option value="test123">2202/15</option>
                                                <option value="test234">2205/49</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="bauherr">Bauherr</label>
                                            <input type="text" class="form-control" id="bauherr" disabled>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="bezeichnung">Bezeichnung</label>
                                            <input type="text" class="form-control" id="bezeichnung" disabled>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="tätigkeit">Tätigkeit</label>
                                            <select class="form-control" id="tätigkeit">
                                                <option disabled selected value> Tätigkeit auswählen </option>
                                                <option value="test123">Drucken</option>
                                                <option value="test234">Kopieren</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-1 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="kilometer">Kilometer</label>
                                            <input type="number" class="form-control" id="kilometer">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="bemerkung">Bemerkung</label>
                                            <input type="text" class="form-control" id="bemerkung">
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-sm-12 col-md-6">
                                        <div class="form-group">
                                            <label for="stundenanzahl">Stundenanzahl</label>
                                            <input type="text" class="form-control" id="stundenanzahl">
                                        </div>
                                    </div>
                                </div>


                            </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('activity mounted.')
        }
    }
</script>