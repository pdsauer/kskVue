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
                            <activityFields @activity-add="say('Activity Added!')"></activityFields>

                            <!-- Bedienungsleiste -->
                            <ControlBar @day-save="say('Day saved!')" @day-delete="say('Day deleted!')"></ControlBar>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5">

        </div>

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
                parent_msg: 'Hello From the Parent!'
            }
        },

        components: {activityFields: activityFields,
                     DaySelector: DaySelector,
                     DayData: DayData,
                     ControlBar: ControlBar
        },

        methods: {
            say: function (msg) {
                alert(msg);
            }
        }
    }




</script>

<style scoped>

</style>
