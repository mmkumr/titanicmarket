@extends ('layout')
@section ('title', 'Home')
@section ('content')
<!-- ##### Welcome Area Start ##### -->
<section class="welcome_area bg-img background-overlay" style="background-image: url(img/bg-img/bg-1.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="hero-content">
                    <h6>asoss</h6>
                    <h2>New Collection</h2>
                    <a href="#" class="btn essence-btn">view collection</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Welcome Area End ##### -->
<!-- ##### Top Catagory Area Start ##### -->
<div class="top_catagory_area section-padding-80 clearfix">
    <div class="container">
        <div class="row justify-content-center">
            @foreach ($categories as $category)
            <!-- Single Catagory -->
            <div class="col-12 col-sm-6 col-md-4">
                <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(img/category/{{$category->slug}}.jpg);"> 
                    <div class="catagory-content">
                        <a href="{{ route('shop.index', ['category' => $category->slug]) }}">{{$category->name}}</a>
                    </div>
                </div>
            </div>
            @endforeach 
        </div>
    </div>
</div>
<!-- ##### Top Catagory Area End ##### -->
<!-- ##### CTA Area Start ##### -->
<div class="cta-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="cta-content bg-img background-overlay" style="background-image: url(img/bg-img/bg-5.jpg);">
                    <div class="h-100 d-flex align-items-center justify-content-end">
                        <div class="cta--text">
                            <h6>-60%</h6>
                            <h2>Global Sale</h2>
                            <a href="#" class="btn essence-btn">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ##### CTA Area End ##### -->

<!-- ##### New Arrivals Area Start ##### -->
<section class="new_arrivals_area section-padding-80 clearfix">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading text-center">
                    <h2>Titanic Market Specials</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="popular-products-slides owl-carousel">
                    @foreach ($latest as $product)
                    <!-- Single Product -->
                    <div class="single-product-wrapper">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="{{ route('shop.show', $product->slug) }}">
                                <img  src="{{ productImage($product->image) }}" alt="">
                            </a>
                            <!-- Product Badge -->
                            <div class="product-badge new-badge">
                            @if ($product->quantity == 0)
                                <spam>{{ "Out of stock" }}</spam>
                            @else
                                <spam>{{ "In stock" }}</spam>
                            @endif
                                <h6></h6>
                            </div>
                        </div>
                        <!-- Product Description -->
                        <div class="product-description">
                            <a href="{{ route('shop.show', $product->slug) }}">
                                <h6>{{$product->name}}</h6>
                            </a>
                            <p class="product-price">{{ $product->presentPrice() }}</p>
                        </div>
                    </div>
                    @endforeach 
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### New Arrivals Area End ##### -->
<!--<script>
    var is_mobile = !!navigator.userAgent.match(/iphone|android|blackberry/ig) || false;
    if(is_mobile) {
    	var all = document.getElementsByClassName('img-fluid w-100');
    	var i=0;
    for (i, max=all.length; i < max; i++) {
    	document.getElementsByClassName('img-fluid w-100');
    }
    for (i, max=all.length; i < max; i++) {
    	document.getElementsByClassName('img-fluid w-100')[i].removeAttribute('class');
    }
    }
</script> -->
@endsection
