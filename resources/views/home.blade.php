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

                    <div>
                        <h3>Stundeneingabe</h3>
                        <p>Gelangen Sie hier zur <a href="/stunden">Stundeneingabe</a></p>


                    </div>

                        <div class="mt-4">

                            <h2>Neuigkeiten</h2>

                                <article class="">
                                    <h4 class="title text-dark">Bitte neuen Index verwenden</h4>

                                    <p>
                                        60% of organizations were exposed to actual or attempted fraud loss last year.
                                        As fraud and risk increases year over year, the amount of data being collected increases as well.
                                        <a class="ml-1" href="/post/4">Mehr lesen</a>
                                    </p>
                                    <p class="text-muted">
                                        <i class="fas fa-user"></i> &nbsp; John Doe &nbsp;
                                        <i class="fas fa-calendar-alt"></i>  &nbsp; Juli 23, 2014 &nbsp;
                                    </p>

                                </article>

                                <article class="">
                                    <h4 class="title text-dark">Bitte neuen Index verwenden</h4>

                                    <p>
                                        60% of organizations were exposed to actual or attempted fraud loss last year.
                                        As fraud and risk increases year over year, the amount of data being collected increases as well.
                                        <a class="ml-1" href="#">Mehr lesen</a>
                                    </p>
                                    <p class="text-muted">
                                        <i class="fas fa-user"></i> &nbsp; John Doe &nbsp;
                                        <i class="fas fa-calendar-alt"></i>  &nbsp; Juli 23, 2014 &nbsp;
                                    </p>

                                </article>

                                <article class="">
                                    <h4 class="title text-dark">Bitte neuen Index verwenden</h4>

                                    <p>
                                        60% of organizations were exposed to actual or attempted fraud loss last year.
                                        As fraud and risk increases year over year, the amount of data being collected increases as well.
                                        <a class="ml-1" href="#">Mehr lesen</a>
                                    </p>
                                    <p class="text-muted">
                                        <i class="fas fa-user"></i> &nbsp; John Doe &nbsp;
                                        <i class="fas fa-calendar-alt"></i>  &nbsp; Juli 23, 2014 &nbsp;
                                    </p>

                                </article>

                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
