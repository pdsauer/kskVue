<template>

    <div class="row mt-4">

        <div class="col-lg-6 col-md-12 col-sm-12 mt-2">
            <button class="btn  btn-success" @click="$emit('day-save')">Tag speichern</button>
            <button class="btn  btn-primary" @click="$emit('day-copy')">Tag kopieren</button>
            <button class="btn  btn-outline-primary" @click="$emit('day-new')">neuer Tag</button>
        </div>



        <div class="col-lg-4 col-md-8 mt-2">
                <div class="form-group row">
                    <label for="inputEmail3" class="col-6 col-form-label">Kontrollsumme</label>
                    <div class="col-4">
                        <input 
                        type="text" 
                        :value="sum" 
                        class=" form-control" 
                        :class=" {'text-success': status, 'text-danger': !status }"  
                        id="inputEmail3" 
                        placeholder="0" disabled>
                    </div>
                </div>
        </div>

        <div class="col-lg-2 col-md-4 col-sm-12 mt-2">
                <button class="btn btn-outline-danger btn-block" @click="$emit('day-delete')">Tag löschen</button>
        </div>

    </div>
</template>


<script>

    export default {
        props: {
            sum: '',
            status: false
        }
    }




</script>
