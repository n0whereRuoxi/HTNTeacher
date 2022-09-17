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
      ?auto_124 - OBJ
      ?auto_125 - LOCATION
    )
    :vars
    (
      ?auto_126 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_126 ?auto_125 ) ( IN-TRUCK ?auto_124 ?auto_126 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_124 ?auto_126 ?auto_125 )
      ( DELIVER-1PKG-VERIFY ?auto_124 ?auto_125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_129 - OBJ
      ?auto_130 - LOCATION
    )
    :vars
    (
      ?auto_131 - TRUCK
      ?auto_132 - LOCATION
      ?auto_133 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_129 ?auto_131 ) ( TRUCK-AT ?auto_131 ?auto_132 ) ( IN-CITY ?auto_132 ?auto_133 ) ( IN-CITY ?auto_130 ?auto_133 ) ( not ( = ?auto_130 ?auto_132 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_131 ?auto_132 ?auto_130 ?auto_133 )
      ( DELIVER-1PKG ?auto_129 ?auto_130 )
      ( DELIVER-1PKG-VERIFY ?auto_129 ?auto_130 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136 - OBJ
      ?auto_137 - LOCATION
    )
    :vars
    (
      ?auto_139 - TRUCK
      ?auto_138 - LOCATION
      ?auto_140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139 ?auto_138 ) ( IN-CITY ?auto_138 ?auto_140 ) ( IN-CITY ?auto_137 ?auto_140 ) ( not ( = ?auto_137 ?auto_138 ) ) ( OBJ-AT ?auto_136 ?auto_138 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136 ?auto_139 ?auto_138 )
      ( DELIVER-1PKG ?auto_136 ?auto_137 )
      ( DELIVER-1PKG-VERIFY ?auto_136 ?auto_137 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_143 - OBJ
      ?auto_144 - LOCATION
    )
    :vars
    (
      ?auto_145 - LOCATION
      ?auto_147 - CITY
      ?auto_146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145 ?auto_147 ) ( IN-CITY ?auto_144 ?auto_147 ) ( not ( = ?auto_144 ?auto_145 ) ) ( OBJ-AT ?auto_143 ?auto_145 ) ( TRUCK-AT ?auto_146 ?auto_144 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_146 ?auto_144 ?auto_145 ?auto_147 )
      ( DELIVER-1PKG ?auto_143 ?auto_144 )
      ( DELIVER-1PKG-VERIFY ?auto_143 ?auto_144 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150 - OBJ
      ?auto_151 - LOCATION
    )
    :vars
    (
      ?auto_152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_152 ?auto_151 ) ( IN-TRUCK ?auto_150 ?auto_152 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_150 ?auto_152 ?auto_151 )
      ( DELIVER-1PKG-VERIFY ?auto_150 ?auto_151 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_155 - OBJ
      ?auto_156 - LOCATION
    )
    :vars
    (
      ?auto_157 - TRUCK
      ?auto_158 - LOCATION
      ?auto_159 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_155 ?auto_157 ) ( TRUCK-AT ?auto_157 ?auto_158 ) ( IN-CITY ?auto_158 ?auto_159 ) ( IN-CITY ?auto_156 ?auto_159 ) ( not ( = ?auto_156 ?auto_158 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_157 ?auto_158 ?auto_156 ?auto_159 )
      ( DELIVER-1PKG ?auto_155 ?auto_156 )
      ( DELIVER-1PKG-VERIFY ?auto_155 ?auto_156 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_162 - OBJ
      ?auto_163 - LOCATION
    )
    :vars
    (
      ?auto_166 - TRUCK
      ?auto_165 - LOCATION
      ?auto_164 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_166 ?auto_165 ) ( IN-CITY ?auto_165 ?auto_164 ) ( IN-CITY ?auto_163 ?auto_164 ) ( not ( = ?auto_163 ?auto_165 ) ) ( OBJ-AT ?auto_162 ?auto_165 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_162 ?auto_166 ?auto_165 )
      ( DELIVER-1PKG ?auto_162 ?auto_163 )
      ( DELIVER-1PKG-VERIFY ?auto_162 ?auto_163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_169 - OBJ
      ?auto_170 - LOCATION
    )
    :vars
    (
      ?auto_171 - LOCATION
      ?auto_172 - CITY
      ?auto_173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171 ?auto_172 ) ( IN-CITY ?auto_170 ?auto_172 ) ( not ( = ?auto_170 ?auto_171 ) ) ( OBJ-AT ?auto_169 ?auto_171 ) ( TRUCK-AT ?auto_173 ?auto_170 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_173 ?auto_170 ?auto_171 ?auto_172 )
      ( DELIVER-1PKG ?auto_169 ?auto_170 )
      ( DELIVER-1PKG-VERIFY ?auto_169 ?auto_170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177 - OBJ
      ?auto_179 - OBJ
      ?auto_178 - LOCATION
    )
    :vars
    (
      ?auto_180 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_179 ?auto_177 ) ( TRUCK-AT ?auto_180 ?auto_178 ) ( IN-TRUCK ?auto_179 ?auto_180 ) ( OBJ-AT ?auto_177 ?auto_178 ) ( not ( = ?auto_177 ?auto_179 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179 ?auto_178 )
      ( DELIVER-2PKG-VERIFY ?auto_177 ?auto_179 ?auto_178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_184 - OBJ
      ?auto_186 - OBJ
      ?auto_185 - LOCATION
    )
    :vars
    (
      ?auto_189 - TRUCK
      ?auto_188 - LOCATION
      ?auto_187 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_186 ?auto_184 ) ( IN-TRUCK ?auto_186 ?auto_189 ) ( TRUCK-AT ?auto_189 ?auto_188 ) ( IN-CITY ?auto_188 ?auto_187 ) ( IN-CITY ?auto_185 ?auto_187 ) ( not ( = ?auto_185 ?auto_188 ) ) ( OBJ-AT ?auto_184 ?auto_185 ) ( not ( = ?auto_184 ?auto_186 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_186 ?auto_185 )
      ( DELIVER-2PKG-VERIFY ?auto_184 ?auto_186 ?auto_185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_193 - OBJ
      ?auto_195 - OBJ
      ?auto_194 - LOCATION
    )
    :vars
    (
      ?auto_198 - TRUCK
      ?auto_196 - LOCATION
      ?auto_197 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_195 ?auto_193 ) ( TRUCK-AT ?auto_198 ?auto_196 ) ( IN-CITY ?auto_196 ?auto_197 ) ( IN-CITY ?auto_194 ?auto_197 ) ( not ( = ?auto_194 ?auto_196 ) ) ( OBJ-AT ?auto_195 ?auto_196 ) ( OBJ-AT ?auto_193 ?auto_194 ) ( not ( = ?auto_193 ?auto_195 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_195 ?auto_194 )
      ( DELIVER-2PKG-VERIFY ?auto_193 ?auto_195 ?auto_194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_202 - OBJ
      ?auto_204 - OBJ
      ?auto_203 - LOCATION
    )
    :vars
    (
      ?auto_206 - LOCATION
      ?auto_205 - CITY
      ?auto_207 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_204 ?auto_202 ) ( IN-CITY ?auto_206 ?auto_205 ) ( IN-CITY ?auto_203 ?auto_205 ) ( not ( = ?auto_203 ?auto_206 ) ) ( OBJ-AT ?auto_204 ?auto_206 ) ( TRUCK-AT ?auto_207 ?auto_203 ) ( OBJ-AT ?auto_202 ?auto_203 ) ( not ( = ?auto_202 ?auto_204 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_204 ?auto_203 )
      ( DELIVER-2PKG-VERIFY ?auto_202 ?auto_204 ?auto_203 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_211 - OBJ
      ?auto_213 - OBJ
      ?auto_212 - LOCATION
    )
    :vars
    (
      ?auto_216 - LOCATION
      ?auto_215 - CITY
      ?auto_214 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_213 ?auto_211 ) ( IN-CITY ?auto_216 ?auto_215 ) ( IN-CITY ?auto_212 ?auto_215 ) ( not ( = ?auto_212 ?auto_216 ) ) ( OBJ-AT ?auto_213 ?auto_216 ) ( TRUCK-AT ?auto_214 ?auto_212 ) ( not ( = ?auto_211 ?auto_213 ) ) ( IN-TRUCK ?auto_211 ?auto_214 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_211 ?auto_212 )
      ( DELIVER-2PKG ?auto_211 ?auto_213 ?auto_212 )
      ( DELIVER-2PKG-VERIFY ?auto_211 ?auto_213 ?auto_212 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_220 - OBJ
      ?auto_222 - OBJ
      ?auto_221 - LOCATION
    )
    :vars
    (
      ?auto_223 - LOCATION
      ?auto_225 - CITY
      ?auto_224 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_222 ?auto_220 ) ( IN-CITY ?auto_223 ?auto_225 ) ( IN-CITY ?auto_221 ?auto_225 ) ( not ( = ?auto_221 ?auto_223 ) ) ( OBJ-AT ?auto_222 ?auto_223 ) ( not ( = ?auto_220 ?auto_222 ) ) ( IN-TRUCK ?auto_220 ?auto_224 ) ( TRUCK-AT ?auto_224 ?auto_223 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_224 ?auto_223 ?auto_221 ?auto_225 )
      ( DELIVER-2PKG ?auto_220 ?auto_222 ?auto_221 )
      ( DELIVER-2PKG-VERIFY ?auto_220 ?auto_222 ?auto_221 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_229 - OBJ
      ?auto_231 - OBJ
      ?auto_230 - LOCATION
    )
    :vars
    (
      ?auto_232 - LOCATION
      ?auto_234 - CITY
      ?auto_233 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_231 ?auto_229 ) ( IN-CITY ?auto_232 ?auto_234 ) ( IN-CITY ?auto_230 ?auto_234 ) ( not ( = ?auto_230 ?auto_232 ) ) ( OBJ-AT ?auto_231 ?auto_232 ) ( not ( = ?auto_229 ?auto_231 ) ) ( TRUCK-AT ?auto_233 ?auto_232 ) ( OBJ-AT ?auto_229 ?auto_232 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_229 ?auto_233 ?auto_232 )
      ( DELIVER-2PKG ?auto_229 ?auto_231 ?auto_230 )
      ( DELIVER-2PKG-VERIFY ?auto_229 ?auto_231 ?auto_230 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_238 - OBJ
      ?auto_240 - OBJ
      ?auto_239 - LOCATION
    )
    :vars
    (
      ?auto_241 - LOCATION
      ?auto_242 - CITY
      ?auto_243 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_240 ?auto_238 ) ( IN-CITY ?auto_241 ?auto_242 ) ( IN-CITY ?auto_239 ?auto_242 ) ( not ( = ?auto_239 ?auto_241 ) ) ( OBJ-AT ?auto_240 ?auto_241 ) ( not ( = ?auto_238 ?auto_240 ) ) ( OBJ-AT ?auto_238 ?auto_241 ) ( TRUCK-AT ?auto_243 ?auto_239 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_243 ?auto_239 ?auto_241 ?auto_242 )
      ( DELIVER-2PKG ?auto_238 ?auto_240 ?auto_239 )
      ( DELIVER-2PKG-VERIFY ?auto_238 ?auto_240 ?auto_239 ) )
  )

)

