<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class MindObjectAudio extends Model {
    use Searchable;
    
    public $timestamps = true;
    
    public function mind_object() {
        return belongsTo('App/MindObject');
    }
    
    public function user() {
        return belongsTo('App/User');
    }
    
    public function audio_response() {
        return hasOne('App/MindObjectAudioResponse');
    }
}
