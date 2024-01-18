@extends('layouts.front-end.app')

@section('title', $web_config['name']->value.' '.\App\CPU\translate('Online Shopping').' | '.$web_config['name']->value.' '.\App\CPU\translate(' Ecommerce'))

@push('css_or_js')
    <meta property="og:image" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>
    <meta property="og:title" content="Welcome To {{$web_config['name']->value}} Home"/>
    <meta property="og:url" content="{{env('APP_URL')}}">
    <meta property="og:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <meta property="twitter:card" content="{{asset('storage/app/public/company')}}/{{$web_config['web_logo']->value}}"/>
    <meta property="twitter:title" content="Welcome To {{$web_config['name']->value}} Home"/>
    <meta property="twitter:url" content="{{env('APP_URL')}}">
    <meta property="twitter:description" content="{!! substr($web_config['about']->value,0,100) !!}">

    <link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/home.css"/>
    
    <style>
        .cz-countdown-days {
            border: .5px solid{{$web_config['primary_color']}};
        }

.btn-scroll-top {
            background:  {{$web_config['primary_color']}};
        }

.__best-selling:hover .ptr,
        .flash_deal_product:hover .flash-product-title {
            color:  {{$web_config['primary_color']}};
        }

        .cz-countdown-hours {
            border: .5px solid{{$web_config['primary_color']}};
        }

        .cz-countdown-minutes {
            border: .5px solid{{$web_config['primary_color']}};
        }

        .cz-countdown-seconds {
            border: .5px solid{{$web_config['primary_color']}};
        }

        .flash_deal_product_details .flash-product-price {
            color: {{$web_config['primary_color']}};
        }

        .featured_deal_left {
            background: {{$web_config['primary_color']}} 0% 0% no-repeat padding-box;
        }

        .category_div:hover {
            color: {{$web_config['secondary_color']}};
        }

        .deal_of_the_day {
            background: {{$web_config['secondary_color']}};
        }

        .best-selleing-image {
            background:{{$web_config['primary_color']}}10;
        }
        .top-rated-image{
            background:{{$web_config['primary_color']}}10;
        }
        @media (max-width: 800px) {
            .categories-view-all {
                {{session('direction') === "rtl" ? 'margin-left: 10px;' : 'margin-right: 6px;'}}
            }
            .categories-title {
                {{Session::get('direction') === "rtl" ? 'margin-right: 0px;' : 'margin-left: 6px;'}}
            }
            .seller-list-title{
                {{Session::get('direction') === "rtl" ? 'margin-right: 0px;' : 'margin-left: 10px;'}}
            }
            .seller-list-view-all {
                {{Session::get('direction') === "rtl" ? 'margin-left: 20px;' : 'margin-right: 10px;'}}
            }
            .category-product-view-title {
                {{Session::get('direction') === "rtl" ? 'margin-right: 16px;' : 'margin-left: -8px;'}}
            }
            .category-product-view-all {
                {{Session::get('direction') === "rtl" ? 'margin-left: -7px;' : 'margin-right: 5px;'}}
            }
        }
        @media(min-width:801px){
            .categories-view-all {
                {{session('direction') === "rtl" ? 'margin-left: 30px;' : 'margin-right: 27px;'}}
            }
            .categories-title {
                {{Session::get('direction') === "rtl" ? 'margin-right: 25px;' : 'margin-left: 25px;'}}
            }
            .seller-list-title{
                {{Session::get('direction') === "rtl" ? 'margin-right: 6px;' : 'margin-left: 10px;'}}
            }
            .seller-list-view-all {
                {{Session::get('direction') === "rtl" ? 'margin-left: 12px;' : 'margin-right: 10px;'}}
            }
            .seller-card {
                {{Session::get('direction') === "rtl" ? 'padding-left:0px !important;' : 'padding-right:0px !important;'}}
            }
            .category-product-view-title {
                {{Session::get('direction') === "rtl" ? 'margin-right: 10px;' : 'margin-left: -12px;'}}
            }
            .category-product-view-all {
                {{Session::get('direction') === "rtl" ? 'margin-left: -20px;' : 'margin-right: 0px;'}}
            }
        }
        .countdown-card{
            background:{{$web_config['primary_color']}}10;

        }
        .flash-deal-text{
            color: {{$web_config['primary_color']}};
        }
        .countdown-background{
            background: {{$web_config['primary_color']}};
        }
     }
     .czi-arrow-left{
        color: {{$web_config['primary_color']}};
        background: {{$web_config['primary_color']}}10;
     }
     .czi-arrow-right{
        color: {{$web_config['primary_color']}};
        background: {{$web_config['primary_color']}}10;
     }
  .flash-deals-background-image{
    background: {{$web_config['primary_color']}}10;
  }
  .view-all-text{
    color:{{$web_config['secondary_color']}} !important;
  }
  .feature-product .czi-arrow-left{
        color: {{$web_config['primary_color']}};
        background: {{$web_config['primary_color']}}10
     }

     .feature-product .czi-arrow-right{
        color: {{$web_config['primary_color']}};
        background: {{$web_config['primary_color']}}10;
        font-size: 12px;
     }
     /*  */
     .tab-container {
    display: flex;
    justify-content: center;
}
.__cat2-item {
    display: block;
    max-width: 57px;
    border-radius: 50%;
    aspect-ratio: 1;
    overflow: hidden;
    border: 1px solid #e5e5e5;
}

