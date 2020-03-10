<?php

namespace App\Http\Controllers;

use App\Post;
use Carbon\Carbon;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Redirector;
use Illuminate\View\View;

class postController extends Controller
{
    // Sicher gehen, dass User ingeloggt ist
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function create(){
        return view('posts.create');
    }

    public function show(Post $post){

        return view('posts.show', ['post' => $post]);
    }

    /**
     * Store Post
     *
     * @return Factory|View
     * @throws \Exception
     */
    public function index(){

        $posts = Post::paginate(10);
        // return Post::paginate(10);
        return view('posts.index', [
            'posts' => $posts
        ]);
    }

    /**
     * Store Post
     *
     * @param Request $request
     * @return RedirectResponse|Redirector
     */
    public function store(Request $request){

        // Nur Mitglieder der Gruppe 1 dürfen Posts machen
        if(1 == auth()->user()->Gruppe  || 1 == auth()->user()->Zugrifsrechte ){
            $post = new Post();
            $valdiated = $request->validate([
                'postTitle' => 'required|string',
                'postContent' => 'required|string',
                'BüroSelect' => 'required|integer',
            ]);

            $post->title = $valdiated['postTitle'];
            $post->inhalt = $valdiated['postContent'];
            $post->Für_Büro = $valdiated['BüroSelect'];
            $post->author = auth()->user()->PersNr;
            $post->created_at = Carbon::now();

            $post->save();
        }

        return redirect('/post');
    }
}
