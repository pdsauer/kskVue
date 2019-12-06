@extends('layouts.app')

@section('content')

    <div class="container">


        <div class="row justify-content-center">
            <div class="col">
                <div class="card">
                    <div class="card-header">

                        <div class="row">

                            <div class="col text-right">
                                <div class="form-group pb-0 mb-0 row">
                                    <label for="DatumSelect" class="col-sm-5 col-form-label col-form-label-sm">Suche Stunden von Datum</label>
                                    <select id="DatumSelect" class="col-sm-3 form-control form-control-sm">

                                        <option disabled selected value> Datum auswählen </option>

                                        @foreach($days as $day)
                                        <option value="{{ $day->Std_ID }}">{{ \Carbon\Carbon::parse($day->Datum)->format('d.m.Y') }}</option>
                                        @endforeach()

                                    </select>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                    @endif

                    <!-- Suche eines Tages  -->

                        <div class="container bg-white">

                            <!-- Allgemeine-Tagesdaten-Eingbae   -->
                            <form method="POST" action="{{ route('stunden') }}">

                                @csrf

                                <div class="row">

                                    <div class="form-row col-lg-4 col-md-6 col-sm-12">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="datum">Datum</label>
                                                <input name="datum" type="date" class="form-control" id="datum" value="{{ old('datum') }}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row col-lg-4 col-md-6 col-sm-12">

                                        <div class="col">
                                            <div class="form-group">
                                                <label for="start">Von</label>
                                                <input name="von" type="time" class="form-control" id="start" value="{{ old('von') }}">
                                            </div>
                                        </div>

                                        <div class="col">
                                            <div class="form-group">
                                                <label for="ende">Bis</label>
                                                <input name="bis" type="time" class="form-control" id="ende" value="{{ old('bis') }}">
                                            </div>
                                        </div>


                                        <div class="col">
                                            <div class="form-group">
                                                <label for="pause">Pause (h)</label>
                                                <input name="pause" type="time" class="form-control" id="pause" value="{{ old('pause') }}">
                                               <!-- <input name="pause" type="number" step="0.01" min="0" class="form-control" id="pause" value="0.0"> -->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row col-lg-4 col-md-6 col-sm-12">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="gesamt">Std-gesamt</label>
                                                <input name="std_gesamt" type="text" id="gesamt" class="form-control" disabled>
                                                <small id="emailHelp" class="form-text text-muted">Die Gesamtstundenzahl wird automatisch errechnet.</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- <input class="btn btn-success" type="submit" value="Tag Speichern"> -->

                            </form>

                        </div>

                        <!-- Tätigkeiten-Eingabe   -->
                        <div class="row">
                            <div class="col-lg-11 col-md-8">
                                <h4 class="pl-3">Tätigkeiten</h4>
                            </div>
                            <div class="col-lg-1 col-md-4">
                                <button class="btn btn-light">
                                    <i class="fa fa-plus" title="Edit"></i>
                                </button>
                            </div>
                        </div>


                        <div class="container bg-light p-3">

                            <div class="form-row">

                                <div class="col-lg-2 col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="auftrags_id">Auftragsnummer</label>
                                        <select class="form-control" id="auftrags_id">
                                            <option disabled selected value> Auftrag auswählen </option>
                                            <option value="test123">2202/15</option>
                                            <option value="test234">2205/49</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="bauherr">Bauherr</label>
                                        <input type="text" class="form-control" id="bauherr" disabled>
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
                                        <select class="form-control" id="tätigkeit">
                                            <option disabled selected value> Tätigkeit auswählen </option>
                                            <option value="test123">Drucken</option>
                                            <option value="test234">Kopieren</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-1 col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="kilometer">Kilometer</label>
                                        <input type="number" class="form-control" id="kilometer">
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="bemerkung">Bemerkung</label>
                                        <input type="text" class="form-control" id="bemerkung">
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-12 col-md-6">
                                    <div class="form-group">
                                        <label for="stundenanzahl">Stundenanzahl</label>
                                        <input type="text" class="form-control" id="stundenanzahl">
                                    </div>
                                </div>
                            </div>


                        </div>

                        <!-- Bedienungsleiste -->
                        <div class="row mt-4">
                            <div class="col-lg-2 col-md-2">
                                <input class="btn btn-success" type="submit" value="Tag Speichern">
                            </div>

                            <div class="col-lg-8 col-md-">
                                <div class="form-group row">
                                    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Stundensumme</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control form-control-sm" id="colFormLabelSm" placeholder="0" disabled>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-2 col-md-2">
                                <button class="btn btn-outline-danger">Tag löschen</button>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection
