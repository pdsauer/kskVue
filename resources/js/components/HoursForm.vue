<template>
  <div>
    <Modal
      v-if="modal.show"
      :btn-class="modal.BtnClass"
      :modal-text="modal.Message"
      :modal-btn-text="modal.BtnText"
      @modalConfirm="modalFunction"
      @modalClose="emptyModal"
    ></Modal>

    <div class="container">
      <div class="row justify-content-center">
        <div class="col">
          <div class="card">
            <div class="card-header">
              <div class="row d-flex justify-content-center">
                <DaySelector class="col-sm-12 col-md-6" @daySelected="daySelected"></DaySelector>
              </div>
            </div>

            <div class="card-body">
              <Loading v-if="loading"></Loading>
              <!-- Suche eines Tages  -->
              <div v-if="!loading" class="container bg-white">
                <!-- Allgemeine-Tagesdaten-Eingbae   -->
                <!-- <DayData :dayData="day" :calcTotal="calcTotal"></DayData>-->
                <div>
                  <!-- Allgemeine-Tagesdaten-Eingbae   -->
                  <form>
                    <div class="row">
                      <div class="form-row col-lg-4 col-md-6 col-sm-12">
                        <div class="col">
                          <div class="form-group">
                            <label for="datum">Datum</label>
                            <input
                              name="datum"
                              type="date"
                              id="datum"
                              class="form-control"
                              :value="day.date && day.date.toISOString().split('T')[0]"
                              @input="day.date = $event.target.valueAsDate"
                              :readonly="day.id ? true : false"
                            />
                          </div>
                        </div>
                      </div>

                      <div class="form-row col-lg-4 col-md-6 col-sm-12">
                        <div class="col">
                          <div class="form-group">
                            <label for="start">Von</label>
                            <input
                              name="von"
                              type="time"
                              class="form-control"
                              id="start"
                              value
                              v-model="day.start"
                            />
                          </div>
                        </div>

                        <div class="col">
                          <div class="form-group">
                            <label for="ende">Bis</label>
                            <input
                              name="bis"
                              type="time"
                              class="form-control"
                              id="ende"
                              value
                              v-model="day.end"
                            />
                          </div>
                        </div>

                        <div class="col">
                          <div class="form-group">
                            <label for="pause">Pause (h)</label>
                            <input
                              name="pause"
                              type="time"
                              class="form-control"
                              id="pause"
                              value
                              v-model="day.pause"
                            />
                            <!-- <input name="pause" type="number" step="0.01" min="0" class="form-control" id="pause" value="0.0"> -->
                          </div>
                        </div>
                      </div>

                      <div class="form-row col-lg-4 col-md-6 col-sm-12">
                        <div class="col">
                          <div class="form-group">
                            <label for="gesamt">Std-gesamt</label>
                            <input
                              name="std_gesamt"
                              type="text"
                              id="gesamt"
                              class="form-control"
                              v-model="calcTotal"
                              disabled
                            />
                            <small
                              id="emailHelp"
                              class="form-text text-muted"
                            >Die Gesamtstundenzahl wird automatisch errechnet.</small>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- <input class="btn btn-success" type="submit" value="Tag Speichern"> -->
                  </form>
                </div>
              </div>

              <!-- Tätigkeiten-Eingabe   -->
              <div class="row">
                <div class="col-lg-11 col-md-8">
                  <h4 class="pl-3">Tätigkeiten</h4>
                </div>
                <div class="col-lg-1 col-md-4">
                  <button class="btn btn-light" @click="addActivity(idcounter)">
                    <i class="fas fa-plus"></i>
                  </button>
                </div>
              </div>

              <activityFields
                v-for="activity in day.activities"
                :activity="activity"
                :key="activity.id"
                @activityDelete="activityDelete"
              ></activityFields>

              <!-- Bedienungsleiste -->
              <ValidationErrors :errors="validationErrors" v-if="validationErrors"></ValidationErrors>
              <ControlBar
                @day-save="saveHandler(day)"
                @day-delete="deleteHandler()"
                @day-new="newDay()"
                @day-copy="copyDay()"
                :sum="checkTotal"
                :status="classTotal"
              ></ControlBar>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="mt-5"></div>
  </div>
</template>

<script>
// To Fix JS Horrible date API - USE ON DAY LOAD TO FIX OFFSET
Date.prototype.addHours = function(h) {
  this.setTime(this.getTime() + h * 60 * 60 * 1000);
  return this;
};

