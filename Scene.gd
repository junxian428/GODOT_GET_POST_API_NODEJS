extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var text1 = ""
var text2 = ""
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_changed(new_text):
	text1 = new_text


func _on_LineEdit2_text_changed(new_text):
	text2 = new_text


func _on_Button_pressed():
	print(text1 + " " + text2)
	print("HTTP GET")
	# NodeJS GET Server
	$GETHttp.request('http://localhost:8081/listUsers')
	var data_to_send = "Hi"
	var query = JSON.print(data_to_send)
	var headers = ["Content-Type: text/plain"]
	$POSTHttp.request('http://localhost:3000/',headers,false,HTTPClient.METHOD_POST,query)

#func _make_post_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	#var query = JSON.print(data_to_send)
	# Add 'Content-Type' header:
	#var headers = ["Content-Type: application/json"]
	#$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, query)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		if response_code == 200:
			print(body.get_string_from_utf8())
		else:
			print("HTTP Error")


func _on_POSTHttp_request_completed(result, response_code, headers, body):
	if result == HTTPRequest.RESULT_SUCCESS:
		if response_code == 200:
			print(body.get_string_from_utf8())
		else:
			print("Error !!!!!!!!!!!!")