.tab {
    cursor: pointer;
    background-color: white;
    color: #a67c52;
    border: 3px solid #a67c52;
    border-radius: 10px;
    padding: 10px 20px;
    width: 117px;
    margin: 10px;
    transition: background-color 0.3s, color 0.3s, border-color 0.3s;
    white-space: nowrap;
    font-size: 19px;
    font-weight: 800;
    text-align: center;
}

.tab img {
    width: 30px; /* Set the desired width */
    height: 30px; /* Set the desired height */
    margin-right: 5px; /* Add some spacing between the image and text */
    display: none;
}

.tab.active {
    background-color: #a67c52;
    color: white;
}

.tab-content {
    display: block;
    padding: 20px;
}

    .tab-container {
        display: flex;  /* Use flexbox */
        justify-content: space-evenly;  /* Evenly space items along the main axis */
        align-items: center;  /* Center items along the cross axis */
    }

    /* Style for each tab */
    .tab {
        /* Add any additional styling for your tabs */
        /* For example: */
        padding: 10px;
        border: 1px solid #ccc;
    }



/*.tab-content.active {*/
/*    display: block;*/
/*}*/
    </style>

    <link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/owl.theme.default.min.css"/>
@endpush

@section('content')
<div class="__inline-61">
    @php($business_mode=\App\CPU\Helpers::get_business_settings('business_mode'))
    {{--categries--}}
   
   <div class="tab-container">
        @foreach($categories as $key=>$category)
            @if($category->name=="Apparel")
            <a href="{{route('home')}}">
            <div class="tab active" id="tab1" > <!-- Tab 1 -->
                <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                src="{{asset("storage/app/public/category/$category->icon")}}"
                alt="{{$category->name}}" >
                <span>Apparel</span>
            </div>
            </a>
            @endif
            @if($category->name=="Craft")
            <a href="{{route('handicraft')}}">
            <div class="tab" id="tab2"> <!-- Tab 2 -->
                <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                src="{{asset("storage/app/public/category/$category->icon")}}"
                alt="{{$category->name}}">
                <span>Craft</span>
            </div>
            </a>
            @endif
             @if($category->name=="Decor")
            <a href="{{route('decor')}}">
            <div class="tab" id="tab3"> <!-- Tab 3 -->
                <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                src="{{asset("storage/app/public/category/$category->icon")}}"
                alt="{{$category->name}}">
                <span>Decor</span>
            </div>
            </a>
            @endif
             @if($category->name=="Artifacts")
            <a href="{{route('artifacts')}}">
            <div class="tab" id="tab4"> <!-- Tab 4 -->
                <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                src="{{asset("storage/app/public/category/$category->icon")}}"
                alt="{{$category->name}}">
                <span>Artifacts</span>
            </div>
            </a>
            @endif
        @endforeach
     </div>

    <!--<div id="content1" class="card tab-content" style="margin:15px">-->
    <!--    @foreach($categories as $key=>$category)-->
    <!--        @if($category->name=="Handloom")-->
    <!--            <div class="owl-carousel owl-theme "  id="cat1">-->
    <!--                @foreach($category['childes'] as $subCategory)-->
    <!--                    <div class="item">-->
    <!--                        <a href="{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}">-->
    <!--                        <div  class="__cat2-item">-->
    <!--                            <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'" style=""-->
    <!--                                src="{{asset("storage/app/public/category/$subCategory->icon")}}"-->
    <!--                                alt="{{$subCategory->name}}">-->
    <!--                        </div>-->
    <!--                        <p class="text-center small mt-2">{{Str::limit($subCategory->name, 12)}}</p>-->
    <!--                        </a>-->
    <!--                    </div>-->
    <!--                @endforeach-->
    <!--            </div>-->
    <!--        @endif-->
    <!--    @endforeach-->
    <!--</div>-->
    
