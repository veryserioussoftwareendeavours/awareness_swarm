<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MindObject extends Model {    
    public $timestamps = false;

    protected $fillable = ['name', 'device_ip', 'detect_motion', 'detect_light', 'detect_position'];

    /**  hasMany  *******************************************************/

    public function light_data() {
        return $this->hasMany('App\MindObjectLight');
    }
    
    public function motion_data() {
        return $this->hasMany('App\MindObjectMotion');
    }
    
    public function position_data() {
        return $this->hasMany('App\MindObjectPosition');
    }
    
    public function audio_data() {
        return $this->hasMany('App\MindObjectAudio');
    }
}
