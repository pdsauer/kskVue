
const selectListDate = document.getElementById('DatumSelect');
// Redirect User to Select Date
selectListDate.addEventListener('change', () => {
    //console.log('test');
    window.location.href  = ("/stunden/" + selectListDate.options[selectListDate.selectedIndex].value)
});
