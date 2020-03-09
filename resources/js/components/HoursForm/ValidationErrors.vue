<template>
    <div v-if="ValidationErrors">
        <ul class="alert alert-danger">
            <li v-for="(value, key, index) in ValidationErrors">@{{ value }}</li>
        </ul>
    </div>
</template>

<script>
    export default {
        name: "ValidationErrors",
        props: ['errors'],
        computed: {
            ValidationErrors() {
                let errors = Object.values(this.errors);
                errors = errors.flat();
                return errors;
            }
        }
    }
</script>

<style scoped>

</style>
