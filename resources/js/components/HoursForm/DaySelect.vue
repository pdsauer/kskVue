<template>
  <div class="row">

    <div class="col text-right">
<!--        <div class="form-group pb-0 mb-0 row">

                <label for="DatumSelect" class="col-sm-5 col-form-label col-form-label-sm">Suche Stunden von Datum</label>
                <select id="DatumSelect" class="col-sm-3 form-control form-control-sm">

                    <option disabled selected value> Datum auswählen </option>



                </select>
            <a class="col-md-auto mt-1" href="/stunden">Neuen Tag hinzufügen</a>
        </div>-->

        <div class="form-group pb-0 mb-0 row">

            <label for="DatumSelect" class="col-sm-5 col-form-label col-form-label-sm pt-3">Suche Stunden von Datum</label>
            <multiselect
                class="col-md-4 col-sm-12 col-4"
                id="DatumSelect"
                v-model="value"
                :options="days"
                :custom-label="formatDate"
                placeholder="Stunden Auswählen"
                selectLabel=""
                @input="onSelect"
            ></multiselect>

        </div>


    </div>


  </div>
</template>

<script>


    import {Multiselect} from "vue-multiselect";

    export default {
        components: {Multiselect},
        data(){
            return {
                value: null,
                options: [],
                days: [],
            }
        },
        mounted() {

            axios.get('/api/v1/days').then(
                response => this.days = response.data.map(function(day) {
                    return {date: day.Datum, id: day.Std_ID}
                } )
                )
        },
        methods:{
            onSelect: function(){
                this.$emit('daySelected', this.value);
            },
            formatDate: function(date) {
                let format = new Date(date.date);
                let day = format.getDate();
                let month = format.getMonth() + 1;
                let year = format.getFullYear();
                return day + '.'+ month + '.' + year;
            }
        }


    }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>

<style scoped>

</style>
