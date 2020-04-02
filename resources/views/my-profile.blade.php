@extends ('layout')
@section ('title', 'Profile')
@section ('content')
    
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb_area bg-img" style="background-image: url(img/bg-img/breadcumb.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="page-title text-center">
                    <img class="author_img rounded-circle" src="{{usersImage($user->dp)}}" alt="" style="display: block;margin-left: auto;margin-right: auto;height:200px;">
                </div>
            </div>
        </div>
    </div>
</div>

     <div class="container">
        @if (session()->has('success_message'))
            <div class="alert alert-success">
                {{ session()->get('success_message') }}
            </div>
        @endif

        @if(count($errors) > 0)
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
    </div>
        <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog_right_sidebar text-center">
                        <aside class="single_sidebar_widget author_widget">
                            <h4>{{$user->name}}</h4>
                            <p><strong>E-Mail:-</strong>{{$user->email}}</p>
                            <p><strong>Phone No.:-</strong>{{$user->phone}}</p>
                            <p><strong>Address:-</strong>{{$user->address  . ', ' . $user->city  . ', ' . $user->state . ', ' . $user->pin_code}}</p>
                            <p><strong>Wallet Balance:-</strong>{{ "₹" . $user->wallet }}</p>
                            <div class="br"></div>
                            <div class="hover">
                                <a class="btn essence-btn" href="{{ route('users.edit') }}">Edit Profile</a>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
