@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Nachrichten

                        @if(1 == auth()->user()->Gruppe  || 1 == auth()->user()->ZugriffRechte)
                        <a href="/post/create">Nachricht erstellen</a>
                        @endif
                    </div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif


                        @foreach($posts as $post)
                            <article class="post-list">
                                <h4 class="title text-dark">{{ $post->title }}</h4>

                                <p>
                                    {{ Str::limit($post->inhalt) }}
                                    <a href="/post/{{ $post->id }}">Mehr Lesen</a>
                                </p>
                                <p class="text-muted">
                                    <i class="fas fa-user"></i> &nbsp;  {{ $post->user['Vorname'].' '.$post->user['Nachname'] }}
                                    <i class="fas fa-calendar-alt"></i>  &nbsp; {{ Carbon\Carbon::parse($post->created_at)->format('d.m.Y') }}&nbsp;
                                </p>

                            </article>
                        @endforeach


                            <a href="/home">zurück</a>

                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection
