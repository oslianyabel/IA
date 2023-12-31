%Tarea Final de Introducci�n a la Inteligencia Artificial
%Integrantes: Osliani Abel Figueiras Saucedo, Raudiel Ruiz Jim�nez y Angel Alejandro L�pez Gonz�lez

%sintomas(nombre de la enfermedad, nivel de prioridad, n�mero del grupo al que pertenece, lista con los sintomas)
sintomas(hipertiroidismo, alta, 1, [mirada_brillante, exoftalmo, facies_angustiosa]).
sintomas(hipertiroidismo, alta, 2, [tiroides_inflamada]).

sintomas(hipertiroidismo, media, 1, [nerviosismo, temblor_fino]).
sintomas(hipertiroidismo, media, 2, [sensibilidad_calor, piel_caliente]).

sintomas(hipertiroidismo, baja, 1, [arenilla_ocular, fotofobia, no_parpadeo]).
sintomas(hipertiroidismo, baja, 2, [disfuncion_erectil, trastornos_menstruales, debilidad_muscular, fatiga]).
sintomas(hipertiroidismo, baja, 3, [perdida_peso, diarreas, constipacion, polifagia]).
sintomas(hipertiroidismo, baja, 4, [taquicardia, palpitaciones]).
sintomas(hipertiroidismo, baja, 5, [insomnio, irritabilidad, depresion]).

%El ultimo argumento unifica con 3 si se encontr� un s�ntoma de importancia alta, 0 en caso contrario.
pertenece_alta([],_,0).
pertenece_alta([Cabeza|_], Grupo, 3):-member(Cabeza, Grupo),!.
pertenece_alta([_|Cola], Grupo, Cont):-pertenece_alta(Cola, Grupo, Cont).

pertenece_media([],_,0).
pertenece_media([Cabeza|_], Grupo, 2):-member(Cabeza, Grupo),!.
pertenece_media([_|Cola], Grupo, Cont):-pertenece_media(Cola, Grupo, Cont).

pertenece_baja([],_,0).
pertenece_baja([Cabeza|_],Grupo, 1.5):-member(Cabeza,Grupo),!.
pertenece_baja([_|Cola],Grupo,Cont):-pertenece_baja(Cola, Grupo, Cont).

%Esta regla es True si los s�ntomas de un paciente sin factores de riesgo suman 5 puntos o m�s y al menos hay presente un s�ntoma de media o alta importancia
%False en caso contrario.
cuadro_clinico(Sintomas_Paciente, sin_riesgo):-
sintomas(hipertiroidismo, alta, 1, Grupo1),
sintomas(hipertiroidismo, alta, 2, Grupo2),
sintomas(hipertiroidismo, media, 1, Grupo3),
sintomas(hipertiroidismo, media, 2, Grupo4),
sintomas(hipertiroidismo, baja, 1, Grupo5),
sintomas(hipertiroidismo, baja, 2, Grupo6),
sintomas(hipertiroidismo, baja, 3, Grupo7),
sintomas(hipertiroidismo, baja, 4, Grupo8),
sintomas(hipertiroidismo, baja, 5, Grupo9),
pertenece_alta(Sintomas_Paciente, Grupo1, X1),
pertenece_alta(Sintomas_Paciente, Grupo2, X2),
pertenece_media(Sintomas_Paciente, Grupo3, X3),
pertenece_media(Sintomas_Paciente, Grupo4, X4),
pertenece_baja(Sintomas_Paciente, Grupo5, X5),
pertenece_baja(Sintomas_Paciente, Grupo6, X6),
pertenece_baja(Sintomas_Paciente, Grupo7, X7),
pertenece_baja(Sintomas_Paciente, Grupo8, X8),
pertenece_baja(Sintomas_Paciente, Grupo9, X9),
Sum1 is X1+X2+X3+X4,
Sum1 >= 2,
Sum2 is Sum1+X5+X6+X7+X8+X9,
Sum2 >= 5.

%Esta regla es True si los s�ntomas de un paciente con factores de riesgo suman 4 puntos o m�s y al menos hay presente un s�ntoma de media o alta importancia
%False en caso contrario.
cuadro_clinico(Sintomas_Paciente, riesgo):-
sintomas(hipertiroidismo, alta, 1, Grupo1),
sintomas(hipertiroidismo, alta, 2, Grupo2),
sintomas(hipertiroidismo, media, 1, Grupo3),
sintomas(hipertiroidismo, media, 2, Grupo4),
sintomas(hipertiroidismo, baja, 1, Grupo5),
sintomas(hipertiroidismo, baja, 2, Grupo6),
sintomas(hipertiroidismo, baja, 3, Grupo7),
sintomas(hipertiroidismo, baja, 4, Grupo8),
sintomas(hipertiroidismo, baja, 5, Grupo9),
pertenece_alta(Sintomas_Paciente, Grupo1, X1),
pertenece_alta(Sintomas_Paciente, Grupo2, X2),
pertenece_media(Sintomas_Paciente, Grupo3, X3),
pertenece_media(Sintomas_Paciente, Grupo4, X4),
pertenece_baja(Sintomas_Paciente, Grupo5, X5),
pertenece_baja(Sintomas_Paciente, Grupo6, X6),
pertenece_baja(Sintomas_Paciente, Grupo7, X7),
pertenece_baja(Sintomas_Paciente, Grupo8, X8),
pertenece_baja(Sintomas_Paciente, Grupo9, X9),
Sum1 is X1+X2+X3+X4,
Sum1 >= 2,
Sum2 is Sum1+X5+X6+X7+X8+X9,
Sum2 >= 4.

%Esta regla es True si los s�ntomas de un paciente con factores de alto riesgo suman 3 puntos o m�s y al menos hay presente un s�ntoma de media o alta importancia.
%False en caso contrario.
cuadro_clinico(Sintomas_Paciente, alto_riesgo):-
sintomas(hipertiroidismo, alta, 1, Grupo1),
sintomas(hipertiroidismo, alta, 2, Grupo2),
sintomas(hipertiroidismo, media, 1, Grupo3),
sintomas(hipertiroidismo, media, 2, Grupo4),
sintomas(hipertiroidismo, baja, 1, Grupo5),
sintomas(hipertiroidismo, baja, 2, Grupo6),
sintomas(hipertiroidismo, baja, 3, Grupo7),
sintomas(hipertiroidismo, baja, 4, Grupo8),
sintomas(hipertiroidismo, baja, 5, Grupo9),
pertenece_alta(Sintomas_Paciente, Grupo1, X1),
pertenece_alta(Sintomas_Paciente, Grupo2, X2),
pertenece_media(Sintomas_Paciente, Grupo3, X3),
pertenece_media(Sintomas_Paciente, Grupo4, X4),
pertenece_baja(Sintomas_Paciente, Grupo5, X5),
pertenece_baja(Sintomas_Paciente, Grupo6, X6),
pertenece_baja(Sintomas_Paciente, Grupo7, X7),
pertenece_baja(Sintomas_Paciente, Grupo8, X8),
pertenece_baja(Sintomas_Paciente, Grupo9, X9),
Sum1 is X1+X2+X3+X4,
Sum1 >= 2,
Sum2 is Sum1+X5+X6+X7+X8+X9,
Sum2 >= 3.

%True si los niveles de T3 > 2 o T4 > 12 o TSH < 0.4. False en caso contrario.
prueba_funcion_tiroidea(T3, T4, TSH):-
T3 > 2;
T4 > 12;
TSH < 0.4.


%Si no hay ningun factor de riesgo la variable como segundo argumento unifica con sin_riesgo.
clasificar_factor_riesgo([], sin_riesgo):-!.

%Si hay m�s de 2 factores de riesgo la variable como segundo argumento unifica con alto_riesgo.
clasificar_factor_riesgo(Lista, alto_riesgo):-length(Lista,X), X >= 2, !.

