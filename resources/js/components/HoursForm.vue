<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col">
                    <div class="card">
                        <div class="card-header">

                            <DaySelector></DaySelector>

                        </div>

                        <div class="card-body">
                            <!-- Suche eines Tages  -->
                            <div class="container bg-white">

                                <!-- Allgemeine-Tagesdaten-Eingbae   -->
                                <DayData></DayData>

                            </div>

                            <!-- Tätigkeiten-Eingabe   -->
                            <div class="row">
                                <div class="col-lg-11 col-md-8">
                                    <h4 class="pl-3">Tätigkeiten</h4>
                                </div>
                                <div class="col-lg-1 col-md-4">
                                    <button class="btn btn-light" @click="addActivity(10,'2045/18', 'Telefonieren', 20, 'alles normal', 2)">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>


                            <activityFields v-for="activity in activities" :activity="activity" :key="activity.id"></activityFields>

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

    export default {
        data () {
            return {
               activities: []
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
                console.log('Activity added');
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
