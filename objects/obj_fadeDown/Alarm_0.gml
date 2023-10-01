alarm[0] = alpha_timer

alpha -= alpha_inc

if alpha <= 0 {
	instance_destroy()
}