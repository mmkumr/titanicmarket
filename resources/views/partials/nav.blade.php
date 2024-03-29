    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="/"><img src="{{asset('img/core-img/logo.png')}}" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><a href="#">Categories</a>
                                <ul class="dropdown">
                                    @foreach ($categories as $category)
                                        <li><a class="nav-link" href="{{ route('shop.index', ['category' => $category->slug]) }}">{{ $category->name }}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                            <li><a href="{{ route('contact') }}">Contact Us</a></li>
                            @guest
                            <li><a href="{{ route('login') }}">Login</a></li>
                            <li><a href="{{ route('register') }}">Create account</a></li>
                            @else
                            <li><a href="#"><i class="fa fa-user"></i>{{ Auth::user()->name }}</a>
                                <ul class="dropdown">
                                    <li><a href="{{ route('orders.index') }}">Orders</a></li>
                                    <li><a href="{{ route('users.edit') }}">Edit account</a></li>
                                    <li><a href="{{ route('profile') }}">Account details</a></li>
                                    <li class="nav-item"><a class="nav-link" href="{{ route('logout') }}"
                                     onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();">Logout</a>
                                    </li>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                     </form>
                                </ul>
                            </li>
                            @endguest 
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form class="d-flex justify-content-between">
                        <div class="aa-input-container" id="aa-input-container">
                            <input type="search" id="aa-search-input" class="aa-input-search" placeholder="Search products" name="search" autocomplete="off" />
                            <svg class="aa-input-icon" viewBox="654 -372 1664 1664">
                                    <path d="M1806,332c0-123.3-43.8-228.8-131.5-316.5C1586.8-72.2,1481.3-116,1358-116s-228.8,43.8-316.5,131.5  C953.8,103.2,910,208.7,910,332s43.8,228.8,131.5,316.5C1129.2,736.2,1234.7,780,1358,780s228.8-43.8,316.5-131.5  C1762.2,560.8,1806,455.3,1806,332z M2318,1164c0,34.7-12.7,64.7-38,90s-55.3,38-90,38c-36,0-66-12.7-90-38l-343-342  c-119.3,82.7-252.3,124-399,124c-95.3,0-186.5-18.5-273.5-55.5s-162-87-225-150s-113-138-150-225S654,427.3,654,332  s18.5-186.5,55.5-273.5s87-162,150-225s138-113,225-150S1262.7-372,1358-372s186.5,18.5,273.5,55.5s162,87,225,150s113,138,150,225  S2062,236.7,2062,332c0,146.7-41.3,279.7-124,399l343,343C2305.7,1098.7,2318,1128.7,2318,1164z" />
                            </svg>
                        </div>
                        <button type="submit" class="btn"></button>
                    </form>
                </div>
                
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="img/core-img/bag.svg" alt=""> <span>{{ Cart::instance('default')->count() }}</span></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    <div class="cart-bg-overlay"></div>

    <div class="right-side-cart-area">

        <!-- Cart Button -->
        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="img/core-img/bag.svg" alt=""> <span>{{ Cart::instance('default')->count() }}</span></a>
        </div>

        <div class="cart-content d-flex">

            <!-- Cart List Area -->
            <div class="cart-list">
                @foreach (Cart::content() as $item)
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                        <a href="{{ route('shop.show', $item->model->slug) }}"><img src="{{ productImage($item->model->image) }}" class="cart-thumb" alt=""></a>

                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                            <form action="{{ route('cart.destroy', $item->rowId) }}" method="POST">
                                {{ csrf_field() }}
                                {{ method_field('DELETE') }}

                                <button type="submit"><span class="product-remove">Remove</button>
                            </form>                            
                           <a href="{{ route('shop.show', $item->model->slug) }}"><h6>{{$item->name}}</h6></a>
                            <p class="price">Price: {{presentPrice($item->price)}} X {{$item->qty}} = {{presentPrice($item->total)}}</p>
                        </div>
                </div>
                @endforeach 
            </div>

            <!-- Cart Summary -->
            <div class="cart-amount-summary">

                <h2>Summary</h2>
                <ul class="summary-table">
                    <li><span>subtotal:</span> <span>{{ presentPrice(Cart::subtotal()) }}</span></li>
                    <li><span>delivery:</span> <span>Free</span></li>
                    <li><span>discount:</span> <span>-{{ presentPrice(session()->get('coupon')['discount']) }}</span></li>
                    @php ($discount = session()->get('coupon')['discount'])
                    <li><span>total:</span> <span>{{ presentPrice(Cart::subtotal() - $discount) }}</span></li>
                </ul>
                @if (!session()->has('coupon'))
                <div class="cupon_text d-flex align-items-center" align = right>
                    <form action="{{ route('coupon.store') }}" method="POST">
                        {{ csrf_field() }}
                        <input type="text" name="coupon_code" placeholder="Coupon Code">
                        <button type="submit" class="btn essence-btn">Apply</button>
                    </form>
                </div>
                @else
                <h3>Coupon code</h3>
                Code ({{ session()->get('coupon')['name'] }})
                <form action="{{ route('coupon.destroy') }}" method="POST">
                    {{ csrf_field() }}
                    {{ method_field('delete') }}
                    <button type="submit" style="font-size:14px;">Remove</button>
                </form>
                @endif
                <div class="checkout-btn mt-100">
                    <a href="{{ route('checkout.index') }}" class="btn essence-btn">check out</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->
