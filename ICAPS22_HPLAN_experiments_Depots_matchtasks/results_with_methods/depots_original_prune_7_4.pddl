( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90104 - SURFACE
      ?auto_90105 - SURFACE
    )
    :vars
    (
      ?auto_90106 - HOIST
      ?auto_90107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90106 ?auto_90107 ) ( SURFACE-AT ?auto_90104 ?auto_90107 ) ( CLEAR ?auto_90104 ) ( LIFTING ?auto_90106 ?auto_90105 ) ( IS-CRATE ?auto_90105 ) ( not ( = ?auto_90104 ?auto_90105 ) ) )
    :subtasks
    ( ( !DROP ?auto_90106 ?auto_90105 ?auto_90104 ?auto_90107 )
      ( MAKE-1CRATE-VERIFY ?auto_90104 ?auto_90105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90108 - SURFACE
      ?auto_90109 - SURFACE
    )
    :vars
    (
      ?auto_90110 - HOIST
      ?auto_90111 - PLACE
      ?auto_90112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90110 ?auto_90111 ) ( SURFACE-AT ?auto_90108 ?auto_90111 ) ( CLEAR ?auto_90108 ) ( IS-CRATE ?auto_90109 ) ( not ( = ?auto_90108 ?auto_90109 ) ) ( TRUCK-AT ?auto_90112 ?auto_90111 ) ( AVAILABLE ?auto_90110 ) ( IN ?auto_90109 ?auto_90112 ) )
    :subtasks
    ( ( !UNLOAD ?auto_90110 ?auto_90109 ?auto_90112 ?auto_90111 )
      ( MAKE-1CRATE ?auto_90108 ?auto_90109 )
      ( MAKE-1CRATE-VERIFY ?auto_90108 ?auto_90109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90113 - SURFACE
      ?auto_90114 - SURFACE
    )
    :vars
    (
      ?auto_90115 - HOIST
      ?auto_90117 - PLACE
      ?auto_90116 - TRUCK
      ?auto_90118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90115 ?auto_90117 ) ( SURFACE-AT ?auto_90113 ?auto_90117 ) ( CLEAR ?auto_90113 ) ( IS-CRATE ?auto_90114 ) ( not ( = ?auto_90113 ?auto_90114 ) ) ( AVAILABLE ?auto_90115 ) ( IN ?auto_90114 ?auto_90116 ) ( TRUCK-AT ?auto_90116 ?auto_90118 ) ( not ( = ?auto_90118 ?auto_90117 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90116 ?auto_90118 ?auto_90117 )
      ( MAKE-1CRATE ?auto_90113 ?auto_90114 )
      ( MAKE-1CRATE-VERIFY ?auto_90113 ?auto_90114 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90119 - SURFACE
      ?auto_90120 - SURFACE
    )
    :vars
    (
      ?auto_90123 - HOIST
      ?auto_90121 - PLACE
      ?auto_90124 - TRUCK
      ?auto_90122 - PLACE
      ?auto_90125 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90123 ?auto_90121 ) ( SURFACE-AT ?auto_90119 ?auto_90121 ) ( CLEAR ?auto_90119 ) ( IS-CRATE ?auto_90120 ) ( not ( = ?auto_90119 ?auto_90120 ) ) ( AVAILABLE ?auto_90123 ) ( TRUCK-AT ?auto_90124 ?auto_90122 ) ( not ( = ?auto_90122 ?auto_90121 ) ) ( HOIST-AT ?auto_90125 ?auto_90122 ) ( LIFTING ?auto_90125 ?auto_90120 ) ( not ( = ?auto_90123 ?auto_90125 ) ) )
    :subtasks
    ( ( !LOAD ?auto_90125 ?auto_90120 ?auto_90124 ?auto_90122 )
      ( MAKE-1CRATE ?auto_90119 ?auto_90120 )
      ( MAKE-1CRATE-VERIFY ?auto_90119 ?auto_90120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90126 - SURFACE
      ?auto_90127 - SURFACE
    )
    :vars
    (
      ?auto_90132 - HOIST
      ?auto_90130 - PLACE
      ?auto_90131 - TRUCK
      ?auto_90129 - PLACE
      ?auto_90128 - HOIST
      ?auto_90133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90132 ?auto_90130 ) ( SURFACE-AT ?auto_90126 ?auto_90130 ) ( CLEAR ?auto_90126 ) ( IS-CRATE ?auto_90127 ) ( not ( = ?auto_90126 ?auto_90127 ) ) ( AVAILABLE ?auto_90132 ) ( TRUCK-AT ?auto_90131 ?auto_90129 ) ( not ( = ?auto_90129 ?auto_90130 ) ) ( HOIST-AT ?auto_90128 ?auto_90129 ) ( not ( = ?auto_90132 ?auto_90128 ) ) ( AVAILABLE ?auto_90128 ) ( SURFACE-AT ?auto_90127 ?auto_90129 ) ( ON ?auto_90127 ?auto_90133 ) ( CLEAR ?auto_90127 ) ( not ( = ?auto_90126 ?auto_90133 ) ) ( not ( = ?auto_90127 ?auto_90133 ) ) )
    :subtasks
    ( ( !LIFT ?auto_90128 ?auto_90127 ?auto_90133 ?auto_90129 )
      ( MAKE-1CRATE ?auto_90126 ?auto_90127 )
      ( MAKE-1CRATE-VERIFY ?auto_90126 ?auto_90127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90134 - SURFACE
      ?auto_90135 - SURFACE
    )
    :vars
    (
      ?auto_90139 - HOIST
      ?auto_90136 - PLACE
      ?auto_90140 - PLACE
      ?auto_90138 - HOIST
      ?auto_90141 - SURFACE
      ?auto_90137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90139 ?auto_90136 ) ( SURFACE-AT ?auto_90134 ?auto_90136 ) ( CLEAR ?auto_90134 ) ( IS-CRATE ?auto_90135 ) ( not ( = ?auto_90134 ?auto_90135 ) ) ( AVAILABLE ?auto_90139 ) ( not ( = ?auto_90140 ?auto_90136 ) ) ( HOIST-AT ?auto_90138 ?auto_90140 ) ( not ( = ?auto_90139 ?auto_90138 ) ) ( AVAILABLE ?auto_90138 ) ( SURFACE-AT ?auto_90135 ?auto_90140 ) ( ON ?auto_90135 ?auto_90141 ) ( CLEAR ?auto_90135 ) ( not ( = ?auto_90134 ?auto_90141 ) ) ( not ( = ?auto_90135 ?auto_90141 ) ) ( TRUCK-AT ?auto_90137 ?auto_90136 ) )
    :subtasks
    ( ( !DRIVE ?auto_90137 ?auto_90136 ?auto_90140 )
      ( MAKE-1CRATE ?auto_90134 ?auto_90135 )
      ( MAKE-1CRATE-VERIFY ?auto_90134 ?auto_90135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90151 - SURFACE
      ?auto_90152 - SURFACE
      ?auto_90153 - SURFACE
    )
    :vars
    (
      ?auto_90155 - HOIST
      ?auto_90154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90155 ?auto_90154 ) ( SURFACE-AT ?auto_90152 ?auto_90154 ) ( CLEAR ?auto_90152 ) ( LIFTING ?auto_90155 ?auto_90153 ) ( IS-CRATE ?auto_90153 ) ( not ( = ?auto_90152 ?auto_90153 ) ) ( ON ?auto_90152 ?auto_90151 ) ( not ( = ?auto_90151 ?auto_90152 ) ) ( not ( = ?auto_90151 ?auto_90153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90152 ?auto_90153 )
      ( MAKE-2CRATE-VERIFY ?auto_90151 ?auto_90152 ?auto_90153 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90161 - SURFACE
      ?auto_90162 - SURFACE
      ?auto_90163 - SURFACE
    )
    :vars
    (
      ?auto_90166 - HOIST
      ?auto_90164 - PLACE
      ?auto_90165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90166 ?auto_90164 ) ( SURFACE-AT ?auto_90162 ?auto_90164 ) ( CLEAR ?auto_90162 ) ( IS-CRATE ?auto_90163 ) ( not ( = ?auto_90162 ?auto_90163 ) ) ( TRUCK-AT ?auto_90165 ?auto_90164 ) ( AVAILABLE ?auto_90166 ) ( IN ?auto_90163 ?auto_90165 ) ( ON ?auto_90162 ?auto_90161 ) ( not ( = ?auto_90161 ?auto_90162 ) ) ( not ( = ?auto_90161 ?auto_90163 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90162 ?auto_90163 )
      ( MAKE-2CRATE-VERIFY ?auto_90161 ?auto_90162 ?auto_90163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90167 - SURFACE
      ?auto_90168 - SURFACE
    )
    :vars
    (
      ?auto_90172 - HOIST
      ?auto_90170 - PLACE
      ?auto_90171 - TRUCK
      ?auto_90169 - SURFACE
      ?auto_90173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90172 ?auto_90170 ) ( SURFACE-AT ?auto_90167 ?auto_90170 ) ( CLEAR ?auto_90167 ) ( IS-CRATE ?auto_90168 ) ( not ( = ?auto_90167 ?auto_90168 ) ) ( AVAILABLE ?auto_90172 ) ( IN ?auto_90168 ?auto_90171 ) ( ON ?auto_90167 ?auto_90169 ) ( not ( = ?auto_90169 ?auto_90167 ) ) ( not ( = ?auto_90169 ?auto_90168 ) ) ( TRUCK-AT ?auto_90171 ?auto_90173 ) ( not ( = ?auto_90173 ?auto_90170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90171 ?auto_90173 ?auto_90170 )
      ( MAKE-2CRATE ?auto_90169 ?auto_90167 ?auto_90168 )
      ( MAKE-1CRATE-VERIFY ?auto_90167 ?auto_90168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90174 - SURFACE
      ?auto_90175 - SURFACE
      ?auto_90176 - SURFACE
    )
    :vars
    (
      ?auto_90177 - HOIST
      ?auto_90180 - PLACE
      ?auto_90178 - TRUCK
      ?auto_90179 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90177 ?auto_90180 ) ( SURFACE-AT ?auto_90175 ?auto_90180 ) ( CLEAR ?auto_90175 ) ( IS-CRATE ?auto_90176 ) ( not ( = ?auto_90175 ?auto_90176 ) ) ( AVAILABLE ?auto_90177 ) ( IN ?auto_90176 ?auto_90178 ) ( ON ?auto_90175 ?auto_90174 ) ( not ( = ?auto_90174 ?auto_90175 ) ) ( not ( = ?auto_90174 ?auto_90176 ) ) ( TRUCK-AT ?auto_90178 ?auto_90179 ) ( not ( = ?auto_90179 ?auto_90180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90175 ?auto_90176 )
      ( MAKE-2CRATE-VERIFY ?auto_90174 ?auto_90175 ?auto_90176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90181 - SURFACE
      ?auto_90182 - SURFACE
    )
    :vars
    (
      ?auto_90186 - HOIST
      ?auto_90183 - PLACE
      ?auto_90184 - SURFACE
      ?auto_90187 - TRUCK
      ?auto_90185 - PLACE
      ?auto_90188 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90186 ?auto_90183 ) ( SURFACE-AT ?auto_90181 ?auto_90183 ) ( CLEAR ?auto_90181 ) ( IS-CRATE ?auto_90182 ) ( not ( = ?auto_90181 ?auto_90182 ) ) ( AVAILABLE ?auto_90186 ) ( ON ?auto_90181 ?auto_90184 ) ( not ( = ?auto_90184 ?auto_90181 ) ) ( not ( = ?auto_90184 ?auto_90182 ) ) ( TRUCK-AT ?auto_90187 ?auto_90185 ) ( not ( = ?auto_90185 ?auto_90183 ) ) ( HOIST-AT ?auto_90188 ?auto_90185 ) ( LIFTING ?auto_90188 ?auto_90182 ) ( not ( = ?auto_90186 ?auto_90188 ) ) )
    :subtasks
    ( ( !LOAD ?auto_90188 ?auto_90182 ?auto_90187 ?auto_90185 )
      ( MAKE-2CRATE ?auto_90184 ?auto_90181 ?auto_90182 )
      ( MAKE-1CRATE-VERIFY ?auto_90181 ?auto_90182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90189 - SURFACE
      ?auto_90190 - SURFACE
      ?auto_90191 - SURFACE
    )
    :vars
    (
      ?auto_90195 - HOIST
      ?auto_90196 - PLACE
      ?auto_90192 - TRUCK
      ?auto_90193 - PLACE
      ?auto_90194 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90195 ?auto_90196 ) ( SURFACE-AT ?auto_90190 ?auto_90196 ) ( CLEAR ?auto_90190 ) ( IS-CRATE ?auto_90191 ) ( not ( = ?auto_90190 ?auto_90191 ) ) ( AVAILABLE ?auto_90195 ) ( ON ?auto_90190 ?auto_90189 ) ( not ( = ?auto_90189 ?auto_90190 ) ) ( not ( = ?auto_90189 ?auto_90191 ) ) ( TRUCK-AT ?auto_90192 ?auto_90193 ) ( not ( = ?auto_90193 ?auto_90196 ) ) ( HOIST-AT ?auto_90194 ?auto_90193 ) ( LIFTING ?auto_90194 ?auto_90191 ) ( not ( = ?auto_90195 ?auto_90194 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90190 ?auto_90191 )
      ( MAKE-2CRATE-VERIFY ?auto_90189 ?auto_90190 ?auto_90191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90197 - SURFACE
      ?auto_90198 - SURFACE
    )
    :vars
    (
      ?auto_90202 - HOIST
      ?auto_90204 - PLACE
      ?auto_90199 - SURFACE
      ?auto_90203 - TRUCK
      ?auto_90201 - PLACE
      ?auto_90200 - HOIST
      ?auto_90205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90202 ?auto_90204 ) ( SURFACE-AT ?auto_90197 ?auto_90204 ) ( CLEAR ?auto_90197 ) ( IS-CRATE ?auto_90198 ) ( not ( = ?auto_90197 ?auto_90198 ) ) ( AVAILABLE ?auto_90202 ) ( ON ?auto_90197 ?auto_90199 ) ( not ( = ?auto_90199 ?auto_90197 ) ) ( not ( = ?auto_90199 ?auto_90198 ) ) ( TRUCK-AT ?auto_90203 ?auto_90201 ) ( not ( = ?auto_90201 ?auto_90204 ) ) ( HOIST-AT ?auto_90200 ?auto_90201 ) ( not ( = ?auto_90202 ?auto_90200 ) ) ( AVAILABLE ?auto_90200 ) ( SURFACE-AT ?auto_90198 ?auto_90201 ) ( ON ?auto_90198 ?auto_90205 ) ( CLEAR ?auto_90198 ) ( not ( = ?auto_90197 ?auto_90205 ) ) ( not ( = ?auto_90198 ?auto_90205 ) ) ( not ( = ?auto_90199 ?auto_90205 ) ) )
    :subtasks
    ( ( !LIFT ?auto_90200 ?auto_90198 ?auto_90205 ?auto_90201 )
      ( MAKE-2CRATE ?auto_90199 ?auto_90197 ?auto_90198 )
      ( MAKE-1CRATE-VERIFY ?auto_90197 ?auto_90198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90206 - SURFACE
      ?auto_90207 - SURFACE
      ?auto_90208 - SURFACE
    )
    :vars
    (
      ?auto_90212 - HOIST
      ?auto_90210 - PLACE
      ?auto_90209 - TRUCK
      ?auto_90214 - PLACE
      ?auto_90211 - HOIST
      ?auto_90213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90212 ?auto_90210 ) ( SURFACE-AT ?auto_90207 ?auto_90210 ) ( CLEAR ?auto_90207 ) ( IS-CRATE ?auto_90208 ) ( not ( = ?auto_90207 ?auto_90208 ) ) ( AVAILABLE ?auto_90212 ) ( ON ?auto_90207 ?auto_90206 ) ( not ( = ?auto_90206 ?auto_90207 ) ) ( not ( = ?auto_90206 ?auto_90208 ) ) ( TRUCK-AT ?auto_90209 ?auto_90214 ) ( not ( = ?auto_90214 ?auto_90210 ) ) ( HOIST-AT ?auto_90211 ?auto_90214 ) ( not ( = ?auto_90212 ?auto_90211 ) ) ( AVAILABLE ?auto_90211 ) ( SURFACE-AT ?auto_90208 ?auto_90214 ) ( ON ?auto_90208 ?auto_90213 ) ( CLEAR ?auto_90208 ) ( not ( = ?auto_90207 ?auto_90213 ) ) ( not ( = ?auto_90208 ?auto_90213 ) ) ( not ( = ?auto_90206 ?auto_90213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90207 ?auto_90208 )
      ( MAKE-2CRATE-VERIFY ?auto_90206 ?auto_90207 ?auto_90208 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90215 - SURFACE
      ?auto_90216 - SURFACE
    )
    :vars
    (
      ?auto_90223 - HOIST
      ?auto_90222 - PLACE
      ?auto_90218 - SURFACE
      ?auto_90221 - PLACE
      ?auto_90220 - HOIST
      ?auto_90219 - SURFACE
      ?auto_90217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90223 ?auto_90222 ) ( SURFACE-AT ?auto_90215 ?auto_90222 ) ( CLEAR ?auto_90215 ) ( IS-CRATE ?auto_90216 ) ( not ( = ?auto_90215 ?auto_90216 ) ) ( AVAILABLE ?auto_90223 ) ( ON ?auto_90215 ?auto_90218 ) ( not ( = ?auto_90218 ?auto_90215 ) ) ( not ( = ?auto_90218 ?auto_90216 ) ) ( not ( = ?auto_90221 ?auto_90222 ) ) ( HOIST-AT ?auto_90220 ?auto_90221 ) ( not ( = ?auto_90223 ?auto_90220 ) ) ( AVAILABLE ?auto_90220 ) ( SURFACE-AT ?auto_90216 ?auto_90221 ) ( ON ?auto_90216 ?auto_90219 ) ( CLEAR ?auto_90216 ) ( not ( = ?auto_90215 ?auto_90219 ) ) ( not ( = ?auto_90216 ?auto_90219 ) ) ( not ( = ?auto_90218 ?auto_90219 ) ) ( TRUCK-AT ?auto_90217 ?auto_90222 ) )
    :subtasks
    ( ( !DRIVE ?auto_90217 ?auto_90222 ?auto_90221 )
      ( MAKE-2CRATE ?auto_90218 ?auto_90215 ?auto_90216 )
      ( MAKE-1CRATE-VERIFY ?auto_90215 ?auto_90216 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90224 - SURFACE
      ?auto_90225 - SURFACE
      ?auto_90226 - SURFACE
    )
    :vars
    (
      ?auto_90230 - HOIST
      ?auto_90227 - PLACE
      ?auto_90231 - PLACE
      ?auto_90229 - HOIST
      ?auto_90232 - SURFACE
      ?auto_90228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90230 ?auto_90227 ) ( SURFACE-AT ?auto_90225 ?auto_90227 ) ( CLEAR ?auto_90225 ) ( IS-CRATE ?auto_90226 ) ( not ( = ?auto_90225 ?auto_90226 ) ) ( AVAILABLE ?auto_90230 ) ( ON ?auto_90225 ?auto_90224 ) ( not ( = ?auto_90224 ?auto_90225 ) ) ( not ( = ?auto_90224 ?auto_90226 ) ) ( not ( = ?auto_90231 ?auto_90227 ) ) ( HOIST-AT ?auto_90229 ?auto_90231 ) ( not ( = ?auto_90230 ?auto_90229 ) ) ( AVAILABLE ?auto_90229 ) ( SURFACE-AT ?auto_90226 ?auto_90231 ) ( ON ?auto_90226 ?auto_90232 ) ( CLEAR ?auto_90226 ) ( not ( = ?auto_90225 ?auto_90232 ) ) ( not ( = ?auto_90226 ?auto_90232 ) ) ( not ( = ?auto_90224 ?auto_90232 ) ) ( TRUCK-AT ?auto_90228 ?auto_90227 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90225 ?auto_90226 )
      ( MAKE-2CRATE-VERIFY ?auto_90224 ?auto_90225 ?auto_90226 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90233 - SURFACE
      ?auto_90234 - SURFACE
    )
    :vars
    (
      ?auto_90237 - HOIST
      ?auto_90236 - PLACE
      ?auto_90240 - SURFACE
      ?auto_90241 - PLACE
      ?auto_90235 - HOIST
      ?auto_90238 - SURFACE
      ?auto_90239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90237 ?auto_90236 ) ( IS-CRATE ?auto_90234 ) ( not ( = ?auto_90233 ?auto_90234 ) ) ( not ( = ?auto_90240 ?auto_90233 ) ) ( not ( = ?auto_90240 ?auto_90234 ) ) ( not ( = ?auto_90241 ?auto_90236 ) ) ( HOIST-AT ?auto_90235 ?auto_90241 ) ( not ( = ?auto_90237 ?auto_90235 ) ) ( AVAILABLE ?auto_90235 ) ( SURFACE-AT ?auto_90234 ?auto_90241 ) ( ON ?auto_90234 ?auto_90238 ) ( CLEAR ?auto_90234 ) ( not ( = ?auto_90233 ?auto_90238 ) ) ( not ( = ?auto_90234 ?auto_90238 ) ) ( not ( = ?auto_90240 ?auto_90238 ) ) ( TRUCK-AT ?auto_90239 ?auto_90236 ) ( SURFACE-AT ?auto_90240 ?auto_90236 ) ( CLEAR ?auto_90240 ) ( LIFTING ?auto_90237 ?auto_90233 ) ( IS-CRATE ?auto_90233 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90240 ?auto_90233 )
      ( MAKE-2CRATE ?auto_90240 ?auto_90233 ?auto_90234 )
      ( MAKE-1CRATE-VERIFY ?auto_90233 ?auto_90234 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90242 - SURFACE
      ?auto_90243 - SURFACE
      ?auto_90244 - SURFACE
    )
    :vars
    (
      ?auto_90247 - HOIST
      ?auto_90246 - PLACE
      ?auto_90249 - PLACE
      ?auto_90250 - HOIST
      ?auto_90245 - SURFACE
      ?auto_90248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90247 ?auto_90246 ) ( IS-CRATE ?auto_90244 ) ( not ( = ?auto_90243 ?auto_90244 ) ) ( not ( = ?auto_90242 ?auto_90243 ) ) ( not ( = ?auto_90242 ?auto_90244 ) ) ( not ( = ?auto_90249 ?auto_90246 ) ) ( HOIST-AT ?auto_90250 ?auto_90249 ) ( not ( = ?auto_90247 ?auto_90250 ) ) ( AVAILABLE ?auto_90250 ) ( SURFACE-AT ?auto_90244 ?auto_90249 ) ( ON ?auto_90244 ?auto_90245 ) ( CLEAR ?auto_90244 ) ( not ( = ?auto_90243 ?auto_90245 ) ) ( not ( = ?auto_90244 ?auto_90245 ) ) ( not ( = ?auto_90242 ?auto_90245 ) ) ( TRUCK-AT ?auto_90248 ?auto_90246 ) ( SURFACE-AT ?auto_90242 ?auto_90246 ) ( CLEAR ?auto_90242 ) ( LIFTING ?auto_90247 ?auto_90243 ) ( IS-CRATE ?auto_90243 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90243 ?auto_90244 )
      ( MAKE-2CRATE-VERIFY ?auto_90242 ?auto_90243 ?auto_90244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90251 - SURFACE
      ?auto_90252 - SURFACE
    )
    :vars
    (
      ?auto_90253 - HOIST
      ?auto_90258 - PLACE
      ?auto_90257 - SURFACE
      ?auto_90254 - PLACE
      ?auto_90259 - HOIST
      ?auto_90256 - SURFACE
      ?auto_90255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90253 ?auto_90258 ) ( IS-CRATE ?auto_90252 ) ( not ( = ?auto_90251 ?auto_90252 ) ) ( not ( = ?auto_90257 ?auto_90251 ) ) ( not ( = ?auto_90257 ?auto_90252 ) ) ( not ( = ?auto_90254 ?auto_90258 ) ) ( HOIST-AT ?auto_90259 ?auto_90254 ) ( not ( = ?auto_90253 ?auto_90259 ) ) ( AVAILABLE ?auto_90259 ) ( SURFACE-AT ?auto_90252 ?auto_90254 ) ( ON ?auto_90252 ?auto_90256 ) ( CLEAR ?auto_90252 ) ( not ( = ?auto_90251 ?auto_90256 ) ) ( not ( = ?auto_90252 ?auto_90256 ) ) ( not ( = ?auto_90257 ?auto_90256 ) ) ( TRUCK-AT ?auto_90255 ?auto_90258 ) ( SURFACE-AT ?auto_90257 ?auto_90258 ) ( CLEAR ?auto_90257 ) ( IS-CRATE ?auto_90251 ) ( AVAILABLE ?auto_90253 ) ( IN ?auto_90251 ?auto_90255 ) )
    :subtasks
    ( ( !UNLOAD ?auto_90253 ?auto_90251 ?auto_90255 ?auto_90258 )
      ( MAKE-2CRATE ?auto_90257 ?auto_90251 ?auto_90252 )
      ( MAKE-1CRATE-VERIFY ?auto_90251 ?auto_90252 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90260 - SURFACE
      ?auto_90261 - SURFACE
      ?auto_90262 - SURFACE
    )
    :vars
    (
      ?auto_90263 - HOIST
      ?auto_90264 - PLACE
      ?auto_90268 - PLACE
      ?auto_90265 - HOIST
      ?auto_90266 - SURFACE
      ?auto_90267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90263 ?auto_90264 ) ( IS-CRATE ?auto_90262 ) ( not ( = ?auto_90261 ?auto_90262 ) ) ( not ( = ?auto_90260 ?auto_90261 ) ) ( not ( = ?auto_90260 ?auto_90262 ) ) ( not ( = ?auto_90268 ?auto_90264 ) ) ( HOIST-AT ?auto_90265 ?auto_90268 ) ( not ( = ?auto_90263 ?auto_90265 ) ) ( AVAILABLE ?auto_90265 ) ( SURFACE-AT ?auto_90262 ?auto_90268 ) ( ON ?auto_90262 ?auto_90266 ) ( CLEAR ?auto_90262 ) ( not ( = ?auto_90261 ?auto_90266 ) ) ( not ( = ?auto_90262 ?auto_90266 ) ) ( not ( = ?auto_90260 ?auto_90266 ) ) ( TRUCK-AT ?auto_90267 ?auto_90264 ) ( SURFACE-AT ?auto_90260 ?auto_90264 ) ( CLEAR ?auto_90260 ) ( IS-CRATE ?auto_90261 ) ( AVAILABLE ?auto_90263 ) ( IN ?auto_90261 ?auto_90267 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90261 ?auto_90262 )
      ( MAKE-2CRATE-VERIFY ?auto_90260 ?auto_90261 ?auto_90262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90305 - SURFACE
      ?auto_90306 - SURFACE
    )
    :vars
    (
      ?auto_90308 - HOIST
      ?auto_90310 - PLACE
      ?auto_90312 - SURFACE
      ?auto_90307 - PLACE
      ?auto_90309 - HOIST
      ?auto_90313 - SURFACE
      ?auto_90311 - TRUCK
      ?auto_90314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90308 ?auto_90310 ) ( SURFACE-AT ?auto_90305 ?auto_90310 ) ( CLEAR ?auto_90305 ) ( IS-CRATE ?auto_90306 ) ( not ( = ?auto_90305 ?auto_90306 ) ) ( AVAILABLE ?auto_90308 ) ( ON ?auto_90305 ?auto_90312 ) ( not ( = ?auto_90312 ?auto_90305 ) ) ( not ( = ?auto_90312 ?auto_90306 ) ) ( not ( = ?auto_90307 ?auto_90310 ) ) ( HOIST-AT ?auto_90309 ?auto_90307 ) ( not ( = ?auto_90308 ?auto_90309 ) ) ( AVAILABLE ?auto_90309 ) ( SURFACE-AT ?auto_90306 ?auto_90307 ) ( ON ?auto_90306 ?auto_90313 ) ( CLEAR ?auto_90306 ) ( not ( = ?auto_90305 ?auto_90313 ) ) ( not ( = ?auto_90306 ?auto_90313 ) ) ( not ( = ?auto_90312 ?auto_90313 ) ) ( TRUCK-AT ?auto_90311 ?auto_90314 ) ( not ( = ?auto_90314 ?auto_90310 ) ) ( not ( = ?auto_90307 ?auto_90314 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90311 ?auto_90314 ?auto_90310 )
      ( MAKE-1CRATE ?auto_90305 ?auto_90306 )
      ( MAKE-1CRATE-VERIFY ?auto_90305 ?auto_90306 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90345 - SURFACE
      ?auto_90346 - SURFACE
      ?auto_90347 - SURFACE
      ?auto_90344 - SURFACE
    )
    :vars
    (
      ?auto_90348 - HOIST
      ?auto_90349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90348 ?auto_90349 ) ( SURFACE-AT ?auto_90347 ?auto_90349 ) ( CLEAR ?auto_90347 ) ( LIFTING ?auto_90348 ?auto_90344 ) ( IS-CRATE ?auto_90344 ) ( not ( = ?auto_90347 ?auto_90344 ) ) ( ON ?auto_90346 ?auto_90345 ) ( ON ?auto_90347 ?auto_90346 ) ( not ( = ?auto_90345 ?auto_90346 ) ) ( not ( = ?auto_90345 ?auto_90347 ) ) ( not ( = ?auto_90345 ?auto_90344 ) ) ( not ( = ?auto_90346 ?auto_90347 ) ) ( not ( = ?auto_90346 ?auto_90344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90347 ?auto_90344 )
      ( MAKE-3CRATE-VERIFY ?auto_90345 ?auto_90346 ?auto_90347 ?auto_90344 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90362 - SURFACE
      ?auto_90363 - SURFACE
      ?auto_90364 - SURFACE
      ?auto_90361 - SURFACE
    )
    :vars
    (
      ?auto_90366 - HOIST
      ?auto_90365 - PLACE
      ?auto_90367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90366 ?auto_90365 ) ( SURFACE-AT ?auto_90364 ?auto_90365 ) ( CLEAR ?auto_90364 ) ( IS-CRATE ?auto_90361 ) ( not ( = ?auto_90364 ?auto_90361 ) ) ( TRUCK-AT ?auto_90367 ?auto_90365 ) ( AVAILABLE ?auto_90366 ) ( IN ?auto_90361 ?auto_90367 ) ( ON ?auto_90364 ?auto_90363 ) ( not ( = ?auto_90363 ?auto_90364 ) ) ( not ( = ?auto_90363 ?auto_90361 ) ) ( ON ?auto_90363 ?auto_90362 ) ( not ( = ?auto_90362 ?auto_90363 ) ) ( not ( = ?auto_90362 ?auto_90364 ) ) ( not ( = ?auto_90362 ?auto_90361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90363 ?auto_90364 ?auto_90361 )
      ( MAKE-3CRATE-VERIFY ?auto_90362 ?auto_90363 ?auto_90364 ?auto_90361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90383 - SURFACE
      ?auto_90384 - SURFACE
      ?auto_90385 - SURFACE
      ?auto_90382 - SURFACE
    )
    :vars
    (
      ?auto_90388 - HOIST
      ?auto_90386 - PLACE
      ?auto_90387 - TRUCK
      ?auto_90389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90388 ?auto_90386 ) ( SURFACE-AT ?auto_90385 ?auto_90386 ) ( CLEAR ?auto_90385 ) ( IS-CRATE ?auto_90382 ) ( not ( = ?auto_90385 ?auto_90382 ) ) ( AVAILABLE ?auto_90388 ) ( IN ?auto_90382 ?auto_90387 ) ( ON ?auto_90385 ?auto_90384 ) ( not ( = ?auto_90384 ?auto_90385 ) ) ( not ( = ?auto_90384 ?auto_90382 ) ) ( TRUCK-AT ?auto_90387 ?auto_90389 ) ( not ( = ?auto_90389 ?auto_90386 ) ) ( ON ?auto_90384 ?auto_90383 ) ( not ( = ?auto_90383 ?auto_90384 ) ) ( not ( = ?auto_90383 ?auto_90385 ) ) ( not ( = ?auto_90383 ?auto_90382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90384 ?auto_90385 ?auto_90382 )
      ( MAKE-3CRATE-VERIFY ?auto_90383 ?auto_90384 ?auto_90385 ?auto_90382 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90407 - SURFACE
      ?auto_90408 - SURFACE
      ?auto_90409 - SURFACE
      ?auto_90406 - SURFACE
    )
    :vars
    (
      ?auto_90411 - HOIST
      ?auto_90412 - PLACE
      ?auto_90414 - TRUCK
      ?auto_90413 - PLACE
      ?auto_90410 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90411 ?auto_90412 ) ( SURFACE-AT ?auto_90409 ?auto_90412 ) ( CLEAR ?auto_90409 ) ( IS-CRATE ?auto_90406 ) ( not ( = ?auto_90409 ?auto_90406 ) ) ( AVAILABLE ?auto_90411 ) ( ON ?auto_90409 ?auto_90408 ) ( not ( = ?auto_90408 ?auto_90409 ) ) ( not ( = ?auto_90408 ?auto_90406 ) ) ( TRUCK-AT ?auto_90414 ?auto_90413 ) ( not ( = ?auto_90413 ?auto_90412 ) ) ( HOIST-AT ?auto_90410 ?auto_90413 ) ( LIFTING ?auto_90410 ?auto_90406 ) ( not ( = ?auto_90411 ?auto_90410 ) ) ( ON ?auto_90408 ?auto_90407 ) ( not ( = ?auto_90407 ?auto_90408 ) ) ( not ( = ?auto_90407 ?auto_90409 ) ) ( not ( = ?auto_90407 ?auto_90406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90408 ?auto_90409 ?auto_90406 )
      ( MAKE-3CRATE-VERIFY ?auto_90407 ?auto_90408 ?auto_90409 ?auto_90406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90434 - SURFACE
      ?auto_90435 - SURFACE
      ?auto_90436 - SURFACE
      ?auto_90433 - SURFACE
    )
    :vars
    (
      ?auto_90438 - HOIST
      ?auto_90440 - PLACE
      ?auto_90441 - TRUCK
      ?auto_90439 - PLACE
      ?auto_90442 - HOIST
      ?auto_90437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90438 ?auto_90440 ) ( SURFACE-AT ?auto_90436 ?auto_90440 ) ( CLEAR ?auto_90436 ) ( IS-CRATE ?auto_90433 ) ( not ( = ?auto_90436 ?auto_90433 ) ) ( AVAILABLE ?auto_90438 ) ( ON ?auto_90436 ?auto_90435 ) ( not ( = ?auto_90435 ?auto_90436 ) ) ( not ( = ?auto_90435 ?auto_90433 ) ) ( TRUCK-AT ?auto_90441 ?auto_90439 ) ( not ( = ?auto_90439 ?auto_90440 ) ) ( HOIST-AT ?auto_90442 ?auto_90439 ) ( not ( = ?auto_90438 ?auto_90442 ) ) ( AVAILABLE ?auto_90442 ) ( SURFACE-AT ?auto_90433 ?auto_90439 ) ( ON ?auto_90433 ?auto_90437 ) ( CLEAR ?auto_90433 ) ( not ( = ?auto_90436 ?auto_90437 ) ) ( not ( = ?auto_90433 ?auto_90437 ) ) ( not ( = ?auto_90435 ?auto_90437 ) ) ( ON ?auto_90435 ?auto_90434 ) ( not ( = ?auto_90434 ?auto_90435 ) ) ( not ( = ?auto_90434 ?auto_90436 ) ) ( not ( = ?auto_90434 ?auto_90433 ) ) ( not ( = ?auto_90434 ?auto_90437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90435 ?auto_90436 ?auto_90433 )
      ( MAKE-3CRATE-VERIFY ?auto_90434 ?auto_90435 ?auto_90436 ?auto_90433 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90462 - SURFACE
      ?auto_90463 - SURFACE
      ?auto_90464 - SURFACE
      ?auto_90461 - SURFACE
    )
    :vars
    (
      ?auto_90466 - HOIST
      ?auto_90467 - PLACE
      ?auto_90469 - PLACE
      ?auto_90468 - HOIST
      ?auto_90465 - SURFACE
      ?auto_90470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90466 ?auto_90467 ) ( SURFACE-AT ?auto_90464 ?auto_90467 ) ( CLEAR ?auto_90464 ) ( IS-CRATE ?auto_90461 ) ( not ( = ?auto_90464 ?auto_90461 ) ) ( AVAILABLE ?auto_90466 ) ( ON ?auto_90464 ?auto_90463 ) ( not ( = ?auto_90463 ?auto_90464 ) ) ( not ( = ?auto_90463 ?auto_90461 ) ) ( not ( = ?auto_90469 ?auto_90467 ) ) ( HOIST-AT ?auto_90468 ?auto_90469 ) ( not ( = ?auto_90466 ?auto_90468 ) ) ( AVAILABLE ?auto_90468 ) ( SURFACE-AT ?auto_90461 ?auto_90469 ) ( ON ?auto_90461 ?auto_90465 ) ( CLEAR ?auto_90461 ) ( not ( = ?auto_90464 ?auto_90465 ) ) ( not ( = ?auto_90461 ?auto_90465 ) ) ( not ( = ?auto_90463 ?auto_90465 ) ) ( TRUCK-AT ?auto_90470 ?auto_90467 ) ( ON ?auto_90463 ?auto_90462 ) ( not ( = ?auto_90462 ?auto_90463 ) ) ( not ( = ?auto_90462 ?auto_90464 ) ) ( not ( = ?auto_90462 ?auto_90461 ) ) ( not ( = ?auto_90462 ?auto_90465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90463 ?auto_90464 ?auto_90461 )
      ( MAKE-3CRATE-VERIFY ?auto_90462 ?auto_90463 ?auto_90464 ?auto_90461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90490 - SURFACE
      ?auto_90491 - SURFACE
      ?auto_90492 - SURFACE
      ?auto_90489 - SURFACE
    )
    :vars
    (
      ?auto_90495 - HOIST
      ?auto_90496 - PLACE
      ?auto_90494 - PLACE
      ?auto_90497 - HOIST
      ?auto_90493 - SURFACE
      ?auto_90498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90495 ?auto_90496 ) ( IS-CRATE ?auto_90489 ) ( not ( = ?auto_90492 ?auto_90489 ) ) ( not ( = ?auto_90491 ?auto_90492 ) ) ( not ( = ?auto_90491 ?auto_90489 ) ) ( not ( = ?auto_90494 ?auto_90496 ) ) ( HOIST-AT ?auto_90497 ?auto_90494 ) ( not ( = ?auto_90495 ?auto_90497 ) ) ( AVAILABLE ?auto_90497 ) ( SURFACE-AT ?auto_90489 ?auto_90494 ) ( ON ?auto_90489 ?auto_90493 ) ( CLEAR ?auto_90489 ) ( not ( = ?auto_90492 ?auto_90493 ) ) ( not ( = ?auto_90489 ?auto_90493 ) ) ( not ( = ?auto_90491 ?auto_90493 ) ) ( TRUCK-AT ?auto_90498 ?auto_90496 ) ( SURFACE-AT ?auto_90491 ?auto_90496 ) ( CLEAR ?auto_90491 ) ( LIFTING ?auto_90495 ?auto_90492 ) ( IS-CRATE ?auto_90492 ) ( ON ?auto_90491 ?auto_90490 ) ( not ( = ?auto_90490 ?auto_90491 ) ) ( not ( = ?auto_90490 ?auto_90492 ) ) ( not ( = ?auto_90490 ?auto_90489 ) ) ( not ( = ?auto_90490 ?auto_90493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90491 ?auto_90492 ?auto_90489 )
      ( MAKE-3CRATE-VERIFY ?auto_90490 ?auto_90491 ?auto_90492 ?auto_90489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90518 - SURFACE
      ?auto_90519 - SURFACE
      ?auto_90520 - SURFACE
      ?auto_90517 - SURFACE
    )
    :vars
    (
      ?auto_90525 - HOIST
      ?auto_90522 - PLACE
      ?auto_90524 - PLACE
      ?auto_90526 - HOIST
      ?auto_90521 - SURFACE
      ?auto_90523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90525 ?auto_90522 ) ( IS-CRATE ?auto_90517 ) ( not ( = ?auto_90520 ?auto_90517 ) ) ( not ( = ?auto_90519 ?auto_90520 ) ) ( not ( = ?auto_90519 ?auto_90517 ) ) ( not ( = ?auto_90524 ?auto_90522 ) ) ( HOIST-AT ?auto_90526 ?auto_90524 ) ( not ( = ?auto_90525 ?auto_90526 ) ) ( AVAILABLE ?auto_90526 ) ( SURFACE-AT ?auto_90517 ?auto_90524 ) ( ON ?auto_90517 ?auto_90521 ) ( CLEAR ?auto_90517 ) ( not ( = ?auto_90520 ?auto_90521 ) ) ( not ( = ?auto_90517 ?auto_90521 ) ) ( not ( = ?auto_90519 ?auto_90521 ) ) ( TRUCK-AT ?auto_90523 ?auto_90522 ) ( SURFACE-AT ?auto_90519 ?auto_90522 ) ( CLEAR ?auto_90519 ) ( IS-CRATE ?auto_90520 ) ( AVAILABLE ?auto_90525 ) ( IN ?auto_90520 ?auto_90523 ) ( ON ?auto_90519 ?auto_90518 ) ( not ( = ?auto_90518 ?auto_90519 ) ) ( not ( = ?auto_90518 ?auto_90520 ) ) ( not ( = ?auto_90518 ?auto_90517 ) ) ( not ( = ?auto_90518 ?auto_90521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90519 ?auto_90520 ?auto_90517 )
      ( MAKE-3CRATE-VERIFY ?auto_90518 ?auto_90519 ?auto_90520 ?auto_90517 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90809 - SURFACE
      ?auto_90810 - SURFACE
      ?auto_90811 - SURFACE
      ?auto_90808 - SURFACE
      ?auto_90812 - SURFACE
    )
    :vars
    (
      ?auto_90814 - HOIST
      ?auto_90813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90814 ?auto_90813 ) ( SURFACE-AT ?auto_90808 ?auto_90813 ) ( CLEAR ?auto_90808 ) ( LIFTING ?auto_90814 ?auto_90812 ) ( IS-CRATE ?auto_90812 ) ( not ( = ?auto_90808 ?auto_90812 ) ) ( ON ?auto_90810 ?auto_90809 ) ( ON ?auto_90811 ?auto_90810 ) ( ON ?auto_90808 ?auto_90811 ) ( not ( = ?auto_90809 ?auto_90810 ) ) ( not ( = ?auto_90809 ?auto_90811 ) ) ( not ( = ?auto_90809 ?auto_90808 ) ) ( not ( = ?auto_90809 ?auto_90812 ) ) ( not ( = ?auto_90810 ?auto_90811 ) ) ( not ( = ?auto_90810 ?auto_90808 ) ) ( not ( = ?auto_90810 ?auto_90812 ) ) ( not ( = ?auto_90811 ?auto_90808 ) ) ( not ( = ?auto_90811 ?auto_90812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90808 ?auto_90812 )
      ( MAKE-4CRATE-VERIFY ?auto_90809 ?auto_90810 ?auto_90811 ?auto_90808 ?auto_90812 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90834 - SURFACE
      ?auto_90835 - SURFACE
      ?auto_90836 - SURFACE
      ?auto_90833 - SURFACE
      ?auto_90837 - SURFACE
    )
    :vars
    (
      ?auto_90839 - HOIST
      ?auto_90838 - PLACE
      ?auto_90840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90839 ?auto_90838 ) ( SURFACE-AT ?auto_90833 ?auto_90838 ) ( CLEAR ?auto_90833 ) ( IS-CRATE ?auto_90837 ) ( not ( = ?auto_90833 ?auto_90837 ) ) ( TRUCK-AT ?auto_90840 ?auto_90838 ) ( AVAILABLE ?auto_90839 ) ( IN ?auto_90837 ?auto_90840 ) ( ON ?auto_90833 ?auto_90836 ) ( not ( = ?auto_90836 ?auto_90833 ) ) ( not ( = ?auto_90836 ?auto_90837 ) ) ( ON ?auto_90835 ?auto_90834 ) ( ON ?auto_90836 ?auto_90835 ) ( not ( = ?auto_90834 ?auto_90835 ) ) ( not ( = ?auto_90834 ?auto_90836 ) ) ( not ( = ?auto_90834 ?auto_90833 ) ) ( not ( = ?auto_90834 ?auto_90837 ) ) ( not ( = ?auto_90835 ?auto_90836 ) ) ( not ( = ?auto_90835 ?auto_90833 ) ) ( not ( = ?auto_90835 ?auto_90837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90836 ?auto_90833 ?auto_90837 )
      ( MAKE-4CRATE-VERIFY ?auto_90834 ?auto_90835 ?auto_90836 ?auto_90833 ?auto_90837 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90864 - SURFACE
      ?auto_90865 - SURFACE
      ?auto_90866 - SURFACE
      ?auto_90863 - SURFACE
      ?auto_90867 - SURFACE
    )
    :vars
    (
      ?auto_90871 - HOIST
      ?auto_90868 - PLACE
      ?auto_90870 - TRUCK
      ?auto_90869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90871 ?auto_90868 ) ( SURFACE-AT ?auto_90863 ?auto_90868 ) ( CLEAR ?auto_90863 ) ( IS-CRATE ?auto_90867 ) ( not ( = ?auto_90863 ?auto_90867 ) ) ( AVAILABLE ?auto_90871 ) ( IN ?auto_90867 ?auto_90870 ) ( ON ?auto_90863 ?auto_90866 ) ( not ( = ?auto_90866 ?auto_90863 ) ) ( not ( = ?auto_90866 ?auto_90867 ) ) ( TRUCK-AT ?auto_90870 ?auto_90869 ) ( not ( = ?auto_90869 ?auto_90868 ) ) ( ON ?auto_90865 ?auto_90864 ) ( ON ?auto_90866 ?auto_90865 ) ( not ( = ?auto_90864 ?auto_90865 ) ) ( not ( = ?auto_90864 ?auto_90866 ) ) ( not ( = ?auto_90864 ?auto_90863 ) ) ( not ( = ?auto_90864 ?auto_90867 ) ) ( not ( = ?auto_90865 ?auto_90866 ) ) ( not ( = ?auto_90865 ?auto_90863 ) ) ( not ( = ?auto_90865 ?auto_90867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90866 ?auto_90863 ?auto_90867 )
      ( MAKE-4CRATE-VERIFY ?auto_90864 ?auto_90865 ?auto_90866 ?auto_90863 ?auto_90867 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90898 - SURFACE
      ?auto_90899 - SURFACE
      ?auto_90900 - SURFACE
      ?auto_90897 - SURFACE
      ?auto_90901 - SURFACE
    )
    :vars
    (
      ?auto_90904 - HOIST
      ?auto_90902 - PLACE
      ?auto_90903 - TRUCK
      ?auto_90906 - PLACE
      ?auto_90905 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90904 ?auto_90902 ) ( SURFACE-AT ?auto_90897 ?auto_90902 ) ( CLEAR ?auto_90897 ) ( IS-CRATE ?auto_90901 ) ( not ( = ?auto_90897 ?auto_90901 ) ) ( AVAILABLE ?auto_90904 ) ( ON ?auto_90897 ?auto_90900 ) ( not ( = ?auto_90900 ?auto_90897 ) ) ( not ( = ?auto_90900 ?auto_90901 ) ) ( TRUCK-AT ?auto_90903 ?auto_90906 ) ( not ( = ?auto_90906 ?auto_90902 ) ) ( HOIST-AT ?auto_90905 ?auto_90906 ) ( LIFTING ?auto_90905 ?auto_90901 ) ( not ( = ?auto_90904 ?auto_90905 ) ) ( ON ?auto_90899 ?auto_90898 ) ( ON ?auto_90900 ?auto_90899 ) ( not ( = ?auto_90898 ?auto_90899 ) ) ( not ( = ?auto_90898 ?auto_90900 ) ) ( not ( = ?auto_90898 ?auto_90897 ) ) ( not ( = ?auto_90898 ?auto_90901 ) ) ( not ( = ?auto_90899 ?auto_90900 ) ) ( not ( = ?auto_90899 ?auto_90897 ) ) ( not ( = ?auto_90899 ?auto_90901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90900 ?auto_90897 ?auto_90901 )
      ( MAKE-4CRATE-VERIFY ?auto_90898 ?auto_90899 ?auto_90900 ?auto_90897 ?auto_90901 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90936 - SURFACE
      ?auto_90937 - SURFACE
      ?auto_90938 - SURFACE
      ?auto_90935 - SURFACE
      ?auto_90939 - SURFACE
    )
    :vars
    (
      ?auto_90944 - HOIST
      ?auto_90945 - PLACE
      ?auto_90943 - TRUCK
      ?auto_90942 - PLACE
      ?auto_90940 - HOIST
      ?auto_90941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90944 ?auto_90945 ) ( SURFACE-AT ?auto_90935 ?auto_90945 ) ( CLEAR ?auto_90935 ) ( IS-CRATE ?auto_90939 ) ( not ( = ?auto_90935 ?auto_90939 ) ) ( AVAILABLE ?auto_90944 ) ( ON ?auto_90935 ?auto_90938 ) ( not ( = ?auto_90938 ?auto_90935 ) ) ( not ( = ?auto_90938 ?auto_90939 ) ) ( TRUCK-AT ?auto_90943 ?auto_90942 ) ( not ( = ?auto_90942 ?auto_90945 ) ) ( HOIST-AT ?auto_90940 ?auto_90942 ) ( not ( = ?auto_90944 ?auto_90940 ) ) ( AVAILABLE ?auto_90940 ) ( SURFACE-AT ?auto_90939 ?auto_90942 ) ( ON ?auto_90939 ?auto_90941 ) ( CLEAR ?auto_90939 ) ( not ( = ?auto_90935 ?auto_90941 ) ) ( not ( = ?auto_90939 ?auto_90941 ) ) ( not ( = ?auto_90938 ?auto_90941 ) ) ( ON ?auto_90937 ?auto_90936 ) ( ON ?auto_90938 ?auto_90937 ) ( not ( = ?auto_90936 ?auto_90937 ) ) ( not ( = ?auto_90936 ?auto_90938 ) ) ( not ( = ?auto_90936 ?auto_90935 ) ) ( not ( = ?auto_90936 ?auto_90939 ) ) ( not ( = ?auto_90936 ?auto_90941 ) ) ( not ( = ?auto_90937 ?auto_90938 ) ) ( not ( = ?auto_90937 ?auto_90935 ) ) ( not ( = ?auto_90937 ?auto_90939 ) ) ( not ( = ?auto_90937 ?auto_90941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90938 ?auto_90935 ?auto_90939 )
      ( MAKE-4CRATE-VERIFY ?auto_90936 ?auto_90937 ?auto_90938 ?auto_90935 ?auto_90939 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90975 - SURFACE
      ?auto_90976 - SURFACE
      ?auto_90977 - SURFACE
      ?auto_90974 - SURFACE
      ?auto_90978 - SURFACE
    )
    :vars
    (
      ?auto_90979 - HOIST
      ?auto_90983 - PLACE
      ?auto_90982 - PLACE
      ?auto_90981 - HOIST
      ?auto_90980 - SURFACE
      ?auto_90984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90979 ?auto_90983 ) ( SURFACE-AT ?auto_90974 ?auto_90983 ) ( CLEAR ?auto_90974 ) ( IS-CRATE ?auto_90978 ) ( not ( = ?auto_90974 ?auto_90978 ) ) ( AVAILABLE ?auto_90979 ) ( ON ?auto_90974 ?auto_90977 ) ( not ( = ?auto_90977 ?auto_90974 ) ) ( not ( = ?auto_90977 ?auto_90978 ) ) ( not ( = ?auto_90982 ?auto_90983 ) ) ( HOIST-AT ?auto_90981 ?auto_90982 ) ( not ( = ?auto_90979 ?auto_90981 ) ) ( AVAILABLE ?auto_90981 ) ( SURFACE-AT ?auto_90978 ?auto_90982 ) ( ON ?auto_90978 ?auto_90980 ) ( CLEAR ?auto_90978 ) ( not ( = ?auto_90974 ?auto_90980 ) ) ( not ( = ?auto_90978 ?auto_90980 ) ) ( not ( = ?auto_90977 ?auto_90980 ) ) ( TRUCK-AT ?auto_90984 ?auto_90983 ) ( ON ?auto_90976 ?auto_90975 ) ( ON ?auto_90977 ?auto_90976 ) ( not ( = ?auto_90975 ?auto_90976 ) ) ( not ( = ?auto_90975 ?auto_90977 ) ) ( not ( = ?auto_90975 ?auto_90974 ) ) ( not ( = ?auto_90975 ?auto_90978 ) ) ( not ( = ?auto_90975 ?auto_90980 ) ) ( not ( = ?auto_90976 ?auto_90977 ) ) ( not ( = ?auto_90976 ?auto_90974 ) ) ( not ( = ?auto_90976 ?auto_90978 ) ) ( not ( = ?auto_90976 ?auto_90980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90977 ?auto_90974 ?auto_90978 )
      ( MAKE-4CRATE-VERIFY ?auto_90975 ?auto_90976 ?auto_90977 ?auto_90974 ?auto_90978 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91014 - SURFACE
      ?auto_91015 - SURFACE
      ?auto_91016 - SURFACE
      ?auto_91013 - SURFACE
      ?auto_91017 - SURFACE
    )
    :vars
    (
      ?auto_91023 - HOIST
      ?auto_91018 - PLACE
      ?auto_91020 - PLACE
      ?auto_91021 - HOIST
      ?auto_91019 - SURFACE
      ?auto_91022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91023 ?auto_91018 ) ( IS-CRATE ?auto_91017 ) ( not ( = ?auto_91013 ?auto_91017 ) ) ( not ( = ?auto_91016 ?auto_91013 ) ) ( not ( = ?auto_91016 ?auto_91017 ) ) ( not ( = ?auto_91020 ?auto_91018 ) ) ( HOIST-AT ?auto_91021 ?auto_91020 ) ( not ( = ?auto_91023 ?auto_91021 ) ) ( AVAILABLE ?auto_91021 ) ( SURFACE-AT ?auto_91017 ?auto_91020 ) ( ON ?auto_91017 ?auto_91019 ) ( CLEAR ?auto_91017 ) ( not ( = ?auto_91013 ?auto_91019 ) ) ( not ( = ?auto_91017 ?auto_91019 ) ) ( not ( = ?auto_91016 ?auto_91019 ) ) ( TRUCK-AT ?auto_91022 ?auto_91018 ) ( SURFACE-AT ?auto_91016 ?auto_91018 ) ( CLEAR ?auto_91016 ) ( LIFTING ?auto_91023 ?auto_91013 ) ( IS-CRATE ?auto_91013 ) ( ON ?auto_91015 ?auto_91014 ) ( ON ?auto_91016 ?auto_91015 ) ( not ( = ?auto_91014 ?auto_91015 ) ) ( not ( = ?auto_91014 ?auto_91016 ) ) ( not ( = ?auto_91014 ?auto_91013 ) ) ( not ( = ?auto_91014 ?auto_91017 ) ) ( not ( = ?auto_91014 ?auto_91019 ) ) ( not ( = ?auto_91015 ?auto_91016 ) ) ( not ( = ?auto_91015 ?auto_91013 ) ) ( not ( = ?auto_91015 ?auto_91017 ) ) ( not ( = ?auto_91015 ?auto_91019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91016 ?auto_91013 ?auto_91017 )
      ( MAKE-4CRATE-VERIFY ?auto_91014 ?auto_91015 ?auto_91016 ?auto_91013 ?auto_91017 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_91053 - SURFACE
      ?auto_91054 - SURFACE
      ?auto_91055 - SURFACE
      ?auto_91052 - SURFACE
      ?auto_91056 - SURFACE
    )
    :vars
    (
      ?auto_91058 - HOIST
      ?auto_91059 - PLACE
      ?auto_91057 - PLACE
      ?auto_91062 - HOIST
      ?auto_91060 - SURFACE
      ?auto_91061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91058 ?auto_91059 ) ( IS-CRATE ?auto_91056 ) ( not ( = ?auto_91052 ?auto_91056 ) ) ( not ( = ?auto_91055 ?auto_91052 ) ) ( not ( = ?auto_91055 ?auto_91056 ) ) ( not ( = ?auto_91057 ?auto_91059 ) ) ( HOIST-AT ?auto_91062 ?auto_91057 ) ( not ( = ?auto_91058 ?auto_91062 ) ) ( AVAILABLE ?auto_91062 ) ( SURFACE-AT ?auto_91056 ?auto_91057 ) ( ON ?auto_91056 ?auto_91060 ) ( CLEAR ?auto_91056 ) ( not ( = ?auto_91052 ?auto_91060 ) ) ( not ( = ?auto_91056 ?auto_91060 ) ) ( not ( = ?auto_91055 ?auto_91060 ) ) ( TRUCK-AT ?auto_91061 ?auto_91059 ) ( SURFACE-AT ?auto_91055 ?auto_91059 ) ( CLEAR ?auto_91055 ) ( IS-CRATE ?auto_91052 ) ( AVAILABLE ?auto_91058 ) ( IN ?auto_91052 ?auto_91061 ) ( ON ?auto_91054 ?auto_91053 ) ( ON ?auto_91055 ?auto_91054 ) ( not ( = ?auto_91053 ?auto_91054 ) ) ( not ( = ?auto_91053 ?auto_91055 ) ) ( not ( = ?auto_91053 ?auto_91052 ) ) ( not ( = ?auto_91053 ?auto_91056 ) ) ( not ( = ?auto_91053 ?auto_91060 ) ) ( not ( = ?auto_91054 ?auto_91055 ) ) ( not ( = ?auto_91054 ?auto_91052 ) ) ( not ( = ?auto_91054 ?auto_91056 ) ) ( not ( = ?auto_91054 ?auto_91060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91055 ?auto_91052 ?auto_91056 )
      ( MAKE-4CRATE-VERIFY ?auto_91053 ?auto_91054 ?auto_91055 ?auto_91052 ?auto_91056 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91713 - SURFACE
      ?auto_91714 - SURFACE
      ?auto_91715 - SURFACE
      ?auto_91712 - SURFACE
      ?auto_91716 - SURFACE
      ?auto_91717 - SURFACE
    )
    :vars
    (
      ?auto_91719 - HOIST
      ?auto_91718 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91719 ?auto_91718 ) ( SURFACE-AT ?auto_91716 ?auto_91718 ) ( CLEAR ?auto_91716 ) ( LIFTING ?auto_91719 ?auto_91717 ) ( IS-CRATE ?auto_91717 ) ( not ( = ?auto_91716 ?auto_91717 ) ) ( ON ?auto_91714 ?auto_91713 ) ( ON ?auto_91715 ?auto_91714 ) ( ON ?auto_91712 ?auto_91715 ) ( ON ?auto_91716 ?auto_91712 ) ( not ( = ?auto_91713 ?auto_91714 ) ) ( not ( = ?auto_91713 ?auto_91715 ) ) ( not ( = ?auto_91713 ?auto_91712 ) ) ( not ( = ?auto_91713 ?auto_91716 ) ) ( not ( = ?auto_91713 ?auto_91717 ) ) ( not ( = ?auto_91714 ?auto_91715 ) ) ( not ( = ?auto_91714 ?auto_91712 ) ) ( not ( = ?auto_91714 ?auto_91716 ) ) ( not ( = ?auto_91714 ?auto_91717 ) ) ( not ( = ?auto_91715 ?auto_91712 ) ) ( not ( = ?auto_91715 ?auto_91716 ) ) ( not ( = ?auto_91715 ?auto_91717 ) ) ( not ( = ?auto_91712 ?auto_91716 ) ) ( not ( = ?auto_91712 ?auto_91717 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_91716 ?auto_91717 )
      ( MAKE-5CRATE-VERIFY ?auto_91713 ?auto_91714 ?auto_91715 ?auto_91712 ?auto_91716 ?auto_91717 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91747 - SURFACE
      ?auto_91748 - SURFACE
      ?auto_91749 - SURFACE
      ?auto_91746 - SURFACE
      ?auto_91750 - SURFACE
      ?auto_91751 - SURFACE
    )
    :vars
    (
      ?auto_91754 - HOIST
      ?auto_91753 - PLACE
      ?auto_91752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91754 ?auto_91753 ) ( SURFACE-AT ?auto_91750 ?auto_91753 ) ( CLEAR ?auto_91750 ) ( IS-CRATE ?auto_91751 ) ( not ( = ?auto_91750 ?auto_91751 ) ) ( TRUCK-AT ?auto_91752 ?auto_91753 ) ( AVAILABLE ?auto_91754 ) ( IN ?auto_91751 ?auto_91752 ) ( ON ?auto_91750 ?auto_91746 ) ( not ( = ?auto_91746 ?auto_91750 ) ) ( not ( = ?auto_91746 ?auto_91751 ) ) ( ON ?auto_91748 ?auto_91747 ) ( ON ?auto_91749 ?auto_91748 ) ( ON ?auto_91746 ?auto_91749 ) ( not ( = ?auto_91747 ?auto_91748 ) ) ( not ( = ?auto_91747 ?auto_91749 ) ) ( not ( = ?auto_91747 ?auto_91746 ) ) ( not ( = ?auto_91747 ?auto_91750 ) ) ( not ( = ?auto_91747 ?auto_91751 ) ) ( not ( = ?auto_91748 ?auto_91749 ) ) ( not ( = ?auto_91748 ?auto_91746 ) ) ( not ( = ?auto_91748 ?auto_91750 ) ) ( not ( = ?auto_91748 ?auto_91751 ) ) ( not ( = ?auto_91749 ?auto_91746 ) ) ( not ( = ?auto_91749 ?auto_91750 ) ) ( not ( = ?auto_91749 ?auto_91751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91746 ?auto_91750 ?auto_91751 )
      ( MAKE-5CRATE-VERIFY ?auto_91747 ?auto_91748 ?auto_91749 ?auto_91746 ?auto_91750 ?auto_91751 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91787 - SURFACE
      ?auto_91788 - SURFACE
      ?auto_91789 - SURFACE
      ?auto_91786 - SURFACE
      ?auto_91790 - SURFACE
      ?auto_91791 - SURFACE
    )
    :vars
    (
      ?auto_91794 - HOIST
      ?auto_91795 - PLACE
      ?auto_91792 - TRUCK
      ?auto_91793 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91794 ?auto_91795 ) ( SURFACE-AT ?auto_91790 ?auto_91795 ) ( CLEAR ?auto_91790 ) ( IS-CRATE ?auto_91791 ) ( not ( = ?auto_91790 ?auto_91791 ) ) ( AVAILABLE ?auto_91794 ) ( IN ?auto_91791 ?auto_91792 ) ( ON ?auto_91790 ?auto_91786 ) ( not ( = ?auto_91786 ?auto_91790 ) ) ( not ( = ?auto_91786 ?auto_91791 ) ) ( TRUCK-AT ?auto_91792 ?auto_91793 ) ( not ( = ?auto_91793 ?auto_91795 ) ) ( ON ?auto_91788 ?auto_91787 ) ( ON ?auto_91789 ?auto_91788 ) ( ON ?auto_91786 ?auto_91789 ) ( not ( = ?auto_91787 ?auto_91788 ) ) ( not ( = ?auto_91787 ?auto_91789 ) ) ( not ( = ?auto_91787 ?auto_91786 ) ) ( not ( = ?auto_91787 ?auto_91790 ) ) ( not ( = ?auto_91787 ?auto_91791 ) ) ( not ( = ?auto_91788 ?auto_91789 ) ) ( not ( = ?auto_91788 ?auto_91786 ) ) ( not ( = ?auto_91788 ?auto_91790 ) ) ( not ( = ?auto_91788 ?auto_91791 ) ) ( not ( = ?auto_91789 ?auto_91786 ) ) ( not ( = ?auto_91789 ?auto_91790 ) ) ( not ( = ?auto_91789 ?auto_91791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91786 ?auto_91790 ?auto_91791 )
      ( MAKE-5CRATE-VERIFY ?auto_91787 ?auto_91788 ?auto_91789 ?auto_91786 ?auto_91790 ?auto_91791 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91832 - SURFACE
      ?auto_91833 - SURFACE
      ?auto_91834 - SURFACE
      ?auto_91831 - SURFACE
      ?auto_91835 - SURFACE
      ?auto_91836 - SURFACE
    )
    :vars
    (
      ?auto_91837 - HOIST
      ?auto_91839 - PLACE
      ?auto_91838 - TRUCK
      ?auto_91840 - PLACE
      ?auto_91841 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_91837 ?auto_91839 ) ( SURFACE-AT ?auto_91835 ?auto_91839 ) ( CLEAR ?auto_91835 ) ( IS-CRATE ?auto_91836 ) ( not ( = ?auto_91835 ?auto_91836 ) ) ( AVAILABLE ?auto_91837 ) ( ON ?auto_91835 ?auto_91831 ) ( not ( = ?auto_91831 ?auto_91835 ) ) ( not ( = ?auto_91831 ?auto_91836 ) ) ( TRUCK-AT ?auto_91838 ?auto_91840 ) ( not ( = ?auto_91840 ?auto_91839 ) ) ( HOIST-AT ?auto_91841 ?auto_91840 ) ( LIFTING ?auto_91841 ?auto_91836 ) ( not ( = ?auto_91837 ?auto_91841 ) ) ( ON ?auto_91833 ?auto_91832 ) ( ON ?auto_91834 ?auto_91833 ) ( ON ?auto_91831 ?auto_91834 ) ( not ( = ?auto_91832 ?auto_91833 ) ) ( not ( = ?auto_91832 ?auto_91834 ) ) ( not ( = ?auto_91832 ?auto_91831 ) ) ( not ( = ?auto_91832 ?auto_91835 ) ) ( not ( = ?auto_91832 ?auto_91836 ) ) ( not ( = ?auto_91833 ?auto_91834 ) ) ( not ( = ?auto_91833 ?auto_91831 ) ) ( not ( = ?auto_91833 ?auto_91835 ) ) ( not ( = ?auto_91833 ?auto_91836 ) ) ( not ( = ?auto_91834 ?auto_91831 ) ) ( not ( = ?auto_91834 ?auto_91835 ) ) ( not ( = ?auto_91834 ?auto_91836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91831 ?auto_91835 ?auto_91836 )
      ( MAKE-5CRATE-VERIFY ?auto_91832 ?auto_91833 ?auto_91834 ?auto_91831 ?auto_91835 ?auto_91836 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91882 - SURFACE
      ?auto_91883 - SURFACE
      ?auto_91884 - SURFACE
      ?auto_91881 - SURFACE
      ?auto_91885 - SURFACE
      ?auto_91886 - SURFACE
    )
    :vars
    (
      ?auto_91891 - HOIST
      ?auto_91889 - PLACE
      ?auto_91890 - TRUCK
      ?auto_91887 - PLACE
      ?auto_91892 - HOIST
      ?auto_91888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91891 ?auto_91889 ) ( SURFACE-AT ?auto_91885 ?auto_91889 ) ( CLEAR ?auto_91885 ) ( IS-CRATE ?auto_91886 ) ( not ( = ?auto_91885 ?auto_91886 ) ) ( AVAILABLE ?auto_91891 ) ( ON ?auto_91885 ?auto_91881 ) ( not ( = ?auto_91881 ?auto_91885 ) ) ( not ( = ?auto_91881 ?auto_91886 ) ) ( TRUCK-AT ?auto_91890 ?auto_91887 ) ( not ( = ?auto_91887 ?auto_91889 ) ) ( HOIST-AT ?auto_91892 ?auto_91887 ) ( not ( = ?auto_91891 ?auto_91892 ) ) ( AVAILABLE ?auto_91892 ) ( SURFACE-AT ?auto_91886 ?auto_91887 ) ( ON ?auto_91886 ?auto_91888 ) ( CLEAR ?auto_91886 ) ( not ( = ?auto_91885 ?auto_91888 ) ) ( not ( = ?auto_91886 ?auto_91888 ) ) ( not ( = ?auto_91881 ?auto_91888 ) ) ( ON ?auto_91883 ?auto_91882 ) ( ON ?auto_91884 ?auto_91883 ) ( ON ?auto_91881 ?auto_91884 ) ( not ( = ?auto_91882 ?auto_91883 ) ) ( not ( = ?auto_91882 ?auto_91884 ) ) ( not ( = ?auto_91882 ?auto_91881 ) ) ( not ( = ?auto_91882 ?auto_91885 ) ) ( not ( = ?auto_91882 ?auto_91886 ) ) ( not ( = ?auto_91882 ?auto_91888 ) ) ( not ( = ?auto_91883 ?auto_91884 ) ) ( not ( = ?auto_91883 ?auto_91881 ) ) ( not ( = ?auto_91883 ?auto_91885 ) ) ( not ( = ?auto_91883 ?auto_91886 ) ) ( not ( = ?auto_91883 ?auto_91888 ) ) ( not ( = ?auto_91884 ?auto_91881 ) ) ( not ( = ?auto_91884 ?auto_91885 ) ) ( not ( = ?auto_91884 ?auto_91886 ) ) ( not ( = ?auto_91884 ?auto_91888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91881 ?auto_91885 ?auto_91886 )
      ( MAKE-5CRATE-VERIFY ?auto_91882 ?auto_91883 ?auto_91884 ?auto_91881 ?auto_91885 ?auto_91886 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91933 - SURFACE
      ?auto_91934 - SURFACE
      ?auto_91935 - SURFACE
      ?auto_91932 - SURFACE
      ?auto_91936 - SURFACE
      ?auto_91937 - SURFACE
    )
    :vars
    (
      ?auto_91942 - HOIST
      ?auto_91943 - PLACE
      ?auto_91938 - PLACE
      ?auto_91939 - HOIST
      ?auto_91941 - SURFACE
      ?auto_91940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91942 ?auto_91943 ) ( SURFACE-AT ?auto_91936 ?auto_91943 ) ( CLEAR ?auto_91936 ) ( IS-CRATE ?auto_91937 ) ( not ( = ?auto_91936 ?auto_91937 ) ) ( AVAILABLE ?auto_91942 ) ( ON ?auto_91936 ?auto_91932 ) ( not ( = ?auto_91932 ?auto_91936 ) ) ( not ( = ?auto_91932 ?auto_91937 ) ) ( not ( = ?auto_91938 ?auto_91943 ) ) ( HOIST-AT ?auto_91939 ?auto_91938 ) ( not ( = ?auto_91942 ?auto_91939 ) ) ( AVAILABLE ?auto_91939 ) ( SURFACE-AT ?auto_91937 ?auto_91938 ) ( ON ?auto_91937 ?auto_91941 ) ( CLEAR ?auto_91937 ) ( not ( = ?auto_91936 ?auto_91941 ) ) ( not ( = ?auto_91937 ?auto_91941 ) ) ( not ( = ?auto_91932 ?auto_91941 ) ) ( TRUCK-AT ?auto_91940 ?auto_91943 ) ( ON ?auto_91934 ?auto_91933 ) ( ON ?auto_91935 ?auto_91934 ) ( ON ?auto_91932 ?auto_91935 ) ( not ( = ?auto_91933 ?auto_91934 ) ) ( not ( = ?auto_91933 ?auto_91935 ) ) ( not ( = ?auto_91933 ?auto_91932 ) ) ( not ( = ?auto_91933 ?auto_91936 ) ) ( not ( = ?auto_91933 ?auto_91937 ) ) ( not ( = ?auto_91933 ?auto_91941 ) ) ( not ( = ?auto_91934 ?auto_91935 ) ) ( not ( = ?auto_91934 ?auto_91932 ) ) ( not ( = ?auto_91934 ?auto_91936 ) ) ( not ( = ?auto_91934 ?auto_91937 ) ) ( not ( = ?auto_91934 ?auto_91941 ) ) ( not ( = ?auto_91935 ?auto_91932 ) ) ( not ( = ?auto_91935 ?auto_91936 ) ) ( not ( = ?auto_91935 ?auto_91937 ) ) ( not ( = ?auto_91935 ?auto_91941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91932 ?auto_91936 ?auto_91937 )
      ( MAKE-5CRATE-VERIFY ?auto_91933 ?auto_91934 ?auto_91935 ?auto_91932 ?auto_91936 ?auto_91937 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91984 - SURFACE
      ?auto_91985 - SURFACE
      ?auto_91986 - SURFACE
      ?auto_91983 - SURFACE
      ?auto_91987 - SURFACE
      ?auto_91988 - SURFACE
    )
    :vars
    (
      ?auto_91994 - HOIST
      ?auto_91990 - PLACE
      ?auto_91993 - PLACE
      ?auto_91992 - HOIST
      ?auto_91989 - SURFACE
      ?auto_91991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91994 ?auto_91990 ) ( IS-CRATE ?auto_91988 ) ( not ( = ?auto_91987 ?auto_91988 ) ) ( not ( = ?auto_91983 ?auto_91987 ) ) ( not ( = ?auto_91983 ?auto_91988 ) ) ( not ( = ?auto_91993 ?auto_91990 ) ) ( HOIST-AT ?auto_91992 ?auto_91993 ) ( not ( = ?auto_91994 ?auto_91992 ) ) ( AVAILABLE ?auto_91992 ) ( SURFACE-AT ?auto_91988 ?auto_91993 ) ( ON ?auto_91988 ?auto_91989 ) ( CLEAR ?auto_91988 ) ( not ( = ?auto_91987 ?auto_91989 ) ) ( not ( = ?auto_91988 ?auto_91989 ) ) ( not ( = ?auto_91983 ?auto_91989 ) ) ( TRUCK-AT ?auto_91991 ?auto_91990 ) ( SURFACE-AT ?auto_91983 ?auto_91990 ) ( CLEAR ?auto_91983 ) ( LIFTING ?auto_91994 ?auto_91987 ) ( IS-CRATE ?auto_91987 ) ( ON ?auto_91985 ?auto_91984 ) ( ON ?auto_91986 ?auto_91985 ) ( ON ?auto_91983 ?auto_91986 ) ( not ( = ?auto_91984 ?auto_91985 ) ) ( not ( = ?auto_91984 ?auto_91986 ) ) ( not ( = ?auto_91984 ?auto_91983 ) ) ( not ( = ?auto_91984 ?auto_91987 ) ) ( not ( = ?auto_91984 ?auto_91988 ) ) ( not ( = ?auto_91984 ?auto_91989 ) ) ( not ( = ?auto_91985 ?auto_91986 ) ) ( not ( = ?auto_91985 ?auto_91983 ) ) ( not ( = ?auto_91985 ?auto_91987 ) ) ( not ( = ?auto_91985 ?auto_91988 ) ) ( not ( = ?auto_91985 ?auto_91989 ) ) ( not ( = ?auto_91986 ?auto_91983 ) ) ( not ( = ?auto_91986 ?auto_91987 ) ) ( not ( = ?auto_91986 ?auto_91988 ) ) ( not ( = ?auto_91986 ?auto_91989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91983 ?auto_91987 ?auto_91988 )
      ( MAKE-5CRATE-VERIFY ?auto_91984 ?auto_91985 ?auto_91986 ?auto_91983 ?auto_91987 ?auto_91988 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_92035 - SURFACE
      ?auto_92036 - SURFACE
      ?auto_92037 - SURFACE
      ?auto_92034 - SURFACE
      ?auto_92038 - SURFACE
      ?auto_92039 - SURFACE
    )
    :vars
    (
      ?auto_92043 - HOIST
      ?auto_92044 - PLACE
      ?auto_92041 - PLACE
      ?auto_92045 - HOIST
      ?auto_92040 - SURFACE
      ?auto_92042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_92043 ?auto_92044 ) ( IS-CRATE ?auto_92039 ) ( not ( = ?auto_92038 ?auto_92039 ) ) ( not ( = ?auto_92034 ?auto_92038 ) ) ( not ( = ?auto_92034 ?auto_92039 ) ) ( not ( = ?auto_92041 ?auto_92044 ) ) ( HOIST-AT ?auto_92045 ?auto_92041 ) ( not ( = ?auto_92043 ?auto_92045 ) ) ( AVAILABLE ?auto_92045 ) ( SURFACE-AT ?auto_92039 ?auto_92041 ) ( ON ?auto_92039 ?auto_92040 ) ( CLEAR ?auto_92039 ) ( not ( = ?auto_92038 ?auto_92040 ) ) ( not ( = ?auto_92039 ?auto_92040 ) ) ( not ( = ?auto_92034 ?auto_92040 ) ) ( TRUCK-AT ?auto_92042 ?auto_92044 ) ( SURFACE-AT ?auto_92034 ?auto_92044 ) ( CLEAR ?auto_92034 ) ( IS-CRATE ?auto_92038 ) ( AVAILABLE ?auto_92043 ) ( IN ?auto_92038 ?auto_92042 ) ( ON ?auto_92036 ?auto_92035 ) ( ON ?auto_92037 ?auto_92036 ) ( ON ?auto_92034 ?auto_92037 ) ( not ( = ?auto_92035 ?auto_92036 ) ) ( not ( = ?auto_92035 ?auto_92037 ) ) ( not ( = ?auto_92035 ?auto_92034 ) ) ( not ( = ?auto_92035 ?auto_92038 ) ) ( not ( = ?auto_92035 ?auto_92039 ) ) ( not ( = ?auto_92035 ?auto_92040 ) ) ( not ( = ?auto_92036 ?auto_92037 ) ) ( not ( = ?auto_92036 ?auto_92034 ) ) ( not ( = ?auto_92036 ?auto_92038 ) ) ( not ( = ?auto_92036 ?auto_92039 ) ) ( not ( = ?auto_92036 ?auto_92040 ) ) ( not ( = ?auto_92037 ?auto_92034 ) ) ( not ( = ?auto_92037 ?auto_92038 ) ) ( not ( = ?auto_92037 ?auto_92039 ) ) ( not ( = ?auto_92037 ?auto_92040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_92034 ?auto_92038 ?auto_92039 )
      ( MAKE-5CRATE-VERIFY ?auto_92035 ?auto_92036 ?auto_92037 ?auto_92034 ?auto_92038 ?auto_92039 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93244 - SURFACE
      ?auto_93245 - SURFACE
      ?auto_93246 - SURFACE
      ?auto_93243 - SURFACE
      ?auto_93247 - SURFACE
      ?auto_93249 - SURFACE
      ?auto_93248 - SURFACE
    )
    :vars
    (
      ?auto_93251 - HOIST
      ?auto_93250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93251 ?auto_93250 ) ( SURFACE-AT ?auto_93249 ?auto_93250 ) ( CLEAR ?auto_93249 ) ( LIFTING ?auto_93251 ?auto_93248 ) ( IS-CRATE ?auto_93248 ) ( not ( = ?auto_93249 ?auto_93248 ) ) ( ON ?auto_93245 ?auto_93244 ) ( ON ?auto_93246 ?auto_93245 ) ( ON ?auto_93243 ?auto_93246 ) ( ON ?auto_93247 ?auto_93243 ) ( ON ?auto_93249 ?auto_93247 ) ( not ( = ?auto_93244 ?auto_93245 ) ) ( not ( = ?auto_93244 ?auto_93246 ) ) ( not ( = ?auto_93244 ?auto_93243 ) ) ( not ( = ?auto_93244 ?auto_93247 ) ) ( not ( = ?auto_93244 ?auto_93249 ) ) ( not ( = ?auto_93244 ?auto_93248 ) ) ( not ( = ?auto_93245 ?auto_93246 ) ) ( not ( = ?auto_93245 ?auto_93243 ) ) ( not ( = ?auto_93245 ?auto_93247 ) ) ( not ( = ?auto_93245 ?auto_93249 ) ) ( not ( = ?auto_93245 ?auto_93248 ) ) ( not ( = ?auto_93246 ?auto_93243 ) ) ( not ( = ?auto_93246 ?auto_93247 ) ) ( not ( = ?auto_93246 ?auto_93249 ) ) ( not ( = ?auto_93246 ?auto_93248 ) ) ( not ( = ?auto_93243 ?auto_93247 ) ) ( not ( = ?auto_93243 ?auto_93249 ) ) ( not ( = ?auto_93243 ?auto_93248 ) ) ( not ( = ?auto_93247 ?auto_93249 ) ) ( not ( = ?auto_93247 ?auto_93248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_93249 ?auto_93248 )
      ( MAKE-6CRATE-VERIFY ?auto_93244 ?auto_93245 ?auto_93246 ?auto_93243 ?auto_93247 ?auto_93249 ?auto_93248 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93288 - SURFACE
      ?auto_93289 - SURFACE
      ?auto_93290 - SURFACE
      ?auto_93287 - SURFACE
      ?auto_93291 - SURFACE
      ?auto_93293 - SURFACE
      ?auto_93292 - SURFACE
    )
    :vars
    (
      ?auto_93296 - HOIST
      ?auto_93295 - PLACE
      ?auto_93294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93296 ?auto_93295 ) ( SURFACE-AT ?auto_93293 ?auto_93295 ) ( CLEAR ?auto_93293 ) ( IS-CRATE ?auto_93292 ) ( not ( = ?auto_93293 ?auto_93292 ) ) ( TRUCK-AT ?auto_93294 ?auto_93295 ) ( AVAILABLE ?auto_93296 ) ( IN ?auto_93292 ?auto_93294 ) ( ON ?auto_93293 ?auto_93291 ) ( not ( = ?auto_93291 ?auto_93293 ) ) ( not ( = ?auto_93291 ?auto_93292 ) ) ( ON ?auto_93289 ?auto_93288 ) ( ON ?auto_93290 ?auto_93289 ) ( ON ?auto_93287 ?auto_93290 ) ( ON ?auto_93291 ?auto_93287 ) ( not ( = ?auto_93288 ?auto_93289 ) ) ( not ( = ?auto_93288 ?auto_93290 ) ) ( not ( = ?auto_93288 ?auto_93287 ) ) ( not ( = ?auto_93288 ?auto_93291 ) ) ( not ( = ?auto_93288 ?auto_93293 ) ) ( not ( = ?auto_93288 ?auto_93292 ) ) ( not ( = ?auto_93289 ?auto_93290 ) ) ( not ( = ?auto_93289 ?auto_93287 ) ) ( not ( = ?auto_93289 ?auto_93291 ) ) ( not ( = ?auto_93289 ?auto_93293 ) ) ( not ( = ?auto_93289 ?auto_93292 ) ) ( not ( = ?auto_93290 ?auto_93287 ) ) ( not ( = ?auto_93290 ?auto_93291 ) ) ( not ( = ?auto_93290 ?auto_93293 ) ) ( not ( = ?auto_93290 ?auto_93292 ) ) ( not ( = ?auto_93287 ?auto_93291 ) ) ( not ( = ?auto_93287 ?auto_93293 ) ) ( not ( = ?auto_93287 ?auto_93292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93291 ?auto_93293 ?auto_93292 )
      ( MAKE-6CRATE-VERIFY ?auto_93288 ?auto_93289 ?auto_93290 ?auto_93287 ?auto_93291 ?auto_93293 ?auto_93292 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93339 - SURFACE
      ?auto_93340 - SURFACE
      ?auto_93341 - SURFACE
      ?auto_93338 - SURFACE
      ?auto_93342 - SURFACE
      ?auto_93344 - SURFACE
      ?auto_93343 - SURFACE
    )
    :vars
    (
      ?auto_93347 - HOIST
      ?auto_93346 - PLACE
      ?auto_93345 - TRUCK
      ?auto_93348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93347 ?auto_93346 ) ( SURFACE-AT ?auto_93344 ?auto_93346 ) ( CLEAR ?auto_93344 ) ( IS-CRATE ?auto_93343 ) ( not ( = ?auto_93344 ?auto_93343 ) ) ( AVAILABLE ?auto_93347 ) ( IN ?auto_93343 ?auto_93345 ) ( ON ?auto_93344 ?auto_93342 ) ( not ( = ?auto_93342 ?auto_93344 ) ) ( not ( = ?auto_93342 ?auto_93343 ) ) ( TRUCK-AT ?auto_93345 ?auto_93348 ) ( not ( = ?auto_93348 ?auto_93346 ) ) ( ON ?auto_93340 ?auto_93339 ) ( ON ?auto_93341 ?auto_93340 ) ( ON ?auto_93338 ?auto_93341 ) ( ON ?auto_93342 ?auto_93338 ) ( not ( = ?auto_93339 ?auto_93340 ) ) ( not ( = ?auto_93339 ?auto_93341 ) ) ( not ( = ?auto_93339 ?auto_93338 ) ) ( not ( = ?auto_93339 ?auto_93342 ) ) ( not ( = ?auto_93339 ?auto_93344 ) ) ( not ( = ?auto_93339 ?auto_93343 ) ) ( not ( = ?auto_93340 ?auto_93341 ) ) ( not ( = ?auto_93340 ?auto_93338 ) ) ( not ( = ?auto_93340 ?auto_93342 ) ) ( not ( = ?auto_93340 ?auto_93344 ) ) ( not ( = ?auto_93340 ?auto_93343 ) ) ( not ( = ?auto_93341 ?auto_93338 ) ) ( not ( = ?auto_93341 ?auto_93342 ) ) ( not ( = ?auto_93341 ?auto_93344 ) ) ( not ( = ?auto_93341 ?auto_93343 ) ) ( not ( = ?auto_93338 ?auto_93342 ) ) ( not ( = ?auto_93338 ?auto_93344 ) ) ( not ( = ?auto_93338 ?auto_93343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93342 ?auto_93344 ?auto_93343 )
      ( MAKE-6CRATE-VERIFY ?auto_93339 ?auto_93340 ?auto_93341 ?auto_93338 ?auto_93342 ?auto_93344 ?auto_93343 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93396 - SURFACE
      ?auto_93397 - SURFACE
      ?auto_93398 - SURFACE
      ?auto_93395 - SURFACE
      ?auto_93399 - SURFACE
      ?auto_93401 - SURFACE
      ?auto_93400 - SURFACE
    )
    :vars
    (
      ?auto_93405 - HOIST
      ?auto_93403 - PLACE
      ?auto_93402 - TRUCK
      ?auto_93406 - PLACE
      ?auto_93404 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_93405 ?auto_93403 ) ( SURFACE-AT ?auto_93401 ?auto_93403 ) ( CLEAR ?auto_93401 ) ( IS-CRATE ?auto_93400 ) ( not ( = ?auto_93401 ?auto_93400 ) ) ( AVAILABLE ?auto_93405 ) ( ON ?auto_93401 ?auto_93399 ) ( not ( = ?auto_93399 ?auto_93401 ) ) ( not ( = ?auto_93399 ?auto_93400 ) ) ( TRUCK-AT ?auto_93402 ?auto_93406 ) ( not ( = ?auto_93406 ?auto_93403 ) ) ( HOIST-AT ?auto_93404 ?auto_93406 ) ( LIFTING ?auto_93404 ?auto_93400 ) ( not ( = ?auto_93405 ?auto_93404 ) ) ( ON ?auto_93397 ?auto_93396 ) ( ON ?auto_93398 ?auto_93397 ) ( ON ?auto_93395 ?auto_93398 ) ( ON ?auto_93399 ?auto_93395 ) ( not ( = ?auto_93396 ?auto_93397 ) ) ( not ( = ?auto_93396 ?auto_93398 ) ) ( not ( = ?auto_93396 ?auto_93395 ) ) ( not ( = ?auto_93396 ?auto_93399 ) ) ( not ( = ?auto_93396 ?auto_93401 ) ) ( not ( = ?auto_93396 ?auto_93400 ) ) ( not ( = ?auto_93397 ?auto_93398 ) ) ( not ( = ?auto_93397 ?auto_93395 ) ) ( not ( = ?auto_93397 ?auto_93399 ) ) ( not ( = ?auto_93397 ?auto_93401 ) ) ( not ( = ?auto_93397 ?auto_93400 ) ) ( not ( = ?auto_93398 ?auto_93395 ) ) ( not ( = ?auto_93398 ?auto_93399 ) ) ( not ( = ?auto_93398 ?auto_93401 ) ) ( not ( = ?auto_93398 ?auto_93400 ) ) ( not ( = ?auto_93395 ?auto_93399 ) ) ( not ( = ?auto_93395 ?auto_93401 ) ) ( not ( = ?auto_93395 ?auto_93400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93399 ?auto_93401 ?auto_93400 )
      ( MAKE-6CRATE-VERIFY ?auto_93396 ?auto_93397 ?auto_93398 ?auto_93395 ?auto_93399 ?auto_93401 ?auto_93400 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93459 - SURFACE
      ?auto_93460 - SURFACE
      ?auto_93461 - SURFACE
      ?auto_93458 - SURFACE
      ?auto_93462 - SURFACE
      ?auto_93464 - SURFACE
      ?auto_93463 - SURFACE
    )
    :vars
    (
      ?auto_93465 - HOIST
      ?auto_93466 - PLACE
      ?auto_93468 - TRUCK
      ?auto_93470 - PLACE
      ?auto_93467 - HOIST
      ?auto_93469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93465 ?auto_93466 ) ( SURFACE-AT ?auto_93464 ?auto_93466 ) ( CLEAR ?auto_93464 ) ( IS-CRATE ?auto_93463 ) ( not ( = ?auto_93464 ?auto_93463 ) ) ( AVAILABLE ?auto_93465 ) ( ON ?auto_93464 ?auto_93462 ) ( not ( = ?auto_93462 ?auto_93464 ) ) ( not ( = ?auto_93462 ?auto_93463 ) ) ( TRUCK-AT ?auto_93468 ?auto_93470 ) ( not ( = ?auto_93470 ?auto_93466 ) ) ( HOIST-AT ?auto_93467 ?auto_93470 ) ( not ( = ?auto_93465 ?auto_93467 ) ) ( AVAILABLE ?auto_93467 ) ( SURFACE-AT ?auto_93463 ?auto_93470 ) ( ON ?auto_93463 ?auto_93469 ) ( CLEAR ?auto_93463 ) ( not ( = ?auto_93464 ?auto_93469 ) ) ( not ( = ?auto_93463 ?auto_93469 ) ) ( not ( = ?auto_93462 ?auto_93469 ) ) ( ON ?auto_93460 ?auto_93459 ) ( ON ?auto_93461 ?auto_93460 ) ( ON ?auto_93458 ?auto_93461 ) ( ON ?auto_93462 ?auto_93458 ) ( not ( = ?auto_93459 ?auto_93460 ) ) ( not ( = ?auto_93459 ?auto_93461 ) ) ( not ( = ?auto_93459 ?auto_93458 ) ) ( not ( = ?auto_93459 ?auto_93462 ) ) ( not ( = ?auto_93459 ?auto_93464 ) ) ( not ( = ?auto_93459 ?auto_93463 ) ) ( not ( = ?auto_93459 ?auto_93469 ) ) ( not ( = ?auto_93460 ?auto_93461 ) ) ( not ( = ?auto_93460 ?auto_93458 ) ) ( not ( = ?auto_93460 ?auto_93462 ) ) ( not ( = ?auto_93460 ?auto_93464 ) ) ( not ( = ?auto_93460 ?auto_93463 ) ) ( not ( = ?auto_93460 ?auto_93469 ) ) ( not ( = ?auto_93461 ?auto_93458 ) ) ( not ( = ?auto_93461 ?auto_93462 ) ) ( not ( = ?auto_93461 ?auto_93464 ) ) ( not ( = ?auto_93461 ?auto_93463 ) ) ( not ( = ?auto_93461 ?auto_93469 ) ) ( not ( = ?auto_93458 ?auto_93462 ) ) ( not ( = ?auto_93458 ?auto_93464 ) ) ( not ( = ?auto_93458 ?auto_93463 ) ) ( not ( = ?auto_93458 ?auto_93469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93462 ?auto_93464 ?auto_93463 )
      ( MAKE-6CRATE-VERIFY ?auto_93459 ?auto_93460 ?auto_93461 ?auto_93458 ?auto_93462 ?auto_93464 ?auto_93463 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93523 - SURFACE
      ?auto_93524 - SURFACE
      ?auto_93525 - SURFACE
      ?auto_93522 - SURFACE
      ?auto_93526 - SURFACE
      ?auto_93528 - SURFACE
      ?auto_93527 - SURFACE
    )
    :vars
    (
      ?auto_93531 - HOIST
      ?auto_93534 - PLACE
      ?auto_93533 - PLACE
      ?auto_93529 - HOIST
      ?auto_93532 - SURFACE
      ?auto_93530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93531 ?auto_93534 ) ( SURFACE-AT ?auto_93528 ?auto_93534 ) ( CLEAR ?auto_93528 ) ( IS-CRATE ?auto_93527 ) ( not ( = ?auto_93528 ?auto_93527 ) ) ( AVAILABLE ?auto_93531 ) ( ON ?auto_93528 ?auto_93526 ) ( not ( = ?auto_93526 ?auto_93528 ) ) ( not ( = ?auto_93526 ?auto_93527 ) ) ( not ( = ?auto_93533 ?auto_93534 ) ) ( HOIST-AT ?auto_93529 ?auto_93533 ) ( not ( = ?auto_93531 ?auto_93529 ) ) ( AVAILABLE ?auto_93529 ) ( SURFACE-AT ?auto_93527 ?auto_93533 ) ( ON ?auto_93527 ?auto_93532 ) ( CLEAR ?auto_93527 ) ( not ( = ?auto_93528 ?auto_93532 ) ) ( not ( = ?auto_93527 ?auto_93532 ) ) ( not ( = ?auto_93526 ?auto_93532 ) ) ( TRUCK-AT ?auto_93530 ?auto_93534 ) ( ON ?auto_93524 ?auto_93523 ) ( ON ?auto_93525 ?auto_93524 ) ( ON ?auto_93522 ?auto_93525 ) ( ON ?auto_93526 ?auto_93522 ) ( not ( = ?auto_93523 ?auto_93524 ) ) ( not ( = ?auto_93523 ?auto_93525 ) ) ( not ( = ?auto_93523 ?auto_93522 ) ) ( not ( = ?auto_93523 ?auto_93526 ) ) ( not ( = ?auto_93523 ?auto_93528 ) ) ( not ( = ?auto_93523 ?auto_93527 ) ) ( not ( = ?auto_93523 ?auto_93532 ) ) ( not ( = ?auto_93524 ?auto_93525 ) ) ( not ( = ?auto_93524 ?auto_93522 ) ) ( not ( = ?auto_93524 ?auto_93526 ) ) ( not ( = ?auto_93524 ?auto_93528 ) ) ( not ( = ?auto_93524 ?auto_93527 ) ) ( not ( = ?auto_93524 ?auto_93532 ) ) ( not ( = ?auto_93525 ?auto_93522 ) ) ( not ( = ?auto_93525 ?auto_93526 ) ) ( not ( = ?auto_93525 ?auto_93528 ) ) ( not ( = ?auto_93525 ?auto_93527 ) ) ( not ( = ?auto_93525 ?auto_93532 ) ) ( not ( = ?auto_93522 ?auto_93526 ) ) ( not ( = ?auto_93522 ?auto_93528 ) ) ( not ( = ?auto_93522 ?auto_93527 ) ) ( not ( = ?auto_93522 ?auto_93532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93526 ?auto_93528 ?auto_93527 )
      ( MAKE-6CRATE-VERIFY ?auto_93523 ?auto_93524 ?auto_93525 ?auto_93522 ?auto_93526 ?auto_93528 ?auto_93527 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93587 - SURFACE
      ?auto_93588 - SURFACE
      ?auto_93589 - SURFACE
      ?auto_93586 - SURFACE
      ?auto_93590 - SURFACE
      ?auto_93592 - SURFACE
      ?auto_93591 - SURFACE
    )
    :vars
    (
      ?auto_93596 - HOIST
      ?auto_93594 - PLACE
      ?auto_93598 - PLACE
      ?auto_93597 - HOIST
      ?auto_93595 - SURFACE
      ?auto_93593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93596 ?auto_93594 ) ( IS-CRATE ?auto_93591 ) ( not ( = ?auto_93592 ?auto_93591 ) ) ( not ( = ?auto_93590 ?auto_93592 ) ) ( not ( = ?auto_93590 ?auto_93591 ) ) ( not ( = ?auto_93598 ?auto_93594 ) ) ( HOIST-AT ?auto_93597 ?auto_93598 ) ( not ( = ?auto_93596 ?auto_93597 ) ) ( AVAILABLE ?auto_93597 ) ( SURFACE-AT ?auto_93591 ?auto_93598 ) ( ON ?auto_93591 ?auto_93595 ) ( CLEAR ?auto_93591 ) ( not ( = ?auto_93592 ?auto_93595 ) ) ( not ( = ?auto_93591 ?auto_93595 ) ) ( not ( = ?auto_93590 ?auto_93595 ) ) ( TRUCK-AT ?auto_93593 ?auto_93594 ) ( SURFACE-AT ?auto_93590 ?auto_93594 ) ( CLEAR ?auto_93590 ) ( LIFTING ?auto_93596 ?auto_93592 ) ( IS-CRATE ?auto_93592 ) ( ON ?auto_93588 ?auto_93587 ) ( ON ?auto_93589 ?auto_93588 ) ( ON ?auto_93586 ?auto_93589 ) ( ON ?auto_93590 ?auto_93586 ) ( not ( = ?auto_93587 ?auto_93588 ) ) ( not ( = ?auto_93587 ?auto_93589 ) ) ( not ( = ?auto_93587 ?auto_93586 ) ) ( not ( = ?auto_93587 ?auto_93590 ) ) ( not ( = ?auto_93587 ?auto_93592 ) ) ( not ( = ?auto_93587 ?auto_93591 ) ) ( not ( = ?auto_93587 ?auto_93595 ) ) ( not ( = ?auto_93588 ?auto_93589 ) ) ( not ( = ?auto_93588 ?auto_93586 ) ) ( not ( = ?auto_93588 ?auto_93590 ) ) ( not ( = ?auto_93588 ?auto_93592 ) ) ( not ( = ?auto_93588 ?auto_93591 ) ) ( not ( = ?auto_93588 ?auto_93595 ) ) ( not ( = ?auto_93589 ?auto_93586 ) ) ( not ( = ?auto_93589 ?auto_93590 ) ) ( not ( = ?auto_93589 ?auto_93592 ) ) ( not ( = ?auto_93589 ?auto_93591 ) ) ( not ( = ?auto_93589 ?auto_93595 ) ) ( not ( = ?auto_93586 ?auto_93590 ) ) ( not ( = ?auto_93586 ?auto_93592 ) ) ( not ( = ?auto_93586 ?auto_93591 ) ) ( not ( = ?auto_93586 ?auto_93595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93590 ?auto_93592 ?auto_93591 )
      ( MAKE-6CRATE-VERIFY ?auto_93587 ?auto_93588 ?auto_93589 ?auto_93586 ?auto_93590 ?auto_93592 ?auto_93591 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93651 - SURFACE
      ?auto_93652 - SURFACE
      ?auto_93653 - SURFACE
      ?auto_93650 - SURFACE
      ?auto_93654 - SURFACE
      ?auto_93656 - SURFACE
      ?auto_93655 - SURFACE
    )
    :vars
    (
      ?auto_93662 - HOIST
      ?auto_93658 - PLACE
      ?auto_93659 - PLACE
      ?auto_93657 - HOIST
      ?auto_93660 - SURFACE
      ?auto_93661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93662 ?auto_93658 ) ( IS-CRATE ?auto_93655 ) ( not ( = ?auto_93656 ?auto_93655 ) ) ( not ( = ?auto_93654 ?auto_93656 ) ) ( not ( = ?auto_93654 ?auto_93655 ) ) ( not ( = ?auto_93659 ?auto_93658 ) ) ( HOIST-AT ?auto_93657 ?auto_93659 ) ( not ( = ?auto_93662 ?auto_93657 ) ) ( AVAILABLE ?auto_93657 ) ( SURFACE-AT ?auto_93655 ?auto_93659 ) ( ON ?auto_93655 ?auto_93660 ) ( CLEAR ?auto_93655 ) ( not ( = ?auto_93656 ?auto_93660 ) ) ( not ( = ?auto_93655 ?auto_93660 ) ) ( not ( = ?auto_93654 ?auto_93660 ) ) ( TRUCK-AT ?auto_93661 ?auto_93658 ) ( SURFACE-AT ?auto_93654 ?auto_93658 ) ( CLEAR ?auto_93654 ) ( IS-CRATE ?auto_93656 ) ( AVAILABLE ?auto_93662 ) ( IN ?auto_93656 ?auto_93661 ) ( ON ?auto_93652 ?auto_93651 ) ( ON ?auto_93653 ?auto_93652 ) ( ON ?auto_93650 ?auto_93653 ) ( ON ?auto_93654 ?auto_93650 ) ( not ( = ?auto_93651 ?auto_93652 ) ) ( not ( = ?auto_93651 ?auto_93653 ) ) ( not ( = ?auto_93651 ?auto_93650 ) ) ( not ( = ?auto_93651 ?auto_93654 ) ) ( not ( = ?auto_93651 ?auto_93656 ) ) ( not ( = ?auto_93651 ?auto_93655 ) ) ( not ( = ?auto_93651 ?auto_93660 ) ) ( not ( = ?auto_93652 ?auto_93653 ) ) ( not ( = ?auto_93652 ?auto_93650 ) ) ( not ( = ?auto_93652 ?auto_93654 ) ) ( not ( = ?auto_93652 ?auto_93656 ) ) ( not ( = ?auto_93652 ?auto_93655 ) ) ( not ( = ?auto_93652 ?auto_93660 ) ) ( not ( = ?auto_93653 ?auto_93650 ) ) ( not ( = ?auto_93653 ?auto_93654 ) ) ( not ( = ?auto_93653 ?auto_93656 ) ) ( not ( = ?auto_93653 ?auto_93655 ) ) ( not ( = ?auto_93653 ?auto_93660 ) ) ( not ( = ?auto_93650 ?auto_93654 ) ) ( not ( = ?auto_93650 ?auto_93656 ) ) ( not ( = ?auto_93650 ?auto_93655 ) ) ( not ( = ?auto_93650 ?auto_93660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93654 ?auto_93656 ?auto_93655 )
      ( MAKE-6CRATE-VERIFY ?auto_93651 ?auto_93652 ?auto_93653 ?auto_93650 ?auto_93654 ?auto_93656 ?auto_93655 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95607 - SURFACE
      ?auto_95608 - SURFACE
      ?auto_95609 - SURFACE
      ?auto_95606 - SURFACE
      ?auto_95610 - SURFACE
      ?auto_95612 - SURFACE
      ?auto_95611 - SURFACE
      ?auto_95613 - SURFACE
    )
    :vars
    (
      ?auto_95615 - HOIST
      ?auto_95614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95615 ?auto_95614 ) ( SURFACE-AT ?auto_95611 ?auto_95614 ) ( CLEAR ?auto_95611 ) ( LIFTING ?auto_95615 ?auto_95613 ) ( IS-CRATE ?auto_95613 ) ( not ( = ?auto_95611 ?auto_95613 ) ) ( ON ?auto_95608 ?auto_95607 ) ( ON ?auto_95609 ?auto_95608 ) ( ON ?auto_95606 ?auto_95609 ) ( ON ?auto_95610 ?auto_95606 ) ( ON ?auto_95612 ?auto_95610 ) ( ON ?auto_95611 ?auto_95612 ) ( not ( = ?auto_95607 ?auto_95608 ) ) ( not ( = ?auto_95607 ?auto_95609 ) ) ( not ( = ?auto_95607 ?auto_95606 ) ) ( not ( = ?auto_95607 ?auto_95610 ) ) ( not ( = ?auto_95607 ?auto_95612 ) ) ( not ( = ?auto_95607 ?auto_95611 ) ) ( not ( = ?auto_95607 ?auto_95613 ) ) ( not ( = ?auto_95608 ?auto_95609 ) ) ( not ( = ?auto_95608 ?auto_95606 ) ) ( not ( = ?auto_95608 ?auto_95610 ) ) ( not ( = ?auto_95608 ?auto_95612 ) ) ( not ( = ?auto_95608 ?auto_95611 ) ) ( not ( = ?auto_95608 ?auto_95613 ) ) ( not ( = ?auto_95609 ?auto_95606 ) ) ( not ( = ?auto_95609 ?auto_95610 ) ) ( not ( = ?auto_95609 ?auto_95612 ) ) ( not ( = ?auto_95609 ?auto_95611 ) ) ( not ( = ?auto_95609 ?auto_95613 ) ) ( not ( = ?auto_95606 ?auto_95610 ) ) ( not ( = ?auto_95606 ?auto_95612 ) ) ( not ( = ?auto_95606 ?auto_95611 ) ) ( not ( = ?auto_95606 ?auto_95613 ) ) ( not ( = ?auto_95610 ?auto_95612 ) ) ( not ( = ?auto_95610 ?auto_95611 ) ) ( not ( = ?auto_95610 ?auto_95613 ) ) ( not ( = ?auto_95612 ?auto_95611 ) ) ( not ( = ?auto_95612 ?auto_95613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_95611 ?auto_95613 )
      ( MAKE-7CRATE-VERIFY ?auto_95607 ?auto_95608 ?auto_95609 ?auto_95606 ?auto_95610 ?auto_95612 ?auto_95611 ?auto_95613 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95662 - SURFACE
      ?auto_95663 - SURFACE
      ?auto_95664 - SURFACE
      ?auto_95661 - SURFACE
      ?auto_95665 - SURFACE
      ?auto_95667 - SURFACE
      ?auto_95666 - SURFACE
      ?auto_95668 - SURFACE
    )
    :vars
    (
      ?auto_95671 - HOIST
      ?auto_95670 - PLACE
      ?auto_95669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95671 ?auto_95670 ) ( SURFACE-AT ?auto_95666 ?auto_95670 ) ( CLEAR ?auto_95666 ) ( IS-CRATE ?auto_95668 ) ( not ( = ?auto_95666 ?auto_95668 ) ) ( TRUCK-AT ?auto_95669 ?auto_95670 ) ( AVAILABLE ?auto_95671 ) ( IN ?auto_95668 ?auto_95669 ) ( ON ?auto_95666 ?auto_95667 ) ( not ( = ?auto_95667 ?auto_95666 ) ) ( not ( = ?auto_95667 ?auto_95668 ) ) ( ON ?auto_95663 ?auto_95662 ) ( ON ?auto_95664 ?auto_95663 ) ( ON ?auto_95661 ?auto_95664 ) ( ON ?auto_95665 ?auto_95661 ) ( ON ?auto_95667 ?auto_95665 ) ( not ( = ?auto_95662 ?auto_95663 ) ) ( not ( = ?auto_95662 ?auto_95664 ) ) ( not ( = ?auto_95662 ?auto_95661 ) ) ( not ( = ?auto_95662 ?auto_95665 ) ) ( not ( = ?auto_95662 ?auto_95667 ) ) ( not ( = ?auto_95662 ?auto_95666 ) ) ( not ( = ?auto_95662 ?auto_95668 ) ) ( not ( = ?auto_95663 ?auto_95664 ) ) ( not ( = ?auto_95663 ?auto_95661 ) ) ( not ( = ?auto_95663 ?auto_95665 ) ) ( not ( = ?auto_95663 ?auto_95667 ) ) ( not ( = ?auto_95663 ?auto_95666 ) ) ( not ( = ?auto_95663 ?auto_95668 ) ) ( not ( = ?auto_95664 ?auto_95661 ) ) ( not ( = ?auto_95664 ?auto_95665 ) ) ( not ( = ?auto_95664 ?auto_95667 ) ) ( not ( = ?auto_95664 ?auto_95666 ) ) ( not ( = ?auto_95664 ?auto_95668 ) ) ( not ( = ?auto_95661 ?auto_95665 ) ) ( not ( = ?auto_95661 ?auto_95667 ) ) ( not ( = ?auto_95661 ?auto_95666 ) ) ( not ( = ?auto_95661 ?auto_95668 ) ) ( not ( = ?auto_95665 ?auto_95667 ) ) ( not ( = ?auto_95665 ?auto_95666 ) ) ( not ( = ?auto_95665 ?auto_95668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95667 ?auto_95666 ?auto_95668 )
      ( MAKE-7CRATE-VERIFY ?auto_95662 ?auto_95663 ?auto_95664 ?auto_95661 ?auto_95665 ?auto_95667 ?auto_95666 ?auto_95668 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95725 - SURFACE
      ?auto_95726 - SURFACE
      ?auto_95727 - SURFACE
      ?auto_95724 - SURFACE
      ?auto_95728 - SURFACE
      ?auto_95730 - SURFACE
      ?auto_95729 - SURFACE
      ?auto_95731 - SURFACE
    )
    :vars
    (
      ?auto_95733 - HOIST
      ?auto_95734 - PLACE
      ?auto_95732 - TRUCK
      ?auto_95735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95733 ?auto_95734 ) ( SURFACE-AT ?auto_95729 ?auto_95734 ) ( CLEAR ?auto_95729 ) ( IS-CRATE ?auto_95731 ) ( not ( = ?auto_95729 ?auto_95731 ) ) ( AVAILABLE ?auto_95733 ) ( IN ?auto_95731 ?auto_95732 ) ( ON ?auto_95729 ?auto_95730 ) ( not ( = ?auto_95730 ?auto_95729 ) ) ( not ( = ?auto_95730 ?auto_95731 ) ) ( TRUCK-AT ?auto_95732 ?auto_95735 ) ( not ( = ?auto_95735 ?auto_95734 ) ) ( ON ?auto_95726 ?auto_95725 ) ( ON ?auto_95727 ?auto_95726 ) ( ON ?auto_95724 ?auto_95727 ) ( ON ?auto_95728 ?auto_95724 ) ( ON ?auto_95730 ?auto_95728 ) ( not ( = ?auto_95725 ?auto_95726 ) ) ( not ( = ?auto_95725 ?auto_95727 ) ) ( not ( = ?auto_95725 ?auto_95724 ) ) ( not ( = ?auto_95725 ?auto_95728 ) ) ( not ( = ?auto_95725 ?auto_95730 ) ) ( not ( = ?auto_95725 ?auto_95729 ) ) ( not ( = ?auto_95725 ?auto_95731 ) ) ( not ( = ?auto_95726 ?auto_95727 ) ) ( not ( = ?auto_95726 ?auto_95724 ) ) ( not ( = ?auto_95726 ?auto_95728 ) ) ( not ( = ?auto_95726 ?auto_95730 ) ) ( not ( = ?auto_95726 ?auto_95729 ) ) ( not ( = ?auto_95726 ?auto_95731 ) ) ( not ( = ?auto_95727 ?auto_95724 ) ) ( not ( = ?auto_95727 ?auto_95728 ) ) ( not ( = ?auto_95727 ?auto_95730 ) ) ( not ( = ?auto_95727 ?auto_95729 ) ) ( not ( = ?auto_95727 ?auto_95731 ) ) ( not ( = ?auto_95724 ?auto_95728 ) ) ( not ( = ?auto_95724 ?auto_95730 ) ) ( not ( = ?auto_95724 ?auto_95729 ) ) ( not ( = ?auto_95724 ?auto_95731 ) ) ( not ( = ?auto_95728 ?auto_95730 ) ) ( not ( = ?auto_95728 ?auto_95729 ) ) ( not ( = ?auto_95728 ?auto_95731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95730 ?auto_95729 ?auto_95731 )
      ( MAKE-7CRATE-VERIFY ?auto_95725 ?auto_95726 ?auto_95727 ?auto_95724 ?auto_95728 ?auto_95730 ?auto_95729 ?auto_95731 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95795 - SURFACE
      ?auto_95796 - SURFACE
      ?auto_95797 - SURFACE
      ?auto_95794 - SURFACE
      ?auto_95798 - SURFACE
      ?auto_95800 - SURFACE
      ?auto_95799 - SURFACE
      ?auto_95801 - SURFACE
    )
    :vars
    (
      ?auto_95803 - HOIST
      ?auto_95805 - PLACE
      ?auto_95802 - TRUCK
      ?auto_95806 - PLACE
      ?auto_95804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_95803 ?auto_95805 ) ( SURFACE-AT ?auto_95799 ?auto_95805 ) ( CLEAR ?auto_95799 ) ( IS-CRATE ?auto_95801 ) ( not ( = ?auto_95799 ?auto_95801 ) ) ( AVAILABLE ?auto_95803 ) ( ON ?auto_95799 ?auto_95800 ) ( not ( = ?auto_95800 ?auto_95799 ) ) ( not ( = ?auto_95800 ?auto_95801 ) ) ( TRUCK-AT ?auto_95802 ?auto_95806 ) ( not ( = ?auto_95806 ?auto_95805 ) ) ( HOIST-AT ?auto_95804 ?auto_95806 ) ( LIFTING ?auto_95804 ?auto_95801 ) ( not ( = ?auto_95803 ?auto_95804 ) ) ( ON ?auto_95796 ?auto_95795 ) ( ON ?auto_95797 ?auto_95796 ) ( ON ?auto_95794 ?auto_95797 ) ( ON ?auto_95798 ?auto_95794 ) ( ON ?auto_95800 ?auto_95798 ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95797 ) ) ( not ( = ?auto_95795 ?auto_95794 ) ) ( not ( = ?auto_95795 ?auto_95798 ) ) ( not ( = ?auto_95795 ?auto_95800 ) ) ( not ( = ?auto_95795 ?auto_95799 ) ) ( not ( = ?auto_95795 ?auto_95801 ) ) ( not ( = ?auto_95796 ?auto_95797 ) ) ( not ( = ?auto_95796 ?auto_95794 ) ) ( not ( = ?auto_95796 ?auto_95798 ) ) ( not ( = ?auto_95796 ?auto_95800 ) ) ( not ( = ?auto_95796 ?auto_95799 ) ) ( not ( = ?auto_95796 ?auto_95801 ) ) ( not ( = ?auto_95797 ?auto_95794 ) ) ( not ( = ?auto_95797 ?auto_95798 ) ) ( not ( = ?auto_95797 ?auto_95800 ) ) ( not ( = ?auto_95797 ?auto_95799 ) ) ( not ( = ?auto_95797 ?auto_95801 ) ) ( not ( = ?auto_95794 ?auto_95798 ) ) ( not ( = ?auto_95794 ?auto_95800 ) ) ( not ( = ?auto_95794 ?auto_95799 ) ) ( not ( = ?auto_95794 ?auto_95801 ) ) ( not ( = ?auto_95798 ?auto_95800 ) ) ( not ( = ?auto_95798 ?auto_95799 ) ) ( not ( = ?auto_95798 ?auto_95801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95800 ?auto_95799 ?auto_95801 )
      ( MAKE-7CRATE-VERIFY ?auto_95795 ?auto_95796 ?auto_95797 ?auto_95794 ?auto_95798 ?auto_95800 ?auto_95799 ?auto_95801 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95872 - SURFACE
      ?auto_95873 - SURFACE
      ?auto_95874 - SURFACE
      ?auto_95871 - SURFACE
      ?auto_95875 - SURFACE
      ?auto_95877 - SURFACE
      ?auto_95876 - SURFACE
      ?auto_95878 - SURFACE
    )
    :vars
    (
      ?auto_95881 - HOIST
      ?auto_95884 - PLACE
      ?auto_95880 - TRUCK
      ?auto_95883 - PLACE
      ?auto_95882 - HOIST
      ?auto_95879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95881 ?auto_95884 ) ( SURFACE-AT ?auto_95876 ?auto_95884 ) ( CLEAR ?auto_95876 ) ( IS-CRATE ?auto_95878 ) ( not ( = ?auto_95876 ?auto_95878 ) ) ( AVAILABLE ?auto_95881 ) ( ON ?auto_95876 ?auto_95877 ) ( not ( = ?auto_95877 ?auto_95876 ) ) ( not ( = ?auto_95877 ?auto_95878 ) ) ( TRUCK-AT ?auto_95880 ?auto_95883 ) ( not ( = ?auto_95883 ?auto_95884 ) ) ( HOIST-AT ?auto_95882 ?auto_95883 ) ( not ( = ?auto_95881 ?auto_95882 ) ) ( AVAILABLE ?auto_95882 ) ( SURFACE-AT ?auto_95878 ?auto_95883 ) ( ON ?auto_95878 ?auto_95879 ) ( CLEAR ?auto_95878 ) ( not ( = ?auto_95876 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( ON ?auto_95873 ?auto_95872 ) ( ON ?auto_95874 ?auto_95873 ) ( ON ?auto_95871 ?auto_95874 ) ( ON ?auto_95875 ?auto_95871 ) ( ON ?auto_95877 ?auto_95875 ) ( not ( = ?auto_95872 ?auto_95873 ) ) ( not ( = ?auto_95872 ?auto_95874 ) ) ( not ( = ?auto_95872 ?auto_95871 ) ) ( not ( = ?auto_95872 ?auto_95875 ) ) ( not ( = ?auto_95872 ?auto_95877 ) ) ( not ( = ?auto_95872 ?auto_95876 ) ) ( not ( = ?auto_95872 ?auto_95878 ) ) ( not ( = ?auto_95872 ?auto_95879 ) ) ( not ( = ?auto_95873 ?auto_95874 ) ) ( not ( = ?auto_95873 ?auto_95871 ) ) ( not ( = ?auto_95873 ?auto_95875 ) ) ( not ( = ?auto_95873 ?auto_95877 ) ) ( not ( = ?auto_95873 ?auto_95876 ) ) ( not ( = ?auto_95873 ?auto_95878 ) ) ( not ( = ?auto_95873 ?auto_95879 ) ) ( not ( = ?auto_95874 ?auto_95871 ) ) ( not ( = ?auto_95874 ?auto_95875 ) ) ( not ( = ?auto_95874 ?auto_95877 ) ) ( not ( = ?auto_95874 ?auto_95876 ) ) ( not ( = ?auto_95874 ?auto_95878 ) ) ( not ( = ?auto_95874 ?auto_95879 ) ) ( not ( = ?auto_95871 ?auto_95875 ) ) ( not ( = ?auto_95871 ?auto_95877 ) ) ( not ( = ?auto_95871 ?auto_95876 ) ) ( not ( = ?auto_95871 ?auto_95878 ) ) ( not ( = ?auto_95871 ?auto_95879 ) ) ( not ( = ?auto_95875 ?auto_95877 ) ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( not ( = ?auto_95875 ?auto_95878 ) ) ( not ( = ?auto_95875 ?auto_95879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95877 ?auto_95876 ?auto_95878 )
      ( MAKE-7CRATE-VERIFY ?auto_95872 ?auto_95873 ?auto_95874 ?auto_95871 ?auto_95875 ?auto_95877 ?auto_95876 ?auto_95878 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95950 - SURFACE
      ?auto_95951 - SURFACE
      ?auto_95952 - SURFACE
      ?auto_95949 - SURFACE
      ?auto_95953 - SURFACE
      ?auto_95955 - SURFACE
      ?auto_95954 - SURFACE
      ?auto_95956 - SURFACE
    )
    :vars
    (
      ?auto_95958 - HOIST
      ?auto_95959 - PLACE
      ?auto_95962 - PLACE
      ?auto_95961 - HOIST
      ?auto_95960 - SURFACE
      ?auto_95957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95958 ?auto_95959 ) ( SURFACE-AT ?auto_95954 ?auto_95959 ) ( CLEAR ?auto_95954 ) ( IS-CRATE ?auto_95956 ) ( not ( = ?auto_95954 ?auto_95956 ) ) ( AVAILABLE ?auto_95958 ) ( ON ?auto_95954 ?auto_95955 ) ( not ( = ?auto_95955 ?auto_95954 ) ) ( not ( = ?auto_95955 ?auto_95956 ) ) ( not ( = ?auto_95962 ?auto_95959 ) ) ( HOIST-AT ?auto_95961 ?auto_95962 ) ( not ( = ?auto_95958 ?auto_95961 ) ) ( AVAILABLE ?auto_95961 ) ( SURFACE-AT ?auto_95956 ?auto_95962 ) ( ON ?auto_95956 ?auto_95960 ) ( CLEAR ?auto_95956 ) ( not ( = ?auto_95954 ?auto_95960 ) ) ( not ( = ?auto_95956 ?auto_95960 ) ) ( not ( = ?auto_95955 ?auto_95960 ) ) ( TRUCK-AT ?auto_95957 ?auto_95959 ) ( ON ?auto_95951 ?auto_95950 ) ( ON ?auto_95952 ?auto_95951 ) ( ON ?auto_95949 ?auto_95952 ) ( ON ?auto_95953 ?auto_95949 ) ( ON ?auto_95955 ?auto_95953 ) ( not ( = ?auto_95950 ?auto_95951 ) ) ( not ( = ?auto_95950 ?auto_95952 ) ) ( not ( = ?auto_95950 ?auto_95949 ) ) ( not ( = ?auto_95950 ?auto_95953 ) ) ( not ( = ?auto_95950 ?auto_95955 ) ) ( not ( = ?auto_95950 ?auto_95954 ) ) ( not ( = ?auto_95950 ?auto_95956 ) ) ( not ( = ?auto_95950 ?auto_95960 ) ) ( not ( = ?auto_95951 ?auto_95952 ) ) ( not ( = ?auto_95951 ?auto_95949 ) ) ( not ( = ?auto_95951 ?auto_95953 ) ) ( not ( = ?auto_95951 ?auto_95955 ) ) ( not ( = ?auto_95951 ?auto_95954 ) ) ( not ( = ?auto_95951 ?auto_95956 ) ) ( not ( = ?auto_95951 ?auto_95960 ) ) ( not ( = ?auto_95952 ?auto_95949 ) ) ( not ( = ?auto_95952 ?auto_95953 ) ) ( not ( = ?auto_95952 ?auto_95955 ) ) ( not ( = ?auto_95952 ?auto_95954 ) ) ( not ( = ?auto_95952 ?auto_95956 ) ) ( not ( = ?auto_95952 ?auto_95960 ) ) ( not ( = ?auto_95949 ?auto_95953 ) ) ( not ( = ?auto_95949 ?auto_95955 ) ) ( not ( = ?auto_95949 ?auto_95954 ) ) ( not ( = ?auto_95949 ?auto_95956 ) ) ( not ( = ?auto_95949 ?auto_95960 ) ) ( not ( = ?auto_95953 ?auto_95955 ) ) ( not ( = ?auto_95953 ?auto_95954 ) ) ( not ( = ?auto_95953 ?auto_95956 ) ) ( not ( = ?auto_95953 ?auto_95960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95955 ?auto_95954 ?auto_95956 )
      ( MAKE-7CRATE-VERIFY ?auto_95950 ?auto_95951 ?auto_95952 ?auto_95949 ?auto_95953 ?auto_95955 ?auto_95954 ?auto_95956 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96028 - SURFACE
      ?auto_96029 - SURFACE
      ?auto_96030 - SURFACE
      ?auto_96027 - SURFACE
      ?auto_96031 - SURFACE
      ?auto_96033 - SURFACE
      ?auto_96032 - SURFACE
      ?auto_96034 - SURFACE
    )
    :vars
    (
      ?auto_96035 - HOIST
      ?auto_96040 - PLACE
      ?auto_96036 - PLACE
      ?auto_96037 - HOIST
      ?auto_96038 - SURFACE
      ?auto_96039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96035 ?auto_96040 ) ( IS-CRATE ?auto_96034 ) ( not ( = ?auto_96032 ?auto_96034 ) ) ( not ( = ?auto_96033 ?auto_96032 ) ) ( not ( = ?auto_96033 ?auto_96034 ) ) ( not ( = ?auto_96036 ?auto_96040 ) ) ( HOIST-AT ?auto_96037 ?auto_96036 ) ( not ( = ?auto_96035 ?auto_96037 ) ) ( AVAILABLE ?auto_96037 ) ( SURFACE-AT ?auto_96034 ?auto_96036 ) ( ON ?auto_96034 ?auto_96038 ) ( CLEAR ?auto_96034 ) ( not ( = ?auto_96032 ?auto_96038 ) ) ( not ( = ?auto_96034 ?auto_96038 ) ) ( not ( = ?auto_96033 ?auto_96038 ) ) ( TRUCK-AT ?auto_96039 ?auto_96040 ) ( SURFACE-AT ?auto_96033 ?auto_96040 ) ( CLEAR ?auto_96033 ) ( LIFTING ?auto_96035 ?auto_96032 ) ( IS-CRATE ?auto_96032 ) ( ON ?auto_96029 ?auto_96028 ) ( ON ?auto_96030 ?auto_96029 ) ( ON ?auto_96027 ?auto_96030 ) ( ON ?auto_96031 ?auto_96027 ) ( ON ?auto_96033 ?auto_96031 ) ( not ( = ?auto_96028 ?auto_96029 ) ) ( not ( = ?auto_96028 ?auto_96030 ) ) ( not ( = ?auto_96028 ?auto_96027 ) ) ( not ( = ?auto_96028 ?auto_96031 ) ) ( not ( = ?auto_96028 ?auto_96033 ) ) ( not ( = ?auto_96028 ?auto_96032 ) ) ( not ( = ?auto_96028 ?auto_96034 ) ) ( not ( = ?auto_96028 ?auto_96038 ) ) ( not ( = ?auto_96029 ?auto_96030 ) ) ( not ( = ?auto_96029 ?auto_96027 ) ) ( not ( = ?auto_96029 ?auto_96031 ) ) ( not ( = ?auto_96029 ?auto_96033 ) ) ( not ( = ?auto_96029 ?auto_96032 ) ) ( not ( = ?auto_96029 ?auto_96034 ) ) ( not ( = ?auto_96029 ?auto_96038 ) ) ( not ( = ?auto_96030 ?auto_96027 ) ) ( not ( = ?auto_96030 ?auto_96031 ) ) ( not ( = ?auto_96030 ?auto_96033 ) ) ( not ( = ?auto_96030 ?auto_96032 ) ) ( not ( = ?auto_96030 ?auto_96034 ) ) ( not ( = ?auto_96030 ?auto_96038 ) ) ( not ( = ?auto_96027 ?auto_96031 ) ) ( not ( = ?auto_96027 ?auto_96033 ) ) ( not ( = ?auto_96027 ?auto_96032 ) ) ( not ( = ?auto_96027 ?auto_96034 ) ) ( not ( = ?auto_96027 ?auto_96038 ) ) ( not ( = ?auto_96031 ?auto_96033 ) ) ( not ( = ?auto_96031 ?auto_96032 ) ) ( not ( = ?auto_96031 ?auto_96034 ) ) ( not ( = ?auto_96031 ?auto_96038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96033 ?auto_96032 ?auto_96034 )
      ( MAKE-7CRATE-VERIFY ?auto_96028 ?auto_96029 ?auto_96030 ?auto_96027 ?auto_96031 ?auto_96033 ?auto_96032 ?auto_96034 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_96106 - SURFACE
      ?auto_96107 - SURFACE
      ?auto_96108 - SURFACE
      ?auto_96105 - SURFACE
      ?auto_96109 - SURFACE
      ?auto_96111 - SURFACE
      ?auto_96110 - SURFACE
      ?auto_96112 - SURFACE
    )
    :vars
    (
      ?auto_96114 - HOIST
      ?auto_96117 - PLACE
      ?auto_96113 - PLACE
      ?auto_96118 - HOIST
      ?auto_96116 - SURFACE
      ?auto_96115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_96114 ?auto_96117 ) ( IS-CRATE ?auto_96112 ) ( not ( = ?auto_96110 ?auto_96112 ) ) ( not ( = ?auto_96111 ?auto_96110 ) ) ( not ( = ?auto_96111 ?auto_96112 ) ) ( not ( = ?auto_96113 ?auto_96117 ) ) ( HOIST-AT ?auto_96118 ?auto_96113 ) ( not ( = ?auto_96114 ?auto_96118 ) ) ( AVAILABLE ?auto_96118 ) ( SURFACE-AT ?auto_96112 ?auto_96113 ) ( ON ?auto_96112 ?auto_96116 ) ( CLEAR ?auto_96112 ) ( not ( = ?auto_96110 ?auto_96116 ) ) ( not ( = ?auto_96112 ?auto_96116 ) ) ( not ( = ?auto_96111 ?auto_96116 ) ) ( TRUCK-AT ?auto_96115 ?auto_96117 ) ( SURFACE-AT ?auto_96111 ?auto_96117 ) ( CLEAR ?auto_96111 ) ( IS-CRATE ?auto_96110 ) ( AVAILABLE ?auto_96114 ) ( IN ?auto_96110 ?auto_96115 ) ( ON ?auto_96107 ?auto_96106 ) ( ON ?auto_96108 ?auto_96107 ) ( ON ?auto_96105 ?auto_96108 ) ( ON ?auto_96109 ?auto_96105 ) ( ON ?auto_96111 ?auto_96109 ) ( not ( = ?auto_96106 ?auto_96107 ) ) ( not ( = ?auto_96106 ?auto_96108 ) ) ( not ( = ?auto_96106 ?auto_96105 ) ) ( not ( = ?auto_96106 ?auto_96109 ) ) ( not ( = ?auto_96106 ?auto_96111 ) ) ( not ( = ?auto_96106 ?auto_96110 ) ) ( not ( = ?auto_96106 ?auto_96112 ) ) ( not ( = ?auto_96106 ?auto_96116 ) ) ( not ( = ?auto_96107 ?auto_96108 ) ) ( not ( = ?auto_96107 ?auto_96105 ) ) ( not ( = ?auto_96107 ?auto_96109 ) ) ( not ( = ?auto_96107 ?auto_96111 ) ) ( not ( = ?auto_96107 ?auto_96110 ) ) ( not ( = ?auto_96107 ?auto_96112 ) ) ( not ( = ?auto_96107 ?auto_96116 ) ) ( not ( = ?auto_96108 ?auto_96105 ) ) ( not ( = ?auto_96108 ?auto_96109 ) ) ( not ( = ?auto_96108 ?auto_96111 ) ) ( not ( = ?auto_96108 ?auto_96110 ) ) ( not ( = ?auto_96108 ?auto_96112 ) ) ( not ( = ?auto_96108 ?auto_96116 ) ) ( not ( = ?auto_96105 ?auto_96109 ) ) ( not ( = ?auto_96105 ?auto_96111 ) ) ( not ( = ?auto_96105 ?auto_96110 ) ) ( not ( = ?auto_96105 ?auto_96112 ) ) ( not ( = ?auto_96105 ?auto_96116 ) ) ( not ( = ?auto_96109 ?auto_96111 ) ) ( not ( = ?auto_96109 ?auto_96110 ) ) ( not ( = ?auto_96109 ?auto_96112 ) ) ( not ( = ?auto_96109 ?auto_96116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_96111 ?auto_96110 ?auto_96112 )
      ( MAKE-7CRATE-VERIFY ?auto_96106 ?auto_96107 ?auto_96108 ?auto_96105 ?auto_96109 ?auto_96111 ?auto_96110 ?auto_96112 ) )
  )

)

