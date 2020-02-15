<template>

    <div>

        <!-- Allgemeine-Tagesdaten-Eingbae   -->
        <form method="POST">

            <div class="row">

                <div class="form-row col-lg-4 col-md-6 col-sm-12">
                    <div class="col">
                        <div class="form-group">
                            <label for="datum">Datum</label>
                            <input name="datum" type="date" :value="date && date.toISOString().split('T')[0]" @input="date = $event.target.valueAsDate" class="form-control" id="datum" value="">
                        </div>
                    </div>
                </div>

                <div class="form-row col-lg-4 col-md-6 col-sm-12">

                    <div class="col">
                        <div class="form-group">
                            <label for="start">Von</label>
                            <input name="von" type="time" class="form-control" id="start" value="" v-model="start">
                        </div>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <label for="ende">Bis</label>
                            <input name="bis" type="time" class="form-control" id="ende" value="" v-model="end">
                        </div>
                    </div>


                    <div class="col">
                        <div class="form-group">
                            <label for="pause">Pause (h)</label>
                            <input name="pause" type="time" class="form-control" id="pause" value="" v-model="pause">
                            <!-- <input name="pause" type="number" step="0.01" min="0" class="form-control" id="pause" value="0.0"> -->
                        </div>
                    </div>
                </div>

                <div class="form-row col-lg-4 col-md-6 col-sm-12">
                    <div class="col">
                        <div class="form-group">
                            <label for="gesamt">Std-gesamt</label>
                            <input name="std_gesamt" type="text" id="gesamt" class="form-control" v-model="calcTotal" disabled>
                            <small id="emailHelp" class="form-text text-muted">Die Gesamtstundenzahl wird automatisch errechnet.</small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- <input class="btn btn-success" type="submit" value="Tag Speichern"> -->
        </form>


    </div>
</template>


<script>

    export default {
        data () {
            return {
                date: '',
                start: '',
                end: '',
                pause: ''
            }
        },

        computed: {
            calcTotal(){
                let result = this.timeToDecimal(this.end) - this.timeToDecimal(this.start) - this.timeToDecimal(this.pause);
                return (!isNaN(result)? result : '');
            }
        },

        // 30 * x = 50

        methods: {

            timeToDecimal: function ($time) {
                let data = $time.split(':');
                let hours = data[0] * 100;
                let minutes = data[1] * (5/3);
                return (hours + minutes) / 100
            },

        }


    }


</script>
