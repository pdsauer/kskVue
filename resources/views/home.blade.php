@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div>
                        <h3>Stundeneingabe</h3>
                        <p>Gelangen Sie hier zur <a href="/stunden">Stundeneingabe</a></p>


                    </div>

                        <div>
                            <h3>Neuigkeiten</h3>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
