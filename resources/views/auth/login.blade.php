<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Vegifruit| Login page</title>

    @include('partials.css')

<body>
    @include('partials.nav')

    <!--================Login Box Area =================-->
    

    <section class="login_box_area section_gap">
        <div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="img/login.jpg" alt="">
						<div class="hover">
							<h4>New to our website</h4>
                            <a class="primary-btn" href="{{ route('register') }}">Create an Account</a><br>
                            <a class="primary-btn" href="{{ route('guestCheckout.index') }}">Guest Account</a>
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
                        <h3>Log in to enter</h3>
                        <form class="row login_form" action="{{ route('login') }}" method="POST" id="contactForm">
                            {{ csrf_field() }}
							<div class="col-md-12 form-group">
								<input type="email" class="form-control" id="name" name="email" value="{{ old('email') }}" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'"required autofocus>
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="name" name="password" value="{{ old('password') }}" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
							    	<label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>							
                                </div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" class="primary-btn">Log In</button>
								<a href="{{ route('password.request') }}">Forgot Password?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

    @include('partials.footer')
    @include('partials.js')
	</body>

</html>
