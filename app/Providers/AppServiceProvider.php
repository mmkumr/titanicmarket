<?php

namespace App\Providers;
use App\Category;
use App\Block;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;
use Laravel\Dusk\DuskServiceProvider;
use Illuminate\Support\Facades\Schema;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $discount = \Session()->get('coupon')['discount'] + session()->get('refer')['value'] + session()->get('wallet')['value'] ?? 0;
        $categories = Category::orderby('name', 'asc')->get();
        view()->share( ['categories' => $categories,
                        'discount' => $discount,
                        'newSubtotal' => getNumbers()->get('newSubtotal'),
                        'newTax' => getNumbers()->get('newTax'),
                        'newTotal' => getNumbers()->get('newTotal'),
                    ]);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->environment('local', 'testing')) {
            $this->app->register(DuskServiceProvider::class);
        }
    }
}
