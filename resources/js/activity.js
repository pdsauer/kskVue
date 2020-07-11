import Helper from "./helper";
class Activity {
    constructor(
        id,
        UStd_ID,
        Std_Id,
        project_ID,
        activity,
        remark,
        km,
        hours,
        bauherr,
        valueOrdersID = null,
        valueActivityID = null
    ) {
        this.id = id;
        this.UStd_ID = UStd_ID;
        this.Std_Id = Std_Id;
        this.project_ID = project_ID;
        this.activity = activity;
        this.remark = remark;
        this.km = km;
        this.hours = hours;
        this.bauherr = bauherr;
        this.valueOrders = { id: parseInt(valueOrdersID, 10), order: null };
        this.valueActivity = { id: valueActivityID, activity: null };
    }
    load() {
        if (this.UStd_ID) {
            // load by UStd_ID
            console.log("Load test");
            axios.get("/api/v1/days_UF/" + this.UStd_ID).then(response => {
                console.table(response.data);
                this.project_ID = response.data.Auftrags_ID;
                this.remark = response.data.Bemerkungen;
                this.activity = response.data.Tkurz;
                this.hours = Helper.timeToNormal(response.data.Std);
                this.km = response.data.Km;
                this.bauherr = response.data.Bauherr;
                this.valueOrders.id = response.data.Auftrags_ID;
                this.valueActivity.id = response.data.Tkurz;
            });
        } else {
            console.log("Didnt load UStd_ID");
        }
    }
    delete() {
        if (this.UStd_ID) {
            axios.delete("/api/v1/days_UF/" + this.UStd_ID);
        }
    }
    saveHandler() {
        if (this.UStd_ID) {
            console.log("Update sinlge activity");
            this.update();
        } else {
            console.log("Save sinlge activity");
            this.save();
        }
    }
    save() {
        let data = {};
        data.Std_Id = this.Std_Id;
        data.project_ID = this.valueOrders.id;
        (data.activity = this.valueActivity.id), (data.remark = this.remark);
        data.km = this.km;
        data.hours = Helper.timeToDecimal(this.hours);
        data.bauherr = this.bauherr;

        console.log("Save Activity");
        console.table(data);
        axios
            .post("/api/v1/days_UF", { data })
            .then(response => {
                if (response && response.status === 200) {
                    console.log("Aktivitäten erfolgreich gespeichert");
                } else {
                    console.log("Aktivitäten nicht erfolreich gespeichert");
                }
            })
            .catch(error => {
                if (error && error.response.status === 422) {
                    this.validationErrors = error.response.data.errors;
                } else {
                    console.log(error.response);
                }
            });
    }
    update() {
        console.log("update activity");
        let data = {};
        data.UStd_ID = this.UStd_ID;
        data.Std_Id = this.Std_Id;
        data.project_ID = this.valueOrders.id;
        data.activity = this.valueActivity.id;
        data.remark = this.remark;
        data.km = this.km;
        data.hours = Helper.timeToDecimal(this.hours);
        data.bauherr = this.bauherr;
        console.table(data);
        axios
            .patch("/api/v1/days_UF/" + data.UStd_ID, { data })
            .then(response => {
                console.table(response);
                if (response && response.status === 200) {
                    console.log("Aktivität erfolreich aktualisiert");
                } else {
                    console.log("Aktivität nicht erfolreich aktualisiert");
                }
            })
            .catch(error => {
                if (error.response.status === 422) {
                    this.validationErrors = error.response.data.errors;
                } else {
                    console.log(error);
                }
            });
    }
}

export default Activity;