@php($decimal_point_settings = !empty(\App\CPU\Helpers::get_business_settings('decimal_point_settings')) ? \App\CPU\Helpers::get_business_settings('decimal_point_settings') : 0)
    <!-- Hero (Banners + Slider)-->
    <section class="bg-transparent mb-3">
        <div>
            <div class="row " style="display:block;">
                <div class="col-12">
                    @include('web-views.partials._home-top-slider')
                </div>
            </div>
        </div>
    </section>
    
    
    <div id="content2" class="card tab-content" style="margin:15px">
        @foreach($categories as $key=>$category)
        @if($category->name=="Apparel")
        <div class="owl-carousel owl-theme "  id="cat1">
            @foreach($category['childes'] as $subCategory)
                <div class="item">
                    <a href="{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}">
                    <div  class="__cat2-item">
                        <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'" style=""
                            src="{{asset("storage/app/public/category/$subCategory->icon")}}"
                            alt="{{$subCategory->name}}">
                    </div>
                    <p class="text-center small mt-2">{{Str::limit($subCategory->name, 12)}}</p>
                    </a>
                </div>
            @endforeach
        </div>
    @endif
        @endforeach
    </div>
    
       
    
    
    <div class="container rtl">
        <div class="row g-3">
            <div class="col-md-6">
                <div class="card card __shadow h-100">
                    <div class="card-body p-xl-35">
                        <div class="row d-flex justify-content-between mx-1 mb-3">
                            <div>
                                <img class="size-30"  src="{{asset("public/assets/front-end/png/best sellings.png")}}"
                                         alt="">
                                    <span class="font-bold pl-1">{{ \App\CPU\translate('best sellings')}}</span>
                            </div>
                            <div>
                                <a class="text-capitalize view-all-text"
                                    href="{{route('products',['data_from'=>'best-selling','page'=>1])}}">{{ \App\CPU\translate('view_all')}}
                                    <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>
                                </a>
                            </div>
                        </div>
                        <div>
                            @foreach($bestSellProduct as $key=>$bestSell)
                                @if($bestSell->product && $key<3)
                                    <a class="__best-selling" href="{{route('product',$bestSell->product->slug)}}">
                                         @if($bestSell->product->discount > 0)
                                                <div class="d-flex" style="top:0;position:absolute;{{Session::get('direction') === "rtl" ? 'right:0;' : 'left:0;'}}">
                                                    <span class="for-discoutn-value p-1 pl-2 pr-2" style="{{Session::get('direction') === "rtl" ? 'border-radius:0px 5px' : 'border-radius:5px 0px'}};">
                                                        @if ($bestSell->product->discount_type == 'percent')
                                                            {{round($bestSell->product->discount)}}%
                                                        @elseif($bestSell->product->discount_type =='flat')
                                                            {{\App\CPU\Helpers::currency_converter($bestSell->product->discount)}}
                                                        @endif {{\App\CPU\translate('off')}}
                                                    </span>
                                                </div>
                                            @endif
                                        <div class="d-flex flex-wrap p-2">
                                            <div class="best-selleing-image">
                                                <img class="rounded" onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'" src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$bestSell->product['thumbnail']}}" alt="Product"/>
                                            </div>
                                            <div class="best-selling-details">
                                                <h6 class="widget-product-title">
                                                    <span class="ptr">
                                                        {{\Illuminate\Support\Str::limit($bestSell->product['name'],100)}}
                                                    </span>
                                                </h6>
                                                @php($bestSell_overallRating = \App\CPU\ProductManager::get_overall_rating($bestSell->product['reviews']))
                                                <div class="rating-show">
                                                    <span class="d-inline-block font-size-sm text-body">
                                                        @for($inc=0;$inc<5;$inc++)
                                                            @if($inc<$bestSell_overallRating[0])
                                                                <i class="p-0 sr-star czi-star-filled active"></i>
                                                            @else
                                                                <i class="p-0 sr-star czi-star __color-fea569"></i>
                                                            @endif
                                                        @endfor
                                                        <label class="badge-style">( {{$bestSell->product->reviews_count}} )</label>
                                                    </span>
                                                </div>
                                                <div>
                                                    @if($bestSell->product->discount > 0)
                                                            <strike class="__color-E96A6A __text-12px">
                                                                {{\App\CPU\Helpers::currency_converter($bestSell->product->unit_price)}}
                                                            </strike>
                                                    @endif
                                                </div>
                                                <div class="widget-product-meta">
                                                    <span class="text-accent">
                                                        {{\App\CPU\Helpers::currency_converter(
                                                        $bestSell->product->unit_price-(\App\CPU\Helpers::get_product_discount($bestSell->product,$bestSell->product->unit_price))
                                                        )}}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>

     {{-- Banner  --}}
    <div class="container rtl py-4 ">
        <div class="row g-3">
            @foreach(\App\Model\Banner::where('banner_type','Footer Banner')->where('published',1)->orderBy('id','desc')->take(2)->get() as $banner)
                <div class="col-md-6">
                    <a href="{{$banner->url}}" class="d-block">
                         <img class="footer_banner_img"
                              onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                              src="{{asset('storage/app/public/banner')}}/{{$banner['photo']}}">
                     </a>
                </div>
            @endforeach
        </div>
    </div>
    
    
    
     <div class="container rtl mt-4">
        <div class="arrival-title">
            <div>
                <img  src="{{asset("public/assets/front-end/png/new-arrivals.png")}}" alt="">

            </div>
            <div class="pl-2">
                {{ \App\CPU\translate('ARRIVALS')}}
            </div>
        </div>
    </div>
    <div class="container rtl mb-3 overflow-hidden">
        <div class="py-2">
            <div class="new_arrival_product">
                <div class="carousel-wrap" >
                    <div class="owl-carousel owl-theme" id="new-arrivals-product">
                        @foreach($latest_products as $key=>$product)

                                @include('web-views.partials._product-card-1',['product'=>$product,'decimal_point_settings'=>$decimal_point_settings])

                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    @php($main_section_banner = \App\Model\Banner::where('banner_type','Main Section Banner')->where('published',1)->orderBy('id','desc')->latest()->first())
    @if (isset($main_section_banner))
    <div class="container rtl mb-3">
        <div class="row" >
            <div class="col-12 pl-0 pr-0">
                <center>
                <a href="{{$main_section_banner->url}}"
                    class="cursor-pointer">
                    <img  onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                            src="{{asset('storage/app/public/banner')}}/{{$main_section_banner['photo']}}">
                </a>
                </center>
            </div>
        </div>
    </div>
    @endif
    

   

   <!--
    <div class="container rtl">
        <div class="row">
            
            @if ($business_mode == 'multi')
                <div class="col-md-12" style="margin:15px">
                    <div class="card __shadow h-100">
                        <div class="card-body">
                            <div class="row d-flex justify-content-between">
                                <div class="categories-title">
                                    <span class="font-semibold">{{ \App\CPU\translate('categories')}}</span>
                                </div>
                                <div class="categories-view-all">
                                    <a class="text-capitalize view-all-text"
                                    href="{{route('categories')}}">{{ \App\CPU\translate('view_all')}}
                                    <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-3">
                                @foreach($categories as $key=>$category)

                                    @if ($key<10)
                                    <div class="text-center __m-5px __cate-item">
                                        <a href="{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}">
                                            <div class="__img">
                                                <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                    src="{{asset("storage/app/public/category/$category->icon")}}"
                                                    alt="{{$category->name}}">
                                            </div>
                                            <p class="text-center small mt-2">{{Str::limit($category->name, 12)}}</p>
                                        </a>
                                    </div>
                                    @endif

                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            @else
                <div class="col-md-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="row d-flex justify-content-between">
                                <div style="{{Session::get('direction') === "rtl" ? 'margin-right: 20px;' : 'margin-left: 16px;'}}">
                                    <span class="font-semibold">{{ \App\CPU\translate('categories')}}</span>
                                </div>
                                <div style="{{Session::get('direction') === "rtl" ? 'margin-left: 15px;' : 'margin-right: 13px;'}}">
                                    <a class="text-capitalize view-all-text"
                                    href="{{route('categories')}}">{{ \App\CPU\translate('view_all')}}
                                    <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-3">
                                @foreach($categories as $key=>$category)
                                    @if ($key<11)
                                        <div class="text-center __m-5px __cate-item">
                                            <a href="{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}">
                                                <div class="__img">
                                                    <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                        src="{{asset("storage/app/public/category/$category->icon")}}"
                                                        alt="{{$category->name}}">
                                                    <p class="text-center small mt-1">{{Str::limit($category->name, 12)}}</p>
                                                </div>
                                            </a>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            @endif
            -->
            <!-- top sellers -->
               
        <!--@if ($business_mode == 'multi')-->
        <!--    @if(count($top_sellers) > 0)-->
        <!--        <div class="col-md-12 mt-2 mt-md-0 seller-card" >-->
        <!--            <div class="card __shadow h-100">-->
        <!--                <div class="card-body">-->
        <!--                    <div class="row d-flex justify-content-between">-->
        <!--                        <div class="seller-list-title">-->
        <!--                            <span class="font-semibold">{{ \App\CPU\translate('sellers')}}</span>-->
        <!--                        </div>-->
        <!--                        <div class="seller-list-view-all">-->
        <!--                            <a class="text-capitalize view-all-text"-->
        <!--                            href="{{route('sellers')}}">{{ \App\CPU\translate('view_all')}}-->
        <!--                            <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>-->
        <!--                            </a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                    <div class="row mt-3">-->
        <!--                        @foreach($top_sellers as $key=>$seller)-->
        <!--                            @if ($key<10)-->

        <!--                                @if($seller->shop)-->
        <!--                                    <div class="__m-5px __cate-item">-->
        <!--                                        <a href="{{route('shopView',['id'=>$seller['id']])}}">-->
        <!--                                            <div class="__img circle">-->
        <!--                                            <img onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"-->
        <!--                                                src="{{asset("storage/app/public/shop")}}/{{$seller->shop->image}}">-->
        <!--                                            </div>-->
        <!--                                            <p class="text-center small mt-2">{{Str::limit($seller->shop->name, 14)}}</p>-->
        <!--                                        </a>-->
        <!--                                    </div>-->
        <!--                                @endif-->
        <!--                            @endif-->
        <!--                        @endforeach-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--            </div>-->
        <!--        </div>-->
        <!--    @endif-->
        <!--@endif-->
        </div>
    </div>
    <div class="container rtl">
        <div class="row g-3">
            
            <div class="col-md-6 mt-2 mt-md-0">
                <div class="card card __shadow h-100">
                    <div class="card-body p-xl-35">
                        <div class="row d-flex justify-content-between mx-1 mb-3">
                            <div>
                                <img class="size-30"  src="{{asset("public/assets/front-end/png/top-rated.png")}}"
                                         alt="">
                                    <span class="font-bold pl-1">{{ \App\CPU\translate('top rated')}}</span>
                            </div>
                            <div>
                                <a class="text-capitalize view-all-text"
                                    href="{{route('products',['data_from'=>'top-rated','page'=>1])}}">{{ \App\CPU\translate('view_all')}}
                                    <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>
                                </a>
                            </div>
                        </div>
                        <div>
                            @foreach($topRated as $key=>$top)
                                @if($top->product && $key<3)
                                    <a class="__best-selling" href="{{route('product',$top->product->slug)}}">
                                         @if($top->product->discount > 0)
                                                <div class="d-flex" style="top:0;position:absolute;{{Session::get('direction') === "rtl" ? 'right:0;' : 'left:0;'}}">
                                                    <span class="for-discoutn-value p-1 pl-2 pr-2" style="{{Session::get('direction') === "rtl" ? 'border-radius:0px 5px' : 'border-radius:5px 0px'}};">
                                                        @if ($top->product->discount_type == 'percent')
                                                            {{round($top->product->discount)}}%
                                                        @elseif($top->product->discount_type =='flat')
                                                            {{\App\CPU\Helpers::currency_converter($top->product->discount)}}
                                                        @endif {{\App\CPU\translate('off')}}
                                                    </span>
                                                </div>
                                            @endif
                                        <div class="d-flex flex-wrap p-2">
                                            <div class="top-rated-image">
                                                <img class="rounded" onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'" src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$top->product['thumbnail']}}" alt="Product"/>
                                            </div>
                                            <div class="top-rated-details" >
                                                <h6 class="widget-product-title">
                                                    <span class="ptr">
                                                        {{\Illuminate\Support\Str::limit($top->product['name'],100)}}
                                                    </span>
                                                </h6>
                                                @php($top_overallRating = \App\CPU\ProductManager::get_overall_rating($top->product['reviews']))
                                                <div class="rating-show">
                                                    <span class="d-inline-block font-size-sm text-body">
                                                        @for($inc=0;$inc<5;$inc++)
                                                            @if($inc<$top_overallRating[0])
                                                                <i class="p-0 sr-star czi-star-filled active"></i>
                                                            @else
                                                                <i class="p-0 sr-star czi-star __color-fea569"></i>
                                                            @endif
                                                        @endfor
                                                        <label class="badge-style">( {{$top->product->reviews_count}} )</label>
                                                    </span>
                                                </div>
                                                <div>
                                                    @if($top->product->discount > 0)
                                                            <strike class="__text-12px __color-E96A6A">
                                                                {{\App\CPU\Helpers::currency_converter($top->product->unit_price)}}
                                                            </strike>
                                                    @endif
                                                </div>
                                                <div class="widget-product-meta">
                                                    <span class="text-accent">
                                                        {{\App\CPU\Helpers::currency_converter(
                                                        $top->product->unit_price-(\App\CPU\Helpers::get_product_discount($top->product,$top->product->unit_price))
                                                        )}}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                @endif
                            @endforeach
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

  
     <?php $i=1 ?>
    {{-- Categorized product --}}
    @foreach($home_categories as $category)
        @if ($category['name'] =="Apparel")
        <section class="container rtl pb-4">
            <!-- Heading-->
            <div class="__p-20px rounded bg-white " >
                <div class="flex-wrap __gap-6px flex-between pl-xl-4">
                    <div class="category-product-view-title" >
                        <span class="for-feature-title {{Session::get('direction') === "rtl" ? 'float-right' : 'float-left'}} font-bold __text-20px text-uppercase"
                                style="{{Session::get('direction') === "rtl" ? 'text-align:right;' : 'text-align:left;'}}">
                            Apparel
                                <!--{{Str::limit($category['name'],18)}}-->
                        </span>
                    </div>
                    <div class="category-product-view-all" >
                        <a class="text-capitalize view-all-text "
                            href="{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}">{{ \App\CPU\translate('view_all')}}
                            <i class="czi-arrow-{{Session::get('direction') === "rtl" ? 'left mr-1 ml-n1 mt-1 float-left' : 'right ml-1 mr-n1'}}"></i>
                        </a>

                    </div>
                </div>

                <div class="row mt-2 justify-content-between g-3">
                    <div class="col-md-3 col-12">
                        <a href="{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}" class="cursor-pointer d-block h-100 __cate-product-side-img">
                             <img class="h-100" onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                  src="{{asset('storage/app/public/category')}}/{{$category['icon']}}">
                         </a>
                    </div>
                    <div class="col-md-9 col-12 ">
                        <div class="row g-2" >
                            @foreach($category['products'] as $key=>$product)
                                @if ($key<4)
                                    <div class="col-md-3 col-sm-4 col-6">
                                        @include('web-views.partials._category-single-product',['product'=>$product,'decimal_point_settings'=>$decimal_point_settings])
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>


                </div>
            </div>
        </section>
        @endif
    @endforeach


        {{--delivery type --}}

  <!--  <div class="container rtl pb-4 pt-3">
        <div class="shipping-policy-web">
            <div class="row g-3">
                <div class="col-md-3 d-flex justify-content-center">
                    <div class="shipping-method-system" >
                        <div class="text-center">
                            <img class="size-60" src="{{asset("public/assets/front-end/png/delivery.png")}}"
                                    alt="">
                        </div>
                        <div class="text-center">
                            <p class="m-0">
                            {{ \App\CPU\translate('Fast Delivery all accross the country')}}
                        </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex justify-content-center">
                    <div class="shipping-method-system">
                        <div class="text-center">
                            <img class="size-60" src="{{asset("public/assets/front-end/png/Payment.png")}}"
                                    alt="">
                        </div>
                        <div class="text-center">
                            <p class="m-0">
                            {{ \App\CPU\translate('Safe Payment')}}
                        </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex justify-content-center">
                    <div class="shipping-method-system">
                        <div class="text-center">
                            <img class="size-60" src="{{asset("public/assets/front-end/png/money.png")}}"
                                    alt="">
                        </div>
                        <div class="text-center">
                            <p class="m-0">
                            {{ \App\CPU\translate('7 Days Return Policy')}}
                        </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 d-flex justify-content-center">
                    <div class="shipping-method-system">
                        <div class="text-center">
                            <img class="size-60" src="{{asset("public/assets/front-end/png/Genuine.png")}}"
                                    alt="">
                        </div>
                        <div class="text-center">
                            <p class="m-0">
                            {{ \App\CPU\translate('100% Authentic Products')}}
                        </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
