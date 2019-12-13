extends Node2D

# Declaración de variables locales
onready var platComun = preload("res://Plataformas/PlataformaComun2D.tscn")
onready var platMovil = preload("res://Plataformas/PlataformaMovil.tscn")
onready var platFant = preload("res://Plataformas/PlataformaFantasma.tscn")
onready var enemigo = preload("res://Jugador/Enemigo.tscn")

onready var player = $Jumper2D
onready var camara = $Camera2D
onready var scoreLabel = $CanvasLayer/Label

var newSalto = 0
var saltoAct = 0
var score = 0

var proxPosX = 190
var proxPosY = -800
var limDer = 833
var limIzq = 300

var zonaACrearPlat = 300

var moverDer = true
var moverIzq = true

#Prop: setear alguna variables
func _ready():
	camara.player = $Jumper2D
	camara.world = self
	player.world = self
	saltoAct = player.position.y
	scoreLabel.set_text("Score: %d" % score)
	print(saltoAct)

#Prop: Crea plataformas si es necesario
func _process(delta):
	if(player.global_position.y < zonaACrearPlat):
		crearPlataforma(12)
		zonaACrearPlat -= 300

#Prop: Crea plataformas
func crearPlataforma(cant):
	for i in range(cant):
		if(i == 3 or i == 6 or i == 10):
			crearPlataformaFantasma()
			posX()
			crearPlataformaComun()
			posX()
			proxPosY -= 400
		if(i == 4 or i == 8):
			crearPlataformaMovible()
			posX()
			proxPosY -= 400
		if(i == 2):
			crearPlataformaComun()
			crearEnemigo()
			posX()
			proxPosY -= 400
		else: 
			crearPlataformaComun()
			posX()
			proxPosY -= 400
	

#Prop: Crea una plaraforma fantasma
func crearPlataformaFantasma():
	var plat = platFant.instance()
	plat.set_position(Vector2(rand_range(0, 1024),proxPosY))
	self.add_child(plat)

#Prop: Crea una plaraforma comun	
func crearPlataformaComun():
	var plat = platComun.instance()
	plat.set_position(Vector2(proxPosX,proxPosY))
	self.add_child(plat)

#Prop: Crea una plaraforma movible
func crearPlataformaMovible():
	var plat = platMovil.instance()
	plat.set_position(Vector2(rand_range(0, 1024),proxPosY))
	self.add_child(plat)

#Prop: Crea un enemigo
func crearEnemigo():
	var newEnem = enemigo.instance()
	newEnem.set_position(Vector2(proxPosX,proxPosY - 10))
	newEnem.player = player
	newEnem.camara = camara
	self.add_child(newEnem)

#Prop: Indica la proxima posicion en el eje X
func posX():
	if(moverDer and proxPosX < limDer):
		moverIzq = false
		proxPosX += 100
	else:
		moverIzq = true
	if(moverIzq and proxPosX > limIzq):
		moverDer = false
		proxPosX -= 100
	else:
		moverDer = true
	#proxPosX = rand_range(190,833)

#Prop: Contavilizar los saltos validos
func salto():
	if(newSalto < saltoAct):
		saltoAct = newSalto
		score += 520
		
		scoreLabel.set_text("Score: %d" % score)