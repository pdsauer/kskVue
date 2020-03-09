<template>
    <div class="modal fade show" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p> {{ modalText }}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger">Tag löschen</button>
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Schließen</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Modal",
        props: ['modalText'],
        methods: {
            close: function () {
                this.$emit('modalClose');
            }
        }
    }
</script>

<style scoped>
    .modal {
        display: block;
        padding-top: 50px;

    }
</style>
