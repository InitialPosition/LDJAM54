alarm[0] = shootingSpeed

if audio_is_playing(snd_laserShoot) {
	audio_stop_sound(snd_laserShoot)
}
audio_play_sound(snd_laserShoot, 1, 0)

var bullet = instance_create_layer(x + 8, y + 2, "Instances_Back", obj_bullet)
bullet.hspeed = 0.7;
if (facingLeft) {
	bullet.direction = 180;
} else {
	bullet.direction = 0;
}