@extends('layouts.app')

@section('content')

    <style>

    /*
    TO FIX SIZING ISSUE WITH THE JUMBOTRON
    */
        @media (min-width: 800px){
            .jumbotron{
                min-width: 420px;
            }
        }
    </style>
<div class="container">
    <div class="row justify-content-center">
        <div class="">
            <div class="card">
                <div class="card-header" style="">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="row">

                        <div class="col-lg-6 col-md-12 col-sm-12">

                            <div class="jumbotron">
                                <h1 class="display-6">Stunden</h1>
                                <hr class="my-4">

                                <p class="lead">
                                    <a class="btn btn-primary btn-lg" href="/stunden/vue" role="button"> <i class="fas fa-calendar-alt"></i> &nbsp; Stunden eingeben</a>
                                </p>
                            </div>

                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12">

                            <div class="jumbotron">
                                <h1 class="display-6">Nachrichten</h1>
                                <hr class="my-4">

                                <p class="lead">
                                    <a class="btn btn-primary btn-lg" href="/post" role="button"><i class="far fa-sticky-note"></i> Nachrichten ansehen</a>
                                </p>
                            </div>

                        </div>

                    </div>

                        <div class="card-body">

                            @foreach($posts as $post)
                            <div class="row">
                                <article class="w-100">
                                    <h4 class="title text-dark">{{ $post->title }}</h4>

                                    <p>
                                        {{ $post->inhalt }}
                                        <a href="/post/{{ $post->id }}">Mehr Lesen</a>
                                    </p>
                                    <p class="text-muted">
                                        <i class="fas fa-user"></i> &nbsp; {{ $post->user['Vorname'].' '.$post->user['Nachname'] }} &nbsp;
                                        <i class="fas fa-calendar-alt"></i>  &nbsp;{{ Carbon\Carbon::parse($post->created_at)->format('d.m.Y') }}&nbsp;
                                    </p>

                                </article>
                            </div>

                            @endforeach
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
