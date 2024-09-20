extends Node2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var stream: AudioStreamPlayer = $AudioStreamPlayer
var spectrum : AudioEffectSpectrumAnalyzerInstance

const FREQ_MAX = 11050.0 #hz
const FREQ_MIN = 0

func _ready() -> void: 
	spectrum = AudioServer.get_bus_effect_instance(1,0)
	stream.play()
	stream.get_stream_playback()
	sprite.set_frame(0)
	
	
func _process(_delta) -> void:
	var magnitude : float = spectrum.get_magnitude_for_frequency_range(FREQ_MIN, FREQ_MAX).normalized()
	#
	print(magnitude)
	if magnitude > 0.5:
		sprite.set_frame(1)
	else:
		sprite.set_frame(2)
