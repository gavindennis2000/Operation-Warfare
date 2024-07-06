/// @description play meteor music

audio_stop_all();

audio_sound_gain(sndMeteorShower, 1, 0);
audio_play_sound(sndMeteorShower, 1, true);