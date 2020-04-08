<template>
  <div class="row">

    <multiselect
        class="col-md-auto"
        id="DatumSelect"
        v-model="value"
        :options="days"
        :custom-label="formatDate"
        placeholder="Stunden Auswählen"
        selectLabel=""
        deselectLabel="Klicken zum Abwählen"
        @input="onSelect"
        style="box-sizing: border-box"
    ></multiselect>

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
            },
            empty: function() {
                this.value = null;
            }
        }


    }
</script>


<style scoped>
</style>
