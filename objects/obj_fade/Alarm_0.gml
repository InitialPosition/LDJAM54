alarm[0] = alpha_timer

alpha += alpha_inc

if alpha >= 1 {
	room_goto(rm_win)
}