</div>
@endsection

@push('script')
    {{-- Owl Carousel --}}
    <script src="{{asset('public/assets/front-end')}}/js/owl.carousel.min.js"></script>

    <script>
//      function toggleTab(tabId) {
//     const tabs = document.querySelectorAll('.tab');
//     tabs.forEach(tab => {
//         if (tab.id === tabId) {
//             tab.classList.add('active');
//             document.getElementById(`content${tabId.slice(-1)}`).classList.add('active');
//         } else {
//             tab.classList.remove('active');
//             document.getElementById(`content${tab.id.slice(-1)}`).classList.remove('active');
//         }
//     });
//     var main = document.getElementById("rtl"+ tabId.slice(-1)+'1');
//         var secondId = (tabId.slice(-1)==1)?'rtl21':'rtl11';
//         var second = document.getElementById(secondId);
//         console.log("show ",main , second,tabId.slice(-1))
//         second.classList.remove('active');
//         main.classList.add('active');
// }

// Initialize the first tab as active
// toggleTab('tab1');
        $('#flash-deal-slider').owlCarousel({
            loop: false,
            autoplay: false,
            margin: 20,
            nav: true,
            navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],
            dots: false,
            autoplayHoverPause: true,
            '{{session('direction')}}': false,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 1
                },
                360: {
                    items: 1
                },
                375: {
                    items: 1
                },
                540: {
                    items: 2
                },
                //Small
                576: {
                    items: 2
                },
                //Medium
                768: {
                    items: 2
                },
                //Large
                992: {
                    items: 2
                },
                //Extra large
                1200: {
                    items: 2
                },
                //Extra extra large
                1400: {
                    items: 3
                }
            }
        })

        $('#web-feature-deal-slider').owlCarousel({
            loop: false,
            autoplay: true,
            margin: 20,
            nav: false,
            //navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],
            dots: false,
            autoplayHoverPause: true,
            '{{session('direction')}}': true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 1
                },
                360: {
                    items: 1
                },
                375: {
                    items: 1
                },
                540: {
                    items: 2
                },
                //Small
                576: {
                    items: 2
                },
                //Medium
                768: {
                    items: 2
                },
                //Large
                992: {
                    items: 2
                },
                //Extra large
                1200: {
                    items: 2
                },
                //Extra extra large
                1400: {
                    items: 2
                }
            }
        })

        $('#new-arrivals-product').owlCarousel({
            loop: true,
            autoplay: false,
            margin: 20,
            nav: true,
            navText: ["<i class='czi-arrow-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}'></i>", "<i class='czi-arrow-{{Session::get('direction') === "rtl" ? 'left' : 'right'}}'></i>"],
            dots: false,
            autoplayHoverPause: true,
            '{{session('direction')}}': true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 1
                },
                360: {
                    items: 1
                },
                375: {
                    items: 1
                },
                540: {
                    items: 2
                },
                //Small
                576: {
                    items: 2
                },
                //Medium
                768: {
                    items: 2
                },
                //Large
                992: {
                    items: 2
                },
                //Extra large
                1200: {
                    items: 4
                },
                //Extra extra large
                1400: {
                    items: 4
                }
            }
        })
    </script>
