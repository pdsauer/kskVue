<template>
    <div>

        <Modal v-if="showModal" :modal-text="modalMessage"></Modal>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col">
                    <div class="card">
                        <div class="card-header">

                            <DaySelector @daySelected="daySelected"></DaySelector>

                        </div>

                        <div class="card-body">
                            <!-- Suche eines Tages  -->
                            <div class="container bg-white">

                                <!-- Allgemeine-Tagesdaten-Eingbae   -->
                               <!-- <DayData :dayData="day" :calcTotal="calcTotal"></DayData>-->
                                <div>

                                    <!-- Allgemeine-Tagesdaten-Eingbae   -->
                                    <form method="POST">

                                        <div class="row">

                                            <div class="form-row col-lg-4 col-md-6 col-sm-12">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="datum">Datum</label>
                                                        <input
                                                            name="datum"
                                                            type="date"
                                                            id="datum"
                                                            class="form-control"
                                                            :value="day.date && day.date.toISOString().split('T')[0]"
                                                            @input="day.date = $event.target.valueAsDate"
                                                            >
                                                        <!--:value="day.date && day.date.toISOString().split('T')[0]"-->
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-row col-lg-4 col-md-6 col-sm-12">

                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="start">Von</label>
                                                        <input name="von" type="time" class="form-control" id="start" value="" v-model="day.start">
                                                    </div>
                                                </div>

                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="ende">Bis</label>
                                                        <input name="bis" type="time" class="form-control" id="ende" value="" v-model="day.end">
                                                    </div>
                                                </div>


                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="pause">Pause (h)</label>
                                                        <input name="pause" type="time" class="form-control" id="pause" value="" v-model="day.pause">
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

                            </div>

                            <!-- Tätigkeiten-Eingabe   -->
                            <div class="row">
                                <div class="col-lg-11 col-md-8">
                                    <h4 class="pl-3">Tätigkeiten</h4>
                                </div>
                                <div class="col-lg-1 col-md-4">
                                    <button class="btn btn-light" @click="addActivity(idcounter,'2045/18', 'Telefonieren', 20, 'alles normal', 2)">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>


                            <activityFields v-for="activity in activities" :activity="activity" :key="activity.id" @activityDelete="activityDelete"></activityFields>

                            <!-- Bedienungsleiste -->
                            <ValidationErrors :errors="validationErrors" v-if="validationErrors"></ValidationErrors>
                            <ControlBar @day-save="saveHander(day)" @day-delete="deleteDay(day)"></ControlBar>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5"></div>
    </div>
</template>

