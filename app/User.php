<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    protected $fillable = [
        'name', 'email', 'password',
    ];
    
    protected $hidden = [
        'password', 'remember_token',
    ];
    
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
    public function awareness_campaigns() {
        return $this->hasMany('App\AwarenessCampaign');
    }
    
    public function dream_interpretations() {
        return $this->hasMany('App\DreamInterpretation');
    }
    
    public function mind_objects_audio() {
        return $this->hasMany('App\MindObjectAudio');
    }
    
    public function user_transcription_keywords() {
        return $this->hasMany('App\UserTranscriptionKeywords');
    }
    
    public function minds_eye_meditations() {
        return $this->hasMany('App\MindsEyeMeditation');
    }
    
}
