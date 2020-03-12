<template>
    <div>

        <Modal v-if="showModal" :btn-class="this.modalBtnClass" :modal-text="modalMessage" :modal-btn-text="modalBtnText" @modalConfirm="modalFunction" @modalClose="emptyModal"></Modal>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col">
                    <div class="card">
                        <div class="card-header">

                            <DaySelector :key="daySelectorKey" @daySelected="daySelected"></DaySelector>

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
                                    <button class="btn btn-light" @click="addActivity(idcounter)">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>


                            <activityFields
                                v-for="activity in day.activities"
                                :activity="activity"
                                :key="activity.id"
                                @activityDelete="activityDelete"></activityFields>

                            <!-- Bedienungsleiste -->
                            <ValidationErrors :errors="validationErrors" v-if="validationErrors"></ValidationErrors>
                            <ControlBar @day-save="saveHandler(day)" @day-delete="deleteHandler()"></ControlBar>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5"></div>
    </div>
</template>

<script>
    // To Fix JS Horrible date API - USE ON DAY LOAD TO FIX OFFSET
    Date.prototype.addHours = function(h) {
        this.setTime(this.getTime() + (h*60*60*1000));
        return this;
    };

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
                    activities: []
                },
                idcounter: 1,
                showModal: false,
                modalMessage: '',
                modalBtnText: '',
                modalFunctionOnConfirm: '',
                modalBtnClass: '',
                validationErrors: '',
                daySelectorKey: true,
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


        methods: {
            addActivity: function (UStd_ID, Std_Id) {
                this.day.activities.push(new Activity(this.idcounter, UStd_ID, Std_Id));
                this.idcounter++;

            },
            activityDelete: function (id){
                // console.log(this.day.activities.forEach(act => console.log(act.remark)));
                let index = this.day.activities.map((x) => {
                    return x.id;
                }).indexOf(id);
                this.day.activities[index].delete();
                this.day.activities.splice(index, 1);

            },

            loadDay: function (id){
                this.emptyData();
                // TODO use and Check for 404
                axios.get('/api/v1/days/' + id).then(


                    response => {
                        console.log('New Day Selected');
                        this.day.id = response.data.Std_ID;
                        this.day.date = new Date(response.data.Datum).addHours(2);
                        this.day.start = this.timeToNormal(response.data.Von) ;
                        this.day.end = this.timeToNormal(response.data.Bis);
                        this.day.pause = this.timeToNormal(response.data.Pause);

                        // load activities by Std_ID
                        axios.get('/api/v1/days_UF/list/' + this.day.id).then(
                            (response) => {

                                response.data.forEach(ustd_ID => this.addActivity(ustd_ID, this.day.id));
                                // load all Activity fields
                                this.day.activities.forEach(activity => activity.load());
                                return Promise.resolve('Test');

                            }
                        )
                    }
                );

            },
            saveDay: async function(day){

                console.log('save Day');
                // Fehler leeren
                this.validationErrors = '';
                // Zum abschicken vorbereiten
                let daySend = {};
                daySend.end = this.timeToDecimal(day.end);
                daySend.start = this.timeToDecimal(day.start);
                daySend.pause = this.timeToDecimal(day.pause);
                daySend.date = day.date;

                axios
                    .post('/api/v1/days', {daySend})
                    .catch(
                        error => {
                            if (error.response.status === 422){

                                this.validationErrors = error.response.data.errors;
                            }
                        }
                    )
                    .then((response) => {

                        if(response.status === 200){
                            // Set id to day
                            // return  response.data.insert_id;
                            this.day.id = response.data.insert_id;

                            // save Activityies
                            console.log('Vorbereitung Stunden speichern');
                            this.day.activities.forEach(activity => activity.Std_Id = this.day.id);
                            this.day.activities.forEach(activity => activity.saveHandler());
                        }
                    }).finally(() => {
                        this.displayModal('Tag wurde erfolreich gespeichert', 'OK', '', 'emptyModal');
                        // this.emptyData();
                }
                );
            },
            updateDay: function(day){
                let daySend = {};
                daySend.id = day.id;
                daySend.end = this.timeToDecimal(day.end);
                daySend.start = this.timeToDecimal(day.start);
                daySend.pause = this.timeToDecimal(day.pause);
                daySend.date = day.date;
                axios
                    .patch('/api/v1/days/' + this.day.id, {daySend})
                    .catch(
                    error => {
                        if (error.response.status === 422){

                            this.validationErrors = error.response.data.errors;
                        }
                    }
                ).then(response => {

                if(response.status === 200){
                    this.displayModal('Tag wurde erfolreich aktualisiert', 'OK', '', 'emptyModal');
                    // this.emptyData();
                }});
            },
            daySelected: function (day) {

                // Check if day is empty -> Wenn kein Tag ausgewählt, dann this.day leeren
                // Sonst tag füllen

                if(day == null){

                    this.emptyData();

                } else {
                    this.loadDay(day.id)

                }

            },
            emptyData: function(){
                this.day.id = '';
                this.day.date = '';
                this.day.start = '';
                this.day.end = '';
                this.day.pause = '';
                this.day.activities = [];
                this.daySelectorKey = !this.daySelectorKey;
                console.log('Tag geleert');
            },
            timeToDecimal: function (time) {
                let data = time.split(':');
                let hours = data[0] * 100;
                let minutes = data[1] * (5/3);
                return (hours + minutes) / 100
            },
            timeToNormal: function (time){

                let data = time.split('.');
                let hours = data[0];
                let minutes = Math.floor((Math.abs(data[1])) * 3/5);
                if (hours === 0 || hours === ''){
                    hours = '00';
                }
                else if(hours < 10){
                    hours = '0' + hours;
                }

                if(minutes.toString().length === 1){
                    minutes += '0';
                }
                return hours + ':' + minutes;
            },
            saveHandler: function(day) {

                if (day.date !== "" && day.start!== "" && day.end !== "" && day.pause !== "" ){

                    if (day.id === ""){

                      this.saveDay(this.day);

                    } else {
                        // Tag ist gefüllt -> update Tag
                        console.log('Tag updaten');
                        this.updateDay(this.day);
                    }

                    //
                } else {
                    console.log('Tag muss korrekt gefüllt werden');
                }

            },
            deleteHandler: function(){
                this.displayModal('Wollen sie den Tag wirklich löschen?', 'Löschen', 'btn-outline-danger', 'deleteDay');
            },
            deleteDay(){

               if (this.day.id === ""){
                    // Wenn Day.id leer ist -> Tag wurde noch nicht gespeichert -> Tag leeren
                    this.emptyData();
                } else {
                    // Wenn Day.id nicht leer ist -> DELETE Request an Server
                    axios.delete('/api/v1/days/'+ this.day.id).then(
                        this.emptyData
                    );}
            },
            say: function (msg) {
                alert(msg);
            },
            emptyModal: function () {
                this.showModal = false;
                this.modalMessage = '';
                this.modalBtnText = '';
            },
            displayModal: function (message, btnText, modalBtnClass, functionOnConfirm){
                this.modalMessage = message;
                this.modalBtnText = btnText;
                this.modalFunctionOnConfirm = functionOnConfirm;
                this.modalBtnClass = modalBtnClass;
                this.showModal = true;
            },
            modalFunction: function () {
                this[this.modalFunctionOnConfirm]();
                this.emptyModal();
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


        constructor(id, UStd_ID, Std_Id) {
            this.id = id;
            this.UStd_ID = UStd_ID;
            this.Std_Id = Std_Id;
            let project_ID ;
            let activity;
            let remark;
            let km;
            let hours;
            let bauherr;
            this.valueOrders = {id: null, order: null };
            this.valueActivity = {id: null, activity: null};
        }
        load(){

            if(this.UStd_ID){
                // load by UStd_ID
                axios.get('/api/v1/days_UF/' + this.UStd_ID).then(
                    (response) => {
                        this.project_ID = response.data.Auftrags_ID;
                        this.remark = response.data.Bemerkungen;
                        this.activity = response.data.Tkurz;
                        this.hours = this.timeToNormal(response.data.Std);
                        this.km = response.data.Km;
                        this.bauherr = response.data.Bauherr;
                        this.valueOrders.id = response.data.Auftrags_ID;
                        this.valueActivity.id = response.data.Tkurz;

                    }
                )
            }
        }
        delete(){
            if(this.UStd_ID){
                axios.delete('/api/v1/days_UF/' + this.UStd_ID);
            }
        }
        saveHandler(){
            console.log(this);
            if(this.UStd_ID){
                this.save()
            } else {
                this.update()
            }
        }
        save(){
            console.log('save' + ' ' +  this.UStd_ID,);
            axios.post('/api/v1/days_UF', {

                Std_Id: this.Std_Id,
                project_ID: this.valueOrders.id,
                actvitiy: this.valueActivity.id,
                remark : this.remark,
                km: this.km,
                hours: this.timeToDecimal(this.hours),
                bauherr: this.bauherr
            })
        }
        update(){
            console.log('update');
/*            axios
                .patch('/api/v1/days_UF/' + this.UStd_ID, this)
                .catch(
                    error => {
                        if (error.response.status === 422){

                            this.validationErrors = error.response.data.errors;
                        }
                    }
                ).then(response => {

                if(response.status === 200){
                   return true;
                }});*/
        }


        timeToNormal(time){
            let data = time.split('.');
            let hours = data[0];
            let minutes = Math.floor((Math.abs(data[1])) * 3/5);
            if (hours === 0 || hours === ''){
                hours = '00';
            }
            else if(hours < 10){
                hours = '0' + hours;
            }

            if(minutes.toString().length === 1){
                minutes += '0';
            }
            return hours + ':' + minutes;
        }
        timeToDecimal(time) {
            let data = time.split(':');
            let hours = data[0] * 100;
            let minutes = data[1] * (5/3);
            return (hours + minutes) / 100
        }
    }
</script>

<style scoped>

</style>
