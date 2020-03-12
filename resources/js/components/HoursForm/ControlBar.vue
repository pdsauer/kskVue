<template>

    <div class="row mt-4">

        <div class="col-lg-6 col-md-8 col-sm-12 mt-2">
            <button class="btn  btn-success" @click="$emit('day-save')">Tag speichern</button>
            <button class="btn  btn-primary" @click="$emit('day-copy')">Tag kopieren</button>
            <button class="btn  btn-outline-primary" @click="$emit('day-new')">Tag kopieren</button>
        </div>



        <div class="col-lg-4 col-md-1 col-sm-0 mt-2"></div>

        <div class="col-lg-2 col-md-3 col-sm-12 mt-2">
                <button class="btn btn-outline-danger btn-block" @click="$emit('day-delete')">Tag löschen</button>
        </div>

    </div>
</template>


<script>

    export default {
        props: {
            sum: ''
        }
    }




</script>
