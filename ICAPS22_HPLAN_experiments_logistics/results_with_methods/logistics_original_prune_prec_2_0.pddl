( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5 - OBJ
      ?auto_6 - LOCATION
    )
    :vars
    (
      ?auto_7 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7 ?auto_6 ) ( IN-TRUCK ?auto_5 ?auto_7 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5 ?auto_7 ?auto_6 )
      ( DELIVER-1PKG-VERIFY ?auto_5 ?auto_6 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16 - OBJ
      ?auto_17 - LOCATION
    )
    :vars
    (
      ?auto_20 - TRUCK
      ?auto_22 - LOCATION
      ?auto_23 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_16 ?auto_20 ) ( TRUCK-AT ?auto_20 ?auto_22 ) ( IN-CITY ?auto_22 ?auto_23 ) ( IN-CITY ?auto_17 ?auto_23 ) ( not ( = ?auto_17 ?auto_22 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20 ?auto_22 ?auto_17 ?auto_23 )
      ( DELIVER-1PKG ?auto_16 ?auto_17 )
      ( DELIVER-1PKG-VERIFY ?auto_16 ?auto_17 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_33 - OBJ
      ?auto_34 - LOCATION
    )
    :vars
    (
      ?auto_37 - TRUCK
      ?auto_38 - LOCATION
      ?auto_35 - CITY
      ?auto_41 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_37 ?auto_38 ) ( IN-CITY ?auto_38 ?auto_35 ) ( IN-CITY ?auto_34 ?auto_35 ) ( not ( = ?auto_34 ?auto_38 ) ) ( TRUCK-AT ?auto_37 ?auto_41 ) ( OBJ-AT ?auto_33 ?auto_41 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_33 ?auto_37 ?auto_41 )
      ( DELIVER-1PKG ?auto_33 ?auto_34 )
      ( DELIVER-1PKG-VERIFY ?auto_33 ?auto_34 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_52 - OBJ
      ?auto_53 - LOCATION
    )
    :vars
    (
      ?auto_55 - LOCATION
      ?auto_59 - CITY
      ?auto_54 - TRUCK
      ?auto_61 - LOCATION
      ?auto_62 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_55 ?auto_59 ) ( IN-CITY ?auto_53 ?auto_59 ) ( not ( = ?auto_53 ?auto_55 ) ) ( OBJ-AT ?auto_52 ?auto_55 ) ( TRUCK-AT ?auto_54 ?auto_61 ) ( IN-CITY ?auto_61 ?auto_62 ) ( IN-CITY ?auto_55 ?auto_62 ) ( not ( = ?auto_55 ?auto_61 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54 ?auto_61 ?auto_55 ?auto_62 )
      ( DELIVER-1PKG ?auto_52 ?auto_53 )
      ( DELIVER-1PKG-VERIFY ?auto_52 ?auto_53 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_90 - OBJ
      ?auto_92 - OBJ
      ?auto_91 - LOCATION
    )
    :vars
    (
      ?auto_93 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_92 ?auto_90 ) ( TRUCK-AT ?auto_93 ?auto_91 ) ( IN-TRUCK ?auto_92 ?auto_93 ) ( OBJ-AT ?auto_90 ?auto_91 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_92 ?auto_91 )
      ( DELIVER-2PKG-VERIFY ?auto_90 ?auto_92 ?auto_91 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_117 - OBJ
      ?auto_119 - OBJ
      ?auto_118 - LOCATION
    )
    :vars
    (
      ?auto_122 - TRUCK
      ?auto_121 - LOCATION
      ?auto_120 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_119 ?auto_117 ) ( IN-TRUCK ?auto_119 ?auto_122 ) ( TRUCK-AT ?auto_122 ?auto_121 ) ( IN-CITY ?auto_121 ?auto_120 ) ( IN-CITY ?auto_118 ?auto_120 ) ( not ( = ?auto_118 ?auto_121 ) ) ( OBJ-AT ?auto_117 ?auto_118 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_119 ?auto_118 )
      ( DELIVER-2PKG-VERIFY ?auto_117 ?auto_119 ?auto_118 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_143 - OBJ
      ?auto_144 - LOCATION
    )
    :vars
    (
      ?auto_147 - OBJ
      ?auto_149 - TRUCK
      ?auto_150 - LOCATION
      ?auto_148 - CITY
      ?auto_152 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_143 ?auto_147 ) ( TRUCK-AT ?auto_149 ?auto_150 ) ( IN-CITY ?auto_150 ?auto_148 ) ( IN-CITY ?auto_144 ?auto_148 ) ( not ( = ?auto_144 ?auto_150 ) ) ( OBJ-AT ?auto_147 ?auto_144 ) ( TRUCK-AT ?auto_149 ?auto_152 ) ( OBJ-AT ?auto_143 ?auto_152 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_143 ?auto_149 ?auto_152 )
      ( DELIVER-2PKG ?auto_147 ?auto_143 ?auto_144 )
      ( DELIVER-1PKG-VERIFY ?auto_143 ?auto_144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_154 - OBJ
      ?auto_156 - OBJ
      ?auto_155 - LOCATION
    )
    :vars
    (
      ?auto_159 - OBJ
      ?auto_160 - TRUCK
      ?auto_158 - LOCATION
      ?auto_157 - CITY
      ?auto_161 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_156 ?auto_154 ) ( GREATER-THAN ?auto_156 ?auto_159 ) ( TRUCK-AT ?auto_160 ?auto_158 ) ( IN-CITY ?auto_158 ?auto_157 ) ( IN-CITY ?auto_155 ?auto_157 ) ( not ( = ?auto_155 ?auto_158 ) ) ( OBJ-AT ?auto_159 ?auto_155 ) ( TRUCK-AT ?auto_160 ?auto_161 ) ( OBJ-AT ?auto_156 ?auto_161 ) ( OBJ-AT ?auto_154 ?auto_155 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156 ?auto_155 )
      ( DELIVER-2PKG-VERIFY ?auto_154 ?auto_156 ?auto_155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_186 - OBJ
      ?auto_187 - LOCATION
    )
    :vars
    (
      ?auto_195 - OBJ
      ?auto_189 - OBJ
      ?auto_190 - LOCATION
      ?auto_191 - CITY
      ?auto_188 - TRUCK
      ?auto_197 - LOCATION
      ?auto_198 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_186 ?auto_195 ) ( GREATER-THAN ?auto_186 ?auto_189 ) ( IN-CITY ?auto_190 ?auto_191 ) ( IN-CITY ?auto_187 ?auto_191 ) ( not ( = ?auto_187 ?auto_190 ) ) ( OBJ-AT ?auto_189 ?auto_187 ) ( OBJ-AT ?auto_186 ?auto_190 ) ( OBJ-AT ?auto_195 ?auto_187 ) ( TRUCK-AT ?auto_188 ?auto_197 ) ( IN-CITY ?auto_197 ?auto_198 ) ( IN-CITY ?auto_190 ?auto_198 ) ( not ( = ?auto_190 ?auto_197 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_188 ?auto_197 ?auto_190 ?auto_198 )
      ( DELIVER-2PKG ?auto_195 ?auto_186 ?auto_187 )
      ( DELIVER-1PKG-VERIFY ?auto_186 ?auto_187 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_200 - OBJ
      ?auto_202 - OBJ
      ?auto_201 - LOCATION
    )
    :vars
    (
      ?auto_208 - OBJ
      ?auto_203 - OBJ
      ?auto_207 - LOCATION
      ?auto_209 - CITY
      ?auto_211 - TRUCK
      ?auto_210 - LOCATION
      ?auto_206 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_202 ?auto_200 ) ( GREATER-THAN ?auto_202 ?auto_208 ) ( GREATER-THAN ?auto_202 ?auto_203 ) ( IN-CITY ?auto_207 ?auto_209 ) ( IN-CITY ?auto_201 ?auto_209 ) ( not ( = ?auto_201 ?auto_207 ) ) ( OBJ-AT ?auto_203 ?auto_201 ) ( OBJ-AT ?auto_202 ?auto_207 ) ( OBJ-AT ?auto_208 ?auto_201 ) ( TRUCK-AT ?auto_211 ?auto_210 ) ( IN-CITY ?auto_210 ?auto_206 ) ( IN-CITY ?auto_207 ?auto_206 ) ( not ( = ?auto_207 ?auto_210 ) ) ( OBJ-AT ?auto_200 ?auto_201 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_202 ?auto_201 )
      ( DELIVER-2PKG-VERIFY ?auto_200 ?auto_202 ?auto_201 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_238 - OBJ
      ?auto_239 - LOCATION
    )
    :vars
    (
      ?auto_245 - OBJ
      ?auto_246 - LOCATION
      ?auto_249 - CITY
      ?auto_240 - TRUCK
      ?auto_247 - LOCATION
      ?auto_242 - CITY
      ?auto_252 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_238 ?auto_245 ) ( IN-CITY ?auto_246 ?auto_249 ) ( IN-CITY ?auto_239 ?auto_249 ) ( not ( = ?auto_239 ?auto_246 ) ) ( OBJ-AT ?auto_238 ?auto_246 ) ( TRUCK-AT ?auto_240 ?auto_247 ) ( IN-CITY ?auto_247 ?auto_242 ) ( IN-CITY ?auto_246 ?auto_242 ) ( not ( = ?auto_246 ?auto_247 ) ) ( TRUCK-AT ?auto_252 ?auto_239 ) ( IN-TRUCK ?auto_245 ?auto_252 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_245 ?auto_239 )
      ( DELIVER-2PKG ?auto_245 ?auto_238 ?auto_239 )
      ( DELIVER-1PKG-VERIFY ?auto_238 ?auto_239 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_253 - OBJ
      ?auto_255 - OBJ
      ?auto_254 - LOCATION
    )
    :vars
    (
      ?auto_263 - LOCATION
      ?auto_261 - CITY
      ?auto_256 - TRUCK
      ?auto_259 - LOCATION
      ?auto_257 - CITY
      ?auto_264 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_255 ?auto_253 ) ( IN-CITY ?auto_263 ?auto_261 ) ( IN-CITY ?auto_254 ?auto_261 ) ( not ( = ?auto_254 ?auto_263 ) ) ( OBJ-AT ?auto_255 ?auto_263 ) ( TRUCK-AT ?auto_256 ?auto_259 ) ( IN-CITY ?auto_259 ?auto_257 ) ( IN-CITY ?auto_263 ?auto_257 ) ( not ( = ?auto_263 ?auto_259 ) ) ( TRUCK-AT ?auto_264 ?auto_254 ) ( IN-TRUCK ?auto_253 ?auto_264 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_255 ?auto_254 )
      ( DELIVER-2PKG-VERIFY ?auto_253 ?auto_255 ?auto_254 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_289 - OBJ
      ?auto_290 - LOCATION
    )
    :vars
    (
      ?auto_296 - OBJ
      ?auto_293 - LOCATION
      ?auto_294 - CITY
      ?auto_297 - CITY
      ?auto_291 - TRUCK
      ?auto_301 - LOCATION
      ?auto_302 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_289 ?auto_296 ) ( IN-CITY ?auto_293 ?auto_294 ) ( IN-CITY ?auto_290 ?auto_294 ) ( not ( = ?auto_290 ?auto_293 ) ) ( OBJ-AT ?auto_289 ?auto_293 ) ( IN-CITY ?auto_290 ?auto_297 ) ( IN-CITY ?auto_293 ?auto_297 ) ( IN-TRUCK ?auto_296 ?auto_291 ) ( TRUCK-AT ?auto_291 ?auto_301 ) ( IN-CITY ?auto_301 ?auto_302 ) ( IN-CITY ?auto_290 ?auto_302 ) ( not ( = ?auto_290 ?auto_301 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_291 ?auto_301 ?auto_290 ?auto_302 )
      ( DELIVER-2PKG ?auto_296 ?auto_289 ?auto_290 )
      ( DELIVER-1PKG-VERIFY ?auto_289 ?auto_290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_304 - OBJ
      ?auto_306 - OBJ
      ?auto_305 - LOCATION
    )
    :vars
    (
      ?auto_314 - LOCATION
      ?auto_315 - CITY
      ?auto_309 - CITY
      ?auto_312 - TRUCK
      ?auto_307 - LOCATION
      ?auto_308 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_306 ?auto_304 ) ( IN-CITY ?auto_314 ?auto_315 ) ( IN-CITY ?auto_305 ?auto_315 ) ( not ( = ?auto_305 ?auto_314 ) ) ( OBJ-AT ?auto_306 ?auto_314 ) ( IN-CITY ?auto_305 ?auto_309 ) ( IN-CITY ?auto_314 ?auto_309 ) ( IN-TRUCK ?auto_304 ?auto_312 ) ( TRUCK-AT ?auto_312 ?auto_307 ) ( IN-CITY ?auto_307 ?auto_308 ) ( IN-CITY ?auto_305 ?auto_308 ) ( not ( = ?auto_305 ?auto_307 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_306 ?auto_305 )
      ( DELIVER-2PKG-VERIFY ?auto_304 ?auto_306 ?auto_305 ) )
  )

)