<!--<header class="header_area sticky-header">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <a class="navbar-brand logo_h" href="{{ route('landing-page') }}"><img src="{{ asset('img/logo.png') }}" alt="" width="137px" height="70px"></a>

  		<ul class="nav navbar-nav navbar-right">
                        <li class="nav-item">
                            
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('cart.index') }}" class="cart"><span class="ti-bag"></span>@if (Cart::instance('default')->count() > 0)<span class="cart-count"><span>{{ Cart::instance('default')->count() }}</span></span>@endif</a>
                            <button class="search" style = "padding-left:30px"><span class="lnr lnr-magnifier" id="search"></span></button>
                        </li>
                </ul>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">Menu
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" href="/">Home</a></li>

                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                             aria-expanded="false">Categories</a>
                            <ul class="dropdown-menu">
                                @foreach ($categories as $category)
                                    <li class="nav-item"><a class="nav-link" href="{{ route('shop.index', ['category' => $category->slug]) }}">{{ $category->name }}</a></li>
                                @endforeach
                            </ul>
                        </li>
                        @guest
                        <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">Create account</a></li>
                        @endguest
                        <li class="nav-item"><a class="nav-link" href="{{ route('contact') }}">Contact us</a></li>
                        @guest 
                        @else 
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                             aria-expanded="false"><i class="fa fa-user"></i> {{ Auth::user()->name }}</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link" href="{{ route('orders.index') }}">Orders</a></li>
                                <li class="nav-item"><a class="nav-link" href="{{ route('users.edit') }}">Edit account</a></li>
                                <li class="nav-item"><a class="nav-link" href="{{ route('profile') }}">Account details</a></li>

                                <li class="nav-item"><a class="nav-link" href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">Logout</a>
                                </li>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    {{ csrf_field() }}
                                </form>
   
                            </ul>
                        </li>
                        @endguest
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item">
                            
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('cart.index') }}" class="cart"><span class="ti-bag"></span>@if (Cart::instance('default')->count() > 0)<span class="cart-count"><span>{{ Cart::instance('default')->count() }}</span></span>@endif</a>
                            <button class="search" style = "padding-left:30px"><span class="lnr lnr-magnifier" id="search"></span></button>
                        </li>
                </ul>
                </div>
            </div>
        </nav>
    </div>
    </div>
    <div class="search_input" id="search_input_box">
        <div class="container">
            <form class="d-flex justify-content-between">
<div class="aa-input-container" id="aa-input-container">
    <input type="search" id="aa-search-input" class="aa-input-search" placeholder="Search products" name="search"
        autocomplete="off" />
    <svg class="aa-input-icon" viewBox="654 -372 1664 1664">
        <path d="M1806,332c0-123.3-43.8-228.8-131.5-316.5C1586.8-72.2,1481.3-116,1358-116s-228.8,43.8-316.5,131.5  C953.8,103.2,910,208.7,910,332s43.8,228.8,131.5,316.5C1129.2,736.2,1234.7,780,1358,780s228.8-43.8,316.5-131.5  C1762.2,560.8,1806,455.3,1806,332z M2318,1164c0,34.7-12.7,64.7-38,90s-55.3,38-90,38c-36,0-66-12.7-90-38l-343-342  c-119.3,82.7-252.3,124-399,124c-95.3,0-186.5-18.5-273.5-55.5s-162-87-225-150s-113-138-150-225S654,427.3,654,332  s18.5-186.5,55.5-273.5s87-162,150-225s138-113,225-150S1262.7-372,1358-372s186.5,18.5,273.5,55.5s162,87,225,150s113,138,150,225  S2062,236.7,2062,332c0,146.7-41.3,279.7-124,399l343,343C2305.7,1098.7,2318,1128.7,2318,1164z" />
    </svg>
</div>
                <button type="submit" class="btn"></button>
                <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
            </form>
        </div>
    </div>
    <script>
    	var is_mobile = !!navigator.userAgent.match(/iphone|android|blackberry/ig) || false;
    	if(!is_mobile) {
    		document.getElementsByClassName('cart')[0].innerHTML=' ';
    		document.getElementsByClassName('search')[0].innerHTML=' ';
    	}
    </script>
</header>
-->
