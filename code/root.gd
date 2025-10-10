extends Node

@onready var generic = get_node("Background/Generic")
@onready var lvl1 = get_node("MainMenu/Level")
@onready var mainMenu = get_node('MainMenu')
@onready var optionsMenu = get_node('MainMenu/OptionsMenu')
@onready var ingameQuitButton = get_node('MainMenu/Level/PauseMenu/Quit')
@onready var deathQuitButton = get_node('MainMenu/Level/HUD/DeathScreen/Quit')
@onready var deathScreen = get_node('MainMenu/Level/HUD/DeathScreen')
@onready var winScreen = get_node('MainMenu/Level/HUD/WinScreen')
@onready var quitButton = get_node('MainMenu/Quit')
@onready var catjam = get_node('MainMenu/Level/Catjam')
@onready var musicSlider = get_node('MainMenu/OptionsMenu/Music Slider')
@onready var SFXSlider = get_node('MainMenu/OptionsMenu/SFX Slider')
var music_index = AudioServer.get_bus_index("Music")
var SFX_index = AudioServer.get_bus_index("SFX")
var musicVolume = 0
var SFXVolume = 0

func _ready():
	#LOGGING
	#LOAD SEQUENCE
	generic.show()
	
	lvl1.hide()
	
	mainMenu.hide()

	optionsMenu.hide()
	
	deathScreen.hide()
	
	winScreen.hide()
	
	catjam.hide()
	
	if quitButton:
		quitButton.pressed.connect(on_quit_pressed)
		
	if ingameQuitButton:
		ingameQuitButton.pressed.connect(on_quit_pressed)
		
	if deathQuitButton:
		deathQuitButton.pressed.connect(on_quit_pressed)
	
	if musicSlider:
		musicSlider.value_changed.connect(on_music_value_changed)
		
	if SFXSlider:
		SFXSlider.value_changed.connect(on_sfx_value_changed)
	
	$Music.playing = false

func _process(_delta):
	if Input.is_action_just_pressed("kill_boss"):
		lvl1.spawnBossMimics()

func on_quit_pressed():
	get_tree().quit()
	
func on_music_value_changed(value: float) -> void:
	musicVolume = value
	if music_index != -1:
		AudioServer.set_bus_volume_db(music_index, musicVolume)
	else:
		pass

func on_sfx_value_changed(value: float) -> void:
	SFXVolume = value
	if SFX_index != -1:
		AudioServer.set_bus_volume_db(SFX_index, SFXVolume)
	else:
		pass