<script>

    import activityFields from './HoursForm/ActivityFields.vue';
    import DaySelector from './HoursForm/DaySelect';
    import DayData from './HoursForm/DayData.vue';
    import ControlBar from './HoursForm/ControlBar.vue';
    import Modal from './modal';
    import ValidationErrors from './HoursForm/ValidationErrors';

    const axios = require('axios').default;


    export default {
        data () {
            return {
                day: {
                    id:'',
                    date: '',
                    start: '',
                    end: '',
                    pause: '',
                },
                activities: [],
                newDay: true,
                idcounter: 1,
                showModal: false,
                modalMessage: '',
                validationErrors: ''
            }
        },

        components: {
            activityFields: activityFields,
            DaySelector: DaySelector,
            DayData: DayData,
            ControlBar: ControlBar,
            Modal: Modal,
            ValidationErrors: ValidationErrors

        },

        watch: {
            day(){
                console.log('day noticed Change');
            }
        },

        methods: {
            addActivity: function (id, projectNumber, action, km, comment, hours) {
                this.activities.push(new Activity(id, projectNumber, action, km, comment,  hours));
                this.idcounter++;
                console.log('Activity added');
            },
            activityDelete: function (id){
                let index = this.activities.map((x) => {
                    return x.id;
                }).indexOf(id);
                this.activities.splice(index, 1);
                console.log('deleted');
            },
            loadDay: function (id){
                // TODO use and Check for 404
                axios.get('/api/v1/days/' + id).then(

                    response => {
                        console.log('New Day Selected');
                        this.day.id = response.data.Std_ID;
                        this.day.date = new Date(response.data.Datum);
                        this.day.start = this.timeToNormal(response.data.Von) ;
                        this.day.end = this.timeToNormal(response.data.Bis);
                        this.day.pause = this.timeToNormal(response.data.Pause);
                    }
                );

                //
            },
            saveDay: function(day){

                // Fehler leeren
                this.validationErrors = '';
                // Zum abschicken vorbereiten
                let daySend = {};
                daySend.end = this.timeToDecimal(day.end);
                daySend.start = this.timeToDecimal(day.start);
                daySend.pause = this.timeToDecimal(day.pause);
                daySend.date = day.date;
                axios.post('/api/v1/days', {daySend}).then(response => console.log(response)).catch(
                        error => {
                            if (error.response.status === 422){

                                this.validationErrors = error.response.data.errors;
                            }
                        }
                    );
            },
            updateDay: function(day){

            },
            daySelected: function (day) {

                // Check if day is empty -> Wenn kein Tag ausgewählt, dann this.day leeren
                // Sonst tag füllen

                if(day == null){

                    this.emptyData();

                } else {
                    this.loadDay(day.id);
                }

            },
            emptyData: function(){
                this.day.id = '';
                this.day.date = '';
                this.day.start = '';
                this.day.end = '';
                this.day.pause = '';
                console.log('Tag geleert');
            },
            timeToDecimal: function (time) {
                let data = time.split(':');
                let hours = data[0] * 100;
                let minutes = data[1] * (5/3);
                return (hours + minutes) / 100
            },
            timeToNormal: function (time){
                let hours = Math.floor(Math.abs(time));
                // '0' vor z.B. 9:00 einfügen
                if (hours < 10){
                    hours = '0' + hours;
                }
                let minutes = Math.floor((Math.abs(time)) % 1 * 60);
                // '0' an 09:0 anfügen

                if (minutes % 10 === 0 ){
                    minutes += '0';
                }

                return hours + ':' + minutes;
            },
            saveHander: function(day) {

                    if (day.id === ""){
                        // Wenn Tag leer ist -> Tag neu speichern
                        // alert('Neuen Tag speichern');
                        // Verify, that day is correctlyfilled
                        if (day.date !== "" && day.start!== "" && day.end !== "" && day.pause !== "" ){
                            // console.log(this.day);
                            this.saveDay(this.day);
                        } else {
                            console.log('Tag muss korrekt gefüllt werden');
                        }

                    } else {
                        // Tag ist gefüllt -> update Tag
                        alert('Tag updaten');
                    }
            },
            deleteDay(day){
                this.modalMessage = 'Wollen Sie den Tag wirklich löschen?';
                this.showModal = true;
/*                if (day.id === ""){
                    // Wenn Day.id leer ist -> Tag wurde noch nicht gespeichert -> Tag leeren
                    this.emptyData();
                } else {
                    // Wenn Day.id nicht leer ist -> DELETE Request an Server
                    axios.delete('/api/v1/days/'+ day.id).then(
                        this.emptyData
                    );
                }*/
            },
            say: function (msg) {
                alert(msg);
            }

        },
        computed: {
            calcTotal(){
                let result = this.timeToDecimal(this.day.end) - this.timeToDecimal(this.day.start) - this.timeToDecimal(this.day.pause);
                return (!isNaN(result)? result : '');
            }

        }
    }

    class Activity {

        constructor(id, projectNumber, action, km, comment, hours) {
            this.id = id;
            this.projectNumber = projectNumber;
            this.action = action;
            this.km = km;
            this.comment = comment;
            this.hours = hours;
        }
    }
</script>

<style scoped>

</style>