<script>
    $('#featured_products_list').owlCarousel({
        loop: true,
            autoplay: false,
            margin: 20,
            nav: true,
            navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],
            dots: false,
            autoplayHoverPause: true,
            '{{session('direction')}}': false,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 1
                },
                360: {
                    items: 1
                },
                375: {
                    items: 1
                },
                540: {
                    items: 2
                },
                //Small
                576: {
                    items: 2
                },
                //Medium
                768: {
                    items: 3
                },
                //Large
                992: {
                    items: 4
                },
                //Extra large
                1200: {
                    items: 5
                },
                //Extra extra large
                1400: {
                    items: 5
                }
            }
        });
</script>
    <script>
        $('#brands-slider').owlCarousel({
            loop: false,
            autoplay: false,
            margin: 10,
            nav: false,
            '{{session('direction')}}': true,
            dots: true,
            autoplayHoverPause: true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 4
                },
                360: {
                    items: 5
                },
                375: {
                    items: 5
                },
                540: {
                    items: 5
                },
                //Small
                576: {
                    items: 6
                },
                //Medium
                768: {
                    items: 7
                },
                //Large
                992: {
                    items: 9
                },
                //Extra large
                1200: {
                    items: 11
                },
                //Extra extra large
                1400: {
                    items: 12
                }
            }
        })
    </script>

    <script>
        $('#category-slider, #top-seller-slider').owlCarousel({
            loop: false,
            autoplay: false,
            margin: 20,
            nav: false,
            // navText: ["<i class='czi-arrow-left'></i>","<i class='czi-arrow-right'></i>"],
            dots: true,
            autoplayHoverPause: true,
            '{{session('direction')}}': true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 2
                },
                360: {
                    items: 3
                },
                375: {
                    items: 3
                },
                540: {
                    items: 4
                },
                //Small
                576: {
                    items: 5
                },
                //Medium
                768: {
                    items: 6
                },
                //Large
                992: {
                    items: 8
                },
                //Extra large
                1200: {
                    items: 10
                },
                //Extra extra large
                1400: {
                    items: 11
                }
            }
        })
       $(document).ready(function () {
    var $carousel = $("#cat1");
    var $carousel2 = $("#cat2");

      $carousel.owlCarousel({
        items: 5, // Number of items displayed in each row
        loop: false, // Disable loop
        margin: 10, // Adjust the margin between items
        dots:true,
        
        responsive: {
            0: {
                    items: 4
                },
                360: {
                    items: 4
                },
                375: {
                    items: 4
                },
                540: {
                    items: 5
                },
                //Small
                576: {
                    items: 5
                },
                //Medium
                768: {
                    items: 6
                },
                //Large
                992: {
                    items: 8
                },
                //Extra large
                1200: {
                    items: 10
                },
                //Extra extra large
                1400: {
                    items: 11
                }
        },
    });
      $carousel2.owlCarousel({
        items: 5, // Number of items displayed in each row
        loop: false, // Disable loop
        margin: 10, // Adjust the margin between items
        dots:true,
        
        responsive: {
            0: {
                    items: 4
                },
                360: {
                    items: 4
                },
                375: {
                    items: 4
                },
                540: {
                    items: 5
                },
                //Small
                576: {
                    items: 5
                },
                //Medium
                768: {
                    items: 6
                },
                //Large
                992: {
                    items: 8
                },
                //Extra large
                1200: {
                    items: 10
                },
                //Extra extra large
                1400: {
                    items: 11
                }
        },
    });

    // Check if the first row exceeds 10 items
    var firstRowItems = $carousel.find('.owl-stage .owl-item').slice(0, 10).length;
    if (firstRowItems > 10) {
        // Move the second row items to a new row
        $carousel.trigger('replace.owl.carousel', [$carousel.find('.owl-stage .owl-item').slice(10)]);
    }
    
    // Check if the first row exceeds 10 items
    var firstRowItems1 = $carousel2.find('.owl-stage .owl-item').slice(0, 10).length;
    if (firstRowItems1 > 10) {
        // Move the second row items to a new row
        $carousel2.trigger('replace.owl.carousel', [$carousel2.find('.owl-stage .owl-item').slice(10)]);
    }
});


    </script>
@endpush

