@extends('layouts.app') 
@section('content')
 
 <div id="appStunden">


    <div class="container">


        <div class="row justify-content-center">
            <div class="col">
                <div class="card">
                    <div class="card-header">


                            <day-selector></day-selector>


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
                            <day-data></day-data>	


                        </div>

                        <!-- Tätigkeiten-Eingabe   -->
                       <activity-fields></activity-fields>

                        <!-- Bedienungsleiste -->
                        <control-bar></control-bar>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="mt-5">

    </div>


 </div>

@endsection