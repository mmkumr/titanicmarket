@extends ('layout')
@section ('title', 'Register')

@section ('content')
    <!--================Login Box Area =================-->
    <section class="login_box_area section_gap">
        <div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="img/login.jpg" alt="">
						<div class="hover">
							<h4>Already have an account!!</h4>
                            <a class="primary-btn" href="{{ route('login') }}">Login</a><br>
						</div>
					</div>
				</div>
                <div class="col-lg-6">
                    <div class="login_form_inner">
                        @if (session()->has('success_message'))
                            <div class="alert alert-success">
                                {{ session()->get('success_message') }}
                            </div>
                            @endif @if(count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <h3>Create Account</h3>
                            
                        <form class="row login_form" action="{{ route('register') }}" method="POST" id="contactForm">
                            <div class="col-lg-6 col-md-6">
                                    <img class="img-fluid w-100" src="img/users/default.png" alt="">
                            </div>
                            <input id="profile_pic" name="profile_pic" type="file">
                            {{ csrf_field() }}
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder = 'Name' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'"required>
                            </div>
                            <div class="col-md-12 form-group">
								<input type="email" class="form-control" id="email" name="email" placeholder = 'Email' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'"required>
                            </div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="name" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
                            </div>
                            <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="password-confirm" name="password_confirmation"  placeholder="Confirm Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'" required>
							</div>
                            <div class="col-md-12 form-group">
								<input type="tel" class="form-control" id="name" name="number"  placeholder = 'Phone Number' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'" required>
                            </div>
							<div class="col-md-12 form-group">
								<button type="submit" class="primary-btn">Log In</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
@endsection
