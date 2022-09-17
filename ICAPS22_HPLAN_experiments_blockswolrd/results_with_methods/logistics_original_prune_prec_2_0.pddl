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
      ?auto_6 - OBJ
      ?auto_5 - LOCATION
    )
    :vars
    (
      ?auto_7 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7 ?auto_5 ) ( IN-TRUCK ?auto_6 ?auto_7 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6 ?auto_7 ?auto_5 )
      ( DELIVER-1PKG-VERIFY ?auto_6 ?auto_5 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13 - OBJ
      ?auto_12 - LOCATION
    )
    :vars
    (
      ?auto_14 - TRUCK
      ?auto_15 - LOCATION
      ?auto_16 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13 ?auto_14 ) ( TRUCK-AT ?auto_14 ?auto_15 ) ( IN-CITY ?auto_15 ?auto_16 ) ( IN-CITY ?auto_12 ?auto_16 ) ( not ( = ?auto_12 ?auto_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14 ?auto_15 ?auto_12 ?auto_16 )
      ( DELIVER-1PKG ?auto_13 ?auto_12 )
      ( DELIVER-1PKG-VERIFY ?auto_13 ?auto_12 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_24 - OBJ
      ?auto_23 - LOCATION
    )
    :vars
    (
      ?auto_27 - TRUCK
      ?auto_25 - LOCATION
      ?auto_26 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_27 ?auto_25 ) ( IN-CITY ?auto_25 ?auto_26 ) ( IN-CITY ?auto_23 ?auto_26 ) ( not ( = ?auto_23 ?auto_25 ) ) ( OBJ-AT ?auto_24 ?auto_25 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_24 ?auto_27 ?auto_25 )
      ( DELIVER-1PKG ?auto_24 ?auto_23 )
      ( DELIVER-1PKG-VERIFY ?auto_24 ?auto_23 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_35 - OBJ
      ?auto_34 - LOCATION
    )
    :vars
    (
      ?auto_37 - LOCATION
      ?auto_38 - CITY
      ?auto_36 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37 ?auto_38 ) ( IN-CITY ?auto_34 ?auto_38 ) ( not ( = ?auto_34 ?auto_37 ) ) ( OBJ-AT ?auto_35 ?auto_37 ) ( TRUCK-AT ?auto_36 ?auto_34 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_36 ?auto_34 ?auto_37 ?auto_38 )
      ( DELIVER-1PKG ?auto_35 ?auto_34 )
      ( DELIVER-1PKG-VERIFY ?auto_35 ?auto_34 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60 - OBJ
      ?auto_61 - OBJ
      ?auto_59 - LOCATION
    )
    :vars
    (
      ?auto_62 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_61 ?auto_60 ) ) ( TRUCK-AT ?auto_62 ?auto_59 ) ( IN-TRUCK ?auto_61 ?auto_62 ) ( OBJ-AT ?auto_60 ?auto_59 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_61 ?auto_59 )
      ( DELIVER-2PKG-VERIFY ?auto_60 ?auto_61 ?auto_59 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64 - OBJ
      ?auto_65 - OBJ
      ?auto_63 - LOCATION
    )
    :vars
    (
      ?auto_66 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_65 ?auto_64 ) ) ( TRUCK-AT ?auto_66 ?auto_63 ) ( IN-TRUCK ?auto_64 ?auto_66 ) ( OBJ-AT ?auto_65 ?auto_63 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64 ?auto_63 )
      ( DELIVER-2PKG-VERIFY ?auto_64 ?auto_65 ?auto_63 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_77 - OBJ
      ?auto_78 - OBJ
      ?auto_76 - LOCATION
    )
    :vars
    (
      ?auto_81 - TRUCK
      ?auto_80 - LOCATION
      ?auto_79 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_78 ?auto_77 ) ) ( IN-TRUCK ?auto_78 ?auto_81 ) ( TRUCK-AT ?auto_81 ?auto_80 ) ( IN-CITY ?auto_80 ?auto_79 ) ( IN-CITY ?auto_76 ?auto_79 ) ( not ( = ?auto_76 ?auto_80 ) ) ( OBJ-AT ?auto_77 ?auto_76 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_78 ?auto_76 )
      ( DELIVER-2PKG-VERIFY ?auto_77 ?auto_78 ?auto_76 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_83 - OBJ
      ?auto_84 - OBJ
      ?auto_82 - LOCATION
    )
    :vars
    (
      ?auto_85 - TRUCK
      ?auto_87 - LOCATION
      ?auto_86 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_84 ?auto_83 ) ) ( IN-TRUCK ?auto_83 ?auto_85 ) ( TRUCK-AT ?auto_85 ?auto_87 ) ( IN-CITY ?auto_87 ?auto_86 ) ( IN-CITY ?auto_82 ?auto_86 ) ( not ( = ?auto_82 ?auto_87 ) ) ( OBJ-AT ?auto_84 ?auto_82 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84 ?auto_83 ?auto_82 )
      ( DELIVER-2PKG-VERIFY ?auto_83 ?auto_84 ?auto_82 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96 - OBJ
      ?auto_95 - LOCATION
    )
    :vars
    (
      ?auto_97 - OBJ
      ?auto_98 - TRUCK
      ?auto_100 - LOCATION
      ?auto_99 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_96 ?auto_97 ) ) ( TRUCK-AT ?auto_98 ?auto_100 ) ( IN-CITY ?auto_100 ?auto_99 ) ( IN-CITY ?auto_95 ?auto_99 ) ( not ( = ?auto_95 ?auto_100 ) ) ( OBJ-AT ?auto_97 ?auto_95 ) ( OBJ-AT ?auto_96 ?auto_100 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96 ?auto_98 ?auto_100 )
      ( DELIVER-2PKG ?auto_97 ?auto_96 ?auto_95 )
      ( DELIVER-1PKG-VERIFY ?auto_96 ?auto_95 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102 - OBJ
      ?auto_103 - OBJ
      ?auto_101 - LOCATION
    )
    :vars
    (
      ?auto_105 - TRUCK
      ?auto_106 - LOCATION
      ?auto_104 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_103 ?auto_102 ) ) ( TRUCK-AT ?auto_105 ?auto_106 ) ( IN-CITY ?auto_106 ?auto_104 ) ( IN-CITY ?auto_101 ?auto_104 ) ( not ( = ?auto_101 ?auto_106 ) ) ( OBJ-AT ?auto_102 ?auto_101 ) ( OBJ-AT ?auto_103 ?auto_106 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_103 ?auto_101 )
      ( DELIVER-2PKG-VERIFY ?auto_102 ?auto_103 ?auto_101 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_108 - OBJ
      ?auto_109 - OBJ
      ?auto_107 - LOCATION
    )
    :vars
    (
      ?auto_111 - TRUCK
      ?auto_112 - LOCATION
      ?auto_110 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_109 ?auto_108 ) ) ( TRUCK-AT ?auto_111 ?auto_112 ) ( IN-CITY ?auto_112 ?auto_110 ) ( IN-CITY ?auto_107 ?auto_110 ) ( not ( = ?auto_107 ?auto_112 ) ) ( OBJ-AT ?auto_109 ?auto_107 ) ( OBJ-AT ?auto_108 ?auto_112 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_109 ?auto_108 ?auto_107 )
      ( DELIVER-2PKG-VERIFY ?auto_108 ?auto_109 ?auto_107 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_121 - OBJ
      ?auto_120 - LOCATION
    )
    :vars
    (
      ?auto_125 - OBJ
      ?auto_124 - LOCATION
      ?auto_122 - CITY
      ?auto_123 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_121 ?auto_125 ) ) ( IN-CITY ?auto_124 ?auto_122 ) ( IN-CITY ?auto_120 ?auto_122 ) ( not ( = ?auto_120 ?auto_124 ) ) ( OBJ-AT ?auto_125 ?auto_120 ) ( OBJ-AT ?auto_121 ?auto_124 ) ( TRUCK-AT ?auto_123 ?auto_120 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_123 ?auto_120 ?auto_124 ?auto_122 )
      ( DELIVER-2PKG ?auto_125 ?auto_121 ?auto_120 )
      ( DELIVER-1PKG-VERIFY ?auto_121 ?auto_120 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_127 - OBJ
      ?auto_128 - OBJ
      ?auto_126 - LOCATION
    )
    :vars
    (
      ?auto_129 - LOCATION
      ?auto_130 - CITY
      ?auto_131 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_128 ?auto_127 ) ) ( IN-CITY ?auto_129 ?auto_130 ) ( IN-CITY ?auto_126 ?auto_130 ) ( not ( = ?auto_126 ?auto_129 ) ) ( OBJ-AT ?auto_127 ?auto_126 ) ( OBJ-AT ?auto_128 ?auto_129 ) ( TRUCK-AT ?auto_131 ?auto_126 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_128 ?auto_126 )
      ( DELIVER-2PKG-VERIFY ?auto_127 ?auto_128 ?auto_126 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_133 - OBJ
      ?auto_134 - OBJ
      ?auto_132 - LOCATION
    )
    :vars
    (
      ?auto_135 - LOCATION
      ?auto_137 - CITY
      ?auto_136 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_134 ?auto_133 ) ) ( IN-CITY ?auto_135 ?auto_137 ) ( IN-CITY ?auto_132 ?auto_137 ) ( not ( = ?auto_132 ?auto_135 ) ) ( OBJ-AT ?auto_134 ?auto_132 ) ( OBJ-AT ?auto_133 ?auto_135 ) ( TRUCK-AT ?auto_136 ?auto_132 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134 ?auto_133 ?auto_132 )
      ( DELIVER-2PKG-VERIFY ?auto_133 ?auto_134 ?auto_132 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_146 - OBJ
      ?auto_145 - LOCATION
    )
    :vars
    (
      ?auto_150 - OBJ
      ?auto_147 - LOCATION
      ?auto_149 - CITY
      ?auto_148 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_146 ?auto_150 ) ) ( IN-CITY ?auto_147 ?auto_149 ) ( IN-CITY ?auto_145 ?auto_149 ) ( not ( = ?auto_145 ?auto_147 ) ) ( OBJ-AT ?auto_146 ?auto_147 ) ( TRUCK-AT ?auto_148 ?auto_145 ) ( IN-TRUCK ?auto_150 ?auto_148 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_150 ?auto_145 )
      ( DELIVER-2PKG ?auto_150 ?auto_146 ?auto_145 )
      ( DELIVER-1PKG-VERIFY ?auto_146 ?auto_145 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_152 - OBJ
      ?auto_153 - OBJ
      ?auto_151 - LOCATION
    )
    :vars
    (
      ?auto_155 - LOCATION
      ?auto_154 - CITY
      ?auto_156 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_153 ?auto_152 ) ) ( IN-CITY ?auto_155 ?auto_154 ) ( IN-CITY ?auto_151 ?auto_154 ) ( not ( = ?auto_151 ?auto_155 ) ) ( OBJ-AT ?auto_153 ?auto_155 ) ( TRUCK-AT ?auto_156 ?auto_151 ) ( IN-TRUCK ?auto_152 ?auto_156 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_153 ?auto_151 )
      ( DELIVER-2PKG-VERIFY ?auto_152 ?auto_153 ?auto_151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_158 - OBJ
      ?auto_159 - OBJ
      ?auto_157 - LOCATION
    )
    :vars
    (
      ?auto_161 - LOCATION
      ?auto_160 - CITY
      ?auto_162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_159 ?auto_158 ) ) ( IN-CITY ?auto_161 ?auto_160 ) ( IN-CITY ?auto_157 ?auto_160 ) ( not ( = ?auto_157 ?auto_161 ) ) ( OBJ-AT ?auto_158 ?auto_161 ) ( TRUCK-AT ?auto_162 ?auto_157 ) ( IN-TRUCK ?auto_159 ?auto_162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159 ?auto_158 ?auto_157 )
      ( DELIVER-2PKG-VERIFY ?auto_158 ?auto_159 ?auto_157 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_171 - OBJ
      ?auto_170 - LOCATION
    )
    :vars
    (
      ?auto_174 - OBJ
      ?auto_173 - LOCATION
      ?auto_172 - CITY
      ?auto_175 - TRUCK
      ?auto_176 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_171 ?auto_174 ) ) ( IN-CITY ?auto_173 ?auto_172 ) ( IN-CITY ?auto_170 ?auto_172 ) ( not ( = ?auto_170 ?auto_173 ) ) ( OBJ-AT ?auto_171 ?auto_173 ) ( IN-TRUCK ?auto_174 ?auto_175 ) ( TRUCK-AT ?auto_175 ?auto_176 ) ( IN-CITY ?auto_176 ?auto_172 ) ( not ( = ?auto_170 ?auto_176 ) ) ( not ( = ?auto_173 ?auto_176 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175 ?auto_176 ?auto_170 ?auto_172 )
      ( DELIVER-2PKG ?auto_174 ?auto_171 ?auto_170 )
      ( DELIVER-1PKG-VERIFY ?auto_171 ?auto_170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_178 - OBJ
      ?auto_179 - OBJ
      ?auto_177 - LOCATION
    )
    :vars
    (
      ?auto_180 - LOCATION
      ?auto_182 - CITY
      ?auto_183 - TRUCK
      ?auto_181 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_179 ?auto_178 ) ) ( IN-CITY ?auto_180 ?auto_182 ) ( IN-CITY ?auto_177 ?auto_182 ) ( not ( = ?auto_177 ?auto_180 ) ) ( OBJ-AT ?auto_179 ?auto_180 ) ( IN-TRUCK ?auto_178 ?auto_183 ) ( TRUCK-AT ?auto_183 ?auto_181 ) ( IN-CITY ?auto_181 ?auto_182 ) ( not ( = ?auto_177 ?auto_181 ) ) ( not ( = ?auto_180 ?auto_181 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_179 ?auto_177 )
      ( DELIVER-2PKG-VERIFY ?auto_178 ?auto_179 ?auto_177 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_185 - OBJ
      ?auto_186 - OBJ
      ?auto_184 - LOCATION
    )
    :vars
    (
      ?auto_189 - LOCATION
      ?auto_190 - CITY
      ?auto_187 - TRUCK
      ?auto_188 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_186 ?auto_185 ) ) ( IN-CITY ?auto_189 ?auto_190 ) ( IN-CITY ?auto_184 ?auto_190 ) ( not ( = ?auto_184 ?auto_189 ) ) ( OBJ-AT ?auto_185 ?auto_189 ) ( IN-TRUCK ?auto_186 ?auto_187 ) ( TRUCK-AT ?auto_187 ?auto_188 ) ( IN-CITY ?auto_188 ?auto_190 ) ( not ( = ?auto_184 ?auto_188 ) ) ( not ( = ?auto_189 ?auto_188 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186 ?auto_185 ?auto_184 )
      ( DELIVER-2PKG-VERIFY ?auto_185 ?auto_186 ?auto_184 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_200 - OBJ
      ?auto_199 - LOCATION
    )
    :vars
    (
      ?auto_205 - OBJ
      ?auto_203 - LOCATION
      ?auto_204 - CITY
      ?auto_201 - TRUCK
      ?auto_202 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_200 ?auto_205 ) ) ( IN-CITY ?auto_203 ?auto_204 ) ( IN-CITY ?auto_199 ?auto_204 ) ( not ( = ?auto_199 ?auto_203 ) ) ( OBJ-AT ?auto_200 ?auto_203 ) ( TRUCK-AT ?auto_201 ?auto_202 ) ( IN-CITY ?auto_202 ?auto_204 ) ( not ( = ?auto_199 ?auto_202 ) ) ( not ( = ?auto_203 ?auto_202 ) ) ( OBJ-AT ?auto_205 ?auto_202 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_205 ?auto_201 ?auto_202 )
      ( DELIVER-2PKG ?auto_205 ?auto_200 ?auto_199 )
      ( DELIVER-1PKG-VERIFY ?auto_200 ?auto_199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_207 - OBJ
      ?auto_208 - OBJ
      ?auto_206 - LOCATION
    )
    :vars
    (
      ?auto_209 - LOCATION
      ?auto_211 - CITY
      ?auto_212 - TRUCK
      ?auto_210 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_208 ?auto_207 ) ) ( IN-CITY ?auto_209 ?auto_211 ) ( IN-CITY ?auto_206 ?auto_211 ) ( not ( = ?auto_206 ?auto_209 ) ) ( OBJ-AT ?auto_208 ?auto_209 ) ( TRUCK-AT ?auto_212 ?auto_210 ) ( IN-CITY ?auto_210 ?auto_211 ) ( not ( = ?auto_206 ?auto_210 ) ) ( not ( = ?auto_209 ?auto_210 ) ) ( OBJ-AT ?auto_207 ?auto_210 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_208 ?auto_206 )
      ( DELIVER-2PKG-VERIFY ?auto_207 ?auto_208 ?auto_206 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_214 - OBJ
      ?auto_215 - OBJ
      ?auto_213 - LOCATION
    )
    :vars
    (
      ?auto_219 - LOCATION
      ?auto_217 - CITY
      ?auto_218 - TRUCK
      ?auto_216 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_215 ?auto_214 ) ) ( IN-CITY ?auto_219 ?auto_217 ) ( IN-CITY ?auto_213 ?auto_217 ) ( not ( = ?auto_213 ?auto_219 ) ) ( OBJ-AT ?auto_214 ?auto_219 ) ( TRUCK-AT ?auto_218 ?auto_216 ) ( IN-CITY ?auto_216 ?auto_217 ) ( not ( = ?auto_213 ?auto_216 ) ) ( not ( = ?auto_219 ?auto_216 ) ) ( OBJ-AT ?auto_215 ?auto_216 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_215 ?auto_214 ?auto_213 )
      ( DELIVER-2PKG-VERIFY ?auto_214 ?auto_215 ?auto_213 ) )
  )

)

