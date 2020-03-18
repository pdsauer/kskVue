<template>
    <div>

        <Modal v-if="modal.show" :btn-class="modal.BtnClass" :modal-text="modal.Message" :modal-btn-text="modal.BtnText" @modalConfirm="modalFunction" @modalClose="emptyModal"></Modal>
        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col">
                    <div class="card">
                        <div class="card-header">

                            <DaySelector @daySelected="daySelected"></DaySelector>

                        </div>

                        <div class="card-body">

                            <Loading v-if="loading"></Loading>
                            <!-- Suche eines Tages  -->
                            <div v-if="!loading" class="container bg-white">

                                <!-- Allgemeine-Tagesdaten-Eingbae   -->
                               <!-- <DayData :dayData="day" :calcTotal="calcTotal"></DayData>-->
                                <div>
                                    
                                    <!-- Allgemeine-Tagesdaten-Eingbae   -->
                                    <form>

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
                            <ControlBar
                                @day-save="saveHandler(day)"
                                @day-delete="deleteHandler()"
                                @day-new="emptyData()"
                                @day-copy="copyDay()" ></ControlBar>

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
    import Loading from './Loading.vue';

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
                loading: false,
                modal: {
                    Message: '',
                    BtnText: '',
                    FunctionOnConfirm: '',
                    BtnClass: '',
                    show: false,
                },
                validationErrors: '',
            }
        },

        components: {
            activityFields: activityFields,
            DaySelector: DaySelector,
            DayData: DayData,
            ControlBar: ControlBar,
            Modal: Modal,
            ValidationErrors: ValidationErrors,
            Loading: Loading
        },


        methods: {
            addActivity: function (Std_Id, UStd_ID, project_ID, activity, remark, km, hours, bauherr) {
                this.day.activities.push(new Activity(this.idcounter, UStd_ID, Std_Id, project_ID, activity, remark, km, hours, bauherr));
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
                //set laod status
                this.loading = true;
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
                        axios
                            .get('/api/v1/days_UF/list/' + this.day.id)
                            .then( response => {

                                if(response && response.status === 200){
                                    response.data.forEach(
                                        data => this.addActivity(
                                            this.day.id,
                                            data.ustd_ID,
                                            data.Auftrags_ID,
                                            data.Tkurz,
                                            data.Bemerkung,
                                            data.km,
                                            data.Std,
                                            data.Bauherr
                                        )
                                    );
                                } else {
                                    // TODO: display Error MSG
                                    console.log('Could not fetch Day_UF API');
                                }
                            }
                        )
                        .finally(
                            // set loading false
                            () => {
                                this.loading = false;
                            }
                        )
                    }
                );

            },
            saveDay: function(){
                // Fehler leeren
                this.validationErrors = '';
                // Zum abschicken vorbereiten
                let daySend = {};
                daySend.end = this.timeToDecimal(this.day.end);
                daySend.start = this.timeToDecimal(this.day.start);
                daySend.pause = this.timeToDecimal(this.day.pause);
                daySend.date = this.day.date;

                axios
                    .post('/api/v1/days', {daySend})
                    .catch(
                        error => {
                            if ( error && error.response.status === 422){

                                this.validationErrors = error.response.data.errors;
                            } else {
                                console.log('Es gab einen Fehler bei der Validierung');
                            }
                        }
                    )
                    .then((response) => {
                        if(response && response.status === 200){
                            // Set id to day
                            // return  response.data.insert_id;
                            this.day.id = response.data.insert_id;

                            // save Activityies
                            console.log('Vorbereitung Stunden speichern');
                            this.day.activities.forEach(activity => activity.Std_Id = this.day.id);
                            this.day.activities.forEach(activity => activity.saveHandler());

                            this.displayModal('Tag wurde erfolreich gespeichert', 'OK', '', 'emptyModal');
                            // this.emptyData();

                        } else {
                            this.displayModal('Es gab einen Fehler beim Speichern', 'OK', 'btn-outline-danger', 'emptyModal');
                        }
                    });
            },
            updateDay: function(){

                // Set Activity ID
                this.day.activities.forEach(activity => activity.Std_Id = this.day.id);

                let daySend = {};
                daySend.id = this.day.id;
                daySend.end = this.timeToDecimal(this.day.end);
                daySend.start = this.timeToDecimal(this.day.start);
                daySend.pause = this.timeToDecimal(this.day.pause);
                daySend.date = this.day.date;
                axios
                    .patch('/api/v1/days/' + this.day.id, {daySend})
                    .catch(
                    error => {
                        if (error.response.status === 422){

                            this.validationErrors = error.response.data.errors;
                        }
                    }
                ).then((response)=> {

                    if(response && response.status === 200){
                        // Set id to day
                        // return  response.data.insert_id;

                        // save Activityies
                        console.log('Vorbereitung Stunden speichern');

                        this.day.activities.forEach(activity => activity.saveHandler());

                    }

                    }
                ).finally(() => {
                    this.displayModal('Tag wurde erfolreich aktualisiert', 'OK', '', 'emptyModal');
                    // this.emptyData();
                });
            },
            copyDay: function (){

                console.log('copy-day');
                // Stunden Datum  und Stunden ID löschen
                this.day.date = null;
                this.day.id = null;

                // Stunden Aktivitäten id löschen
                this.day.activities.forEach(activitiy => {
                    // activitiy.Std_Id = null;
                    activitiy.UStd_ID = null;
                });


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
            },
            timeToDecimal: function (time) {
                if(time){
                    let data = time.split(':');
                    let hours = data[0] * 100;
                    let minutes = data[1] * (5/3);
                    return (hours + minutes) / 100
                }

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

                if (this.checkData() ){

                    if (day.id === "" || day.id === null){

                      this.saveDay();

                    } else {
                        // Tag ist gefüllt -> update Tag
                        console.log('Tag updaten');
                        this.updateDay();
                    }

                    //
                } else {
                    this.displayModal('Die Stundensumme muss stimmen, oder die Stundendauer wurde nicht korrekt eingegeben!', 'OK', '', 'emptyModal');
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
            emptyModal: function () {
                this.modal.show = false;
                this.modal.Message = '';
                this.modal.BtnText = '';
            },
            displayModal: function (message, btnText, modalBtnClass, functionOnConfirm){
                this.modal.Message = message;
                this.modal.BtnText = btnText;
                this.modal.FunctionOnConfirm = functionOnConfirm;
                this.modal.BtnClass = modalBtnClass;
                this.modal.show = true;
            },
            modalFunction: function () {
                this[this.modal.FunctionOnConfirm]();
                this.emptyModal();
            },
            calcTotalActivity(){
                let sum = 0;
                this.day.activities.forEach(activity => {sum += this.timeToDecimal(activity.hours)});
                return (!isNaN(sum)? sum : '');
            },
            checkData: function () {

                let status = true;

                // Überprüfen, ob Stunden übereinstimmen
                if(this.calcTotal !== this.calcTotalActivity()){
                    console.log('Total Falsch');
                    status = false;
                    // Stunden sind nicht gleich
                }  else if(this.day.date == "" || this.day.start == "" || this.day.end == "" || this.day.pause == "") {
                    console.log('Felder leer');
                    status =  false;
                } else if(this.timeToDecimal(this.day.start) > this.timeToDecimal(this.day.end)){
                    console.log('Richtung Falsch');
                    status = false;
                }

                return status;

            }

        },
        computed: {
            calcTotal(){
                let result = this.timeToDecimal(this.day.end) - this.timeToDecimal(this.day.start) - this.timeToDecimal(this.day.pause);
                return (!isNaN(result)? result : '');
            },
        }
    }

    class Activity {


        constructor(id, UStd_ID, Std_Id, project_ID, activity, remark, km, hours, bauherr) {
            this.id = id;
            this.UStd_ID = UStd_ID;
            this.Std_Id = Std_Id;
            this.project_ID = project_ID;
            this.activity = activity;
            this.remark = remark;
            this.km = km;
            this.hours = hours;
            this.bauherr = bauherr
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

            if(this.UStd_ID){
                this.update()
            } else {
                this.save()
            }
        }
        save(){

            let data = {};
                data.Std_Id = this.Std_Id;
                data.project_ID = this.valueOrders.id;
                data.activity = this.valueActivity.id, data.remark =this.remark;
                data.km =this.km;
                data.hours =this.timeToDecimal(this.hours);
                data.bauherr =this.bauherr;

            console.log('Save Activity');
            console.table(data);
            axios.post('/api/v1/days_UF', {data}).catch(
                error => {
                    if (error && error.response.status === 422){

                        this.validationErrors = error.response.data.errors;
                    }
                }
            ).then(response => {
                if (response && response.data.status === 200){
                    console.log('Aktivitäten erfolgreich gespeichert')
                } else {
                    console.log('Aktivitäten nicht erfolreich gespeichert')
                }
            });
        }
        update(){

            console.log('update activity');
            let data = {};
            data.UStd_ID = this.UStd_ID;
            data.Std_Id = this.Std_Id;
            data.project_ID = this.valueOrders.id;
            data.activity = this.valueActivity.id;
            data.remark =this.remark;
            data.km =this.km;
            data.hours =this.timeToDecimal(this.hours);
            data.bauherr =this.bauherr;
            axios
                .patch('/api/v1/days_UF/' + data.UStd_ID, {data})
                .catch(
                    error => {
                        if (error.response.status === 422){

                            this.validationErrors = error.response.data.errors;
                        }
                    }
                )
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
