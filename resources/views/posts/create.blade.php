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

                                <h5 class="ml-4 mb-0">Einen Eintrag erstellen</h5>



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

                    <!-- Eintrag erstellen  -->

                        <div class="container bg-white">

                            <form method="POST" action ="/post/create">

                                @csrf

                                <div class="form-group">
                                    <label for="postTitle">Titel</label>
                                    <input type="text" class="form-control" name="postTitle" id="postTitle" placeholder="Titel eingeben" value {{ old('postTitle') }}>
                                </div>

                                <div class="form-group">
                                    <label for="postContent">Eintragstext</label>
                                    <textarea class="form-control" id="postContent" name="postContent" rows="7" placeholder="Text eingeben">{{ old('postContent') }}</textarea>
                                </div>





                                <!-- Bedienungsleiste -->
                                <div class="row">
                                    <div class="col mt-2">
                                        <input class="btn btn-success" type="submit" value="Veröffentlichen">
                                    </div>

                                    <div class="col"></div>

                                    <div class="col mt-3">
                                        <a class="text-danger" href="#">Abbrechen</a>
                                    </div>

                                </div>

                            </form>

                        </div>





                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection
