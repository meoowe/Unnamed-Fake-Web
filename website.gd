extends Node
## [page_renderer]
func click():
	OS.shell_open("http://example.com")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Page.link("http://hello.com")
	Page.set_title("h")
	Page.set_title("hello")
	#Page.create_text("meow")
	Page.create_button("hello").pressed.connect(click)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#await get_tree().create_timer(0.5).timeout
	#Page.create_text(".")
	pass
