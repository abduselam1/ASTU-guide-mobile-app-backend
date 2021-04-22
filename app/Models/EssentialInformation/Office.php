<?php

namespace App\Models\EssentialInformation;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Building;
class Office extends Model
{
    use HasFactory;

    public function building()
    {
        return $this->belongsTo(Building::class);
    }
}