import activityFields from "./HoursForm/ActivityFields.vue";
import DaySelector from "./HoursForm/DaySelect";
import DayData from "./HoursForm/DayData.vue";
import ControlBar from "./HoursForm/ControlBar.vue";
import Modal from "./modal";
import ValidationErrors from "./HoursForm/ValidationErrors";
import Loading from "./Loading.vue";
import Helper from "../helper";
import Activity from "../activity";

const axios = require("axios").default;

export default {
  data() {
    return {
      day: {
        id: "",
        date: "",
        start: "",
        end: "",
        pause: "",
        activities: []
      },
      idcounter: 1,
      loading: false,
      modal: {
        Message: "",
        BtnText: "",
        FunctionOnConfirm: "",
        BtnClass: "",
        show: false
      },
      checkForErrorsString: "",
      validationErrors: ""
    };
  },

  components: {
    activityFields: activityFields,
    DaySelector: DaySelector,
    DayData: DayData,
    ControlBar: ControlBar,
    Modal: Modal,
    ValidationErrors: ValidationErrors,
    Loading: Loading
  },

  methods: {
    // Neue Tätigkeit hinzufügen
    addActivity: function(
      Std_Id,
      UStd_ID,
      project_ID,
      activity,
      remark,
      km,
      hours,
      bauherr,
      valueOrderID,
      valueActivityID
    ) {
      this.day.activities.push(
        new Activity(
          this.idcounter,
          UStd_ID,
          Std_Id,
          project_ID,
          activity,
          remark,
          km,
          hours,
          bauherr,
          valueOrderID,
          valueActivityID
        )
      );
      this.idcounter++;
    },
    // Tätigkeit entfernen
    activityDelete: function(id) {
      // console.log(this.day.activities.forEach(act => console.log(act.remark)));
      let index = this.day.activities
        .map(x => {
          return x.id;
        })
        .indexOf(id);
      this.day.activities[index].delete();
      this.day.activities.splice(index, 1);
    },
    // Tag laden
    loadDay: function(id) {
      //set laod status
      this.loading = true;
      this.emptyData();
      // TODO use and Check for 404
      axios.get("/api/v1/days/" + id).then(response => {
        // console.log("New Day Selected");
        this.day.id = response.data.Std_ID;
        this.day.date = new Date(response.data.Datum).addHours(2);
        this.day.start = Helper.timeToNormal(response.data.Von);
        this.day.end = Helper.timeToNormal(response.data.Bis);
        this.day.pause = Helper.timeToNormal(response.data.Pause);

        // load activities by Std_ID
        axios
          .get("/api/v1/days_UF/list/" + this.day.id)
          .then(response => {
            // console.table(response.data);
            if (response && response.status === 200) {
              response.data.forEach(data =>
                this.addActivity(
                  this.day.id,
                  data.UStd_ID,
                  data.Auftrags_ID,
                  data.Tkurz,
                  data.Bemerkungen,
                  data.km,
                  Helper.timeToNormal(data.Std),
                  data.Bauherr,
                  data.Auftrags_ID,
                  data.Tkurz
                )
              );
            } else {
              // TODO: display Error MSG
              // console.log("Could not fetch Day_UF API");
            }
          })
          .finally(
            // set loading false
            () => {
              setTimeout(() => {
                this.loading = false;
              }, 500);
            }
          );
      });
    },
    // Tag speichern
    saveDay: function() {
      // Fehler leeren
      this.validationErrors = "";
      // Zum abschicken vorbereiten
      let daySend = {};
      daySend.end = Helper.timeToDecimal(this.day.end);
      daySend.start = Helper.timeToDecimal(this.day.start);
      daySend.pause = Helper.timeToDecimal(this.day.pause);
      daySend.date = this.day.date;

      axios
        .post("/api/v1/days", { daySend })
        .catch(error => {
          if (error && error.response.status === 422) {
            this.validationErrors = error.response.data.errors;
          } else {
            // console.log("Es gab einen Fehler bei der Validierung");
            // console.log(error);
          }
        })
        .then(response => {
          if (response && response.status === 200) {
            // Set id to day
            // return  response.data.insert_id;
            this.day.id = response.data.insert_id;

            // save Activityies
            // console.log("Vorbereitung Stunden speichern");
            this.day.activities.forEach(
              activity => (activity.Std_Id = this.day.id)
            );
            this.day.activities.forEach(activity => activity.saveHandler());

            this.displayModal(
              "Tag wurde erfolreich gespeichert",
              "OK",
              "",
              "emptyModal"
            );

            // DropDown aktualiseren
            this.bus.$emit("DaySelect-refresh");
            // this.emptyData();
          } else {
            this.displayModal(
              "Es gab einen Fehler beim Speichern",
              "OK",
              "btn-outline-danger",
              "emptyModal"
            );
          }
        });
    },
    // tag aktualisieren
    updateDay: function() {
      // Set Activity ID
      this.day.activities.forEach(activity => (activity.Std_Id = this.day.id));

      let daySend = {};
      daySend.id = this.day.id;
      daySend.end = Helper.timeToDecimal(this.day.end);
      daySend.start = Helper.timeToDecimal(this.day.start);
      daySend.pause = Helper.timeToDecimal(this.day.pause);
      daySend.date = this.day.date;
      axios
        .patch("/api/v1/days/" + this.day.id, { daySend })
        .catch(error => {
          if (error.response.status === 422) {
            this.validationErrors = error.response.data.errors;
          }
        })
        .then(response => {
          if (response && response.status === 200) {
            // Tätigkeiten speichern

            this.day.activities.forEach(activity => activity.saveHandler());
          }
        })
        .finally(() => {
          this.displayModal(
            "Tag wurde erfolreich aktualisiert",
            "OK",
            "",
            "emptyModal"
          );
          // this.emptyData();
        });
    },
    // Tag kopieren
    copyDay: function() {
      //console.log("copy-day");
      // Stunden Datum  und Stunden ID löschen
      this.day.date = null;
      this.day.id = null;
      // empty dropdown
      this.bus.$emit("DaySelect-refresh");

      // Stunden Aktivitäten id löschen
      this.day.activities.forEach(activitiy => {
        // activitiy.Std_Id = null;
        activitiy.UStd_ID = null;
      });
    },
    // Tag laden oder leeren, wenn dieser abgewählt wurde
    daySelected: function(day) {
      // Check if day is empty -> Wenn kein Tag ausgewählt, dann this.day leeren
      // Sonst tag füllen

      if (day == null) {
        this.emptyData();
      } else {
        this.loadDay(day.id);
      }
    },
    // alle daten leeren
    emptyData: function() {
      this.day.id = "";
      this.day.date = "";
      this.day.start = "";
      this.day.end = "";
      this.day.pause = "";
      this.day.activities = [];
      this.checkForErrorsString = "";
    },
    // neuen Tag anlegen, dropdown auch leeren
    newDay: function() {
      this.emptyData();
      this.bus.$emit("DaySelect-refresh");
    },
    // Überprüfen, ob geupdated oder gespeichert werden muss
    saveHandler: function(day) {
      if (this.checkData()) {
        if (day.id === "" || day.id === null) {
          this.saveDay();
          // refresh dropdown
          this.bus.$emit("DaySelect-refresh");
        } else {
          // Tag ist gefüllt -> update Tag
          // console.log("Tag updaten");
          this.updateDay();
        }
      } else {
        this.displayModal(this.checkForErrorsString, "OK", "", "emptyModal");
      }
    },
    // Abfragen, ob Tag wirklich gelöscht werden soll
    deleteHandler: function() {
      this.displayModal(
        "Wollen sie den Tag wirklich löschen?",
        "Löschen",
        "btn-outline-danger",
        "deleteDay"
      );
    },
    // Tag löschen
    deleteDay() {
      if (this.day.id === "") {
        // Wenn Day.id leer ist -> Tag wurde noch nicht gespeichert -> Tag leeren
        this.emptyData();
      } else {
        // Wenn Day.id nicht leer ist -> DELETE Request an Server
        axios.delete("/api/v1/days/" + this.day.id).then(() => {
          // wenn erfolgreich gelöscht wurde, leeren und Tag-Drop-Down aktualisieren
          this.emptyData();
          this.bus.$emit("DaySelect-refresh");
        });
      }
    },
    // empty modal
    emptyModal: function() {
      this.modal.show = false;
      this.modal.Message = "";
      this.modal.BtnText = "";
    },
    // Show Modal, Pass function on confrirm
    displayModal: function(message, btnText, modalBtnClass, functionOnConfirm) {
      this.modal.Message = message;
      this.modal.BtnText = btnText;
      this.modal.FunctionOnConfirm = functionOnConfirm;
      this.modal.BtnClass = modalBtnClass;
      this.modal.show = true;
    },
    // execute passed function
    modalFunction: function() {
      this[this.modal.FunctionOnConfirm]();
      this.emptyModal();
    },
    // Summe der Aktivitätsstunden errechnen
    calcTotalActivity() {
      let sum = 0;
      this.day.activities.forEach(activity => {
        sum += Helper.timeToDecimal(activity.hours);
      });
      return !isNaN(sum) ? sum : "";
    },
    // Überprüfen, ob irgendwelche fehler vorliegen
    checkData: function() {
      let status = true;
      this.checkForErrorsString = "";

      // Überprüfen, ob der User schon einen Tag mit diesem Datum hat

      // Überprüfen, ob Datum ausgewählt wurde
      if (!this.day.date || typeof this.day.date.getMonth !== "function") {
        status = false;
        this.checkForErrorsString += "Bitte wählen Sie ein Datum aus. ";
      }

      // Überprüfen, ob Stunden übereinstimmen
      if (this.calcTotal !== this.calcTotalActivity()) {
        // console.log(
        //   "Total Falsch:" + this.calcTotalActivity() + "gegen " + this.calcTotal
        // );
        this.checkForErrorsString += "Die Stundensumme stimmt nicht überein. ";
        status = false;
        // Stunden sind nicht gleich
      } else if (
        this.day.date == "" ||
        this.day.start == "" ||
        this.day.end == "" ||
        this.day.pause == ""
      ) {
        // console.log("Felder leer");
        this.checkForErrorsString +=
          "Es sind nicht alle benötigten Zeitangaben getätigt wurden. ";
        status = false;
      } else if (
        Helper.timeToDecimal(this.day.start) >
        Helper.timeToDecimal(this.day.end)
      ) {
        this.checkForErrorsString +=
          "Die Anfangsuhrzeit liegt hinter der Enduhrzeit. ";
        // console.log("Richtung Falsch");
        status = false;
      }

      // Check if times (start, end) have the correct format
      if (
        !this.day.start.match(/\d{2}:\d{2}/) ||
        !this.day.end.match(/\d{2}:\d{2}/)
      ) {
        this.checkForErrorsString +=
          "Das Zeitformat der Zeiteingaben stimmt nicht. ";
        // console.log("doesnt match regex - day");
        status = false;
      }

      // Überprüfen, ob alle Tätigkeiten und das richtige Zeitformat haben
      this.day.activities.forEach(activity => {
        if (!activity.hours || !activity.hours.match(/\d{2}:\d{2}/)) {
          // console.log("doesnt match regex - activity");
          this.checkForErrorsString +=
            "Die Zeiten wurden nicht im korrekten Format [HH:MM] eingegeben. ";
          status = false;
        }
      });

      // Überprüfen, ob alle Tätigkeiten und Aufträge ausgewählt wurden
      this.day.activities.forEach(activity => {
        if (
          !activity.valueActivity.activity ||
          activity.valueActivity.activity === null ||
          !activity.valueOrders.order ||
          activity.valueOrders.order === null
        ) {
          this.checkForErrorsString +=
            "Es wurde nicht zu jeder Tätigkeit eine Aktivität oder ein Auftrag ausgewählt. ";
          // console.log("check: Activity");
          status = false;
        }
      });

      return status;
    }
  },
  computed: {
    // Stundensumme des Tages ausrechnen
    calcTotal() {
      let result =
        Helper.timeToDecimal(this.day.end) -
        Helper.timeToDecimal(this.day.start) -
        Helper.timeToDecimal(this.day.pause);
      return !isNaN(result) ? result : "";
    },
    // Aktivitätensumme erechnen
    checkTotal() {
      let sum = 0;
      if (this.day.activities) {
        this.day.activities.forEach(activity => {
          sum += Helper.timeToDecimal(activity.hours);
        });
      }
      return !isNaN(sum) ? sum : "";
    },
    // Überprüfen, ob Summen stimmen
    classTotal() {
      let status = false;
      if (this.calcTotal === this.checkTotal) {
        status = true;
      }
      return status;
    }
  }
};
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
<style scoped>
</style>
