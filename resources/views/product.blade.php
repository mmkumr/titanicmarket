@extends ('layout')

@section ('title', $product->name)

@section ('content')

	<!--================Single Product Area =================-->
	<div class="product_image_area" style = "padding-top: 150px">
		<div class="container">
			<div class="row s_product_inner">
                <div class="col-lg-6  col-md-6 col-sm-6">
                @if (session()->has('success_message'))
                    <div class="alert alert-success">
                        {{ session()->get('success_message') }}
                    </div>
                @endif

                @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif
                    <div class="s_Product_carousel">
                        <div class="single-prd-item">
                                <img class="img-fluid" src="{{ productImage($product->image) }}" alt="">
                        </div>
                        @if ($product->images)
                            @foreach (json_decode($product->images, true) as $image)
                            <div class="single-prd-item">
                                <img class="img-fluid" src="{{ productImage($image) }}" alt="">
                            </div>
                        @endforeach
                    @endif
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>{{ $product->name }}</h3>
						<h2>{{ $product->presentPrice() }}</h2>
						<ul class="list">
							<li><span>Category</span> : {{$categories->where('id', $cid)->first()->name}}</li>
							<li><span>Availibility</span> : {!! $stockLevel !!}</li>
						</ul>
                        <div class="card_area d-flex align-items-center">
                        @if ($product->quantity > 0)
                        <form action="{{ route('cart.store', $product) }}" method="POST" id = "cart">
                            {{ csrf_field() }}
                        </form>
                            <a class="primary-btn" href="#" onclick="document.getElementById('cart').submit()">Add to Cart</a>
                        @endif
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
		    <h1>Description</h1>	
                    <p>{{$product->description}}</p>
        </div>
	</section>
    <!--================End Product Description Area =================-->
	<!-- Start related-product Area -->
	<section class="related-product-area section_gap_bottom">
		<div class="container">
            <h2 align = 'center'>Might Also Like to Purchase.</h2>
			<div class="row" style = "padding-top:20px">
				<div class="col-lg-12">
					<div class="row">
                    @foreach ($mightAlsoLike as $product)
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="{{ route('shop.show', $product->slug) }}"><img src="{{ productImage($product->image) }}" alt=""></a>
								<div class="desc">
									<a href="{{ route('shop.show', $product->slug) }}" class="title">{{ $product->name }}</a>
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
	<!-- End related-product Area -->

@endsection
