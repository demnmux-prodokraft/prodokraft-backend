@extends('layouts.front-end.app')

@section('title',\App\CPU\translate('My Wishlists'))

@section('content')
    <!-- Page Content-->
    <div class="container rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
        <h3 class="headerTitle my-3 text-center">{{\App\CPU\translate('Wishlist')}}</h3>


                @include('web-views.partials._wish-list-data',['wishlists'=>$wishlists, 'brand_setting'=>$brand_setting])
            
    </div>
@endsection