%Si antecedente_personal o antecedente_familiar son factores de riesgo, la variable como segundo argumento tambi�n unifica con alto_riesgo.
clasificar_factor_riesgo([Cabeza|_], alto_riesgo):-
Cabeza=antecedente_personal;
Cabeza=antecedente_familiar,
!.

%si no unifica con ninguna de las anteriores entonces unifica con riesgo.
clasificar_factor_riesgo([_], riesgo).

%informacion(nombre de enfermedad, tipo de informaci�n,  informaci�n)
informacion(hipertiroidismo, causas, 'Enfermedad de Graves Basedow').
informacion(hipertiroidismo, causas, 'N�dulos tiroideos').
informacion(hipertiroidismo, causas, 'Tiroiditis').
informacion(hipertiroidismo, causas, 'Ingesta de yodo').
informacion(hipertiroidismo, causas, 'Sobredosis de medicamentos para el hipotiroidismo').

informacion(hipertiroidismo, signos, 'mirada brillante').
informacion(hipertiroidismo, signos, 'exoftalmo').
informacion(hipertiroidismo, signos, 'facies angustiosa').
informacion(hipertiroidismo, signos, 'tiroides inflamada').
informacion(hipertiroidismo, sintomas, 'nerviosismo').
informacion(hipertiroidismo, signos, 'temblor fino').
informacion(hipertiroidismo, sintomas, 'sensibilidad al calor').
informacion(hipertiroidismo, sintomas, 'piel caliente').
informacion(hipertiroidismo, sintomas, 'arenilla ocular').
informacion(hipertiroidismo, signos, 'fotofobia').
informacion(hipertiroidismo, signos, 'poco parpadeo').
informacion(hipertiroidismo, sintomas, 'disfunci�n er�ctil').
informacion(hipertiroidismo, sintomas, 'trastornos menstruales').
informacion(hipertiroidismo, sintomas, 'debilidad muscular').
informacion(hipertiroidismo, sintomas, 'fatiga').
informacion(hipertiroidismo, sintomas, 'perdida de peso').
informacion(hipertiroidismo, sintomas, 'diarreas').
informacion(hipertiroidismo, sintomas, 'constipacion').
informacion(hipertiroidismo, sintomas, 'polifagia').
informacion(hipertiroidismo, signos, 'taquicardia').
informacion(hipertiroidismo, sintomas, 'palpitaciones').
informacion(hipertiroidismo, sintomas, 'insomnio').
informacion(hipertiroidismo, sintomas, 'irritabilidad').
informacion(hipertiroidismo, sintomas, 'depresi�n').

informacion(hipertiroidismo, factor_riesgo, 'Mujeres').
informacion(hipertiroidismo, factor_riesgo, 'Mayores de 60 a�os').
informacion(hipertiroidismo, factor_riesgo, 'Embarazo reciente').
informacion(hipertiroidismo, factor_riesgo, 'Antecedente quir�rjico en la tiroides o un problema de tiroides como bocio').
informacion(hipertiroidismo, factor_riesgo, 'Antecedentes familiares de enfermedad de la tiroides').
informacion(hipertiroidismo, factor_riesgo, 'Anemia perniciosa').
informacion(hipertiroidismo, factor_riesgo, 'Diabetes tipo 1').
informacion(hipertiroidismo, factor_riesgo, 'Consume demasiado yodo').

informacion(autores, 'Osliani Abel Figueiras Saucedo').
informacion(autores, 'Raudiel Ruiz Jim�nez').
informacion(autores, 'Angel Alejandro L�pez Gonzalez').

%muestra toda la informaci�n en forma de listas.
mostrar_info(Signos, Sintomas, Causas, Factor_de_riesgo, Autores):-
findall(X, informacion(hipertiroidismo, signos, X), Signos),
findall(X, informacion(hipertiroidismo, sintomas, X), Sintomas),
findall(X, informacion(hipertiroidismo, causas, X), Causas),
findall(X, informacion(hipertiroidismo, factor_riesgo, X), Factor_de_riesgo),
findall(X, informacion(autores, X), Autores).


