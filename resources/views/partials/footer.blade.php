<footer class="footer-area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-6  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6>About Us</h6>
                    <p>
                       We deliver fresh fruits, vegitables, dry fruits and Berhampur special(namkins, pickles, papads etc) items.
                    </p>
                </div>
            </div>
            <div class="col-lg-4  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6>Newsletter</h6>
                    <p>Stay update with our latest</p>
                    <div class="" id="mc_embed_signup">
                        <form class="row login_form" action="{{ route('subscribe') }}" method="POST" id="subscribe">
                            {{ csrf_field() }}
                            <div class="d-flex flex-row">
                                <input class="form-control" name="email" placeholder="Enter your E-Mail ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your E-Mail ID'" required type="email"autofocus>
                                <input class="form-control" name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" required>
                                
                            </div>
                            <a class="click-btn btn btn-default" href="#" onclick="document.getElementById('subscribe').submit()"><span class="lnr lnr-arrow-right"></span></a>
                            <div class="info"></div>
                        </form>
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
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="single-footer-widget" style = "padding-left:60px">
                    <h6>Follow Us</h6>
                    <p>Let us be social</p>
                    <div class="footer-social d-flex align-items-center">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-envelope"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
            <p class="footer-text m-0">
Copyright &copy;2019 All rights reserved by AMTech
</p>
        </div>
    </div>
</footer>
