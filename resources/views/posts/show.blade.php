@extends('layouts.app')

@section('content')

    <div class="container">
        <div class="row justify-content-center">
            <div class="col">
                <div class="card">
                    <div class="card-header">Dashboard</div>

                        <div class="card-body">

                            <div class="">

                                <article class="">
                                    <h4 class="title text-dark">{{ $post->title }}</h4>

                                    <p>
                                        {{ $post->inhalt }}
                                    </p>
                                    <p class="text-muted">
                                        <i class="fas fa-user"></i> &nbsp; {{ $post->user['Vorname'].' '.$post->user['Nachname'] }} &nbsp;
                                        <i class="fas fa-calendar-alt"></i>  &nbsp; {{ Carbon\Carbon::parse($post->created_at)->format('d.m.Y') }}&nbsp;
                                    </p>

                                </article>

                                <a href="/post">zurück</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
