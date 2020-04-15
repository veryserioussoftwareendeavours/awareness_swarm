<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class AudioFile extends Model {
    use Searchable;
    
    public $timestamps = false;
    
    
    public function awareness_campaigns() {
        return $this->hasMany('App\AwarenessCampaign');
    }
    
    public function reminders() {
        return $this->hasMany('App\Reminder');
    }
    
    public function user_transcription_keywords() {
        return $this->hasMany('App\UserTranscriptionKeywords');
    }
}
