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
        function getNumbers()
        {
            $tax = config('cart.tax') / 100;
            $discount = session()->get('coupon')['discount'] + session()->get('refer')['value'] + session()->get('wallet')['value'] ?? 0;
            $code = session()->get('coupon')['name'] ?? null;
            $newSubtotal = (Cart::subtotal() - $discount);
            if ($newSubtotal < 0) {
                $newSubtotal = 0;
            }
            $newTax = $newSubtotal * $tax;
            $newTotal = $newSubtotal * (1 + $tax);

            return collect([
                'tax' => $tax,
                'discount' => $discount,
                'code' => $code,
                'newSubtotal' => $newSubtotal,
                'newTax' => $newTax,
                'newTotal' => $newTotal,
            ]);
        }
        $categories = Category::orderby('name', 'asc')->get();
        view()->share( ['categories' => $categories,
                        'discount' => getNumbers()->get('discount'),
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
