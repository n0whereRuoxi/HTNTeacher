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
      ?auto_41 - AIRCRAFT
      ?auto_40 - CITY
      ?auto_43 - FLEVEL
      ?auto_42 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_41 ?auto_40 ) ( NEXT ?auto_43 ?auto_42 ) ( not ( = ?auto_38 ?auto_40 ) ) ( not ( = ?auto_42 ?auto_43 ) ) ( PERSON-AT ?auto_39 ?auto_40 ) ( FUEL-LEVEL ?auto_41 ?auto_43 ) )
    :subtasks
    ( ( !REFUEL ?auto_41 ?auto_40 ?auto_43 ?auto_42 )
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
      ?auto_56 - FLEVEL
      ?auto_53 - FLEVEL
      ?auto_55 - CITY
      ?auto_54 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_56 ?auto_53 ) ( not ( = ?auto_51 ?auto_55 ) ) ( not ( = ?auto_53 ?auto_56 ) ) ( PERSON-AT ?auto_52 ?auto_55 ) ( AIRCRAFT-AT ?auto_54 ?auto_51 ) ( FUEL-LEVEL ?auto_54 ?auto_53 ) )
    :subtasks
    ( ( !FLY ?auto_54 ?auto_51 ?auto_55 ?auto_53 ?auto_56 )
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
      ?auto_66 - FLEVEL
      ?auto_67 - CITY
      ?auto_68 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_69 ?auto_66 ) ( not ( = ?auto_64 ?auto_67 ) ) ( not ( = ?auto_66 ?auto_69 ) ) ( PERSON-AT ?auto_65 ?auto_67 ) ( AIRCRAFT-AT ?auto_68 ?auto_64 ) ( FUEL-LEVEL ?auto_68 ?auto_69 ) )
    :subtasks
    ( ( !REFUEL ?auto_68 ?auto_64 ?auto_69 ?auto_66 )
      ( FLY-1PPL ?auto_65 ?auto_64 )
      ( FLY-1PPL-VERIFY ?auto_65 ?auto_64 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_89 - PERSON
      ?auto_88 - CITY
    )
    :vars
    (
      ?auto_90 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_89 ?auto_90 ) ( AIRCRAFT-AT ?auto_90 ?auto_88 ) )
    :subtasks
    ( ( !DEBARK ?auto_89 ?auto_90 ?auto_88 )
      ( FLY-1PPL-VERIFY ?auto_89 ?auto_88 ) )
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

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_104 - PERSON
      ?auto_103 - CITY
    )
    :vars
    (
      ?auto_105 - AIRCRAFT
      ?auto_108 - CITY
      ?auto_106 - FLEVEL
      ?auto_107 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_104 ?auto_105 ) ( AIRCRAFT-AT ?auto_105 ?auto_108 ) ( FUEL-LEVEL ?auto_105 ?auto_106 ) ( NEXT ?auto_107 ?auto_106 ) ( not ( = ?auto_103 ?auto_108 ) ) ( not ( = ?auto_106 ?auto_107 ) ) )
    :subtasks
    ( ( !FLY ?auto_105 ?auto_108 ?auto_103 ?auto_106 ?auto_107 )
      ( FLY-1PPL ?auto_104 ?auto_103 )
      ( FLY-1PPL-VERIFY ?auto_104 ?auto_103 ) )
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
      ?auto_120 - AIRCRAFT
      ?auto_121 - CITY
      ?auto_119 - FLEVEL
      ?auto_122 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_117 ?auto_120 ) ( AIRCRAFT-AT ?auto_120 ?auto_121 ) ( FUEL-LEVEL ?auto_120 ?auto_119 ) ( NEXT ?auto_122 ?auto_119 ) ( not ( = ?auto_116 ?auto_121 ) ) ( not ( = ?auto_119 ?auto_122 ) ) ( PERSON-AT ?auto_118 ?auto_116 ) ( not ( = ?auto_118 ?auto_117 ) ) )
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
      ?auto_134 - AIRCRAFT
      ?auto_135 - CITY
      ?auto_133 - FLEVEL
      ?auto_136 - FLEVEL
      ?auto_137 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_134 ?auto_135 ) ( FUEL-LEVEL ?auto_134 ?auto_133 ) ( NEXT ?auto_136 ?auto_133 ) ( not ( = ?auto_131 ?auto_135 ) ) ( not ( = ?auto_133 ?auto_136 ) ) ( PERSON-AT ?auto_137 ?auto_131 ) ( not ( = ?auto_137 ?auto_132 ) ) ( PERSON-AT ?auto_132 ?auto_135 ) )
    :subtasks
    ( ( !BOARD ?auto_132 ?auto_134 ?auto_135 )
      ( FLY-2PPL ?auto_137 ?auto_132 ?auto_131 )
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
      ?auto_144 - AIRCRAFT
      ?auto_141 - CITY
      ?auto_142 - FLEVEL
      ?auto_143 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_144 ?auto_141 ) ( FUEL-LEVEL ?auto_144 ?auto_142 ) ( NEXT ?auto_143 ?auto_142 ) ( not ( = ?auto_138 ?auto_141 ) ) ( not ( = ?auto_142 ?auto_143 ) ) ( PERSON-AT ?auto_139 ?auto_138 ) ( not ( = ?auto_139 ?auto_140 ) ) ( PERSON-AT ?auto_140 ?auto_141 ) )
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
      ?auto_151 - AIRCRAFT
      ?auto_149 - CITY
      ?auto_150 - FLEVEL
      ?auto_148 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_151 ?auto_149 ) ( FUEL-LEVEL ?auto_151 ?auto_150 ) ( NEXT ?auto_148 ?auto_150 ) ( not ( = ?auto_145 ?auto_149 ) ) ( not ( = ?auto_150 ?auto_148 ) ) ( PERSON-AT ?auto_147 ?auto_145 ) ( not ( = ?auto_147 ?auto_146 ) ) ( PERSON-AT ?auto_146 ?auto_149 ) )
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
      ?auto_165 - AIRCRAFT
      ?auto_163 - CITY
      ?auto_162 - FLEVEL
      ?auto_164 - FLEVEL
      ?auto_166 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_165 ?auto_163 ) ( NEXT ?auto_162 ?auto_164 ) ( not ( = ?auto_160 ?auto_163 ) ) ( not ( = ?auto_164 ?auto_162 ) ) ( PERSON-AT ?auto_166 ?auto_160 ) ( not ( = ?auto_166 ?auto_161 ) ) ( PERSON-AT ?auto_161 ?auto_163 ) ( FUEL-LEVEL ?auto_165 ?auto_162 ) )
    :subtasks
    ( ( !REFUEL ?auto_165 ?auto_163 ?auto_162 ?auto_164 )
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
      ?auto_173 - AIRCRAFT
      ?auto_172 - CITY
      ?auto_171 - FLEVEL
      ?auto_170 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_173 ?auto_172 ) ( NEXT ?auto_171 ?auto_170 ) ( not ( = ?auto_167 ?auto_172 ) ) ( not ( = ?auto_170 ?auto_171 ) ) ( PERSON-AT ?auto_168 ?auto_167 ) ( not ( = ?auto_168 ?auto_169 ) ) ( PERSON-AT ?auto_169 ?auto_172 ) ( FUEL-LEVEL ?auto_173 ?auto_171 ) )
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
      ?auto_180 - AIRCRAFT
      ?auto_179 - CITY
      ?auto_178 - FLEVEL
      ?auto_177 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_180 ?auto_179 ) ( NEXT ?auto_178 ?auto_177 ) ( not ( = ?auto_174 ?auto_179 ) ) ( not ( = ?auto_177 ?auto_178 ) ) ( PERSON-AT ?auto_176 ?auto_174 ) ( not ( = ?auto_176 ?auto_175 ) ) ( PERSON-AT ?auto_175 ?auto_179 ) ( FUEL-LEVEL ?auto_180 ?auto_178 ) )
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
      ?auto_192 - FLEVEL
      ?auto_191 - FLEVEL
      ?auto_193 - CITY
      ?auto_195 - PERSON
      ?auto_194 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_192 ?auto_191 ) ( not ( = ?auto_189 ?auto_193 ) ) ( not ( = ?auto_191 ?auto_192 ) ) ( PERSON-AT ?auto_195 ?auto_189 ) ( not ( = ?auto_195 ?auto_190 ) ) ( PERSON-AT ?auto_190 ?auto_193 ) ( AIRCRAFT-AT ?auto_194 ?auto_189 ) ( FUEL-LEVEL ?auto_194 ?auto_191 ) )
    :subtasks
    ( ( !FLY ?auto_194 ?auto_189 ?auto_193 ?auto_191 ?auto_192 )
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
      ?auto_200 - FLEVEL
      ?auto_202 - CITY
      ?auto_199 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_201 ?auto_200 ) ( not ( = ?auto_196 ?auto_202 ) ) ( not ( = ?auto_200 ?auto_201 ) ) ( PERSON-AT ?auto_197 ?auto_196 ) ( not ( = ?auto_197 ?auto_198 ) ) ( PERSON-AT ?auto_198 ?auto_202 ) ( AIRCRAFT-AT ?auto_199 ?auto_196 ) ( FUEL-LEVEL ?auto_199 ?auto_200 ) )
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
      ?auto_207 - FLEVEL
      ?auto_208 - FLEVEL
      ?auto_206 - CITY
      ?auto_209 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_207 ?auto_208 ) ( not ( = ?auto_203 ?auto_206 ) ) ( not ( = ?auto_208 ?auto_207 ) ) ( PERSON-AT ?auto_205 ?auto_203 ) ( not ( = ?auto_205 ?auto_204 ) ) ( PERSON-AT ?auto_204 ?auto_206 ) ( AIRCRAFT-AT ?auto_209 ?auto_203 ) ( FUEL-LEVEL ?auto_209 ?auto_208 ) )
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
      ?auto_221 - FLEVEL
      ?auto_222 - FLEVEL
      ?auto_220 - CITY
      ?auto_224 - PERSON
      ?auto_223 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_221 ?auto_222 ) ( not ( = ?auto_218 ?auto_220 ) ) ( not ( = ?auto_222 ?auto_221 ) ) ( PERSON-AT ?auto_224 ?auto_218 ) ( not ( = ?auto_224 ?auto_219 ) ) ( PERSON-AT ?auto_219 ?auto_220 ) ( AIRCRAFT-AT ?auto_223 ?auto_218 ) ( FUEL-LEVEL ?auto_223 ?auto_221 ) )
    :subtasks
    ( ( !REFUEL ?auto_223 ?auto_218 ?auto_221 ?auto_222 )
      ( FLY-2PPL ?auto_224 ?auto_219 ?auto_218 )
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
      ?auto_229 - FLEVEL
      ?auto_230 - FLEVEL
      ?auto_228 - CITY
      ?auto_231 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_229 ?auto_230 ) ( not ( = ?auto_225 ?auto_228 ) ) ( not ( = ?auto_230 ?auto_229 ) ) ( PERSON-AT ?auto_226 ?auto_225 ) ( not ( = ?auto_226 ?auto_227 ) ) ( PERSON-AT ?auto_227 ?auto_228 ) ( AIRCRAFT-AT ?auto_231 ?auto_225 ) ( FUEL-LEVEL ?auto_231 ?auto_229 ) )
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
      ?auto_238 - FLEVEL
      ?auto_235 - FLEVEL
      ?auto_236 - CITY
      ?auto_237 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_238 ?auto_235 ) ( not ( = ?auto_232 ?auto_236 ) ) ( not ( = ?auto_235 ?auto_238 ) ) ( PERSON-AT ?auto_234 ?auto_232 ) ( not ( = ?auto_234 ?auto_233 ) ) ( PERSON-AT ?auto_233 ?auto_236 ) ( AIRCRAFT-AT ?auto_237 ?auto_232 ) ( FUEL-LEVEL ?auto_237 ?auto_238 ) )
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
      ?auto_252 - FLEVEL
      ?auto_249 - FLEVEL
      ?auto_250 - CITY
      ?auto_253 - PERSON
      ?auto_251 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_252 ?auto_249 ) ( not ( = ?auto_247 ?auto_250 ) ) ( not ( = ?auto_249 ?auto_252 ) ) ( not ( = ?auto_253 ?auto_248 ) ) ( PERSON-AT ?auto_248 ?auto_250 ) ( AIRCRAFT-AT ?auto_251 ?auto_247 ) ( FUEL-LEVEL ?auto_251 ?auto_252 ) ( IN ?auto_253 ?auto_251 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_253 ?auto_247 )
      ( FLY-2PPL ?auto_253 ?auto_248 ?auto_247 )
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
      ?auto_260 - FLEVEL
      ?auto_257 - FLEVEL
      ?auto_258 - CITY
      ?auto_259 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_260 ?auto_257 ) ( not ( = ?auto_254 ?auto_258 ) ) ( not ( = ?auto_257 ?auto_260 ) ) ( not ( = ?auto_255 ?auto_256 ) ) ( PERSON-AT ?auto_256 ?auto_258 ) ( AIRCRAFT-AT ?auto_259 ?auto_254 ) ( FUEL-LEVEL ?auto_259 ?auto_260 ) ( IN ?auto_255 ?auto_259 ) )
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
      ?auto_267 - FLEVEL
      ?auto_266 - FLEVEL
      ?auto_265 - CITY
      ?auto_264 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_267 ?auto_266 ) ( not ( = ?auto_261 ?auto_265 ) ) ( not ( = ?auto_266 ?auto_267 ) ) ( not ( = ?auto_263 ?auto_262 ) ) ( PERSON-AT ?auto_262 ?auto_265 ) ( AIRCRAFT-AT ?auto_264 ?auto_261 ) ( FUEL-LEVEL ?auto_264 ?auto_267 ) ( IN ?auto_263 ?auto_264 ) )
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
      ?auto_281 - FLEVEL
      ?auto_280 - FLEVEL
      ?auto_279 - CITY
      ?auto_282 - PERSON
      ?auto_278 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_281 ?auto_280 ) ( not ( = ?auto_276 ?auto_279 ) ) ( not ( = ?auto_280 ?auto_281 ) ) ( not ( = ?auto_282 ?auto_277 ) ) ( PERSON-AT ?auto_277 ?auto_279 ) ( IN ?auto_282 ?auto_278 ) ( AIRCRAFT-AT ?auto_278 ?auto_279 ) ( FUEL-LEVEL ?auto_278 ?auto_280 ) )
    :subtasks
    ( ( !FLY ?auto_278 ?auto_279 ?auto_276 ?auto_280 ?auto_281 )
      ( FLY-2PPL ?auto_282 ?auto_277 ?auto_276 )
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
      ?auto_289 - CITY
      ?auto_286 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_287 ?auto_288 ) ( not ( = ?auto_283 ?auto_289 ) ) ( not ( = ?auto_288 ?auto_287 ) ) ( not ( = ?auto_284 ?auto_285 ) ) ( PERSON-AT ?auto_285 ?auto_289 ) ( IN ?auto_284 ?auto_286 ) ( AIRCRAFT-AT ?auto_286 ?auto_289 ) ( FUEL-LEVEL ?auto_286 ?auto_288 ) )
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
      ?auto_294 - FLEVEL
      ?auto_296 - FLEVEL
      ?auto_293 - CITY
      ?auto_295 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_294 ?auto_296 ) ( not ( = ?auto_290 ?auto_293 ) ) ( not ( = ?auto_296 ?auto_294 ) ) ( not ( = ?auto_292 ?auto_291 ) ) ( PERSON-AT ?auto_291 ?auto_293 ) ( IN ?auto_292 ?auto_295 ) ( AIRCRAFT-AT ?auto_295 ?auto_293 ) ( FUEL-LEVEL ?auto_295 ?auto_296 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_292 ?auto_291 ?auto_290 )
      ( FLY-2PPL-VERIFY ?auto_291 ?auto_292 ?auto_290 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_306 - PERSON
      ?auto_305 - CITY
    )
    :vars
    (
      ?auto_308 - FLEVEL
      ?auto_310 - FLEVEL
      ?auto_307 - CITY
      ?auto_311 - PERSON
      ?auto_309 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_308 ?auto_310 ) ( not ( = ?auto_305 ?auto_307 ) ) ( not ( = ?auto_310 ?auto_308 ) ) ( not ( = ?auto_311 ?auto_306 ) ) ( PERSON-AT ?auto_306 ?auto_307 ) ( AIRCRAFT-AT ?auto_309 ?auto_307 ) ( FUEL-LEVEL ?auto_309 ?auto_310 ) ( PERSON-AT ?auto_311 ?auto_307 ) )
    :subtasks
    ( ( !BOARD ?auto_311 ?auto_309 ?auto_307 )
      ( FLY-2PPL ?auto_311 ?auto_306 ?auto_305 )
      ( FLY-1PPL-VERIFY ?auto_306 ?auto_305 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_313 - PERSON
      ?auto_314 - PERSON
      ?auto_312 - CITY
    )
    :vars
    (
      ?auto_316 - FLEVEL
      ?auto_318 - FLEVEL
      ?auto_315 - CITY
      ?auto_317 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_316 ?auto_318 ) ( not ( = ?auto_312 ?auto_315 ) ) ( not ( = ?auto_318 ?auto_316 ) ) ( not ( = ?auto_313 ?auto_314 ) ) ( PERSON-AT ?auto_314 ?auto_315 ) ( AIRCRAFT-AT ?auto_317 ?auto_315 ) ( FUEL-LEVEL ?auto_317 ?auto_318 ) ( PERSON-AT ?auto_313 ?auto_315 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_314 ?auto_312 )
      ( FLY-2PPL-VERIFY ?auto_313 ?auto_314 ?auto_312 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_320 - PERSON
      ?auto_321 - PERSON
      ?auto_319 - CITY
    )
    :vars
    (
      ?auto_322 - FLEVEL
      ?auto_323 - FLEVEL
      ?auto_325 - CITY
      ?auto_324 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_322 ?auto_323 ) ( not ( = ?auto_319 ?auto_325 ) ) ( not ( = ?auto_323 ?auto_322 ) ) ( not ( = ?auto_321 ?auto_320 ) ) ( PERSON-AT ?auto_320 ?auto_325 ) ( AIRCRAFT-AT ?auto_324 ?auto_325 ) ( FUEL-LEVEL ?auto_324 ?auto_323 ) ( PERSON-AT ?auto_321 ?auto_325 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_321 ?auto_320 ?auto_319 )
      ( FLY-2PPL-VERIFY ?auto_320 ?auto_321 ?auto_319 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_335 - PERSON
      ?auto_334 - CITY
    )
    :vars
    (
      ?auto_336 - FLEVEL
      ?auto_337 - FLEVEL
      ?auto_339 - CITY
      ?auto_340 - PERSON
      ?auto_338 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_336 ?auto_337 ) ( not ( = ?auto_334 ?auto_339 ) ) ( not ( = ?auto_337 ?auto_336 ) ) ( not ( = ?auto_340 ?auto_335 ) ) ( PERSON-AT ?auto_335 ?auto_339 ) ( AIRCRAFT-AT ?auto_338 ?auto_339 ) ( PERSON-AT ?auto_340 ?auto_339 ) ( FUEL-LEVEL ?auto_338 ?auto_336 ) )
    :subtasks
    ( ( !REFUEL ?auto_338 ?auto_339 ?auto_336 ?auto_337 )
      ( FLY-2PPL ?auto_340 ?auto_335 ?auto_334 )
      ( FLY-1PPL-VERIFY ?auto_335 ?auto_334 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_342 - PERSON
      ?auto_343 - PERSON
      ?auto_341 - CITY
    )
    :vars
    (
      ?auto_346 - FLEVEL
      ?auto_344 - FLEVEL
      ?auto_347 - CITY
      ?auto_345 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_346 ?auto_344 ) ( not ( = ?auto_341 ?auto_347 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( not ( = ?auto_342 ?auto_343 ) ) ( PERSON-AT ?auto_343 ?auto_347 ) ( AIRCRAFT-AT ?auto_345 ?auto_347 ) ( PERSON-AT ?auto_342 ?auto_347 ) ( FUEL-LEVEL ?auto_345 ?auto_346 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_343 ?auto_341 )
      ( FLY-2PPL-VERIFY ?auto_342 ?auto_343 ?auto_341 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_349 - PERSON
      ?auto_350 - PERSON
      ?auto_348 - CITY
    )
    :vars
    (
      ?auto_353 - FLEVEL
      ?auto_354 - FLEVEL
      ?auto_351 - CITY
      ?auto_352 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_353 ?auto_354 ) ( not ( = ?auto_348 ?auto_351 ) ) ( not ( = ?auto_354 ?auto_353 ) ) ( not ( = ?auto_350 ?auto_349 ) ) ( PERSON-AT ?auto_349 ?auto_351 ) ( AIRCRAFT-AT ?auto_352 ?auto_351 ) ( PERSON-AT ?auto_350 ?auto_351 ) ( FUEL-LEVEL ?auto_352 ?auto_353 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_350 ?auto_349 ?auto_348 )
      ( FLY-2PPL-VERIFY ?auto_349 ?auto_350 ?auto_348 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_364 - PERSON
      ?auto_363 - CITY
    )
    :vars
    (
      ?auto_367 - FLEVEL
      ?auto_368 - FLEVEL
      ?auto_365 - CITY
      ?auto_369 - PERSON
      ?auto_366 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_367 ?auto_368 ) ( not ( = ?auto_363 ?auto_365 ) ) ( not ( = ?auto_368 ?auto_367 ) ) ( not ( = ?auto_369 ?auto_364 ) ) ( PERSON-AT ?auto_364 ?auto_365 ) ( PERSON-AT ?auto_369 ?auto_365 ) ( AIRCRAFT-AT ?auto_366 ?auto_363 ) ( FUEL-LEVEL ?auto_366 ?auto_368 ) )
    :subtasks
    ( ( !FLY ?auto_366 ?auto_363 ?auto_365 ?auto_368 ?auto_367 )
      ( FLY-2PPL ?auto_369 ?auto_364 ?auto_363 )
      ( FLY-1PPL-VERIFY ?auto_364 ?auto_363 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_371 - PERSON
      ?auto_372 - PERSON
      ?auto_370 - CITY
    )
    :vars
    (
      ?auto_373 - FLEVEL
      ?auto_374 - FLEVEL
      ?auto_376 - CITY
      ?auto_375 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_373 ?auto_374 ) ( not ( = ?auto_370 ?auto_376 ) ) ( not ( = ?auto_374 ?auto_373 ) ) ( not ( = ?auto_371 ?auto_372 ) ) ( PERSON-AT ?auto_372 ?auto_376 ) ( PERSON-AT ?auto_371 ?auto_376 ) ( AIRCRAFT-AT ?auto_375 ?auto_370 ) ( FUEL-LEVEL ?auto_375 ?auto_374 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_372 ?auto_370 )
      ( FLY-2PPL-VERIFY ?auto_371 ?auto_372 ?auto_370 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_378 - PERSON
      ?auto_379 - PERSON
      ?auto_377 - CITY
    )
    :vars
    (
      ?auto_382 - FLEVEL
      ?auto_381 - FLEVEL
      ?auto_383 - CITY
      ?auto_380 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_382 ?auto_381 ) ( not ( = ?auto_377 ?auto_383 ) ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_379 ?auto_378 ) ) ( PERSON-AT ?auto_378 ?auto_383 ) ( PERSON-AT ?auto_379 ?auto_383 ) ( AIRCRAFT-AT ?auto_380 ?auto_377 ) ( FUEL-LEVEL ?auto_380 ?auto_381 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_379 ?auto_378 ?auto_377 )
      ( FLY-2PPL-VERIFY ?auto_378 ?auto_379 ?auto_377 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_393 - PERSON
      ?auto_392 - CITY
    )
    :vars
    (
      ?auto_396 - FLEVEL
      ?auto_395 - FLEVEL
      ?auto_397 - CITY
      ?auto_398 - PERSON
      ?auto_394 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_396 ?auto_395 ) ( not ( = ?auto_392 ?auto_397 ) ) ( not ( = ?auto_395 ?auto_396 ) ) ( not ( = ?auto_398 ?auto_393 ) ) ( PERSON-AT ?auto_393 ?auto_397 ) ( PERSON-AT ?auto_398 ?auto_397 ) ( AIRCRAFT-AT ?auto_394 ?auto_392 ) ( FUEL-LEVEL ?auto_394 ?auto_396 ) )
    :subtasks
    ( ( !REFUEL ?auto_394 ?auto_392 ?auto_396 ?auto_395 )
      ( FLY-2PPL ?auto_398 ?auto_393 ?auto_392 )
      ( FLY-1PPL-VERIFY ?auto_393 ?auto_392 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_400 - PERSON
      ?auto_401 - PERSON
      ?auto_399 - CITY
    )
    :vars
    (
      ?auto_402 - FLEVEL
      ?auto_404 - FLEVEL
      ?auto_405 - CITY
      ?auto_403 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_402 ?auto_404 ) ( not ( = ?auto_399 ?auto_405 ) ) ( not ( = ?auto_404 ?auto_402 ) ) ( not ( = ?auto_400 ?auto_401 ) ) ( PERSON-AT ?auto_401 ?auto_405 ) ( PERSON-AT ?auto_400 ?auto_405 ) ( AIRCRAFT-AT ?auto_403 ?auto_399 ) ( FUEL-LEVEL ?auto_403 ?auto_402 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_401 ?auto_399 )
      ( FLY-2PPL-VERIFY ?auto_400 ?auto_401 ?auto_399 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_407 - PERSON
      ?auto_408 - PERSON
      ?auto_406 - CITY
    )
    :vars
    (
      ?auto_412 - FLEVEL
      ?auto_410 - FLEVEL
      ?auto_411 - CITY
      ?auto_409 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_412 ?auto_410 ) ( not ( = ?auto_406 ?auto_411 ) ) ( not ( = ?auto_410 ?auto_412 ) ) ( not ( = ?auto_408 ?auto_407 ) ) ( PERSON-AT ?auto_407 ?auto_411 ) ( PERSON-AT ?auto_408 ?auto_411 ) ( AIRCRAFT-AT ?auto_409 ?auto_406 ) ( FUEL-LEVEL ?auto_409 ?auto_412 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_408 ?auto_407 ?auto_406 )
      ( FLY-2PPL-VERIFY ?auto_407 ?auto_408 ?auto_406 ) )
  )

)

