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
      ?auto_2 - OBJ
      ?auto_3 - LOCATION
    )
    :vars
    (
      ?auto_4 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4 ?auto_3 ) ( IN-TRUCK ?auto_2 ?auto_4 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2 ?auto_4 ?auto_3 )
      ( DELIVER-1PKG-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9 - OBJ
      ?auto_10 - LOCATION
    )
    :vars
    (
      ?auto_13 - TRUCK
      ?auto_15 - LOCATION
      ?auto_16 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9 ?auto_13 ) ( TRUCK-AT ?auto_13 ?auto_15 ) ( IN-CITY ?auto_15 ?auto_16 ) ( IN-CITY ?auto_10 ?auto_16 ) ( not ( = ?auto_10 ?auto_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13 ?auto_15 ?auto_10 ?auto_16 )
      ( DELIVER-1PKG ?auto_9 ?auto_10 )
      ( DELIVER-1PKG-VERIFY ?auto_9 ?auto_10 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20 - OBJ
      ?auto_21 - LOCATION
    )
    :vars
    (
      ?auto_23 - TRUCK
      ?auto_25 - LOCATION
      ?auto_26 - CITY
      ?auto_28 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_23 ?auto_25 ) ( IN-CITY ?auto_25 ?auto_26 ) ( IN-CITY ?auto_21 ?auto_26 ) ( not ( = ?auto_21 ?auto_25 ) ) ( TRUCK-AT ?auto_23 ?auto_28 ) ( OBJ-AT ?auto_20 ?auto_28 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_20 ?auto_23 ?auto_28 )
      ( DELIVER-1PKG ?auto_20 ?auto_21 )
      ( DELIVER-1PKG-VERIFY ?auto_20 ?auto_21 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_32 - OBJ
      ?auto_33 - LOCATION
    )
    :vars
    (
      ?auto_35 - LOCATION
      ?auto_38 - CITY
      ?auto_39 - TRUCK
      ?auto_41 - LOCATION
      ?auto_42 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_35 ?auto_38 ) ( IN-CITY ?auto_33 ?auto_38 ) ( not ( = ?auto_33 ?auto_35 ) ) ( OBJ-AT ?auto_32 ?auto_35 ) ( TRUCK-AT ?auto_39 ?auto_41 ) ( IN-CITY ?auto_41 ?auto_42 ) ( IN-CITY ?auto_35 ?auto_42 ) ( not ( = ?auto_35 ?auto_41 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_39 ?auto_41 ?auto_35 ?auto_42 )
      ( DELIVER-1PKG ?auto_32 ?auto_33 )
      ( DELIVER-1PKG-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_91 - OBJ
      ?auto_93 - OBJ
      ?auto_92 - LOCATION
    )
    :vars
    (
      ?auto_95 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_93 ?auto_91 ) ( TRUCK-AT ?auto_95 ?auto_92 ) ( IN-TRUCK ?auto_93 ?auto_95 ) ( OBJ-AT ?auto_91 ?auto_92 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_93 ?auto_92 )
      ( DELIVER-2PKG-VERIFY ?auto_91 ?auto_93 ?auto_92 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_100 - OBJ
      ?auto_102 - OBJ
      ?auto_101 - LOCATION
    )
    :vars
    (
      ?auto_103 - TRUCK
      ?auto_106 - LOCATION
      ?auto_104 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_102 ?auto_100 ) ( IN-TRUCK ?auto_102 ?auto_103 ) ( TRUCK-AT ?auto_103 ?auto_106 ) ( IN-CITY ?auto_106 ?auto_104 ) ( IN-CITY ?auto_101 ?auto_104 ) ( not ( = ?auto_101 ?auto_106 ) ) ( OBJ-AT ?auto_100 ?auto_101 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_102 ?auto_101 )
      ( DELIVER-2PKG-VERIFY ?auto_100 ?auto_102 ?auto_101 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_111 - OBJ
      ?auto_113 - OBJ
      ?auto_112 - LOCATION
    )
    :vars
    (
      ?auto_118 - TRUCK
      ?auto_119 - LOCATION
      ?auto_116 - CITY
      ?auto_117 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_113 ?auto_111 ) ( TRUCK-AT ?auto_118 ?auto_119 ) ( IN-CITY ?auto_119 ?auto_116 ) ( IN-CITY ?auto_112 ?auto_116 ) ( not ( = ?auto_112 ?auto_119 ) ) ( TRUCK-AT ?auto_118 ?auto_117 ) ( OBJ-AT ?auto_113 ?auto_117 ) ( OBJ-AT ?auto_111 ?auto_112 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_113 ?auto_112 )
      ( DELIVER-2PKG-VERIFY ?auto_111 ?auto_113 ?auto_112 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_123 - OBJ
      ?auto_125 - OBJ
      ?auto_124 - LOCATION
    )
    :vars
    (
      ?auto_128 - LOCATION
      ?auto_131 - CITY
      ?auto_129 - TRUCK
      ?auto_132 - LOCATION
      ?auto_127 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_125 ?auto_123 ) ( IN-CITY ?auto_128 ?auto_131 ) ( IN-CITY ?auto_124 ?auto_131 ) ( not ( = ?auto_124 ?auto_128 ) ) ( OBJ-AT ?auto_125 ?auto_128 ) ( TRUCK-AT ?auto_129 ?auto_132 ) ( IN-CITY ?auto_132 ?auto_127 ) ( IN-CITY ?auto_128 ?auto_127 ) ( not ( = ?auto_128 ?auto_132 ) ) ( OBJ-AT ?auto_123 ?auto_124 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_125 ?auto_124 )
      ( DELIVER-2PKG-VERIFY ?auto_123 ?auto_125 ?auto_124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_144 - OBJ
      ?auto_138 - OBJ
      ?auto_137 - LOCATION
    )
    :vars
    (
      ?auto_146 - LOCATION
      ?auto_142 - CITY
      ?auto_139 - TRUCK
      ?auto_145 - LOCATION
      ?auto_141 - CITY
      ?auto_149 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_138 ?auto_144 ) ( IN-CITY ?auto_146 ?auto_142 ) ( IN-CITY ?auto_137 ?auto_142 ) ( not ( = ?auto_137 ?auto_146 ) ) ( OBJ-AT ?auto_138 ?auto_146 ) ( TRUCK-AT ?auto_139 ?auto_145 ) ( IN-CITY ?auto_145 ?auto_141 ) ( IN-CITY ?auto_146 ?auto_141 ) ( not ( = ?auto_146 ?auto_145 ) ) ( TRUCK-AT ?auto_149 ?auto_137 ) ( IN-TRUCK ?auto_144 ?auto_149 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_144 ?auto_137 )
      ( DELIVER-2PKG ?auto_144 ?auto_138 ?auto_137 )
      ( DELIVER-2PKG-VERIFY ?auto_144 ?auto_138 ?auto_137 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_153 - OBJ
      ?auto_155 - OBJ
      ?auto_154 - LOCATION
    )
    :vars
    (
      ?auto_158 - LOCATION
      ?auto_163 - CITY
      ?auto_160 - CITY
      ?auto_162 - TRUCK
      ?auto_166 - LOCATION
      ?auto_167 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_155 ?auto_153 ) ( IN-CITY ?auto_158 ?auto_163 ) ( IN-CITY ?auto_154 ?auto_163 ) ( not ( = ?auto_154 ?auto_158 ) ) ( OBJ-AT ?auto_155 ?auto_158 ) ( IN-CITY ?auto_154 ?auto_160 ) ( IN-CITY ?auto_158 ?auto_160 ) ( IN-TRUCK ?auto_153 ?auto_162 ) ( TRUCK-AT ?auto_162 ?auto_166 ) ( IN-CITY ?auto_166 ?auto_167 ) ( IN-CITY ?auto_154 ?auto_167 ) ( not ( = ?auto_154 ?auto_166 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_162 ?auto_166 ?auto_154 ?auto_167 )
      ( DELIVER-2PKG ?auto_153 ?auto_155 ?auto_154 )
      ( DELIVER-2PKG-VERIFY ?auto_153 ?auto_155 ?auto_154 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_172 - OBJ
      ?auto_174 - OBJ
      ?auto_173 - LOCATION
    )
    :vars
    (
      ?auto_178 - LOCATION
      ?auto_181 - CITY
      ?auto_176 - CITY
      ?auto_179 - TRUCK
      ?auto_182 - LOCATION
      ?auto_180 - CITY
      ?auto_185 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_174 ?auto_172 ) ( IN-CITY ?auto_178 ?auto_181 ) ( IN-CITY ?auto_173 ?auto_181 ) ( not ( = ?auto_173 ?auto_178 ) ) ( OBJ-AT ?auto_174 ?auto_178 ) ( IN-CITY ?auto_173 ?auto_176 ) ( IN-CITY ?auto_178 ?auto_176 ) ( TRUCK-AT ?auto_179 ?auto_182 ) ( IN-CITY ?auto_182 ?auto_180 ) ( IN-CITY ?auto_173 ?auto_180 ) ( not ( = ?auto_173 ?auto_182 ) ) ( TRUCK-AT ?auto_179 ?auto_185 ) ( OBJ-AT ?auto_172 ?auto_185 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_172 ?auto_179 ?auto_185 )
      ( DELIVER-2PKG ?auto_172 ?auto_174 ?auto_173 )
      ( DELIVER-2PKG-VERIFY ?auto_172 ?auto_174 ?auto_173 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190 - OBJ
      ?auto_192 - OBJ
      ?auto_191 - LOCATION
    )
    :vars
    (
      ?auto_201 - LOCATION
      ?auto_200 - CITY
      ?auto_194 - CITY
      ?auto_202 - LOCATION
      ?auto_195 - CITY
      ?auto_197 - TRUCK
      ?auto_204 - LOCATION
      ?auto_205 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_192 ?auto_190 ) ( IN-CITY ?auto_201 ?auto_200 ) ( IN-CITY ?auto_191 ?auto_200 ) ( not ( = ?auto_191 ?auto_201 ) ) ( OBJ-AT ?auto_192 ?auto_201 ) ( IN-CITY ?auto_191 ?auto_194 ) ( IN-CITY ?auto_201 ?auto_194 ) ( IN-CITY ?auto_202 ?auto_195 ) ( IN-CITY ?auto_191 ?auto_195 ) ( not ( = ?auto_191 ?auto_202 ) ) ( OBJ-AT ?auto_190 ?auto_202 ) ( TRUCK-AT ?auto_197 ?auto_204 ) ( IN-CITY ?auto_204 ?auto_205 ) ( IN-CITY ?auto_202 ?auto_205 ) ( not ( = ?auto_202 ?auto_204 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_197 ?auto_204 ?auto_202 ?auto_205 )
      ( DELIVER-2PKG ?auto_190 ?auto_192 ?auto_191 )
      ( DELIVER-2PKG-VERIFY ?auto_190 ?auto_192 ?auto_191 ) )
  )

)

