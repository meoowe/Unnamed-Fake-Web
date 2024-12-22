extends Control

@onready var bodyContainer: ScrollContainer = $ScrollContainer
@onready var body: Panel = $ScrollContainer/body


var tab_changes: int = 0
## This script contains functions that render a webpage.
## 
## Usage:
## [codeblock]
## extends Node
## func _ready():
##     Panel.set_title("Title Goes Here!")
## [/codeblock]

## Creates a new tab and sets the title to a string.
func set_title(title: String):
	%tabs.add_tab(title)

## Randomly places a label... because why not make it impossible to use? 
func create_text(text: String) -> Label:
	var label: Label = Label.new()
	label.text = text
	body.add_child(label)
	label.position = Vector2(randi_range(1, 1000), randi_range(1, 1000))
	return label

## @experimental: Creates a color picker in the top left corner.
## 
func open_colour_picker() -> ColorPicker:
	var colour_picker = ColorPicker.new()
	body.add_child(colour_picker)
	return colour_picker
	

## Creates a button(predictably). [br]
## [param text] is required and is the label for the button. [br]
## [param icon] defaults to null.
func create_button(text: String, icon: Texture2D= null) -> Button:
	var new_button: Button = Button.new()
	new_button.icon = icon
	new_button.text = text
	body.add_child(new_button)
	return new_button

func open_color_picker():
	return open_colour_picker()

func link(dest: String) -> Label:
	var label: Label = Label.new()
	label.text = dest
	body.add_child(label)
	label.position = Vector2(randi_range(1, 1000), randi_range(1, 1000))
	label.set_label_settings(preload("res://link_label.tres"))
	return label

func create_text_box(line: bool, placeholder: String):
	if line:
		var line_edit: LineEdit = LineEdit.new()
		line_edit.placeholder_text = placeholder
		return line_edit


func _on_tabs_tab_changed(tab: int) -> void:
	tab_changes += 1
	if tab_changes > 1:
		bodyContainer.remove_child(body)
		bodyContainer.add_child(Panel.new())
		
