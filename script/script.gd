extends Area2D

var mpos = Vector2()
var pos = Vector2()
var screen
var mangle
var rot
var SMOOTH_SPEED = 5.0
var max_vel = 200
var acc = Vector2()
var vel = Vector2()
var acc_limit = 500


func _ready():
	set_fixed_process(true)
	screen = get_viewport_rect().size
	pos = screen / 2
	

func _fixed_process(delta):
	mpos = get_global_mouse_pos()
	
	set_pos(pos)
	look_at(mpos)
	if Input.is_action_pressed("ui_up"):
		acc = mpos - pos
	if acc.length() > acc_limit:
		acc = acc.normalized() * acc_limit
	vel += acc * delta
	if vel.length() > max_vel:
		vel = vel.normalized() * max_vel
	pos += vel * delta
	set_pos(pos)