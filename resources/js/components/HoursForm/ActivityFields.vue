<template>
    <div>
        <div class="container bg-light p-3 activity">
            <div class="form-row">

                <div class="col-lg-2 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="auftrags_id">Auftragsnummer</label>
                        <multiselect
                            class=""
                            id="auftrags_id"
                            v-model="valueOrder"
                            :options="orders"
                            placeholder="Auftrag"
                            selectLabel=""
                            :custom-label="formatOrder"
                            deselectLabel="Klicken zum Abwählen"
                        ></multiselect>
                    </div>
                </div>

                <div class="col-lg-2 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="bauherr">Bauherr</label>
                        <input type="text" class="form-control" id="bauherr" disabled v-model="activity.bauherr">
                    </div>
                </div>


                <div class="col-lg-3 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="bezeichnung">Bezeichnung</label>
                        <input type="text" class="form-control" id="bezeichnung" disabled>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="tätigkeit">Tätigkeit</label>
                        <multiselect
                            class=""
                            id="tätigkeit"
                            v-model="valueActivity"
                            :options="activities"
                            :custom-label="formatActivity"
                            placeholder="Tätigkeit Auswählen"
                            deselectLabel="Klicken zum Abwählen"
                            selectLabel=""

                        ></multiselect>
                    </div>
                </div>


                <div class="col-lg-2 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="kilometer">Kilometer</label>
                        <input type="number" step="0.1" class="form-control" id="kilometer" v-model="activity.km">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-5 col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="bemerkung">Bemerkung</label>
                        <input type="text" class="form-control" id="bemerkung" v-model="activity.remark">
                    </div>
                </div>
                <div class="col-lg-2 col-sm-12 col-md-6">
                    <div class="form-group">
                        <label for="stundenanzahl">Stundenanzahl</label>
                        <input type="time" class="form-control" id="stundenanzahl" v-model="activity.hours">
                    </div>
                </div>

                <div class="col-lg-4 col-sm-12 col-md-12">

                    <div class="form-group">
                        <label for="stundenanzahl">&nbsp;</label>
                        <button class="btn btn-light form-control text-danger" @click="$emit('activityDelete', day_UF.id)">
                            <i class="fas fa-trash-alt"></i>
                            Tätigkeit löschen
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import {Multiselect} from "vue-multiselect";


    export default {
        components: {Multiselect},
        props: {
            activity: {
                type: Object
            },
        },
        data() {
            return {
                valueActivity: null,
                valueOrder: null,
                orders: [],
                activities: [],
                day_UF: {
                    id: '',
                    day_id: '',
                    order_id: '',
                    activity_id: '',
                    hours: '',
                    km: '',
                    remark: '',
                    builder: ''
                }
            }
        },
        methods:{
            formatActivity: function(activity) {
                return activity.activity;
            },
            formatOrder: function(order){
                return order.order;
            },
            setActivityDropDown: function (id){

                if(id){
                    console.log('Set Activity Drop Down');
                    this.valueActivity = {};
                    this.valueActivity.id = id;
                    this.valueActivity.activity = this.activities.filter(activity => activity.id === id)[0].activity;
                } else {
                    console.log('Activity is empty');
                }
            },
            setOrderDropDown: function (id){

                if(id){
                    console.log('Set Order Dropdown');
                    this.valueOrder = {};
                    this.valueOrder.id = id;
                    this.valueOrder.order = this.orders.filter(order => order.id === parseInt(id))[0].order;
                }else {
                    console.log('Order is empty');
                }
            },
            loadDropdowns: function(){
                console.log('Load dropdownms');
                this.setOrderDropDown(this.activity.project_ID);
                this.setActivityDropDown(this.activity.activity);
            }
        },
        mounted() {
            //Set src for Multiselect - activity
            axios.get('/api/v1/activities').then(response => {
                this.activities = response.data.map(function(activity) {
                    return {activity: activity.Tätigkeit, id: activity.T_kurz}
                })
            });
            //Set src for Multiselect - Order
            axios.get('/api/v1/orders').then(response => {
                this.orders = response.data.map(function(order){
                    return {order: order.Auftrags_Nr, id: order.Auftrags_ID}
                })
            });
        },
    }
</script>

<style scoped>

    .activity{
        border-top: 1px solid #1c1c1c;
    }

</style>
