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
                            <activity></activity>

                            <!-- Bedienungsleiste -->
                            <ControlBar></ControlBar>
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


    import activity from './ActivityFields.vue';
    import DaySelector from './DaySelect';
    import DayData from './DayData.vue';
    import ControlBar from './ControlBar.vue';


    export default {
        data () {
            return {
                parent_msg: 'Hello From the Parent!'
            }
        },
        components: {activity: activity,
                     DaySelector: DaySelector,
                     DayData: DayData,
                     ControlBar: ControlBar
        }
    }
</script>

<style scoped>

</style>
