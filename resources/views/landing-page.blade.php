@extends ('layout')
@section ('title', 'Home')

@section ('content')
	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1>Fresh Fruit, Vegetables,<br>namkins etc.</h1>
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>Fresh Fruit, Vegetables<br>and namkins etc.</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- start features Area -->
	<section class="features-area section_gap">
		<div class="container">
			<div class="row features-inner">
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon3.png" alt=""height = 50px>
						</div>
						<h6>Additional Offers</h6>
						<p>We provide cashbacks and coupons.</p>
					</div>
                </div>
				<!-- single features -->
				<div class="col-lg-3 col-md-4 col-sm-4">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon5.png" alt="" height = 50px>
                        </div>
						<h6>Best quality</h6>
						<p>We provide best quality products.</p>
					</div>
				</div>

				<!-- single features -->
				<div class="col-lg-3 col-md-4 col-sm-4">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon4.png" alt="">
						</div>
						<h6>Secure Payment</h6>
						<p>Our website is encrypted for our security.</p>
					</div>
                </div>
                <!-- single features -->
				<div class="col-lg-3 col-md-4 col-sm-4">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/features/f-icon6.png" alt=""height = 50px>
						</div>
						<h6>Carrier Charges</h6>
						<p>Carrier charges are applied on every purchase.</p>
					</div>
                </div>
			</div>
		</div>
	</section>
    <!-- end features Area -->
    @php ( $i = 0 )
    @php ( $col = array(0, 8, 4, 4, 8, 8, 4, 4, 8) )
    <!-- Start category Area -->
	<section class="category-area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 col-md-12">
                    <div class="row">
                    @foreach ($categories as $category)
                    @php ($i = $i + 1)
					<a href="{{ route('shop.index', ['category' => $category->slug]) }}">
						<div class="col-lg-{{$col[$i]}} col-md-{{$col[$i]}}">
							<div class="single-deal">
                                <div class="overlay"></div>
                                @if ($col[$i] == 4)
								    <img  src="img/category/{{$category->slug}}.jpg" alt="" width="350px" height="295px">
                                @endif
                                @if ($col[$i] == 8)
								    <img src="img/category/{{$category->slug}}.jpg" alt="" width="730px" height="295px">
                                @endif
									<div class="deal-details">
										<h6 class="deal-title">{{$category->name}}</h6>
									</div>
                            </div>
						</a>
                        </div>
                        @endforeach 
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End category Area -->

	<!-- start product Area -->
	<section class="owl-carousel active-product-area section_gap">
		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Latest Products</h1>
						</div>
					</div>
				</div>
				<div class="row">
                    <!-- single product -->
                    @php ($i = 0)
                    @foreach ($latest as $product)
					<div class="col-lg-3 col-md-6">
                        <div class="single-product">
                            <a href="{{ route('shop.show', $product->slug) }}">
                                <img  src="{{ productImage($product->image) }}" alt="" width="200px" height="200px">
                            </a>
                            <div class="product-details">
                                <a href="{{ route('shop.show', $product->slug) }}">
                                    <h6>{{$product->name}}</h6>
                                </a>
								<div class="price">
									<h6>{{ $product->presentPrice() }}</h6>
								</div>
								<form action="{{ route('cart.store', $product) }}" method="POST" class = "link-form-bag">
                                        {{ csrf_field() }}
                                </form>
								<div class="prd-bottom">
								    <a href="javascript:document.getElementsByClassName('link-form-bag')[{{$i}}].submit()"  class="social-info">
									    <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
									</a>

									<a href="{{ route('shop.show', $product->slug) }}" class="social-info">
                                        <span class="lnr lnr-move"></span>
                                        <p class="hover-text">view more</p>
                                    </a>							
                                </div>
							</div>
						</div>
                    </div>
                    @php ($i = $i + 1)
                    @endforeach
				</div>
			</div>
        </div>
										

		<!-- single product slide -->
		<div class="single-product-slider">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6 text-center">
						<div class="section-title">
							<h1>Vegifruit Specials</h1>
						</div>
					</div>
				</div>
                <div class="row">
                    @php ($j = $i - 1)
                    @foreach ($special as $product)
					<!-- single product -->
					<div class="col-lg-3 col-md-6">
						<div class="single-product">
							<a href="{{ route('shop.show', $product->slug) }}">
                                <img class="img-fluid" src="{{ productImage($product->image) }}" alt="" width="200px" height="200px">
                            </a>
                            <div class="product-details">
                                <a href="{{ route('shop.show', $product->slug) }}">
                                    <h6>{{$product->name}}</h6>
                                </a>
								<div class="price">
									<h6>{{ $product->presentPrice() }}</h6>
								</div>
								<form action="{{ route('cart.store', $product) }}" method="POST" class = "link-form-bag">
                                        {{ csrf_field() }}
                                </form>
								<div class="prd-bottom">
								    <a href="javascript:document.getElementsByClassName('link-form-bag')[{{$i}}].submit()"  class="social-info">
									    <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
									</a>

									<a href="{{ route('shop.show', $product->slug) }}" class="social-info">
                                        <span class="lnr lnr-move"></span>
                                        <p class="hover-text">view more</p>
                                    </a>
								</div>
							</div>
						</div>
                    </div>
                    @php ($j = $j + 1)
                    @endforeach
				</div>
			</div>
		</div>
	</section>
	<!-- end product Area -->

    <!-- Start related-product Area -->
    @if ($products->count())
	<section class="related-product-area section_gap_bottom" >
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>Deals of the Week</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
                    <div class="row">
                        @foreach ($products as $product)
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="{{ route('shop.show', $product->slug) }}"><img src="{{ productImage($product->image) }}" alt="" width="100px" height="100px"></a>
								<div class="desc">
									<a href="{{ route('shop.show', $product->slug) }}" class="title">{{$product->name}}</a>
									<div class="price">
										<h6>{{ $product->presentPrice() }}</h6>
									</div>
								</div>
							</div>
                        </div>
                        @endforeach 
					</div>
				</div>
			</div>
		</div>
    </section>
    @endif
	<!-- End related-product Area -->
@endsection
