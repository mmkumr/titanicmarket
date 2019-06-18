<?php

use App\Category;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now()->toDateTimeString();

        Category::insert([
            ['name' => 'Vegetables', 'slug' => 'Vegetables', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Fruits', 'slug' => 'fruits', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Dry Fruits', 'slug' => 'dry-fruits', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Berhampurwala', 'slug' => 'berhampurwala', 'created_at' => $now, 'updated_at' => $now],
        ]);
    }
}
