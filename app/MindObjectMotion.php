<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class MindObjectMotion extends Model {
    use Searchable;
    
    public $timestamps = true;
    
    public function mind_object {
        return belongsTo('App/MindObject');
    }
}
