// Fast alle zu tunenden Werte des Techtrees stehen in diesem Script,
// sowohl, welche Materialien und Erfahrungen für die Produkte nötig sind,
// als auch, wodurch die Zwerge die Erfahrungen bekommen.

// Welche Produkte eine PS hat, kann hier prinzipiell auch verändert werden,
// allerdings sollte man darauf achten, dass die PS alle Materialien bereits kennt,
// da sonst die Produktionsanimtionen durcheinandergeraten.
// Beispiel: Man kann ohne Probleme ein Produkt in den Hauklotz eintragen, das aus
// Pilzstämmen besteht, da der Hauklotz "weiss", was mit Pilzstämmen zu tun ist.
// Wenn für dieses Produkt aber Kristall benötigt wird, müsste man in den Hauklotz
// erst Kristallverarbeitungsanimationen einbauen.

// Die Anzahl der produzierten Ware, wie z.B. 2 Grillpilze aus 1 Pilzhut wird nur
// von Küchen und Feuerstelle beherrscht.

proc Xmal {item count} { set ret "$item"; for {set i 1} {$i < $count} {incr i} {set ret "$ret $item"}; return $ret }

if {[info exists tttsection_tocall]} {
switch $tttsection_tocall {
	// Produktionsstätten
	"Feuerstelle" {
		set tttmaterial_Feuerstelle			{Pilzstamm Stein}
		// um eine FS herzustellen, braucht man einen Pilzstamm und einen Stein
		set tttinvent_Feuerstelle			{}
		// keine Erfahrungen sind nötig, um sie zu erfinden
		set tttgain_Feuerstelle				{{exp_Holz 0.01} {exp_Stein 0.01}}
		// der Zwerg erhält einen Erfahrungszuwachs in Holz und Stein von 1 Prozent
		set tttinfluence_Feuerstelle		{{exp_Holz 0.5} {exp_Nahrung 0.5} {exp_Stein 0.5}}
		// bis hin zu diesen Werten beschleunigt Erfahrung linear den Herstellungsprozess
		set tttitems_Feuerstelle			{Grillpilz Grillhamster Zelt Hauklotz Steinmetz Feuerstelle}
		// Produkte an dieser Produktionsstätte
		set tttpreinv_Feuerstelle			{Grillpilz Zelt Feuerstelle}
		// an dieser PS sind Grillpilz Zelt und Feuerstelle bereits erfunden
		set tttenergyclass_Feuerstelle 		0
		// die Produktionsstätte benötigt mindestens eine Energiequelle der Klasse 0 (läuft also auch ohne Energie)
		set tttenergycons_Feuerstelle		0
		// die PS benötigt bei jeder Produktion 0 Einheiten Energie
		set tttfow_x						15
		set tttfow_y						15
	}
	"Hauklotz" {
		set tttmaterial_Hauklotz			{Pilzstamm Pilzstamm Pilzhut}
		set tttinvent_Hauklotz				{{exp_Holz 0.004}}
		set tttgain_Hauklotz				{{exp_Holz 0.03}}
		set tttinfluence_Hauklotz			{{exp_Holz 0.2}}
//# IF FULL
		set tttitems_Hauklotz				{Holzkiepe Leiter Farm Brauerei Schreinerei Holztuer}
//# ELSE
		set tttitems_Hauklotz				{Holzkiepe Leiter Farm}
//# ENDIF
		set tttpreinv_Hauklotz				{Leiter}
		set tttenergyclass_Hauklotz			0
		set tttenergycons_Hauklotz			0
		set tttfow_x						12
		set tttfow_y						12
	}
	"Steinmetz" {
		set tttmaterial_Steinmetz			{Stein Stein Stein Pilzstamm Pilzstamm}
		set tttinvent_Steinmetz				{{exp_Stein 0.013}}
		set tttgain_Steinmetz				{{exp_Holz 0.01} {exp_Stein 0.03}}
		set tttinfluence_Steinmetz			{{exp_Holz 0.1} {exp_Stein 0.2}}
//# IF FULL
		set tttitems_Steinmetz				{Eisenerz Steintuer Grenzstein Steinschleuder Grabstein Keule Plattmachfalle Schmiede Schmelze}
//# ELSE
		set tttitems_Steinmetz				{Steintuer Grenzstein Steinschleuder}
//# ENDIF
		set tttpreinv_Steinmetz				{Grenzstein}
		set tttenergyclass_Steinmetz		0
		set tttenergycons_Steinmetz			0
		set tttfow_x						12
		set tttfow_y						12
	}
	"Farm" {
		set tttmaterial_Farm				{Pilzstamm Pilzstamm}
		set tttinvent_Farm					{{exp_Holz 0.025} {exp_Nahrung 0.015}}
		set tttgain_Farm					{{exp_Holz 0.04}}
		set tttinfluence_Farm				{{exp_Holz 0.3} {exp_Nahrung 0.1}}
		set tttitems_Farm					{Hamster Pilz Raupe}
		set tttpreinv_Farm					{Hamster}
		set tttfow_x						12
		set tttfow_y						12
	}
	"Brauerei" {
		set tttmaterial_Brauerei			{Pilzstamm Pilzstamm Pilzstamm}
		set tttinvent_Brauerei				{{exp_Holz 0.035} {exp_Nahrung 0.08}}
		set tttgain_Brauerei				{{exp_Holz 0.05}}
		set tttinfluence_Brauerei			{{exp_Holz 0.2} {exp_Nahrung 0.3}}
		set tttitems_Brauerei				{Bier_ Bier Kleiner_Heiltrank Heiltrank}
		set tttpreinv_Brauerei				{Bier}
		set tttenergyclass_Brauerei			0
		set tttenergycons_Brauerei			0
		set tttfow_x						12
		set tttfow_y						12
	}
	"Schreinerei" {
		set tttmaterial_Schreinerei			{Pilzstamm Pilzstamm Pilzstamm Pilzstamm}
		set tttinvent_Schreinerei			{{exp_Holz 0.065}}
		set tttgain_Schreinerei				{{exp_Holz 0.06}}
		set tttinfluence_Schreinerei		{{exp_Holz 0.4}}
//# IF FULL
		set tttitems_Schreinerei			{Wachhaus Laufrad Aufzug  Reithamster Lager Bar Saegewerk Tischlerei}
//# ELSE
		set tttitems_Schreinerei			{Aufzug Bar}
//# ENDIF
		set tttpreinv_Schreinerei			{Laufrad}
		set tttenergyclass_Schreinerei		0
		set tttenergycons_Schreinerei		0
		set tttfow_x						12
		set tttfow_y						12
	}
//# IF FULL
	"Schmiede" {
		set tttmaterial_Schmiede			{Pilzstamm Pilzstamm Stein Eisen}
		set tttinvent_Schmiede				{{exp_Stein 0.035} {exp_Metall 0.025}}
		set tttgain_Schmiede				{{exp_Stein 0.03}}
		set tttinfluence_Schmiede			{{exp_Stein 0.4} {exp_Metall 0.1}}
		set tttitems_Schmiede				{Schild Streitaxt Taucherglocke Leiter_Metall Waffenschmiede Dampfhammer Dampfmaschine}
		set tttpreinv_Schmiede				{Schild}
		set tttenergyclass_Schmiede			0
		set tttenergycons_Schmiede			0
		set tttfow_x						12
		set tttfow_y						12
	}
	"Schmelze" {
		set tttmaterial_Schmelze			{Pilzstamm Stein Stein Stein}
		set tttinvent_Schmelze				{{exp_Stein 0.1} {exp_Metall 0.01}}
		set tttgain_Schmelze				{{exp_Stein 0.04} {exp_Energie 0.02}}
		set tttinfluence_Schmelze			{{exp_Stein 0.3} {exp_Metall 0.1}}
		set tttitems_Schmelze				{Kohle Golderz Eisen}
		set tttpreinv_Schmelze				{Eisen}
		set tttenergyclass_Schmelze			1
		set tttenergycons_Schmelze			10
		set tttfow_x						12
		set tttfow_y						12
	}
	"Laufrad" {
		set tttmaterial_Laufrad				{Pilzstamm Pilzstamm Hamster}
		set tttinvent_Laufrad				{}
		set tttgain_Laufrad					{{exp_Energie 0.03}}
		set tttinfluence_Laufrad			{{exp_Holz 0.3}}
		set tttitems_Laufrad				{Energie}
		set tttpreinv_Laufrad				{Energie}
		set tttenergyrange_Laufrad			20
		set tttenergyclass_Laufrad 			1
		set tttenergymaxstore_Laufrad		400
		set tttenergyyield_Laufrad			200							;// Einheiten Energie pro Pilzhut
		set tttfow_x						20
		set tttfow_y						20
	}
	"Wachhaus" {
		set tttmaterial_Wachhaus			{Pilzstamm}
		set tttinvent_Wachhaus				{{exp_Holz 0.025} {exp_Kampf 0.005}}
		set tttgain_Wachhaus				{{exp_Holz 0.03}}
		set tttinfluence_Wachhaus			{{exp_Holz 0.4}}
		set tttitems_Wachhaus				{_Bewachen_nah _Bewachen_mittel _Bewachen_weit}
		set tttpreinv_Wachhaus				{_Bewachen_nah _Bewachen_mittel _Bewachen_weit}
		set tttfow_x						30
		set tttfow_y						30
	}
//# ENDIF
	"Dampflore" {
		set tttmaterial_Dampflore			{}
		set tttinvent_Dampflore				{}
		set tttgain_Dampflore				{}
		set tttinfluence_Dampflore			{}
		set tttitems_Dampflore				{_Weiche_1 _Weiche_2 _Weiche_3 _Weiche_4 _Kamera}
		set tttpreinv_Dampflore				{_Weiche_1 _Weiche_2 _Weiche_3 _Weiche_4 _Kamera}
	}
//# IF FULL
	"Lager" {
		set tttmaterial_Lager				{Pilzstamm Pilzstamm Pilzstamm Pilzstamm Pilzhut}
		set tttinvent_Lager					{{exp_Holz 0.09} {exp_Transport 0.055}}
		set tttgain_Lager					{{exp_Holz 0.1}}
		set tttinfluence_Lager				{{exp_Holz 0.3}}
		set tttitems_Lager					{_Kisten_einlagern _Nahrung_einlagern _Pilzhut_einlagern _Pilzstamm_einlagern _Rohmineralien_einlagern _Stein_einlagern _Kohle_einlagern _Eisen_einlagern _Gold_einlagern _Kristall_einlagern _Waffen_einlagern _Werkzeuge_einlagern _Traenke_einlagern _Ringe_einlagern}
		set tttpreinv_Lager					{_Kisten_einlagern _Nahrung_einlagern _Pilzhut_einlagern _Pilzstamm_einlagern _Rohmineralien_einlagern _Stein_einlagern _Kohle_einlagern _Eisen_einlagern _Gold_einlagern _Kristall_einlagern _Waffen_einlagern _Werkzeuge_einlagern _Traenke_einlagern _Ringe_einlagern}
		set tttfow_x						20
		set tttfow_y						20
	}
	"Saegewerk" {
		set tttmaterial_Saegewerk			{Pilzstamm Pilzstamm Pilzstamm Stein Eisen}
		set tttinvent_Saegewerk				{{exp_Holz 0.15}}
		set tttgain_Saegewerk				{{exp_Holz 0.12} {exp_Metall 0.02}}
		set tttinfluence_Saegewerk			{{exp_Holz 0.6}}
		set tttitems_Saegewerk				{Schubkarren Grosse_Holzkiepe Kettensaege Wasserrad Schule Dojo Theater Dreherei Bordell}
		set tttpreinv_Saegewerk				{Wasserrad}
		set tttenergyclass_Saegewerk		1
		set tttenergycons_Saegewerk			80
		set tttfow_x						20
		set tttfow_y						20
	}
//# ENDIF
	"Bar" {
		set tttmaterial_Bar					{Pilzstamm Pilzstamm Pilzstamm Pilzhut}
		set tttinvent_Bar					{{exp_Holz 0.13} {exp_Nahrung 0.03}}
		set tttgain_Bar						{{exp_Holz 0.1}}
		set tttinfluence_Bar				{{exp_Holz 0.4} {exp_Nahrung 0.2}}
		set tttitems_Bar					{Barbetrieb}
		set tttpreinv_Bar					{Barbetrieb}
		set tttfow_x						20
		set tttfow_y						20
	}
//# IF FULL
	"Dojo" {
		set tttmaterial_Dojo				{Pilzstamm Pilzstamm Pilzstamm Stein Stein}
		set tttinvent_Dojo					{{exp_Holz 0.18} {exp_Kampf 0.05}}
		set tttgain_Dojo					{{exp_Holz 0.1}}
		set tttinfluence_Dojo				{{exp_Holz 1.0} {exp_Kampf 0.5}}
		set tttitems_Dojo					{_Kungfu _Schwertkampf _Zweihandkampf _Schusswaffen _Verteidigung}
		set tttpreinv_Dojo					{_Kungfu _Schwertkampf _Zweihandkampf _Schusswaffen _Verteidigung}
        set tttfow_x						12
		set tttfow_y						12
	}
	"Tischlerei" {
		set tttmaterial_Tischlerei			{Pilzstamm Pilzstamm Stein Pilzhut}
		set tttinvent_Tischlerei			{{exp_Holz 0.09}}
		set tttgain_Tischlerei				{{exp_Holz 0.12}}
		set tttinfluence_Tischlerei			{{exp_Holz 0.5}}
		set tttitems_Tischlerei				{Mittelalterkueche Mittelalterbad Mittelalterwohnzimmer Mittelalterschlafzimmer Industriekueche Industriebad Industriewohnzimmer Industrieschlafzimmer Luxuskueche Luxusbad Luxuswohnzimmer Luxusschlafzimmer }
		set tttpreinv_Tischlerei			{Mittelalterkueche Mittelalterbad Mittelalterwohnzimmer Mittelalterschlafzimmer}
		set tttenergyclass_Tischlerei		1
		set tttenergycons_Tischlerei		100
		set tttfow_x						12
		set tttfow_y						12
	}
	"Waffenschmiede" {
		set tttmaterial_Waffenschmiede		{Pilzstamm Stein Eisen Eisen Eisen}
		set tttinvent_Waffenschmiede		{{exp_Metall 0.03} {exp_Kampf 0.05}}
		set tttgain_Waffenschmiede			{{exp_Metall 0.05}}
		set tttinfluence_Waffenschmiede		{{exp_Metall 0.2}}
		set tttitems_Waffenschmiede			{Schwert PfeilUndBogen Metallschild Waffenfabrik}
		set tttpreinv_Waffenschmiede		{Schwert}
		set tttenergyclass_Waffenschmiede	1
		set tttenergycons_Waffenschmiede	50
		set tttfow_x						12
		set tttfow_y						12
	}
	"Dampfhammer" {
		set tttmaterial_Dampfhammer			{Pilzstamm Pilzstamm Stein Stein Eisen Eisen}
		set tttinvent_Dampfhammer			{{exp_Metall 0.08}}
		set tttgain_Dampfhammer				{{exp_Metall 0.07}}
		set tttinfluence_Dampfhammer		{{exp_Metall 0.3}}
		set tttitems_Dampfhammer			{Eisenerz_ Kristallerz Abfluss Dampfaufzug Hochofen Schleiferei Metalltuer Kristallschmiede}
		set tttpreinv_Dampfhammer			{Abfluss}
		set tttenergyclass_Dampfhammer		2
		set tttenergycons_Dampfhammer		100
		set tttfow_x						12
		set tttfow_y						12
	}
//# ENDIF
	"Schule" {
		set tttmaterial_Schule				{Pilzstamm Pilzstamm Pilzstamm Pilzhut Stein}
		set tttinvent_Schule				{{exp_Holz 0.15} {exp_Service 0.03}}
		set tttgain_Schule					{{exp_Holz 0.12}}
		set tttinfluence_Schule				{{exp_Holz 0.5}}
		set tttitems_Schule					{_Unterricht}
		set tttpreinv_Schule				{_Unterricht}
		set tttfow_x						20
		set tttfow_y						20
	}
//# IF FULL
	"Theater" {
		set tttmaterial_Theater				{Pilzstamm Pilzstamm Pilzstamm Pilzhut Pilzhut Hamster}
		set tttinvent_Theater				{{exp_Holz 0.14} {exp_Service 0.015}}
		set tttgain_Theater					{{exp_Holz 0.1}}
		set tttinfluence_Theater			{{exp_Holz 0.3}}
		set tttitems_Theater				{_Theatervorstellung}
		set tttpreinv_Theater				{_Theatervorstellung}
		set tttfow_x						20
		set tttfow_y						20
	}
	"Dreherei" {
		set tttmaterial_Dreherei			{Stein Pilzstamm Pilzstamm Pilzstamm Eisen Eisen}
		set tttinvent_Dreherei				{{exp_Holz 0.05} {exp_Metall 0.04} {exp_Energie 0.01}}
		set tttgain_Dreherei				{{exp_Holz 0.03} {exp_Metall 0.05}}
		set tttinfluence_Dreherei			{{exp_Holz 0.2} {exp_Metall 0.1}}
		set tttitems_Dreherei				{Presslufthammer Hoverboard Labor Krankenhaus Tempel Bowlingbahn Disco Fitnessstudio}
		set tttpreinv_Dreherei				{Presslufthammer}
		set tttenergyclass_Dreherei			2
		set tttenergycons_Dreherei			200
		set tttfow_x						12
		set tttfow_y						12
	}
	"Fitnessstudio" {
		set tttmaterial_Fitnessstudio		{Stein Eisen Eisen Eisen Pilzstamm Pilzstamm}
		set tttinvent_Fitnessstudio			{{exp_Metall 0.03} {exp_Service 0.08}}
		set tttgain_Fitnessstudio			{{exp_Metall 0.05}}
		set tttinfluence_Fitnessstudio		{{exp_Metall 0.2}}
		set tttitems_Fitnessstudio			{}
		set tttpreinv_Fitnessstudio			{}
		set tttfow_x						20
		set tttfow_y						20
	}
	"Wasserrad" {
		set tttmaterial_Wasserrad			{Pilzstamm Pilzstamm Stein Stein}
		set tttinvent_Wasserrad				{}
		set tttgain_Wasserrad				{{exp_Energie 0.05}}
		set tttinfluence_Wasserrad			{{exp_Holz 0.2}}
		set tttitems_Wasserrad				{Energie_}
		set tttpreinv_Wasserrad				{Energie_}
		set tttenergyrange_Wasserrad		60
		set tttenergyclass_Wasserrad		1
		set tttenergymaxstore_Wasserrad		400
		set tttenergyyield_Wasserrad		0.5							;// Einheiten Energie pro Sec. im Wasser
		set tttfow_x						20
		set tttfow_y						20
	}
	"Mittelalterkueche" {
		set tttmaterial_Mittelalterkueche	{Pilzstamm Pilzstamm Stein Stein}
		set tttinvent_Mittelalterkueche		{}
		set tttgain_Mittelalterkueche		{{exp_Holz 0.1}}
		set tttinfluence_Mittelalterkueche	{{exp_Holz 0.4}}
		set tttitems_Mittelalterkueche		{Grillpilz_ Grillhamster_ Raupensuppe_ Feuerstelle}
		set tttpreinv_Mittelalterkueche		{Grillpilz_ Feuerstelle}
		set tttenergyclass_Mittelalterkueche	1
		set tttenergycons_Mittelalterkueche		10
		set tttfow_x						20
		set tttfow_y						20
	}
	"Industriekueche" {
		set tttmaterial_Industriekueche		{Pilzstamm Stein Stein Stein Eisen}
		set tttinvent_Industriekueche		{{exp_Holz 0.2} {exp_Nahrung 0.08}}
		set tttgain_Industriekueche			{{exp_Holz 0.15}}
		set tttinfluence_Industriekueche	{{exp_Holz 0.5}}
		set tttitems_Industriekueche		{Grillpilz__ Grillhamster__ Raupensuppe__ Pilzbrot__ Raupenschleimkuchen__ }
		set tttpreinv_Industriekueche		{Grillpilz__}
		set tttenergyclass_Industriekueche	2
		set tttenergycons_Industriekueche	20
		set tttfow_x						24
		set tttfow_y						24
	}
	"Luxuskueche" {
		set tttmaterial_Luxuskueche			{Stein Eisen Eisen Gold Gold Kristall Kristall}
		set tttinvent_Luxuskueche			{{exp_Service 0.08} {exp_Energie 0.03} {exp_Nahrung 0.13}}
		set tttgain_Luxuskueche				{{exp_Holz 0.15}}
		set tttinfluence_Luxuskueche		{{exp_Holz 0.5}}
		set tttitems_Luxuskueche			{Raupensuppe___ Pilzbrot___  Raupenschleimkuchen___ Gourmetsuppe___ Hamstershake___}
		set tttpreinv_Luxuskueche			{}
		set tttenergyclass_Luxuskueche 		3
		set tttenergycons_Luxuskueche		20
		set tttfow_x						24
		set tttfow_y						24
	}
	"Dampfmaschine" {
		set tttmaterial_Dampfmaschine		{Stein Eisen Eisen Eisen Pilzstamm Pilzstamm}
		set tttinvent_Dampfmaschine			{{exp_Metall 0.05}}
		set tttgain_Dampfmaschine			{{exp_Metall 0.05} {exp_Energie 0.05}}
		set tttinfluence_Dampfmaschine		{{exp_Metall 0.3}}
		set tttitems_Dampfmaschine			{Energie__}
		set tttpreinv_Dampfmaschine			{Energie__}
		set tttenergyrange_Dampfmaschine	60
		set tttenergyclass_Dampfmaschine	2
		set tttenergymaxstore_Dampfmaschine	2000
		set tttenergyyield_Dampfmaschine	400							;// Einheiten Energie pro Kohlestück
		set tttfow_x						24
		set tttfow_y						24
	}
	"Hochofen" {
		set tttmaterial_Hochofen			{Eisen Eisen Eisen Stein Stein Stein Pilzstamm Pilzstamm}
		set tttinvent_Hochofen				{{exp_Metall 0.13} {exp_Energie 0.03}}
		set tttgain_Hochofen				{{exp_Metall 0.1} {exp_Energie 0.05}}
		set tttinfluence_Hochofen			{{exp_Metall 0.3}}
		set tttitems_Hochofen				{Kohle_ Golderz_ Eisen_ Gold}
		set tttpreinv_Hochofen				{Eisen_}
		set tttenergyclass_Hochofen			2
		set tttenergycons_Hochofen			20
		set tttfow_x						20
		set tttfow_y						20
	}
	"Schleiferei" {
		set tttmaterial_Schleiferei			{Eisen Eisen Eisen Eisen Stein Gold}
		set tttinvent_Schleiferei			{{exp_Stein 0.2} {exp_Metall 0.1}}
		set tttgain_Schleiferei				{{exp_Metall 0.12}}
		set tttinfluence_Schleiferei		{{exp_Metall 0.3}}
		set tttitems_Schleiferei			{Kristall}
		set tttpreinv_Schleiferei			{Kristall}
		set tttenergyclass_Schleiferei		2
		set tttenergycons_Schleiferei		30
		set tttfow_x						20
		set tttfow_y						20
	}
	"Waffenfabrik" {
		set tttmaterial_Waffenfabrik		{Kohle Eisen Eisen Eisen Eisen Gold Gold}
		set tttinvent_Waffenfabrik			{{exp_Metall 0.1} {exp_Kampf 0.15}}
		set tttgain_Waffenfabrik			{{exp_Metall 0.15} {exp_Stein 0.05}}
		set tttinfluence_Waffenfabrik		{{exp_Metall 1.0} {exp_Kampf 0.5}}
		set tttitems_Waffenfabrik			{Buechse Lichtschwert Kristallschild}
		set tttpreinv_Waffenfabrik			{Buechse}
		set tttenergyclass_Waffenfabrik		3
		set tttenergycons_Waffenfabrik		100
		set tttfow_x						24
		set tttfow_y						24
	}
	"Kristallschmiede" {
		set tttmaterial_Kristallschmiede	{Eisen Eisen Stein Kristall Kristall}
		set tttinvent_Kristallschmiede		{{exp_Stein 0.2} {exp_Metall 0.13}}
		set tttgain_Kristallschmiede		{{exp_Metall 0.15}}
		set tttinfluence_Kristallschmiede	{{exp_Metall 0.2}}
		set tttitems_Kristallschmiede		{Kristalltuer Leiter_Kristall Kristallstrahl SteinfalleMedusa Reaktor Kristallaufzug}
		set tttpreinv_Kristallschmiede		{Kristalltuer}
		set tttenergyclass_Kristallschmiede	2
		set tttenergycons_Kristallschmiede	150
		set tttfow_x						20
		set tttfow_y						20
	}
	"Reaktor" {
		set tttmaterial_Reaktor				{Stein Eisen Eisen Kristall Kristall Kristall Gold Gold}
		set tttinvent_Reaktor				{{exp_Stein 0.28} {exp_Energie 0.05}}
		set tttgain_Reaktor					{{exp_Energie 0.1} {exp_Metall 0.05}}
		set tttinfluence_Reaktor			{{exp_Stein 0.3}}
		set tttitems_Reaktor				{Energie___}
		set tttpreinv_Reaktor				{Energie___}
		set tttenergyrange_Reaktor			100
		set tttenergyclass_Reaktor			3
		set tttenergymaxstore_Reaktor		4000
		set tttenergyyield_Reaktor			500							;// Einheiten Energie pro Kristall
		set tttfow_x						24
		set tttfow_y						24
	}
	"Labor" {
		set tttmaterial_Labor				{Eisen Eisen Stein Gold Gold Kristall Kristall Kristall Kristall}
		set tttinvent_Labor					{{exp_Energie 0.08} {exp_Metall 0.05} {exp_Service 0.04}}
		set tttgain_Labor					{{exp_Energie 0.15}}
		set tttinfluence_Labor				{{exp_Metall 0.1}}
		set tttitems_Labor					{Pilzschnaps Grosser_Heiltrank Liebestrank Unverwundbarkeitstrank}
		set tttpreinv_Labor					{Pilzschnaps}
		set tttenergyclass_Labor			3
		set tttenergycons_Labor				100
		set tttfow_x						20
		set tttfow_y						20
	}
	"Krankenhaus" {
		set tttmaterial_Krankenhaus			{Stein Stein Eisen Eisen Kristall Kristall Gold}
		set tttinvent_Krankenhaus			{{exp_Service 0.09} {exp_Nahrung 0.1}}
		set tttgain_Krankenhaus				{{exp_Metall 0.07} {exp_Service 0.03}}
		set tttinfluence_Krankenhaus		{{exp_Metall 0.2}}
		set tttitems_Krankenhaus			{_Heilen}
		set tttpreinv_Krankenhaus			{_Heilen}
		set tttfow_x						24
		set tttfow_y						24
	}
	"Tempel" {
		set tttmaterial_Tempel				{Kristall Stein Stein Stein Gold Gold Gold}
		set tttinvent_Tempel				{{exp_Service 0.1} {exp_Energie 0.1}}
		set tttgain_Tempel					{{exp_Stein 0.05} {exp_Energie 0.03}}
		set tttinfluence_Tempel				{{exp_Stein 0.3}}
		set tttitems_Tempel					{Unsichtbarkeitstrank Jungbrunnentrank Fruchtbarkeitstrank Wiederbelebung}
		set tttpreinv_Tempel				{Unsichtbarkeitstrank}
		set tttenergyclass_Tempel			3
		set tttenergycons_Tempel			100
		set tttfow_x						20
		set tttfow_y						20
	}
	"Bowlingbahn" {
		set tttmaterial_Bowlingbahn			{Pilzstamm Pilzstamm Stein Stein Kristall}
		set tttinvent_Bowlingbahn			{{exp_Stein 0.2} {exp_Service 0.06}}
		set tttgain_Bowlingbahn				{{exp_Stein 0.07}}
		set tttinfluence_Bowlingbahn		{{exp_Stein 0.5}}
		set tttitems_Bowlingbahn			{}
		set tttpreinv_Bowlingbahn			{}
		set tttfow_x						20
		set tttfow_y						20
	}
	"Bordell" {
		set tttmaterial_Bordell				{Pilzstamm Eisen Eisen Gold Gold Hamster Hamster}
		set tttinvent_Bordell				{{exp_Holz 0.12} {exp_Service 0.03}}
		set tttgain_Bordell					{{exp_Holz 0.05}}
		set tttinfluence_Bordell			{{exp_Holz 0.3}}
		set tttitems_Bordell				{_Liebesdienst}
		set tttpreinv_Bordell				{_Liebesdienst}
		set tttfow_x						20
		set tttfow_y						20
	}
	"Disco" {
		set tttmaterial_Disco				{Eisen Eisen Gold Gold Kristall Kristall}
		set tttinvent_Disco					{{exp_Metall 0.07} {exp_Service 0.07} {exp_Energie 0.07}}
		set tttgain_Disco					{{exp_Metall 0.08}}
		set tttinfluence_Disco				{{exp_Metall 0.2}}
		set tttitems_Disco					{_Auflegen}
		set tttpreinv_Disco					{_Auflegen}
		set tttenergyclass_Disco			3
		set tttenergycons_Disco				3
		set tttfow_x						20
		set tttfow_y						20
	}
//# ENDIF
	"TitanicPumpe" {
		set tttmaterial_$tttsection_tocall	{}
		set tttinvent_$tttsection_tocall	{{exp_Holz 0.004}}
		set tttgain_$tttsection_tocall		{{exp_Holz 0.03}}
		set tttinfluence_$tttsection_tocall	{{exp_Holz 0.5}}
		set tttitems_$tttsection_tocall		{Titanic_abpumpen}
		set tttpreinv_$tttsection_tocall	{Titanic_abpumpen}
		set tttenergyclass_$tttsection_tocall 0
	}

	"Schwefelbruecke" {
		set tttmaterial_$tttsection_tocall	{}
		set tttinvent_$tttsection_tocall	{}
		set tttgain_$tttsection_tocall		{}
		set tttinfluence_$tttsection_tocall	{}
		set tttitems_$tttsection_tocall		{}
		set tttpreinv_$tttsection_tocall	{}
		set tttenergyclass_$tttsection_tocall 0
	}

	// Produkte /////////////////////////////////////////////////////////////////////////////////////
	"Grillpilz" {	;// an der Feuerstelle
		set tttmaterial_Grillpilz			{Pilzhut}
		set tttinvent_Grillpilz				{}
		set tttgain_Grillpilz				{{exp_Nahrung 0.012}}
		set tttinfluence_Grillpilz			{{exp_Nahrung 0.2}}
		set tttnumber2produce_Grillpilz		2
	}
	"Grillhamster" {	;// an der Feuerstelle
		set tttmaterial_Grillhamster		{Hamster}
		set tttinvent_Grillhamster			{{exp_Nahrung 0.02}}
		set tttgain_Grillhamster			{{exp_Nahrung 0.018}}
		set tttinfluence_Grillhamster		{{exp_Nahrung 0.2}}
		set tttnumber2produce_Grillhamster	2
	}
	"Pilzbrot" {	;// an der Feuerstelle
		set tttmaterial_Pilzbrot			{Pilzhut}
		set tttinvent_Pilzbrot				{{exp_Nahrung 0.13}}
		set tttgain_Pilzbrot				{{exp_Nahrung 0.008}}
		set tttinfluence_Pilzbrot			{{exp_Nahrung 0.25}}
		set tttnumber2produce_Pilzbrot		4
	}
	"Raupensuppe" {	;// an der Feuerstelle
		set tttmaterial_Raupensuppe			{Raupe}
		set tttinvent_Raupensuppe			{{exp_Nahrung 0.05}}
		set tttgain_Raupensuppe				{{exp_Nahrung 0.015}}
		set tttinfluence_Raupensuppe		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Raupensuppe	2
	}
	"Raupenschleimkuchen" {	;// an der Feuerstelle
		set tttmaterial_Raupenschleimkuchen			{Raupe}
		set tttinvent_Raupenschleimkuchen			{{exp_Nahrung 0.15}}
		set tttgain_Raupenschleimkuchen				{{exp_Nahrung 0.02}}
		set tttinfluence_Raupenschleimkuchen		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Raupenschleimkuchen	2
	}
	"Gourmetsuppe" {	;// an der Feuerstelle
		set tttmaterial_Gourmetsuppe		{Hamster Raupe Pilzhut}
		set tttinvent_Gourmetsuppe			{{exp_Nahrung 0.18}}
		set tttgain_Gourmetsuppe			{{exp_Nahrung 0.03}}
		set tttinfluence_Gourmetsuppe		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Gourmetsuppe	3
	}
	"Hamstershake" {	;// an der Feuerstelle
		set tttmaterial_Hamstershake		{Hamster}
		set tttinvent_Hamstershake			{{exp_Nahrung 0.15} {exp_Service 0.05}}
		set tttgain_Hamstershake			{{exp_Nahrung 0.03}}
		set tttinfluence_Hamstershake		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Hamstershake	4
	}

	"Grillpilz_" {	;// in der Mittelalterkueche
		set tttmaterial_Grillpilz_			{Pilzhut}
		set tttinvent_Grillpilz_			{}
		set tttgain_Grillpilz_				{{exp_Nahrung 0.015}}
		set tttinfluence_Grillpilz_			{{exp_Nahrung 0.3}}
		set tttnumber2produce_Grillpilz_	3
	}
	"Grillhamster_" {	;// in der Mittelalterkueche
		set tttmaterial_Grillhamster_		{Hamster}
		set tttinvent_Grillhamster_			{{exp_Nahrung 0.02}}
		set tttgain_Grillhamster_			{{exp_Nahrung 0.02}}
		set tttinfluence_Grillhamster_		{{exp_Nahrung 0.3}}
		set tttnumber2produce_Grillhamster_	3
	}
	"Pilzbrot_" {	;// in der Mittelalterkueche
		set tttmaterial_Pilzbrot_			{Pilzhut}
		set tttinvent_Pilzbrot_				{{exp_Nahrung 0.13}}
		set tttgain_Pilzbrot_				{{exp_Nahrung 0.015}}
		set tttinfluence_Pilzbrot_			{{exp_Nahrung 0.3}}
		set tttnumber2produce_Pilzbrot_		4
	}
	"Raupensuppe_" {	;// in der Mittelalterkueche
		set tttmaterial_Raupensuppe_		{Raupe}
		set tttinvent_Raupensuppe_			{{exp_Nahrung 0.07}}
		set tttgain_Raupensuppe_			{{exp_Nahrung 0.022}}
		set tttinfluence_Raupensuppe_		{{exp_Nahrung 0.3}}
		set tttnumber2produce_Raupensuppe_	2
	}
	"Raupenschleimkuchen_" {	;// in der Mittelalterkueche
		set tttmaterial_Raupenschleimkuchen_		{Raupe Pilzhut}
		set tttinvent_Raupenschleimkuchen_			{{exp_Nahrung 0.15}}
		set tttgain_Raupenschleimkuchen_			{{exp_Nahrung 0.015}}
		set tttinfluence_Raupenschleimkuchen_		{{exp_Nahrung 0.3}}
		set tttnumber2produce_Raupenschleimkuchen_	2
	}
	"Gourmetsuppe_" {	;// in der Mittelalterkueche
		set tttmaterial_Gourmetsuppe_		{Hamster Raupe Pilzhut}
		set tttinvent_Gourmetsuppe_			{{exp_Nahrung 0.18}}
		set tttgain_Gourmetsuppe_			{{exp_Nahrung 0.015}}
		set tttinfluence_Gourmetsuppe_		{{exp_Nahrung 0.3}}
		set tttnumber2produce_Gourmetsuppe_	3
	}
	"Hamstershake_" {	;// in der Mittelalterkueche
		set tttmaterial_Hamstershake_		{Hamster}
		set tttinvent_Hamstershake_			{{exp_Nahrung 0.2}}
		set tttgain_Hamstershake_			{{exp_Nahrung 0.015}}
		set tttinfluence_Hamstershake_		{{exp_Nahrung 0.3}}
		set tttnumber2produce_Hamstershake_	2
	}

	"Grillpilz__" {	;// in der Industriekueche
		set tttmaterial_Grillpilz__			{Pilzhut}
		set tttinvent_Grillpilz__			{}
		set tttgain_Grillpilz__				{{exp_Nahrung 0.015}}
		set tttinfluence_Grillpilz__		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Grillpilz__	3
	}
	"Grillhamster__" {	;// in der Industriekueche
		set tttmaterial_Grillhamster__			{Hamster}
		set tttinvent_Grillhamster__			{{exp_Nahrung 0.02}}
		set tttgain_Grillhamster__				{{exp_Nahrung 0.02}}
		set tttinfluence_Grillhamster__			{{exp_Nahrung 0.4}}
		set tttnumber2produce_Grillhamster__	3
	}
	"Pilzbrot__" {	;// in der Industriekueche
		set tttmaterial_Pilzbrot__			{Pilzhut}
		set tttinvent_Pilzbrot__			{{exp_Nahrung 0.13}}
		set tttgain_Pilzbrot__				{{exp_Nahrung 0.01}}
		set tttinfluence_Pilzbrot__			{{exp_Nahrung 0.4}}
		set tttnumber2produce_Pilzbrot__	4
	}
	"Raupensuppe__" {	;// in der Industriekueche
		set tttmaterial_Raupensuppe__		{Raupe}
		set tttinvent_Raupensuppe__			{{exp_Nahrung 0.07}}
		set tttgain_Raupensuppe__			{{exp_Nahrung 0.02}}
		set tttinfluence_Raupensuppe__		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Raupensuppe__	2
	}
	"Raupenschleimkuchen__" {	;// in der Industriekueche
		set tttmaterial_Raupenschleimkuchen__		{Raupe Pilzhut}
		set tttinvent_Raupenschleimkuchen__			{{exp_Nahrung 0.15}}
		set tttgain_Raupenschleimkuchen__			{{exp_Nahrung 0.02}}
		set tttinfluence_Raupenschleimkuchen__		{{exp_Nahrung 0.4}}
		set tttnumber2produce_Raupenschleimkuchen__	2
	}
	"Gourmetsuppe__" {	;// in der Industriekueche
		set tttmaterial_Gourmetsuppe__			{Hamster Raupe Pilzhut}
		set tttinvent_Gourmetsuppe__			{{exp_Nahrung 0.18}}
		set tttgain_Gourmetsuppe__				{{exp_Nahrung 0.015}}
		set tttinfluence_Gourmetsuppe__			{{exp_Nahrung 0.4}}
		set tttnumber2produce_Gourmetsuppe__	3
	}
	"Hamstershake__" {	;// in der Industriekueche
		set tttmaterial_Hamstershake__			{Hamster}
		set tttinvent_Hamstershake__			{{exp_Nahrung 0.2}}
		set tttgain_Hamstershake__				{{exp_Nahrung 0.015}}
		set tttinfluence_Hamstershake__			{{exp_Nahrung 0.4}}
		set tttnumber2produce_Hamstershake__	2
	}

	"Grillpilz___" {	;// in der Luxuskueche
		set tttmaterial_Grillpilz___			{Pilzhut}
		set tttinvent_Grillpilz___				{}
		set tttgain_Grillpilz___				{{exp_Nahrung 0.01}}
		set tttinfluence_Grillpilz___			{{exp_Nahrung 0.2}}
		set tttnumber2produce_Grillpilz___		3
	}
	"Grillhamster___" {	;// in der Luxuskueche
		set tttmaterial_Grillhamster___			{Hamster}
		set tttinvent_Grillhamster___			{{exp_Nahrung 0.02}}
		set tttgain_Grillhamster___				{{exp_Nahrung 0.015}}
		set tttinfluence_Grillhamster___		{{exp_Nahrung 0.2}}
		set tttnumber2produce_Grillhamster___	3
	}
	"Pilzbrot___" {	;// in der Luxuskueche
		set tttmaterial_Pilzbrot___				{Pilzhut}
		set tttinvent_Pilzbrot___				{{exp_Nahrung 0.13}}
		set tttgain_Pilzbrot___					{{exp_Nahrung 0.01}}
		set tttinfluence_Pilzbrot___			{{exp_Nahrung 0.5}}
		set tttnumber2produce_Pilzbrot___		4
	}
	"Raupensuppe___" {	;// in der Luxuskueche
		set tttmaterial_Raupensuppe___			{Raupe}
		set tttinvent_Raupensuppe___			{{exp_Nahrung 0.07}}
		set tttgain_Raupensuppe___				{{exp_Nahrung 0.015}}
		set tttinfluence_Raupensuppe___			{{exp_Nahrung 0.5}}
		set tttnumber2produce_Raupensuppe___	2
	}
	"Raupenschleimkuchen___" {	;// in der Luxuskueche
		set tttmaterial_Raupenschleimkuchen___			{Raupe Pilzhut}
		set tttinvent_Raupenschleimkuchen___			{{exp_Nahrung 0.15}}
		set tttgain_Raupenschleimkuchen___				{{exp_Nahrung 0.015}}
		set tttinfluence_Raupenschleimkuchen___			{{exp_Nahrung 0.5}}
		set tttnumber2produce_Raupenschleimkuchen___	2
	}
	"Gourmetsuppe___" {	;// in der Luxuskueche
		set tttmaterial_Gourmetsuppe___			{Hamster Raupe Pilzhut Golderz}
		set tttinvent_Gourmetsuppe___			{{exp_Nahrung 0.18}}
		set tttgain_Gourmetsuppe___				{{exp_Nahrung 0.03}}
		set tttinfluence_Gourmetsuppe___		{{exp_Nahrung 0.5}}
		set tttnumber2produce_Gourmetsuppe___	3
	}
	"Hamstershake___" {	;// in der Luxuskueche
		set tttmaterial_Hamstershake___			{Hamster}
		set tttinvent_Hamstershake___			{{exp_Nahrung 0.2}}
		set tttgain_Hamstershake___				{{exp_Nahrung 0.015}}
		set tttinfluence_Hamstershake___		{{exp_Nahrung 0.5}}
		set tttnumber2produce_Hamstershake___	2
	}
	"Zelt" {
		set tttmaterial_Zelt				{Pilzstamm Pilzhut}
		set tttinvent_Zelt					{}
		set tttgain_Zelt					{{exp_Holz 0.02}}
		set tttinfluence_Zelt				{{exp_Holz 0.2}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Leiter" {
		set tttmaterial_Leiter				{Pilzstamm}
		set tttinvent_Leiter				{}
		set tttgain_Leiter					{{exp_Holz 0.02}}
		set tttinfluence_Leiter				{{exp_Holz 0.2}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Leiter_Metall" {
		set tttmaterial_Leiter_Metall		{Eisen}
		set tttinvent_Leiter_Metall			{{exp_Metall 0.05} {exp_Transport 0.025}}
		set tttgain_Leiter_Metall			{{exp_Metall 0.02}}
		set tttinfluence_Leiter_Metall		{{exp_Metall 0.2}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Leiter_Kristall" {
		set tttmaterial_Leiter_Kristall		{Kristall}
		set tttinvent_Leiter_Kristall		{{exp_Stein 0.15} {exp_Transport 0.075}}
		set tttgain_Leiter_Kristall			{{exp_Stein 0.01}}
		set tttinfluence_Leiter_Kristall	{{exp_Stein 0.4}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Holzkiepe_" {
		set tttmaterial_Holzkiepe			{Pilzstamm}
		set tttinvent_Holzkiepe				{{exp_Holz 0.03} {exp_Transport 0.03}}
		set tttgain_Holzkiepe				{{exp_Holz 0.012}}
		set tttinfluence_Holzkiepe			{{exp_Holz 0.2}}
	}
	"Grosse_Holzkiepe_" {
		set tttmaterial_Grosse_Holzkiepe				{Pilzstamm Pilzstamm}
		set tttinvent_Grosse_Holzkiepe		{{exp_Holz 0.03} {exp_Transport 0.03}}
		set tttgain_Grosse_Holzkiepe		{{exp_Holz 0.012}}
		set tttinfluence_Grosse_Holzkiepe	{{exp_Holz 0.2}}
	}
	"Holzkiepe" {
		set tttmaterial_Holzkiepe			{Pilzstamm}
		set tttinvent_Holzkiepe				{{exp_Holz 0.03} {exp_Transport 0.03}}
		set tttgain_Holzkiepe				{{exp_Holz 0.012}}
		set tttinfluence_Holzkiepe			{{exp_Holz 0.2}}
	}
	"Schubkarren" {
		set tttmaterial_Schubkarren		{Pilzstamm Pilzstamm Eisen}
		set tttinvent_Schubkarren			{{exp_Holz 0.1} {exp_Transport 0.13}}
		set tttgain_Schubkarren				{{exp_Holz 0.04}}
		set tttinfluence_Schubkarren		{{exp_Holz 0.3}}
	}
	"Grosse_Holzkiepe" {
		set tttmaterial_Grosse_Holzkiepe	{Pilzstamm Pilzstamm}
		set tttinvent_Grosse_Holzkiepe		{{exp_Holz 0.08} {exp_Transport 0.08}}
		set tttgain_Grosse_Holzkiepe		{{exp_Holz 0.02}}
		set tttinfluence_Grosse_Holzkiepe	{{exp_Holz 0.3}}
	}
	"Steinschleuder" {
		set tttmaterial_Steinschleuder		{Pilzstamm Stein}
		set tttinvent_Steinschleuder		{{exp_Stein 0.02}}
		set tttgain_Steinschleuder			{{exp_Stein 0.01}}
		set tttinfluence_Steinschleuder		{{exp_Stein 0.2}}
	}
	"Grabstein" {
		set tttmaterial_Grabstein			{Stein Stein Zipfelmuetze}
		set tttinvent_Grabstein				{}
		set tttgain_Grabstein				{{exp_Stein 0.03}}
		set tttinfluence_Grabstein			{{exp_Stein 0.3}}
		set tttitems_Grabstein				{}
		set tttpreinv_Grabstein				{}
		set tttfow_x						24
		set tttfow_y						24
	}
	"Grenzstein" {
		set tttmaterial_Grenzstein			{Stein}
		set tttinvent_Grenzstein			{}
		set tttgain_Grenzstein				{{exp_Stein 0.005}}
		set tttinfluence_Grenzstein			{{exp_Stein 0.2}}
		set tttitems_Grenzstein				{}
		set tttpreinv_Grenzstein			{}
		set tttfow_x						24
		set tttfow_y                        24
	}
	"Plattmachfalle" {
		set tttmaterial_Plattmachfalle		{Stein Stein Stein Pilzstamm}
		set tttinvent_Plattmachfalle		{{exp_Stein 0.045} {exp_Kampf 0.01}}
		set tttgain_Plattmachfalle			{{exp_Stein 0.02}}
		set tttinfluence_Plattmachfalle		{{exp_Stein 0.3}}
		set tttitems_Plattmachfalle			{}
		set tttpreinv_Plattmachfalle		{}
		set tttfow_x						6
		set tttfow_y                        6
	}
	"Pilz" {
		set tttmaterial_Pilz				{Pilzhut}
		set tttinvent_Pilz					{{exp_Holz 0.06} {exp_Nahrung 0.045}}
		set tttgain_Pilz					{{exp_Nahrung 0.001}}
		set tttinfluence_Pilz				{{exp_Nahrung 0.5} {exp_Transport 0.5}}
	}
	"Hamster" {
		set tttmaterial_Hamster				{Hamster Hamster}
		set tttinvent_Hamster				{{exp_Holz 0.04} {exp_Nahrung 0.03}}
		set tttgain_Hamster					{{exp_Nahrung 0.002}}
		set tttinfluence_Hamster			{{exp_Nahrung 0.5}}
	}
	"Reithamster" {
		set tttmaterial_Reithamster			{Hamster Pilzhut Pilzstamm}
		set tttinvent_Reithamster			{{exp_Holz 0.055} {exp_Transport 0.06}}
		set tttgain_Reithamster				{{exp_Holz 0.01} {exp_Nahrung 0.005}}
		set tttinfluence_Reithamster		{{exp_Holz 0.3}}
	}
	"Raupe" {
		set tttmaterial_Raupe				{Raupe}
		set tttinvent_Raupe					{{exp_Nahrung 0.09}}
		set tttgain_Raupe					{{exp_Nahrung 0.002}}
		set tttinfluence_Raupe				{{exp_Nahrung 0.5}}
	}
	"Bier" {
		set tttmaterial_Bier				{Pilzhut Pilzstamm}
		set tttinvent_Bier					{}
		set tttgain_Bier					{{exp_Nahrung 0.003} {exp_Service 0.002}}
		set tttinfluence_Bier				{{exp_Nahrung 0.3}}
	}
	"Bier_" {
		set tttmaterial_Bier_				{Pilzstamm Raupe Raupe Raupe}
		set tttinvent_Bier_					{{exp_Nahrung 0.15} {exp_Energie 0.08}}
		set tttgain_Bier_					{{exp_Nahrung 0.003} {exp_Service 0.002}}
		set tttinfluence_Bier_				{{exp_Nahrung 0.3}}
	}
	"Pilzschnaps" {
		set tttmaterial_Pilzschnaps			{Pilzhut Raupe Hamster}
		set tttinvent_Pilzschnaps			{}
		set tttgain_Pilzschnaps				{{exp_Nahrung 0.015} {exp_Service 0.005}}
		set tttinfluence_Pilzschnaps		{{exp_Nahrung 0.5}}
	}
	"Kleiner_Heiltrank" {
		set tttmaterial_Kleiner_Heiltrank	{Pilzhut Raupe Pilzstamm}
		set tttinvent_Kleiner_Heiltrank		{{exp_Nahrung 0.04} {exp_Kampf 0.03}}
		set tttgain_Kleiner_Heiltrank		{{exp_Energie 0.005}}
		set tttinfluence_Kleiner_Heiltrank	{{exp_Nahrung 0.2}}
	}
//# IF FULL
	"Heiltrank" {
		set tttmaterial_Heiltrank			{Raupe Raupe Pilzhut Golderz}
		set tttinvent_Heiltrank				{{exp_Nahrung 0.1} {exp_Service 0.03} {exp_Kampf 0.03}}
		set tttgain_Heiltrank				{{exp_Energie 0.01}}
		set tttinfluence_Heiltrank			{{exp_Nahrung 0.3}}
	}
	"Grosser_Heiltrank" {
		set tttmaterial_Grosser_Heiltrank	{Raupe Raupe Bier Gold}
		set tttinvent_Grosser_Heiltrank		{{exp_Energie 0.1} {exp_Service 0.05} {exp_Kampf 0.13}}
		set tttgain_Grosser_Heiltrank		{{exp_Energie 0.02}}
		set tttinfluence_Grosser_Heiltrank	{{exp_Nahrung 0.3}}
	}
	"Unsichtbarkeitstrank" {
		set tttmaterial_Unsichtbarkeitstrank	{Hamster Kristall Kristall Gold Gold Gold}
		set tttinvent_Unsichtbarkeitstrank		{{exp_Service 0.2} {exp_Kampf 0.03}}
		set tttgain_Unsichtbarkeitstrank		{{exp_Energie 0.05} {exp_Service 0.02}}
		set tttinfluence_Unsichtbarkeitstrank	{{exp_Service 0.5}}
	}
	"Jungbrunnentrank" {
		set tttmaterial_Jungbrunnentrank	{Hamster Kristall Eisenerz Gold}
		set tttinvent_Jungbrunnentrank		{{exp_Nahrung 0.15} {exp_Energie 0.09}}
		set tttgain_Jungbrunnentrank		{{exp_Energie 0.06}}
		set tttinfluence_Jungbrunnentrank	{{exp_Energie 0.3}}
	}
	"Wiederbelebung" {
		set tttmaterial_Wiederbelebung		{Zipfelmuetze Hamster Gold Gold Kristallerz}
		set tttinvent_Wiederbelebung		{{exp_Energie 0.18} {exp_Service 0.1} {exp_Transport 0.08}}
		set tttgain_Wiederbelebung			{{exp_Energie 0.05} {exp_Service 0.02}}
		set tttinfluence_Wiederbelebung		{{exp_Energie 0.1} {exp_Service 0.1}}
	}
	"Liebestrank" {
		set tttmaterial_Liebestrank			{Raupe Raupe Bier}
		set tttinvent_Liebestrank			{{exp_Nahrung 0.08} {exp_Service 0.15}}
		set tttgain_Liebestrank				{{exp_Nahrung 0.02} {exp_Energie 0.05}}
		set tttinfluence_Liebestrank		{{exp_Service 0.4}}
	}
	"Fruchtbarkeitstrank" {
		set tttmaterial_Fruchtbarkeitstrank	 {Raupe Hamster Gold}
		set tttinvent_Fruchtbarkeitstrank	 {{exp_Nahrung 0.12} {exp_Energie 0.07} {exp_Service 0.17}}
		set tttgain_Fruchtbarkeitstrank		 {{exp_Nahrung 0.02} {exp_Energie 0.05}}
		set tttinfluence_Fruchtbarkeitstrank {{exp_Energie 0.4}}
	}
	"Unverwundbarkeitstrank" {
		set tttmaterial_Unverwundbarkeitstrank	{Kristall Eisen Gold Gold Hamster}
		set tttinvent_Unverwundbarkeitstrank	{{exp_Energie 0.05} {exp_Kampf 0.3}}
		set tttgain_Unverwundbarkeitstrank		{{exp_Nahrung 0.02} {exp_Energie 0.06}}
		set tttinfluence_Unverwundbarkeitstrank	{{exp_Energie 0.3}}
	}
//# ENDIF
	"Aufzug" {
		set tttmaterial_Aufzug				{Pilzstamm Pilzstamm Pilzstamm Pilzstamm}
		set tttinvent_Aufzug				{{exp_Holz 0.13} {exp_Transport 0.05}}
		set tttgain_Aufzug					{{exp_Holz 0.04}}
		set tttinfluence_Aufzug				{{exp_Holz 0.3}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Taucherglocke" {
		set tttmaterial_Taucherglocke		{Eisen Pilzstamm Hamster}
		set tttinvent_Taucherglocke			{{exp_Metall 0.08} {exp_Transport 0.03}}
		set tttgain_Taucherglocke			{{exp_Metall 0.03}}
		set tttinfluence_Taucherglocke		{{exp_Metall 0.2}}
	}
	"Abfluss" {
		set tttmaterial_Abfluss				{Eisen}
		set tttinvent_Abfluss				{}
		set tttgain_Abfluss					{{exp_Metall 0.04}}
		set tttinfluence_Abfluss			{{exp_Metall 0.3}}
		set tttitems_Abfluss				{}
		set tttpreinv_Abfluss				{}
	}
//# IF FULL
	"Hoverboard" {
		set tttmaterial_Hoverboard			{Kristall Eisen Pilzstamm}
		set tttinvent_Hoverboard			{{exp_Transport 0.27} {exp_Energie 0.07}}
		set tttgain_Hoverboard				{{exp_Metall 0.03}}
		set tttinfluence_Hoverboard			{{exp_Metall 0.3}}
	}
	"Kristallstrahl" {
		set tttmaterial_Kristallstrahl		{Eisen Kristall Kristall}
		set tttinvent_Kristallstrahl		{{exp_Stein 0.4} {exp_Energie 0.05}}
		set tttgain_Kristallstrahl			{{exp_Stein 0.02} {exp_Energie 0.02}}
		set tttinfluence_Kristallstrahl		{{exp_Stein 0.5}}
	}
	"Presslufthammer" {
		set tttmaterial_Presslufthammer		{Eisen Stein}
		set tttinvent_Presslufthammer		{}
		set tttgain_Presslufthammer			{{exp_Metall 0.05}}
		set tttinfluence_Presslufthammer	{{exp_Metall 0.2}}
	}
	"Kettensaege" {
		set tttmaterial_Kettensaege			{Pilzstamm Eisen}
		set tttinvent_Kettensaege			{{exp_Holz 0.2} {exp_Metall 0.05} {exp_Energie 0.03}}
		set tttgain_Kettensaege				{{exp_Metall 0.03}}
		set tttinfluence_Kettensaege		{{exp_Holz 0.1} {exp_Metall 0.2}}
	}
	"Eisen" {
		set tttmaterial_Eisen				{Pilzstamm Eisenerz}
		set tttinvent_Eisen					{}
		set tttgain_Eisen					{{exp_Metall 0.016} {exp_Energie 0.004}}
		set tttinfluence_Eisen				{{exp_Metall 0.2}}
		set tttnumber2produce_Eisen 		2
	}
	"Eisen_" { ;# in Hochofen
		set tttmaterial_Eisen_				{Kohle Eisenerz}
		set tttinvent_Eisen_				{}
		set tttgain_Eisen_					{{exp_Metall 0.02} {exp_Energie 0.006}}
		set tttinfluence_Eisen_				{{exp_Metall 0.3}}
		set tttnumber2produce_Eisen_		3
	}
	"Eisenerz_" {# im Dampfhammer
		set tttmaterial_Eisenerz_         {Stein Stein Stein}
		set tttinvent_Eisenerz_            {{exp_Stein 0.15} {exp_Metall 0.06}}
		set tttgain_Eisenerz_            {{exp_Metall 0.05} {exp_Stein 0.06}}
		set tttinfluence_Eisenerz_         {{exp_Metall 0.5}}
		set tttnumber2produce_Eisenerz_		3
	}
	"Kohle_" {# im Hochofen
		set tttmaterial_Kohle_            {Pilzstamm Pilzstamm Pilzstamm}
		set tttinvent_Kohle_               {{exp_Holz 0.08} {exp_Stein 0.05}}
		set tttgain_Kohle_               {{exp_Stein 0.05} {exp_Holz 0.1} {exp_Energie 0.016}}
		set tttinfluence_Kohle_            {{exp_Stein 0.6}}
		set tttnumber2produce_Kohle_		3
	}
	"Golderz_" {# im Hochofen
		set tttmaterial_Golderz_            {Eisenerz Eisenerz Eisenerz}
		set tttinvent_Golderz_            {{exp_Metall 0.1} {exp_Stein 0.13} {exp_Energie 0.05}}
		set tttgain_Golderz_               {{exp_Stein 0.07} {exp_Metall 0.12} {exp_Energie 0.028}}
		set tttinfluence_Golderz_         {{exp_Stein 0.6}}
	}
	"Kristallerz" {# im Dampfhammer
		set tttmaterial_Kristallerz         {Kohle Kohle Kohle}
		set tttinvent_Kristallerz         {{exp_Stein 0.5}}
		set tttgain_Kristallerz            {{exp_Stein 0.3}}
		set tttinfluence_Kristallerz      {{exp_Stein 0.9}}
	}
	"Eisenerz" {# im Steinmetz
		set tttmaterial_Eisenerz         {Stein Stein Stein Stein Stein}
		set tttinvent_Eisenerz            {{exp_Stein 0.2} {exp_Metall 0.03}}
		set tttgain_Eisenerz            {{exp_Metall 0.05} {exp_Stein 0.06}}
		set tttinfluence_Eisenerz         {{exp_Metall 0.5}}
		set tttnumber2produce_Eisenerz		2
	}
	"Kohle" {# in der Schmelze
		set tttmaterial_Kohle           {Pilzstamm Pilzstamm Pilzstamm Pilzstamm}
		set tttinvent_Kohle              {{exp_Holz 0.05} {exp_Stein 0.08}}
		set tttgain_Kohle              {{exp_Stein 0.05} {exp_Holz 0.1} {exp_Energie 0.016}}
		set tttinfluence_Kohle            {{exp_Stein 0.6}}
		set tttnumber2produce_Kohle_		2
	}
	"Golderz" {# in der Schmelze
		set tttmaterial_Golderz           {Eisenerz Eisenerz Eisenerz Eisenerz}
		set tttinvent_Golderz            {{exp_Metall 0.13} {exp_Stein 0.08} {exp_Energie 0.1}}
		set tttgain_Golderz               {{exp_Stein 0.07} {exp_Metall 0.12} {exp_Energie 0.028}}
		set tttinfluence_Golderz         {{exp_Stein 0.6}}
	}
	"Gold" {
		set tttmaterial_Gold				{Golderz Kohle}
		set tttinvent_Gold					{{exp_Metall 0.15} {exp_Energie 0.02}}
		set tttgain_Gold					{{exp_Metall 0.02} {exp_Energie 0.015}}
		set tttinfluence_Gold				{{exp_Metall 0.35}}
	}
	"Mittelalterwohnzimmer" {
		set tttmaterial_Mittelalterwohnzimmer	{Pilzstamm Pilzstamm Pilzstamm Pilzhut}
		set tttinvent_Mittelalterwohnzimmer		{}
		set tttgain_Mittelalterwohnzimmer		{{exp_Holz 0.12}}
		set tttinfluence_Mittelalterwohnzimmer	{{exp_Holz 0.3}}
		set tttfow_x						10
		set tttfow_y						10
	}
	"Mittelalterschlafzimmer" {
		set tttmaterial_Mittelalterschlafzimmer		{Pilzstamm Pilzstamm Pilzhut Hamster}
		set tttinvent_Mittelalterschlafzimmer		{}
		set tttgain_Mittelalterschlafzimmer			{{exp_Holz 0.1}}
		set tttinfluence_Mittelalterschlafzimmer	{{exp_Holz 0.3}}
		set tttfow_x						10
		set tttfow_y						10
	}
	"Mittelalterbad" {
		set tttmaterial_Mittelalterbad			{Pilzstamm Pilzstamm Stein}
		set tttinvent_Mittelalterbad			{}
		set tttgain_Mittelalterbad				{{exp_Holz 0.07}}
		set tttinfluence_Mittelalterbad			{{exp_Holz 0.3}}
		set tttfow_x						10
		set tttfow_y						10
	}
	"Industriewohnzimmer" {
		set tttmaterial_Industriewohnzimmer		{Pilzstamm Pilzstamm Stein Stein Stein Eisen Pilzhut}
		set tttinvent_Industriewohnzimmer		{{exp_Holz 0.2} {exp_Service 0.02}}
		set tttgain_Industriewohnzimmer			{{exp_Holz 0.15}}
		set tttinfluence_Industriewohnzimmer	{{exp_Holz 0.4}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Industrieschlafzimmer" {
		set tttmaterial_Industrieschlafzimmer	{Pilzstamm Pilzstamm Eisen Eisen Hamster Hamster}
		set tttinvent_Industrieschlafzimmer		{{exp_Holz 0.25}}
		set tttgain_Industrieschlafzimmer		{{exp_Holz 0.15}}
		set tttinfluence_Industrieschlafzimmer	{{exp_Holz 0.4}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Industriebad" {
		set tttmaterial_Industriebad			{Pilzstamm Stein Eisen}
		set tttinvent_Industriebad				{{exp_Holz 0.15} {exp_Nahrung 0.1}}
		set tttgain_Industriebad				{{exp_Holz 0.15}}
		set tttinfluence_Industriebad			{{exp_Holz 0.4}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Luxuswohnzimmer" {
		set tttmaterial_Luxuswohnzimmer		{Pilzstamm Pilzhut Kristall Kristall}
		set tttinvent_Luxuswohnzimmer		{{exp_Stein 0.15} {exp_Service 0.04} {exp_Energie 0.04}}
		set tttgain_Luxuswohnzimmer			{{exp_Stein 0.08}}
		set tttinfluence_Luxuswohnzimmer	{{exp_Stein 0.5}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Luxusschlafzimmer" {
		set tttmaterial_Luxusschlafzimmer	{Pilzstamm Kristall Kristall Hamster}
		set tttinvent_Luxusschlafzimmer		{{exp_Stein 0.24} {exp_Service 0.04}}
		set tttgain_Luxusschlafzimmer		{{exp_Stein 0.1}}
		set tttinfluence_Luxusschlafzimmer	{{exp_Stein 0.5}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Luxusbad" {
		set tttmaterial_Luxusbad			{Stein Kristall Kristall Eisen}
		set tttinvent_Luxusbad				{{exp_Stein 0.28} {exp_Energie 0.03}}
		set tttgain_Luxusbad				{{exp_Stein 0.08}}
		set tttinfluence_Luxusbad			{{exp_Stein 0.5}}
		set tttfow_x						14
		set tttfow_y						14
	}
	"Dampfaufzug" {
		set tttmaterial_Dampfaufzug			{Kohle Eisen Eisen}
		set tttinvent_Dampfaufzug			{{exp_Metall 0.1} {exp_Transport 0.15}}
		set tttgain_Dampfaufzug				{{exp_Metall 0.06}}
		set tttinfluence_Dampfaufzug		{{exp_Metall 0.4}}
		set tttfow_x						6
		set tttfow_y						6
	}
	"Kristallaufzug" {
		set tttmaterial_Kristallaufzug		{Eisen Kristall Kristall}
		set tttinvent_Kristallaufzug		{{exp_Stein 0.15} {exp_Transport 0.2} {exp_Energie 0.05}}
		set tttgain_Kristallaufzug			{{exp_Metall 0.02} {exp_Stein 0.02}}
		set tttinfluence_Kristallaufzug		{{exp_Stein 0.5}}
		set tttfow_x						6
		set tttfow_y						6
	}
//# ENDIF
	"Holztuer" {
		set tttmaterial_Holztuer			{Pilzstamm Pilzstamm Stein}
		set tttinvent_Holztuer				{{exp_Holz 0.04}}
		set tttgain_Holztuer				{{exp_Holz 0.03}}
		set tttinfluence_Holztuer			{{exp_Holz 0.2}}
		set tttitems_Holztuer				{_Offen _Verschlossen _Automatisch}
		set tttpreinv_Holztuer				{_Offen _Verschlossen _Automatisch}
		set tttfow_x						2
		set tttfow_y						2
	}
//# IF FULL
	"Metalltuer" {
		set tttmaterial_Metalltuer			{Eisen Eisen}
		set tttinvent_Metalltuer			{{exp_Metall 0.09}}
		set tttgain_Metalltuer				{{exp_Metall 0.05}}
		set tttinfluence_Metalltuer			{{exp_Metall 0.3}}
		set tttitems_Metalltuer				{_Offen _Verschlossen _Automatisch}
		set tttpreinv_Metalltuer			{_Offen _Verschlossen _Automatisch}
		set tttfow_x						2
		set tttfow_y						2
	}
	"Steintuer" {
		set tttmaterial_Steintuer			{Pilzstamm Stein Stein}
		set tttinvent_Steintuer				{{exp_Stein 0.1}}
		set tttgain_Steintuer				{{exp_Stein 0.05}}
		set tttinfluence_Steintuer			{{exp_Stein 1.0}}
		set tttitems_Steintuer				{_Offen _Verschlossen _Automatisch}
		set tttpreinv_Steintuer				{_Offen _Verschlossen _Automatisch}
		set tttfow_x						2
		set tttfow_y						2
	}
	"Kristalltuer" {
		set tttmaterial_Kristalltuer		{Eisen Kristall Kristall}
		set tttinvent_Kristalltuer			{{exp_Stein 0.25} {exp_Metall 0.11}}
		set tttgain_Kristalltuer			{{exp_Stein 0.03} {exp_Metall 0.01}}
		set tttinfluence_Kristalltuer		{{exp_Stein 0.5}}
		set tttitems_Kristalltuer			{_Offen _Verschlossen _Automatisch}
		set tttpreinv_Kristalltuer			{_Offen _Verschlossen _Automatisch}
		set tttfow_x						2
		set tttfow_y						2
	}
	"Keule" {
		set tttmaterial_Keule				{Pilzstamm Stein}
		set tttinvent_Keule					{{exp_Stein 0.005} {exp_Kampf 0.005}}
		set tttgain_Keule					{{exp_Stein 0.01}}
		set tttinfluence_Keule				{{exp_Stein 0.3}}
	}
	"Schild" {
		set tttmaterial_Schild				{Stein Eisen}
		set tttinvent_Schild				{}
		set tttgain_Schild					{{exp_Metall 0.01}}
		set tttinfluence_Schild				{{exp_Metall 0.2}}
	}
	"Streitaxt" {
		set tttmaterial_Streitaxt			{Pilzstamm Eisen}
		set tttinvent_Streitaxt				{{exp_Metall 0.02} {exp_Kampf 0.06}}
		set tttgain_Streitaxt				{{exp_Metall 0.02}}
		set tttinfluence_Streitaxt			{{exp_Metall 0.3}}
	}
	"Schwert" {
		set tttmaterial_Schwert				{Kohle Eisen}
		set tttinvent_Schwert				{}
		set tttgain_Schwert					{{exp_Metall 0.04}}
		set tttinfluence_Schwert			{{exp_Metall 0.4}}
	}
	"PfeilUndBogen" {
		set tttmaterial_PfeilUndBogen		{Pilzstamm Eisen}
		set tttinvent_PfeilUndBogen			{{exp_Holz 0.03} {exp_Metall 0.02} {exp_Kampf 0.035}}
		set tttgain_PfeilUndBogen			{{exp_Holz 0.01} {exp_Metall 0.03}}
		set tttinfluence_PfeilUndBogen		{{exp_Holz 0.1} {exp_Metall 0.1}}
	}
	"Metallschild" {
		set tttmaterial_Metallschild		{Eisen Eisen}
		set tttinvent_Metallschild			{{exp_Metall 0.08} {exp_Kampf 0.08}}
		set tttgain_Metallschild			{{exp_Metall 0.02}}
		set tttinfluence_Metallschild		{{exp_Metall 0.3}}
	}
	"Buechse" {
		set tttmaterial_Buechse				{Pilzstamm Eisen Eisen Kohle}
		set tttinvent_Buechse				{{exp_Metall 0.2} {exp_Energie 0.05} {exp_Kampf 0.1}}
		set tttgain_Buechse					{{exp_Metall 0.05} {exp_Energie 0.02}}
		set tttinfluence_Buechse			{{exp_Metall 0.4}}
	}
	"Lichtschwert" {
		set tttmaterial_Lichtschwert		{Kristall Kristall Eisen}
		set tttinvent_Lichtschwert			{{exp_Energie 0.25} {exp_Kampf 0.2}}
		set tttgain_Lichtschwert			{{exp_Metall 0.02} {exp_Energie 0.02}}
		set tttinfluence_Lichtschwert		{{exp_Stein 0.1} {exp_Metall 0.2}}
	}
	"Kristallschild" {
		set tttmaterial_Kristallschild		{Kristall Kristall Gold}
		set tttinvent_Kristallschild		{{exp_Stein 0.15} {exp_Metall 0.09} {exp_Kampf 0.15}}
		set tttgain_Kristallschild			{{exp_Stein 0.02} {exp_Metall 0.02}}
		set tttinfluence_Kristallschild		{{exp_Stein 0.1} {exp_Metall 0.2}}
	}
	"Kristall" {
		set tttmaterial_Kristall			{Kristallerz}
		set tttinvent_Kristall				{}
		set tttgain_Kristall				{{exp_Stein 0.02} {exp_Energie 0.006}}
		set tttinfluence_Kristall			{{exp_Stein 1.0}}
	}
	"SteinfalleMedusa" {
		set tttmaterial_SteinfalleMedusa	{Stein Kristall Gold}
		set tttinvent_SteinfalleMedusa		{{exp_Stein 0.2} {exp_Kampf 0.04}}
		set tttgain_SteinfalleMedusa		{{exp_Stein 0.03}}
		set tttinfluence_SteinfalleMedusa	{{exp_Stein 0.4}}
		set tttitems_SteinfalleMedusa		{}
		set tttpreinv_SteinfalleMedusa		{}
		set tttfow_x						3
		set tttfow_y						3
	}
	"Energie" { ;# Laufrad
		set tttmaterial_Energie				{Pilzhut}
		set tttinvent_Energie				{}
		set tttgain_Energie					{{exp_Energie 0.02}}
		set tttinfluence_Energie			{{exp_Energie 0.3}}
	}
	"Energie_" { ;# Wasserrad
		set tttmaterial_Energie_			{}
		set tttinvent_Energie_				{}
		set tttgain_Energie_				{{exp_Energie 0.05}}
		set tttinfluence_Energie_			{{exp_Energie 0.3}}
	}
	"Energie__" { ;# Dampfmaschine
		set tttmaterial_Energie__			{Kohle}
		set tttinvent_Energie__				{}
		set tttgain_Energie__				{{exp_Energie 0.05}}
		set tttinfluence_Energie__			{{exp_Energie 0.4}}
	}
	"Energie___" { ;# Reaktor
		set tttmaterial_Energie___			{Kristall}
		set tttinvent_Energie___			{}
		set tttgain_Energie___				{{exp_Energie 0.1}}
		set tttinfluence_Energie___			{{exp_Energie 0.5}}
	}

	// Dienste //////////////////////////////////////////////////////////////////////
//# ENDIF
	"Titanic_abpumpen" {
		set tttmaterial_Titanic_abpumpen	"[Xmal Kohle 30]"
		set tttinvent_Titanic_abpumpen		{}
		set tttgain_Titanic_abpumpen		{{exp_Metall 0.005}}
		set tttinfluence_Titanic_abpumpen	{{exp_Metall 0.5}}
	}
	"_Unterricht" {
		set tttmaterial__Unterricht			{}
		set tttinvent__Unterricht			{}
		set tttgain__Unterricht				{}
		set tttinfluence__Unterricht		{}
	}
	"Barbetrieb" {
		set tttmaterial_Barbetrieb			{Bier Bier Bier Bier Bier Bier Bier Bier}
		set tttinvent_Barbetrieb			{}
		set tttgain_Barbetrieb				{{exp_Service 0.01}}
		set tttinfluence_Barbetrieb			{{exp_Service 0.7}}
	}
//# IF FULL
	"_Auflegen" {
		set tttmaterial__Auflegen			{}
		set tttinvent__Auflegen				{}
		set tttgain__Auflegen				{{exp_Service 0.01}}
		set tttinfluence__Auflegen			{{exp_Service 0.9}}
	}
	"_Theatervorstellung" {
		set tttmaterial__Theatervorstellung		{}
		set tttinvent__Theatervorstellung		{}
		set tttgain__Theatervorstellung			{{exp_Service 0.01}}
		set tttinfluence__Theatervorstellung	{{exp_Service 0.8}}
	}
	"_Liebesdienst" {
		set tttmaterial__Liebesdienst		{}
		set tttinvent__Liebesdienst			{}
		set tttgain__Liebesdienst			{{exp_Service 0.015}}
		set tttinfluence__Liebesdienst		{{exp_Service 0.6}}
	}
	"_Kungfu" {
		set tttmaterial__Kungfu				{}
		set tttinvent__Kungfu				{}
		set tttgain__Kungfu					{}
		set tttinfluence__Kungfu			{}
	}
	"_Schwertkampf" {
		set tttmaterial__Schwertkampf		{}
		set tttinvent__Schwertkampf			{}
		set tttgain__Schwertkampf			{}
		set tttinfluence__Schwertkampf		{}
	}
	"_Zweihandkampf" {
		set tttmaterial__Zweihandkampf		{}
		set tttinvent__Zweihandkampf		{}
		set tttgain__Zweihandkampf			{}
		set tttinfluence__Zweihandkampf		{}
	}
	"_Schusswaffen" {
		set tttmaterial__Schusswaffen		{}
		set tttinvent__Schusswaffen			{}
		set tttgain__Schusswaffen			{}
		set tttinfluence__Schusswaffen		{}
	}
	"_Verteidigung" {
		set tttmaterial__Verteidigung		{}
		set tttinvent__Verteidigung			{}
		set tttgain__Verteidigung			{}
		set tttinfluence__Verteidigung		{}
	}
	"_Bewachen_nah" {
		set tttmaterial__Bewachen_nah		{}
		set tttinvent__Bewachen_nah			{}
		set tttgain__Bewachen_nah			{}
		set tttinfluence__Bewachen_nah		{{exp_Kampf 0.5}}
	}
	"_Bewachen_mittel" {
		set tttmaterial__Bewachen_mittel	{}
		set tttinvent__Bewachen_mittel		{}
		set tttgain__Bewachen_mittel		{}
		set tttinfluence__Bewachen_mittel	{{exp_Kampf 0.7}}
	}
	"_Bewachen_weit" {
		set tttmaterial__Bewachen_weit		{}
		set tttinvent__Bewachen_weit		{}
		set tttgain__Bewachen_weit			{}
		set tttinfluence__Bewachen_weit		{{exp_Kampf 1.0}}
	}
//# ENDIF
	"_Offen" {
		set tttmaterial__Offen				{}
		set tttinvent__Offen				{}
		set tttgain__Offen					{}
		set tttinfluence__Offen				{}
	}
	"_Verschlossen" {
		set tttmaterial__Verschlossen		{}
		set tttinvent__Verschlossen			{}
		set tttgain__Verschlossen			{}
		set tttinfluence__Verschlossen		{}
	}
	"_Automatisch" {
		set tttmaterial__Automatisch		{}
		set tttinvent__Automatisch			{}
		set tttgain__Automatisch			{}
		set tttinfluence__Automatisch		{}
	}
	"_Weiche_1" {
		set tttmaterial__Weiche_1			{}
		set tttinvent__Weiche_1				{}
		set tttgain__Weiche_1				{}
		set tttinfluence__Weiche_1			{}
	}
	"_Weiche_2" {
		set tttmaterial__Weiche_2			{}
		set tttinvent__Weiche_2				{}
		set tttgain__Weiche_2				{}
		set tttinfluence__Weiche_2			{}
	}
	"_Weiche_3" {
		set tttmaterial__Weiche_3			{}
		set tttinvent__Weiche_3				{}
		set tttgain__Weiche_3				{}
		set tttinfluence__Weiche_3			{}
	}
	"_Weiche_4" {
		set tttmaterial__Weiche_4			{}
		set tttinvent__Weiche_4				{}
		set tttgain__Weiche_4				{}
		set tttinfluence__Weiche_4			{}
	}
	"_Kamera" {
		set tttmaterial__Kamera				{}
		set tttinvent__Kamera				{}
		set tttgain__Kamera					{}
		set tttinfluence__Kamera			{}
	}
//# IF FULL
	"_Heilen" {
		set tttmaterial__Heilen			{}
		set tttinvent__Heilen			{}
		set tttgain__Heilen				{}
		set tttinfluence__Heilen			{{exp_Service 1.0}}
	}
	"_Nahrung_einlagern" {					;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Nahrung_einlagern	{}
		set tttinvent__Nahrung_einlagern	{}
		set tttgain__Nahrung_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Nahrung_einlagern	{{exp_Transport 1.0}}
	}
	"_Kisten_einlagern" {					;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Kisten_einlagern	{}
		set tttinvent__Kisten_einlagern		{}
		set tttgain__Kisten_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Kisten_einlagern	{{exp_Transport 1.0}}
	}
	"_Pilze_einlagern" {					;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Pilze_einlagern	{}
		set tttinvent__Pilze_einlagern		{}
		set tttgain__Pilze_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Pilze_einlagern	{{exp_Transport 1.0}}
	}
	"_Rohmineralien_einlagern" {					;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Rohmineralien_einlagern	{}
		set tttinvent__Rohmineralien_einlagern		{}
		set tttgain__Rohmineralien_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Rohmineralien_einlagern	{{exp_Transport 1.0}}
	}
	"_Mineralien_einlagern" {						;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Mineralien_einlagern		{}
		set tttinvent__Mineralien_einlagern			{}
		set tttgain__Mineralien_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Mineralien_einlagern		{{exp_Transport 1.0}}
	}
	"_Waffen_Werkzeug_und_Traenke_einlagern" {						;// Werte sollten für alle Lager-Items gleich sein!
		set tttmaterial__Waffen_Werkzeug_und_Traenke_einlagern		{}
		set tttinvent__Waffen_Werkzeug_und_Traenke_einlagern		{}
		set tttgain__Waffen_Werkzeug_und_Traenke_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Waffen_Werkzeug_und_Traenke_einlagern		{{exp_Transport 1.0}}
	}
	"_Pilzhut_einlagern" {
		set tttmaterial__Pilzhut_einlagern	{}
		set tttinvent__Pilzhut_einlagern		{}
		set tttgain__Pilzhut_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Pilzhut_einlagern	{{exp_Transport 1.0}}
	}
	"_Pilzstamm_einlagern" {
		set tttmaterial__Pilzstamm_einlagern	{}
		set tttinvent__Pilzstamm_einlagern		{}
		set tttgain__Pilzstamm_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Pilzstamm_einlagern	{{exp_Transport 1.0}}
	}
	"_Rohmineralien_einlagern" {
		set tttmaterial__Rohmineralien_einlagern	{}
		set tttinvent__Rohmineralien_einlagern		{}
		set tttgain__Rohmineralien_einlagern		{{exp_Transport 0.001}}
		set tttinfluence__Rohmineralien_einlagern	{{exp_Transport 1.0}}
	}
	"_Stein_einlagern" {
		set tttmaterial__Stein_einlagern		{}
		set tttinvent__Stein_einlagern			{}
		set tttgain__Stein_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Stein_einlagern		{{exp_Transport 1.0}}
	}
	"_Kohle_einlagern" {
		set tttmaterial__Kohle_einlagern		{}
		set tttinvent__Kohle_einlagern			{}
		set tttgain__Kohle_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Kohle_einlagern		{{exp_Transport 1.0}}
	}
	"_Eisen_einlagern" {
		set tttmaterial__Eisen_einlagern		{}
		set tttinvent__Eisen_einlagern			{}
		set tttgain__Eisen_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Eisen_einlagern		{{exp_Transport 1.0}}
	}
	"_Gold_einlagern" {
		set tttmaterial__Gold_einlagern		{}
		set tttinvent__Gold_einlagern			{}
		set tttgain__Gold_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Gold_einlagern		{{exp_Transport 1.0}}
	}
	"_Kristall_einlagern" {
		set tttmaterial__Kristall_einlagern		{}
		set tttinvent__Kristall_einlagern			{}
		set tttgain__Kristall_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Kristall_einlagern		{{exp_Transport 1.0}}
	}
	"_Waffen_einlagern" {
		set tttmaterial__Waffen_einlagern		{}
		set tttinvent__Waffen_einlagern			{}
		set tttgain__Waffen_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Waffen_einlagern		{{exp_Transport 1.0}}
	}
	"_Werkzeuge_einlagern" {
		set tttmaterial__Werkzeuge_einlagern		{}
		set tttinvent__Werkzeuge_einlagern			{}
		set tttgain__Werkzeuge_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Werkzeuge_einlagern		{{exp_Transport 1.0}}
	}
	"_Traenke_einlagern" {
		set tttmaterial__Traenke_einlagern		{}
		set tttinvent__Traenke_einlagern			{}
		set tttgain__Traenke_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Traenke_einlagern		{{exp_Transport 1.0}}
	}
	"_Ringe_einlagern" {
		set tttmaterial__Ringe_einlagern		{}
		set tttinvent__Ringe_einlagern			{}
		set tttgain__Ringe_einlagern			{{exp_Transport 0.001}}
		set tttinfluence__Ringe_einlagern		{{exp_Transport 1.0}}
	}
//# ENDIF
	// Es folgen die PS-unabhängigen Erfahrungszuwächse beim Zwergendasein
	"Zwerg" {
		// Pilzfällen
		set tttgain_Pilz					{{exp_Holz 0.013}}
		set tttinfluence_Pilz				10.0
		// Graben
		set tttgain_dig						{{exp_Stein 0.001} {exp_Metall 0.00008}}
		set tttinfluence_dig				10.0
		set tttfailmax_dig					0.2
		set tttexp_digbrush2				0.15
		set tttexp_digbrush3				0.30
		set tttexp_digbrush4				0.70
		// bis zu diesem Wert der Steinerfahrung kann es zu Fehlschlägen kommen
		// Transport
		set tttgain_buildup					0.0023
		set tttgain_supply					0.004
		// Claneinstellungen
		set ttt_clanexp						{}
		set ttt_Voodoo_clanexp				{{exp_Nahrung 1.3} {exp_Holz 1.1} {exp_Kampf 0.9}}
		set ttt_Knocker_clanexp				{{exp_Stein 1.2} {exp_Metall 1.1}}
		set ttt_Brain_clanexp				{{exp_Energie 1.2} {exp_Service 1.1}}
		set ttt_Vampir_clanexp				{{exp_Kampf 1.2} {exp_Nahrung 0.8}}
		// Vampirzwerge mehr Kampfzuwachs!
	}
	default {
		set tttitems_$tttsection_tocall	{}
		set tttpreinv_$tttsection_tocall	{}
		set tttmaterial_$tttsection_tocall	{}
		set tttinvent_$tttsection_tocall	{}
		set tttgain_$tttsection_tocall		{}
		set tttinfluence_$tttsection_tocall	{}
	}

}
}
