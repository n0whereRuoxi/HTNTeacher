( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6 - PERSON
      ?auto_5 - CITY
    )
    :vars
    (
      ?auto_7 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6 ?auto_7 ) ( AIRCRAFT-AT ?auto_7 ?auto_5 ) )
    :subtasks
    ( ( !DEBARK ?auto_6 ?auto_7 ?auto_5 )
      ( FLY-1PPL-VERIFY ?auto_6 ?auto_5 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13 - PERSON
      ?auto_12 - CITY
    )
    :vars
    (
      ?auto_14 - AIRCRAFT
      ?auto_17 - CITY
      ?auto_15 - FLEVEL
      ?auto_16 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_13 ?auto_14 ) ( AIRCRAFT-AT ?auto_14 ?auto_17 ) ( FUEL-LEVEL ?auto_14 ?auto_15 ) ( NEXT ?auto_16 ?auto_15 ) ( not ( = ?auto_12 ?auto_17 ) ) ( not ( = ?auto_15 ?auto_16 ) ) )
    :subtasks
    ( ( !FLY ?auto_14 ?auto_17 ?auto_12 ?auto_15 ?auto_16 )
      ( FLY-1PPL ?auto_13 ?auto_12 )
      ( FLY-1PPL-VERIFY ?auto_13 ?auto_12 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_26 - PERSON
      ?auto_25 - CITY
    )
    :vars
    (
      ?auto_27 - AIRCRAFT
      ?auto_29 - CITY
      ?auto_28 - FLEVEL
      ?auto_30 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_27 ?auto_29 ) ( FUEL-LEVEL ?auto_27 ?auto_28 ) ( NEXT ?auto_30 ?auto_28 ) ( not ( = ?auto_25 ?auto_29 ) ) ( not ( = ?auto_28 ?auto_30 ) ) ( PERSON-AT ?auto_26 ?auto_29 ) )
    :subtasks
    ( ( !BOARD ?auto_26 ?auto_27 ?auto_29 )
      ( FLY-1PPL ?auto_26 ?auto_25 )
      ( FLY-1PPL-VERIFY ?auto_26 ?auto_25 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_39 - PERSON
      ?auto_38 - CITY
    )
    :vars
    (
      ?auto_40 - AIRCRAFT
      ?auto_41 - CITY
      ?auto_42 - FLEVEL
      ?auto_43 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_40 ?auto_41 ) ( NEXT ?auto_42 ?auto_43 ) ( not ( = ?auto_38 ?auto_41 ) ) ( not ( = ?auto_43 ?auto_42 ) ) ( PERSON-AT ?auto_39 ?auto_41 ) ( FUEL-LEVEL ?auto_40 ?auto_42 ) )
    :subtasks
    ( ( !REFUEL ?auto_40 ?auto_41 ?auto_42 ?auto_43 )
      ( FLY-1PPL ?auto_39 ?auto_38 )
      ( FLY-1PPL-VERIFY ?auto_39 ?auto_38 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_52 - PERSON
      ?auto_51 - CITY
    )
    :vars
    (
      ?auto_55 - FLEVEL
      ?auto_56 - FLEVEL
      ?auto_54 - CITY
      ?auto_53 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_55 ?auto_56 ) ( not ( = ?auto_51 ?auto_54 ) ) ( not ( = ?auto_56 ?auto_55 ) ) ( PERSON-AT ?auto_52 ?auto_54 ) ( AIRCRAFT-AT ?auto_53 ?auto_51 ) ( FUEL-LEVEL ?auto_53 ?auto_56 ) )
    :subtasks
    ( ( !FLY ?auto_53 ?auto_51 ?auto_54 ?auto_56 ?auto_55 )
      ( FLY-1PPL ?auto_52 ?auto_51 )
      ( FLY-1PPL-VERIFY ?auto_52 ?auto_51 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_65 - PERSON
      ?auto_64 - CITY
    )
    :vars
    (
      ?auto_69 - FLEVEL
      ?auto_68 - FLEVEL
      ?auto_67 - CITY
      ?auto_66 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_69 ?auto_68 ) ( not ( = ?auto_64 ?auto_67 ) ) ( not ( = ?auto_68 ?auto_69 ) ) ( PERSON-AT ?auto_65 ?auto_67 ) ( AIRCRAFT-AT ?auto_66 ?auto_64 ) ( FUEL-LEVEL ?auto_66 ?auto_69 ) )
    :subtasks
    ( ( !REFUEL ?auto_66 ?auto_64 ?auto_69 ?auto_68 )
      ( FLY-1PPL ?auto_65 ?auto_64 )
      ( FLY-1PPL-VERIFY ?auto_65 ?auto_64 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_92 - PERSON
      ?auto_93 - PERSON
      ?auto_91 - CITY
    )
    :vars
    (
      ?auto_94 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_93 ?auto_94 ) ( AIRCRAFT-AT ?auto_94 ?auto_91 ) ( PERSON-AT ?auto_92 ?auto_91 ) ( not ( = ?auto_92 ?auto_93 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_93 ?auto_91 )
      ( FLY-2PPL-VERIFY ?auto_92 ?auto_93 ?auto_91 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_96 - PERSON
      ?auto_97 - PERSON
      ?auto_95 - CITY
    )
    :vars
    (
      ?auto_98 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_96 ?auto_98 ) ( AIRCRAFT-AT ?auto_98 ?auto_95 ) ( PERSON-AT ?auto_97 ?auto_95 ) ( not ( = ?auto_96 ?auto_97 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_96 ?auto_95 )
      ( FLY-2PPL-VERIFY ?auto_96 ?auto_97 ?auto_95 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_110 - PERSON
      ?auto_111 - PERSON
      ?auto_109 - CITY
    )
    :vars
    (
      ?auto_112 - AIRCRAFT
      ?auto_114 - CITY
      ?auto_113 - FLEVEL
      ?auto_115 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_111 ?auto_112 ) ( AIRCRAFT-AT ?auto_112 ?auto_114 ) ( FUEL-LEVEL ?auto_112 ?auto_113 ) ( NEXT ?auto_115 ?auto_113 ) ( not ( = ?auto_109 ?auto_114 ) ) ( not ( = ?auto_113 ?auto_115 ) ) ( PERSON-AT ?auto_110 ?auto_109 ) ( not ( = ?auto_110 ?auto_111 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_111 ?auto_109 )
      ( FLY-2PPL-VERIFY ?auto_110 ?auto_111 ?auto_109 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_117 - PERSON
      ?auto_118 - PERSON
      ?auto_116 - CITY
    )
    :vars
    (
      ?auto_119 - AIRCRAFT
      ?auto_122 - CITY
      ?auto_120 - FLEVEL
      ?auto_121 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_117 ?auto_119 ) ( AIRCRAFT-AT ?auto_119 ?auto_122 ) ( FUEL-LEVEL ?auto_119 ?auto_120 ) ( NEXT ?auto_121 ?auto_120 ) ( not ( = ?auto_116 ?auto_122 ) ) ( not ( = ?auto_120 ?auto_121 ) ) ( PERSON-AT ?auto_118 ?auto_116 ) ( not ( = ?auto_118 ?auto_117 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_118 ?auto_117 ?auto_116 )
      ( FLY-2PPL-VERIFY ?auto_117 ?auto_118 ?auto_116 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_132 - PERSON
      ?auto_131 - CITY
    )
    :vars
    (
      ?auto_133 - AIRCRAFT
      ?auto_137 - CITY
      ?auto_134 - FLEVEL
      ?auto_135 - FLEVEL
      ?auto_136 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_133 ?auto_137 ) ( FUEL-LEVEL ?auto_133 ?auto_134 ) ( NEXT ?auto_135 ?auto_134 ) ( not ( = ?auto_131 ?auto_137 ) ) ( not ( = ?auto_134 ?auto_135 ) ) ( PERSON-AT ?auto_136 ?auto_131 ) ( not ( = ?auto_136 ?auto_132 ) ) ( PERSON-AT ?auto_132 ?auto_137 ) )
    :subtasks
    ( ( !BOARD ?auto_132 ?auto_133 ?auto_137 )
      ( FLY-2PPL ?auto_136 ?auto_132 ?auto_131 )
      ( FLY-1PPL-VERIFY ?auto_132 ?auto_131 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_139 - PERSON
      ?auto_140 - PERSON
      ?auto_138 - CITY
    )
    :vars
    (
      ?auto_142 - AIRCRAFT
      ?auto_144 - CITY
      ?auto_143 - FLEVEL
      ?auto_141 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_142 ?auto_144 ) ( FUEL-LEVEL ?auto_142 ?auto_143 ) ( NEXT ?auto_141 ?auto_143 ) ( not ( = ?auto_138 ?auto_144 ) ) ( not ( = ?auto_143 ?auto_141 ) ) ( PERSON-AT ?auto_139 ?auto_138 ) ( not ( = ?auto_139 ?auto_140 ) ) ( PERSON-AT ?auto_140 ?auto_144 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_140 ?auto_138 )
      ( FLY-2PPL-VERIFY ?auto_139 ?auto_140 ?auto_138 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_146 - PERSON
      ?auto_147 - PERSON
      ?auto_145 - CITY
    )
    :vars
    (
      ?auto_149 - AIRCRAFT
      ?auto_150 - CITY
      ?auto_148 - FLEVEL
      ?auto_151 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_149 ?auto_150 ) ( FUEL-LEVEL ?auto_149 ?auto_148 ) ( NEXT ?auto_151 ?auto_148 ) ( not ( = ?auto_145 ?auto_150 ) ) ( not ( = ?auto_148 ?auto_151 ) ) ( PERSON-AT ?auto_147 ?auto_145 ) ( not ( = ?auto_147 ?auto_146 ) ) ( PERSON-AT ?auto_146 ?auto_150 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_147 ?auto_146 ?auto_145 )
      ( FLY-2PPL-VERIFY ?auto_146 ?auto_147 ?auto_145 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_161 - PERSON
      ?auto_160 - CITY
    )
    :vars
    (
      ?auto_163 - AIRCRAFT
      ?auto_164 - CITY
      ?auto_165 - FLEVEL
      ?auto_162 - FLEVEL
      ?auto_166 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_163 ?auto_164 ) ( NEXT ?auto_165 ?auto_162 ) ( not ( = ?auto_160 ?auto_164 ) ) ( not ( = ?auto_162 ?auto_165 ) ) ( PERSON-AT ?auto_166 ?auto_160 ) ( not ( = ?auto_166 ?auto_161 ) ) ( PERSON-AT ?auto_161 ?auto_164 ) ( FUEL-LEVEL ?auto_163 ?auto_165 ) )
    :subtasks
    ( ( !REFUEL ?auto_163 ?auto_164 ?auto_165 ?auto_162 )
      ( FLY-2PPL ?auto_166 ?auto_161 ?auto_160 )
      ( FLY-1PPL-VERIFY ?auto_161 ?auto_160 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_168 - PERSON
      ?auto_169 - PERSON
      ?auto_167 - CITY
    )
    :vars
    (
      ?auto_172 - AIRCRAFT
      ?auto_173 - CITY
      ?auto_171 - FLEVEL
      ?auto_170 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_172 ?auto_173 ) ( NEXT ?auto_171 ?auto_170 ) ( not ( = ?auto_167 ?auto_173 ) ) ( not ( = ?auto_170 ?auto_171 ) ) ( PERSON-AT ?auto_168 ?auto_167 ) ( not ( = ?auto_168 ?auto_169 ) ) ( PERSON-AT ?auto_169 ?auto_173 ) ( FUEL-LEVEL ?auto_172 ?auto_171 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_169 ?auto_167 )
      ( FLY-2PPL-VERIFY ?auto_168 ?auto_169 ?auto_167 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_175 - PERSON
      ?auto_176 - PERSON
      ?auto_174 - CITY
    )
    :vars
    (
      ?auto_178 - AIRCRAFT
      ?auto_180 - CITY
      ?auto_177 - FLEVEL
      ?auto_179 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_178 ?auto_180 ) ( NEXT ?auto_177 ?auto_179 ) ( not ( = ?auto_174 ?auto_180 ) ) ( not ( = ?auto_179 ?auto_177 ) ) ( PERSON-AT ?auto_176 ?auto_174 ) ( not ( = ?auto_176 ?auto_175 ) ) ( PERSON-AT ?auto_175 ?auto_180 ) ( FUEL-LEVEL ?auto_178 ?auto_177 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_176 ?auto_175 ?auto_174 )
      ( FLY-2PPL-VERIFY ?auto_175 ?auto_176 ?auto_174 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_190 - PERSON
      ?auto_189 - CITY
    )
    :vars
    (
      ?auto_191 - FLEVEL
      ?auto_193 - FLEVEL
      ?auto_194 - CITY
      ?auto_195 - PERSON
      ?auto_192 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_191 ?auto_193 ) ( not ( = ?auto_189 ?auto_194 ) ) ( not ( = ?auto_193 ?auto_191 ) ) ( PERSON-AT ?auto_195 ?auto_189 ) ( not ( = ?auto_195 ?auto_190 ) ) ( PERSON-AT ?auto_190 ?auto_194 ) ( AIRCRAFT-AT ?auto_192 ?auto_189 ) ( FUEL-LEVEL ?auto_192 ?auto_193 ) )
    :subtasks
    ( ( !FLY ?auto_192 ?auto_189 ?auto_194 ?auto_193 ?auto_191 )
      ( FLY-2PPL ?auto_195 ?auto_190 ?auto_189 )
      ( FLY-1PPL-VERIFY ?auto_190 ?auto_189 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_197 - PERSON
      ?auto_198 - PERSON
      ?auto_196 - CITY
    )
    :vars
    (
      ?auto_201 - FLEVEL
      ?auto_199 - FLEVEL
      ?auto_202 - CITY
      ?auto_200 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_201 ?auto_199 ) ( not ( = ?auto_196 ?auto_202 ) ) ( not ( = ?auto_199 ?auto_201 ) ) ( PERSON-AT ?auto_197 ?auto_196 ) ( not ( = ?auto_197 ?auto_198 ) ) ( PERSON-AT ?auto_198 ?auto_202 ) ( AIRCRAFT-AT ?auto_200 ?auto_196 ) ( FUEL-LEVEL ?auto_200 ?auto_199 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_198 ?auto_196 )
      ( FLY-2PPL-VERIFY ?auto_197 ?auto_198 ?auto_196 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_204 - PERSON
      ?auto_205 - PERSON
      ?auto_203 - CITY
    )
    :vars
    (
      ?auto_208 - FLEVEL
      ?auto_209 - FLEVEL
      ?auto_206 - CITY
      ?auto_207 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_208 ?auto_209 ) ( not ( = ?auto_203 ?auto_206 ) ) ( not ( = ?auto_209 ?auto_208 ) ) ( PERSON-AT ?auto_205 ?auto_203 ) ( not ( = ?auto_205 ?auto_204 ) ) ( PERSON-AT ?auto_204 ?auto_206 ) ( AIRCRAFT-AT ?auto_207 ?auto_203 ) ( FUEL-LEVEL ?auto_207 ?auto_209 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_205 ?auto_204 ?auto_203 )
      ( FLY-2PPL-VERIFY ?auto_204 ?auto_205 ?auto_203 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_219 - PERSON
      ?auto_218 - CITY
    )
    :vars
    (
      ?auto_222 - FLEVEL
      ?auto_224 - FLEVEL
      ?auto_220 - CITY
      ?auto_223 - PERSON
      ?auto_221 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_222 ?auto_224 ) ( not ( = ?auto_218 ?auto_220 ) ) ( not ( = ?auto_224 ?auto_222 ) ) ( PERSON-AT ?auto_223 ?auto_218 ) ( not ( = ?auto_223 ?auto_219 ) ) ( PERSON-AT ?auto_219 ?auto_220 ) ( AIRCRAFT-AT ?auto_221 ?auto_218 ) ( FUEL-LEVEL ?auto_221 ?auto_222 ) )
    :subtasks
    ( ( !REFUEL ?auto_221 ?auto_218 ?auto_222 ?auto_224 )
      ( FLY-2PPL ?auto_223 ?auto_219 ?auto_218 )
      ( FLY-1PPL-VERIFY ?auto_219 ?auto_218 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_226 - PERSON
      ?auto_227 - PERSON
      ?auto_225 - CITY
    )
    :vars
    (
      ?auto_228 - FLEVEL
      ?auto_229 - FLEVEL
      ?auto_231 - CITY
      ?auto_230 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_228 ?auto_229 ) ( not ( = ?auto_225 ?auto_231 ) ) ( not ( = ?auto_229 ?auto_228 ) ) ( PERSON-AT ?auto_226 ?auto_225 ) ( not ( = ?auto_226 ?auto_227 ) ) ( PERSON-AT ?auto_227 ?auto_231 ) ( AIRCRAFT-AT ?auto_230 ?auto_225 ) ( FUEL-LEVEL ?auto_230 ?auto_228 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_227 ?auto_225 )
      ( FLY-2PPL-VERIFY ?auto_226 ?auto_227 ?auto_225 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_233 - PERSON
      ?auto_234 - PERSON
      ?auto_232 - CITY
    )
    :vars
    (
      ?auto_236 - FLEVEL
      ?auto_238 - FLEVEL
      ?auto_235 - CITY
      ?auto_237 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_236 ?auto_238 ) ( not ( = ?auto_232 ?auto_235 ) ) ( not ( = ?auto_238 ?auto_236 ) ) ( PERSON-AT ?auto_234 ?auto_232 ) ( not ( = ?auto_234 ?auto_233 ) ) ( PERSON-AT ?auto_233 ?auto_235 ) ( AIRCRAFT-AT ?auto_237 ?auto_232 ) ( FUEL-LEVEL ?auto_237 ?auto_236 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_234 ?auto_233 ?auto_232 )
      ( FLY-2PPL-VERIFY ?auto_233 ?auto_234 ?auto_232 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_248 - PERSON
      ?auto_247 - CITY
    )
    :vars
    (
      ?auto_251 - FLEVEL
      ?auto_253 - FLEVEL
      ?auto_250 - CITY
      ?auto_249 - PERSON
      ?auto_252 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_251 ?auto_253 ) ( not ( = ?auto_247 ?auto_250 ) ) ( not ( = ?auto_253 ?auto_251 ) ) ( not ( = ?auto_249 ?auto_248 ) ) ( PERSON-AT ?auto_248 ?auto_250 ) ( AIRCRAFT-AT ?auto_252 ?auto_247 ) ( FUEL-LEVEL ?auto_252 ?auto_251 ) ( IN ?auto_249 ?auto_252 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_249 ?auto_247 )
      ( FLY-2PPL ?auto_249 ?auto_248 ?auto_247 )
      ( FLY-1PPL-VERIFY ?auto_248 ?auto_247 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_255 - PERSON
      ?auto_256 - PERSON
      ?auto_254 - CITY
    )
    :vars
    (
      ?auto_257 - FLEVEL
      ?auto_259 - FLEVEL
      ?auto_260 - CITY
      ?auto_258 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_257 ?auto_259 ) ( not ( = ?auto_254 ?auto_260 ) ) ( not ( = ?auto_259 ?auto_257 ) ) ( not ( = ?auto_255 ?auto_256 ) ) ( PERSON-AT ?auto_256 ?auto_260 ) ( AIRCRAFT-AT ?auto_258 ?auto_254 ) ( FUEL-LEVEL ?auto_258 ?auto_257 ) ( IN ?auto_255 ?auto_258 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_256 ?auto_254 )
      ( FLY-2PPL-VERIFY ?auto_255 ?auto_256 ?auto_254 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_262 - PERSON
      ?auto_263 - PERSON
      ?auto_261 - CITY
    )
    :vars
    (
      ?auto_264 - FLEVEL
      ?auto_266 - FLEVEL
      ?auto_267 - CITY
      ?auto_265 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_264 ?auto_266 ) ( not ( = ?auto_261 ?auto_267 ) ) ( not ( = ?auto_266 ?auto_264 ) ) ( not ( = ?auto_263 ?auto_262 ) ) ( PERSON-AT ?auto_262 ?auto_267 ) ( AIRCRAFT-AT ?auto_265 ?auto_261 ) ( FUEL-LEVEL ?auto_265 ?auto_264 ) ( IN ?auto_263 ?auto_265 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_263 ?auto_262 ?auto_261 )
      ( FLY-2PPL-VERIFY ?auto_262 ?auto_263 ?auto_261 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_277 - PERSON
      ?auto_276 - CITY
    )
    :vars
    (
      ?auto_278 - FLEVEL
      ?auto_281 - FLEVEL
      ?auto_282 - CITY
      ?auto_280 - PERSON
      ?auto_279 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_278 ?auto_281 ) ( not ( = ?auto_276 ?auto_282 ) ) ( not ( = ?auto_281 ?auto_278 ) ) ( not ( = ?auto_280 ?auto_277 ) ) ( PERSON-AT ?auto_277 ?auto_282 ) ( IN ?auto_280 ?auto_279 ) ( AIRCRAFT-AT ?auto_279 ?auto_282 ) ( FUEL-LEVEL ?auto_279 ?auto_281 ) )
    :subtasks
    ( ( !FLY ?auto_279 ?auto_282 ?auto_276 ?auto_281 ?auto_278 )
      ( FLY-2PPL ?auto_280 ?auto_277 ?auto_276 )
      ( FLY-1PPL-VERIFY ?auto_277 ?auto_276 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_284 - PERSON
      ?auto_285 - PERSON
      ?auto_283 - CITY
    )
    :vars
    (
      ?auto_287 - FLEVEL
      ?auto_288 - FLEVEL
      ?auto_286 - CITY
      ?auto_289 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_287 ?auto_288 ) ( not ( = ?auto_283 ?auto_286 ) ) ( not ( = ?auto_288 ?auto_287 ) ) ( not ( = ?auto_284 ?auto_285 ) ) ( PERSON-AT ?auto_285 ?auto_286 ) ( IN ?auto_284 ?auto_289 ) ( AIRCRAFT-AT ?auto_289 ?auto_286 ) ( FUEL-LEVEL ?auto_289 ?auto_288 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_285 ?auto_283 )
      ( FLY-2PPL-VERIFY ?auto_284 ?auto_285 ?auto_283 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_291 - PERSON
      ?auto_292 - PERSON
      ?auto_290 - CITY
    )
    :vars
    (
      ?auto_293 - FLEVEL
      ?auto_296 - FLEVEL
      ?auto_294 - CITY
      ?auto_295 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_293 ?auto_296 ) ( not ( = ?auto_290 ?auto_294 ) ) ( not ( = ?auto_296 ?auto_293 ) ) ( not ( = ?auto_292 ?auto_291 ) ) ( PERSON-AT ?auto_291 ?auto_294 ) ( IN ?auto_292 ?auto_295 ) ( AIRCRAFT-AT ?auto_295 ?auto_294 ) ( FUEL-LEVEL ?auto_295 ?auto_296 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_292 ?auto_291 ?auto_290 )
      ( FLY-2PPL-VERIFY ?auto_291 ?auto_292 ?auto_290 ) )
  )

)

