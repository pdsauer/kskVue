@extends('layouts.app')


@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        @guest
                            <h3>Achtung</h3>

                            <p>Bitte <a href="/login">melden Sie sich</a> an</p>

                        @endguest




                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection
