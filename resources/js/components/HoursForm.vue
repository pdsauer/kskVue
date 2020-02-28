<template>
    <div>
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
                                <DayData :dayData="day" :calcTotal="calcTotal"></DayData>

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
                            <ControlBar @day-save="say('Day saved!')" @day-delete="say('Day deleted!')"></ControlBar>

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
                idcounter: 1
            }
        },

        components: {activityFields: activityFields,
                     DaySelector: DaySelector,
                     DayData: DayData,
                     ControlBar: ControlBar
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
                        this.day.date = response.data.Datum;
                        this.day.start = response.data.Von;
                        this.day.end = response.data.Bis;
                        this.day.pause = response.data.Pause;
                    }
                );

                //
            },
            daySelected: function (day) {

                // Check if day is empty -> Wenn kein Tag ausgewählt, dann this.day leeren
                // Sonst tag füllen

                if(day == null){

                    this.day.id = '';
                    this.day.date = '';
                    this.day.start = '';
                    this.day.end = '';
                    this.day.pause = '';
                } else {
                    this.loadDay(day.id);
                }



            },
            timeToDecimal: function (time) {
                let data = time.split(':');
                let hours = data[0] * 100;
                let minutes = data[1] * (5/3);
                return (hours + minutes) / 100
            },

        },
        computed: {
            calcTotal(){
                let result = this.timeToDecimal(this.day.end) - this.timeToDecimal(this.day.start) - this.timeToDecimal(this.day.pause);
                return (!isNaN(result)? result : '');
            }
        },

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
