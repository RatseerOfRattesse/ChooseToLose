extends RichTextLabel

func _ready():
	bbcode_enabled = true
	connect("meta_clicked", _on_meta_clicked)

func _on_meta_clicked(link):
	OS.shell_open(link)
