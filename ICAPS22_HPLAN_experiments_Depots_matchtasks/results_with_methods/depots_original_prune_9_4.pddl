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

  ( :method MAKE-8CRATE-VERIFY
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
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
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
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245094 - SURFACE
      ?auto_245095 - SURFACE
    )
    :vars
    (
      ?auto_245096 - HOIST
      ?auto_245097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245096 ?auto_245097 ) ( SURFACE-AT ?auto_245094 ?auto_245097 ) ( CLEAR ?auto_245094 ) ( LIFTING ?auto_245096 ?auto_245095 ) ( IS-CRATE ?auto_245095 ) ( not ( = ?auto_245094 ?auto_245095 ) ) )
    :subtasks
    ( ( !DROP ?auto_245096 ?auto_245095 ?auto_245094 ?auto_245097 )
      ( MAKE-1CRATE-VERIFY ?auto_245094 ?auto_245095 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245098 - SURFACE
      ?auto_245099 - SURFACE
    )
    :vars
    (
      ?auto_245101 - HOIST
      ?auto_245100 - PLACE
      ?auto_245102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245101 ?auto_245100 ) ( SURFACE-AT ?auto_245098 ?auto_245100 ) ( CLEAR ?auto_245098 ) ( IS-CRATE ?auto_245099 ) ( not ( = ?auto_245098 ?auto_245099 ) ) ( TRUCK-AT ?auto_245102 ?auto_245100 ) ( AVAILABLE ?auto_245101 ) ( IN ?auto_245099 ?auto_245102 ) )
    :subtasks
    ( ( !UNLOAD ?auto_245101 ?auto_245099 ?auto_245102 ?auto_245100 )
      ( MAKE-1CRATE ?auto_245098 ?auto_245099 )
      ( MAKE-1CRATE-VERIFY ?auto_245098 ?auto_245099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245103 - SURFACE
      ?auto_245104 - SURFACE
    )
    :vars
    (
      ?auto_245107 - HOIST
      ?auto_245105 - PLACE
      ?auto_245106 - TRUCK
      ?auto_245108 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245107 ?auto_245105 ) ( SURFACE-AT ?auto_245103 ?auto_245105 ) ( CLEAR ?auto_245103 ) ( IS-CRATE ?auto_245104 ) ( not ( = ?auto_245103 ?auto_245104 ) ) ( AVAILABLE ?auto_245107 ) ( IN ?auto_245104 ?auto_245106 ) ( TRUCK-AT ?auto_245106 ?auto_245108 ) ( not ( = ?auto_245108 ?auto_245105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_245106 ?auto_245108 ?auto_245105 )
      ( MAKE-1CRATE ?auto_245103 ?auto_245104 )
      ( MAKE-1CRATE-VERIFY ?auto_245103 ?auto_245104 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245109 - SURFACE
      ?auto_245110 - SURFACE
    )
    :vars
    (
      ?auto_245113 - HOIST
      ?auto_245111 - PLACE
      ?auto_245112 - TRUCK
      ?auto_245114 - PLACE
      ?auto_245115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245113 ?auto_245111 ) ( SURFACE-AT ?auto_245109 ?auto_245111 ) ( CLEAR ?auto_245109 ) ( IS-CRATE ?auto_245110 ) ( not ( = ?auto_245109 ?auto_245110 ) ) ( AVAILABLE ?auto_245113 ) ( TRUCK-AT ?auto_245112 ?auto_245114 ) ( not ( = ?auto_245114 ?auto_245111 ) ) ( HOIST-AT ?auto_245115 ?auto_245114 ) ( LIFTING ?auto_245115 ?auto_245110 ) ( not ( = ?auto_245113 ?auto_245115 ) ) )
    :subtasks
    ( ( !LOAD ?auto_245115 ?auto_245110 ?auto_245112 ?auto_245114 )
      ( MAKE-1CRATE ?auto_245109 ?auto_245110 )
      ( MAKE-1CRATE-VERIFY ?auto_245109 ?auto_245110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245116 - SURFACE
      ?auto_245117 - SURFACE
    )
    :vars
    (
      ?auto_245118 - HOIST
      ?auto_245119 - PLACE
      ?auto_245122 - TRUCK
      ?auto_245121 - PLACE
      ?auto_245120 - HOIST
      ?auto_245123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245118 ?auto_245119 ) ( SURFACE-AT ?auto_245116 ?auto_245119 ) ( CLEAR ?auto_245116 ) ( IS-CRATE ?auto_245117 ) ( not ( = ?auto_245116 ?auto_245117 ) ) ( AVAILABLE ?auto_245118 ) ( TRUCK-AT ?auto_245122 ?auto_245121 ) ( not ( = ?auto_245121 ?auto_245119 ) ) ( HOIST-AT ?auto_245120 ?auto_245121 ) ( not ( = ?auto_245118 ?auto_245120 ) ) ( AVAILABLE ?auto_245120 ) ( SURFACE-AT ?auto_245117 ?auto_245121 ) ( ON ?auto_245117 ?auto_245123 ) ( CLEAR ?auto_245117 ) ( not ( = ?auto_245116 ?auto_245123 ) ) ( not ( = ?auto_245117 ?auto_245123 ) ) )
    :subtasks
    ( ( !LIFT ?auto_245120 ?auto_245117 ?auto_245123 ?auto_245121 )
      ( MAKE-1CRATE ?auto_245116 ?auto_245117 )
      ( MAKE-1CRATE-VERIFY ?auto_245116 ?auto_245117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245124 - SURFACE
      ?auto_245125 - SURFACE
    )
    :vars
    (
      ?auto_245129 - HOIST
      ?auto_245126 - PLACE
      ?auto_245130 - PLACE
      ?auto_245127 - HOIST
      ?auto_245131 - SURFACE
      ?auto_245128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245129 ?auto_245126 ) ( SURFACE-AT ?auto_245124 ?auto_245126 ) ( CLEAR ?auto_245124 ) ( IS-CRATE ?auto_245125 ) ( not ( = ?auto_245124 ?auto_245125 ) ) ( AVAILABLE ?auto_245129 ) ( not ( = ?auto_245130 ?auto_245126 ) ) ( HOIST-AT ?auto_245127 ?auto_245130 ) ( not ( = ?auto_245129 ?auto_245127 ) ) ( AVAILABLE ?auto_245127 ) ( SURFACE-AT ?auto_245125 ?auto_245130 ) ( ON ?auto_245125 ?auto_245131 ) ( CLEAR ?auto_245125 ) ( not ( = ?auto_245124 ?auto_245131 ) ) ( not ( = ?auto_245125 ?auto_245131 ) ) ( TRUCK-AT ?auto_245128 ?auto_245126 ) )
    :subtasks
    ( ( !DRIVE ?auto_245128 ?auto_245126 ?auto_245130 )
      ( MAKE-1CRATE ?auto_245124 ?auto_245125 )
      ( MAKE-1CRATE-VERIFY ?auto_245124 ?auto_245125 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245141 - SURFACE
      ?auto_245142 - SURFACE
      ?auto_245143 - SURFACE
    )
    :vars
    (
      ?auto_245144 - HOIST
      ?auto_245145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245144 ?auto_245145 ) ( SURFACE-AT ?auto_245142 ?auto_245145 ) ( CLEAR ?auto_245142 ) ( LIFTING ?auto_245144 ?auto_245143 ) ( IS-CRATE ?auto_245143 ) ( not ( = ?auto_245142 ?auto_245143 ) ) ( ON ?auto_245142 ?auto_245141 ) ( not ( = ?auto_245141 ?auto_245142 ) ) ( not ( = ?auto_245141 ?auto_245143 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245142 ?auto_245143 )
      ( MAKE-2CRATE-VERIFY ?auto_245141 ?auto_245142 ?auto_245143 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245151 - SURFACE
      ?auto_245152 - SURFACE
      ?auto_245153 - SURFACE
    )
    :vars
    (
      ?auto_245154 - HOIST
      ?auto_245156 - PLACE
      ?auto_245155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245154 ?auto_245156 ) ( SURFACE-AT ?auto_245152 ?auto_245156 ) ( CLEAR ?auto_245152 ) ( IS-CRATE ?auto_245153 ) ( not ( = ?auto_245152 ?auto_245153 ) ) ( TRUCK-AT ?auto_245155 ?auto_245156 ) ( AVAILABLE ?auto_245154 ) ( IN ?auto_245153 ?auto_245155 ) ( ON ?auto_245152 ?auto_245151 ) ( not ( = ?auto_245151 ?auto_245152 ) ) ( not ( = ?auto_245151 ?auto_245153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245152 ?auto_245153 )
      ( MAKE-2CRATE-VERIFY ?auto_245151 ?auto_245152 ?auto_245153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245157 - SURFACE
      ?auto_245158 - SURFACE
    )
    :vars
    (
      ?auto_245162 - HOIST
      ?auto_245161 - PLACE
      ?auto_245160 - TRUCK
      ?auto_245159 - SURFACE
      ?auto_245163 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245162 ?auto_245161 ) ( SURFACE-AT ?auto_245157 ?auto_245161 ) ( CLEAR ?auto_245157 ) ( IS-CRATE ?auto_245158 ) ( not ( = ?auto_245157 ?auto_245158 ) ) ( AVAILABLE ?auto_245162 ) ( IN ?auto_245158 ?auto_245160 ) ( ON ?auto_245157 ?auto_245159 ) ( not ( = ?auto_245159 ?auto_245157 ) ) ( not ( = ?auto_245159 ?auto_245158 ) ) ( TRUCK-AT ?auto_245160 ?auto_245163 ) ( not ( = ?auto_245163 ?auto_245161 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_245160 ?auto_245163 ?auto_245161 )
      ( MAKE-2CRATE ?auto_245159 ?auto_245157 ?auto_245158 )
      ( MAKE-1CRATE-VERIFY ?auto_245157 ?auto_245158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245164 - SURFACE
      ?auto_245165 - SURFACE
      ?auto_245166 - SURFACE
    )
    :vars
    (
      ?auto_245170 - HOIST
      ?auto_245169 - PLACE
      ?auto_245167 - TRUCK
      ?auto_245168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245170 ?auto_245169 ) ( SURFACE-AT ?auto_245165 ?auto_245169 ) ( CLEAR ?auto_245165 ) ( IS-CRATE ?auto_245166 ) ( not ( = ?auto_245165 ?auto_245166 ) ) ( AVAILABLE ?auto_245170 ) ( IN ?auto_245166 ?auto_245167 ) ( ON ?auto_245165 ?auto_245164 ) ( not ( = ?auto_245164 ?auto_245165 ) ) ( not ( = ?auto_245164 ?auto_245166 ) ) ( TRUCK-AT ?auto_245167 ?auto_245168 ) ( not ( = ?auto_245168 ?auto_245169 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245165 ?auto_245166 )
      ( MAKE-2CRATE-VERIFY ?auto_245164 ?auto_245165 ?auto_245166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245171 - SURFACE
      ?auto_245172 - SURFACE
    )
    :vars
    (
      ?auto_245177 - HOIST
      ?auto_245176 - PLACE
      ?auto_245173 - SURFACE
      ?auto_245174 - TRUCK
      ?auto_245175 - PLACE
      ?auto_245178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245177 ?auto_245176 ) ( SURFACE-AT ?auto_245171 ?auto_245176 ) ( CLEAR ?auto_245171 ) ( IS-CRATE ?auto_245172 ) ( not ( = ?auto_245171 ?auto_245172 ) ) ( AVAILABLE ?auto_245177 ) ( ON ?auto_245171 ?auto_245173 ) ( not ( = ?auto_245173 ?auto_245171 ) ) ( not ( = ?auto_245173 ?auto_245172 ) ) ( TRUCK-AT ?auto_245174 ?auto_245175 ) ( not ( = ?auto_245175 ?auto_245176 ) ) ( HOIST-AT ?auto_245178 ?auto_245175 ) ( LIFTING ?auto_245178 ?auto_245172 ) ( not ( = ?auto_245177 ?auto_245178 ) ) )
    :subtasks
    ( ( !LOAD ?auto_245178 ?auto_245172 ?auto_245174 ?auto_245175 )
      ( MAKE-2CRATE ?auto_245173 ?auto_245171 ?auto_245172 )
      ( MAKE-1CRATE-VERIFY ?auto_245171 ?auto_245172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245179 - SURFACE
      ?auto_245180 - SURFACE
      ?auto_245181 - SURFACE
    )
    :vars
    (
      ?auto_245183 - HOIST
      ?auto_245184 - PLACE
      ?auto_245186 - TRUCK
      ?auto_245182 - PLACE
      ?auto_245185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245183 ?auto_245184 ) ( SURFACE-AT ?auto_245180 ?auto_245184 ) ( CLEAR ?auto_245180 ) ( IS-CRATE ?auto_245181 ) ( not ( = ?auto_245180 ?auto_245181 ) ) ( AVAILABLE ?auto_245183 ) ( ON ?auto_245180 ?auto_245179 ) ( not ( = ?auto_245179 ?auto_245180 ) ) ( not ( = ?auto_245179 ?auto_245181 ) ) ( TRUCK-AT ?auto_245186 ?auto_245182 ) ( not ( = ?auto_245182 ?auto_245184 ) ) ( HOIST-AT ?auto_245185 ?auto_245182 ) ( LIFTING ?auto_245185 ?auto_245181 ) ( not ( = ?auto_245183 ?auto_245185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245180 ?auto_245181 )
      ( MAKE-2CRATE-VERIFY ?auto_245179 ?auto_245180 ?auto_245181 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245187 - SURFACE
      ?auto_245188 - SURFACE
    )
    :vars
    (
      ?auto_245192 - HOIST
      ?auto_245191 - PLACE
      ?auto_245194 - SURFACE
      ?auto_245193 - TRUCK
      ?auto_245190 - PLACE
      ?auto_245189 - HOIST
      ?auto_245195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245192 ?auto_245191 ) ( SURFACE-AT ?auto_245187 ?auto_245191 ) ( CLEAR ?auto_245187 ) ( IS-CRATE ?auto_245188 ) ( not ( = ?auto_245187 ?auto_245188 ) ) ( AVAILABLE ?auto_245192 ) ( ON ?auto_245187 ?auto_245194 ) ( not ( = ?auto_245194 ?auto_245187 ) ) ( not ( = ?auto_245194 ?auto_245188 ) ) ( TRUCK-AT ?auto_245193 ?auto_245190 ) ( not ( = ?auto_245190 ?auto_245191 ) ) ( HOIST-AT ?auto_245189 ?auto_245190 ) ( not ( = ?auto_245192 ?auto_245189 ) ) ( AVAILABLE ?auto_245189 ) ( SURFACE-AT ?auto_245188 ?auto_245190 ) ( ON ?auto_245188 ?auto_245195 ) ( CLEAR ?auto_245188 ) ( not ( = ?auto_245187 ?auto_245195 ) ) ( not ( = ?auto_245188 ?auto_245195 ) ) ( not ( = ?auto_245194 ?auto_245195 ) ) )
    :subtasks
    ( ( !LIFT ?auto_245189 ?auto_245188 ?auto_245195 ?auto_245190 )
      ( MAKE-2CRATE ?auto_245194 ?auto_245187 ?auto_245188 )
      ( MAKE-1CRATE-VERIFY ?auto_245187 ?auto_245188 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245196 - SURFACE
      ?auto_245197 - SURFACE
      ?auto_245198 - SURFACE
    )
    :vars
    (
      ?auto_245202 - HOIST
      ?auto_245200 - PLACE
      ?auto_245199 - TRUCK
      ?auto_245201 - PLACE
      ?auto_245204 - HOIST
      ?auto_245203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245202 ?auto_245200 ) ( SURFACE-AT ?auto_245197 ?auto_245200 ) ( CLEAR ?auto_245197 ) ( IS-CRATE ?auto_245198 ) ( not ( = ?auto_245197 ?auto_245198 ) ) ( AVAILABLE ?auto_245202 ) ( ON ?auto_245197 ?auto_245196 ) ( not ( = ?auto_245196 ?auto_245197 ) ) ( not ( = ?auto_245196 ?auto_245198 ) ) ( TRUCK-AT ?auto_245199 ?auto_245201 ) ( not ( = ?auto_245201 ?auto_245200 ) ) ( HOIST-AT ?auto_245204 ?auto_245201 ) ( not ( = ?auto_245202 ?auto_245204 ) ) ( AVAILABLE ?auto_245204 ) ( SURFACE-AT ?auto_245198 ?auto_245201 ) ( ON ?auto_245198 ?auto_245203 ) ( CLEAR ?auto_245198 ) ( not ( = ?auto_245197 ?auto_245203 ) ) ( not ( = ?auto_245198 ?auto_245203 ) ) ( not ( = ?auto_245196 ?auto_245203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245197 ?auto_245198 )
      ( MAKE-2CRATE-VERIFY ?auto_245196 ?auto_245197 ?auto_245198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245205 - SURFACE
      ?auto_245206 - SURFACE
    )
    :vars
    (
      ?auto_245212 - HOIST
      ?auto_245211 - PLACE
      ?auto_245213 - SURFACE
      ?auto_245207 - PLACE
      ?auto_245208 - HOIST
      ?auto_245210 - SURFACE
      ?auto_245209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245212 ?auto_245211 ) ( SURFACE-AT ?auto_245205 ?auto_245211 ) ( CLEAR ?auto_245205 ) ( IS-CRATE ?auto_245206 ) ( not ( = ?auto_245205 ?auto_245206 ) ) ( AVAILABLE ?auto_245212 ) ( ON ?auto_245205 ?auto_245213 ) ( not ( = ?auto_245213 ?auto_245205 ) ) ( not ( = ?auto_245213 ?auto_245206 ) ) ( not ( = ?auto_245207 ?auto_245211 ) ) ( HOIST-AT ?auto_245208 ?auto_245207 ) ( not ( = ?auto_245212 ?auto_245208 ) ) ( AVAILABLE ?auto_245208 ) ( SURFACE-AT ?auto_245206 ?auto_245207 ) ( ON ?auto_245206 ?auto_245210 ) ( CLEAR ?auto_245206 ) ( not ( = ?auto_245205 ?auto_245210 ) ) ( not ( = ?auto_245206 ?auto_245210 ) ) ( not ( = ?auto_245213 ?auto_245210 ) ) ( TRUCK-AT ?auto_245209 ?auto_245211 ) )
    :subtasks
    ( ( !DRIVE ?auto_245209 ?auto_245211 ?auto_245207 )
      ( MAKE-2CRATE ?auto_245213 ?auto_245205 ?auto_245206 )
      ( MAKE-1CRATE-VERIFY ?auto_245205 ?auto_245206 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245214 - SURFACE
      ?auto_245215 - SURFACE
      ?auto_245216 - SURFACE
    )
    :vars
    (
      ?auto_245219 - HOIST
      ?auto_245218 - PLACE
      ?auto_245222 - PLACE
      ?auto_245221 - HOIST
      ?auto_245220 - SURFACE
      ?auto_245217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245219 ?auto_245218 ) ( SURFACE-AT ?auto_245215 ?auto_245218 ) ( CLEAR ?auto_245215 ) ( IS-CRATE ?auto_245216 ) ( not ( = ?auto_245215 ?auto_245216 ) ) ( AVAILABLE ?auto_245219 ) ( ON ?auto_245215 ?auto_245214 ) ( not ( = ?auto_245214 ?auto_245215 ) ) ( not ( = ?auto_245214 ?auto_245216 ) ) ( not ( = ?auto_245222 ?auto_245218 ) ) ( HOIST-AT ?auto_245221 ?auto_245222 ) ( not ( = ?auto_245219 ?auto_245221 ) ) ( AVAILABLE ?auto_245221 ) ( SURFACE-AT ?auto_245216 ?auto_245222 ) ( ON ?auto_245216 ?auto_245220 ) ( CLEAR ?auto_245216 ) ( not ( = ?auto_245215 ?auto_245220 ) ) ( not ( = ?auto_245216 ?auto_245220 ) ) ( not ( = ?auto_245214 ?auto_245220 ) ) ( TRUCK-AT ?auto_245217 ?auto_245218 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245215 ?auto_245216 )
      ( MAKE-2CRATE-VERIFY ?auto_245214 ?auto_245215 ?auto_245216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245223 - SURFACE
      ?auto_245224 - SURFACE
    )
    :vars
    (
      ?auto_245226 - HOIST
      ?auto_245229 - PLACE
      ?auto_245231 - SURFACE
      ?auto_245225 - PLACE
      ?auto_245227 - HOIST
      ?auto_245228 - SURFACE
      ?auto_245230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245226 ?auto_245229 ) ( IS-CRATE ?auto_245224 ) ( not ( = ?auto_245223 ?auto_245224 ) ) ( not ( = ?auto_245231 ?auto_245223 ) ) ( not ( = ?auto_245231 ?auto_245224 ) ) ( not ( = ?auto_245225 ?auto_245229 ) ) ( HOIST-AT ?auto_245227 ?auto_245225 ) ( not ( = ?auto_245226 ?auto_245227 ) ) ( AVAILABLE ?auto_245227 ) ( SURFACE-AT ?auto_245224 ?auto_245225 ) ( ON ?auto_245224 ?auto_245228 ) ( CLEAR ?auto_245224 ) ( not ( = ?auto_245223 ?auto_245228 ) ) ( not ( = ?auto_245224 ?auto_245228 ) ) ( not ( = ?auto_245231 ?auto_245228 ) ) ( TRUCK-AT ?auto_245230 ?auto_245229 ) ( SURFACE-AT ?auto_245231 ?auto_245229 ) ( CLEAR ?auto_245231 ) ( LIFTING ?auto_245226 ?auto_245223 ) ( IS-CRATE ?auto_245223 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245231 ?auto_245223 )
      ( MAKE-2CRATE ?auto_245231 ?auto_245223 ?auto_245224 )
      ( MAKE-1CRATE-VERIFY ?auto_245223 ?auto_245224 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245232 - SURFACE
      ?auto_245233 - SURFACE
      ?auto_245234 - SURFACE
    )
    :vars
    (
      ?auto_245235 - HOIST
      ?auto_245236 - PLACE
      ?auto_245240 - PLACE
      ?auto_245237 - HOIST
      ?auto_245238 - SURFACE
      ?auto_245239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245235 ?auto_245236 ) ( IS-CRATE ?auto_245234 ) ( not ( = ?auto_245233 ?auto_245234 ) ) ( not ( = ?auto_245232 ?auto_245233 ) ) ( not ( = ?auto_245232 ?auto_245234 ) ) ( not ( = ?auto_245240 ?auto_245236 ) ) ( HOIST-AT ?auto_245237 ?auto_245240 ) ( not ( = ?auto_245235 ?auto_245237 ) ) ( AVAILABLE ?auto_245237 ) ( SURFACE-AT ?auto_245234 ?auto_245240 ) ( ON ?auto_245234 ?auto_245238 ) ( CLEAR ?auto_245234 ) ( not ( = ?auto_245233 ?auto_245238 ) ) ( not ( = ?auto_245234 ?auto_245238 ) ) ( not ( = ?auto_245232 ?auto_245238 ) ) ( TRUCK-AT ?auto_245239 ?auto_245236 ) ( SURFACE-AT ?auto_245232 ?auto_245236 ) ( CLEAR ?auto_245232 ) ( LIFTING ?auto_245235 ?auto_245233 ) ( IS-CRATE ?auto_245233 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245233 ?auto_245234 )
      ( MAKE-2CRATE-VERIFY ?auto_245232 ?auto_245233 ?auto_245234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245241 - SURFACE
      ?auto_245242 - SURFACE
    )
    :vars
    (
      ?auto_245248 - HOIST
      ?auto_245246 - PLACE
      ?auto_245247 - SURFACE
      ?auto_245244 - PLACE
      ?auto_245243 - HOIST
      ?auto_245245 - SURFACE
      ?auto_245249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245248 ?auto_245246 ) ( IS-CRATE ?auto_245242 ) ( not ( = ?auto_245241 ?auto_245242 ) ) ( not ( = ?auto_245247 ?auto_245241 ) ) ( not ( = ?auto_245247 ?auto_245242 ) ) ( not ( = ?auto_245244 ?auto_245246 ) ) ( HOIST-AT ?auto_245243 ?auto_245244 ) ( not ( = ?auto_245248 ?auto_245243 ) ) ( AVAILABLE ?auto_245243 ) ( SURFACE-AT ?auto_245242 ?auto_245244 ) ( ON ?auto_245242 ?auto_245245 ) ( CLEAR ?auto_245242 ) ( not ( = ?auto_245241 ?auto_245245 ) ) ( not ( = ?auto_245242 ?auto_245245 ) ) ( not ( = ?auto_245247 ?auto_245245 ) ) ( TRUCK-AT ?auto_245249 ?auto_245246 ) ( SURFACE-AT ?auto_245247 ?auto_245246 ) ( CLEAR ?auto_245247 ) ( IS-CRATE ?auto_245241 ) ( AVAILABLE ?auto_245248 ) ( IN ?auto_245241 ?auto_245249 ) )
    :subtasks
    ( ( !UNLOAD ?auto_245248 ?auto_245241 ?auto_245249 ?auto_245246 )
      ( MAKE-2CRATE ?auto_245247 ?auto_245241 ?auto_245242 )
      ( MAKE-1CRATE-VERIFY ?auto_245241 ?auto_245242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245250 - SURFACE
      ?auto_245251 - SURFACE
      ?auto_245252 - SURFACE
    )
    :vars
    (
      ?auto_245254 - HOIST
      ?auto_245256 - PLACE
      ?auto_245253 - PLACE
      ?auto_245255 - HOIST
      ?auto_245257 - SURFACE
      ?auto_245258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245254 ?auto_245256 ) ( IS-CRATE ?auto_245252 ) ( not ( = ?auto_245251 ?auto_245252 ) ) ( not ( = ?auto_245250 ?auto_245251 ) ) ( not ( = ?auto_245250 ?auto_245252 ) ) ( not ( = ?auto_245253 ?auto_245256 ) ) ( HOIST-AT ?auto_245255 ?auto_245253 ) ( not ( = ?auto_245254 ?auto_245255 ) ) ( AVAILABLE ?auto_245255 ) ( SURFACE-AT ?auto_245252 ?auto_245253 ) ( ON ?auto_245252 ?auto_245257 ) ( CLEAR ?auto_245252 ) ( not ( = ?auto_245251 ?auto_245257 ) ) ( not ( = ?auto_245252 ?auto_245257 ) ) ( not ( = ?auto_245250 ?auto_245257 ) ) ( TRUCK-AT ?auto_245258 ?auto_245256 ) ( SURFACE-AT ?auto_245250 ?auto_245256 ) ( CLEAR ?auto_245250 ) ( IS-CRATE ?auto_245251 ) ( AVAILABLE ?auto_245254 ) ( IN ?auto_245251 ?auto_245258 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245251 ?auto_245252 )
      ( MAKE-2CRATE-VERIFY ?auto_245250 ?auto_245251 ?auto_245252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245259 - SURFACE
      ?auto_245260 - SURFACE
    )
    :vars
    (
      ?auto_245261 - HOIST
      ?auto_245265 - PLACE
      ?auto_245267 - SURFACE
      ?auto_245263 - PLACE
      ?auto_245262 - HOIST
      ?auto_245266 - SURFACE
      ?auto_245264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245261 ?auto_245265 ) ( IS-CRATE ?auto_245260 ) ( not ( = ?auto_245259 ?auto_245260 ) ) ( not ( = ?auto_245267 ?auto_245259 ) ) ( not ( = ?auto_245267 ?auto_245260 ) ) ( not ( = ?auto_245263 ?auto_245265 ) ) ( HOIST-AT ?auto_245262 ?auto_245263 ) ( not ( = ?auto_245261 ?auto_245262 ) ) ( AVAILABLE ?auto_245262 ) ( SURFACE-AT ?auto_245260 ?auto_245263 ) ( ON ?auto_245260 ?auto_245266 ) ( CLEAR ?auto_245260 ) ( not ( = ?auto_245259 ?auto_245266 ) ) ( not ( = ?auto_245260 ?auto_245266 ) ) ( not ( = ?auto_245267 ?auto_245266 ) ) ( SURFACE-AT ?auto_245267 ?auto_245265 ) ( CLEAR ?auto_245267 ) ( IS-CRATE ?auto_245259 ) ( AVAILABLE ?auto_245261 ) ( IN ?auto_245259 ?auto_245264 ) ( TRUCK-AT ?auto_245264 ?auto_245263 ) )
    :subtasks
    ( ( !DRIVE ?auto_245264 ?auto_245263 ?auto_245265 )
      ( MAKE-2CRATE ?auto_245267 ?auto_245259 ?auto_245260 )
      ( MAKE-1CRATE-VERIFY ?auto_245259 ?auto_245260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245268 - SURFACE
      ?auto_245269 - SURFACE
      ?auto_245270 - SURFACE
    )
    :vars
    (
      ?auto_245276 - HOIST
      ?auto_245272 - PLACE
      ?auto_245274 - PLACE
      ?auto_245273 - HOIST
      ?auto_245271 - SURFACE
      ?auto_245275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245276 ?auto_245272 ) ( IS-CRATE ?auto_245270 ) ( not ( = ?auto_245269 ?auto_245270 ) ) ( not ( = ?auto_245268 ?auto_245269 ) ) ( not ( = ?auto_245268 ?auto_245270 ) ) ( not ( = ?auto_245274 ?auto_245272 ) ) ( HOIST-AT ?auto_245273 ?auto_245274 ) ( not ( = ?auto_245276 ?auto_245273 ) ) ( AVAILABLE ?auto_245273 ) ( SURFACE-AT ?auto_245270 ?auto_245274 ) ( ON ?auto_245270 ?auto_245271 ) ( CLEAR ?auto_245270 ) ( not ( = ?auto_245269 ?auto_245271 ) ) ( not ( = ?auto_245270 ?auto_245271 ) ) ( not ( = ?auto_245268 ?auto_245271 ) ) ( SURFACE-AT ?auto_245268 ?auto_245272 ) ( CLEAR ?auto_245268 ) ( IS-CRATE ?auto_245269 ) ( AVAILABLE ?auto_245276 ) ( IN ?auto_245269 ?auto_245275 ) ( TRUCK-AT ?auto_245275 ?auto_245274 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245269 ?auto_245270 )
      ( MAKE-2CRATE-VERIFY ?auto_245268 ?auto_245269 ?auto_245270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245277 - SURFACE
      ?auto_245278 - SURFACE
    )
    :vars
    (
      ?auto_245279 - HOIST
      ?auto_245282 - PLACE
      ?auto_245283 - SURFACE
      ?auto_245280 - PLACE
      ?auto_245281 - HOIST
      ?auto_245284 - SURFACE
      ?auto_245285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245279 ?auto_245282 ) ( IS-CRATE ?auto_245278 ) ( not ( = ?auto_245277 ?auto_245278 ) ) ( not ( = ?auto_245283 ?auto_245277 ) ) ( not ( = ?auto_245283 ?auto_245278 ) ) ( not ( = ?auto_245280 ?auto_245282 ) ) ( HOIST-AT ?auto_245281 ?auto_245280 ) ( not ( = ?auto_245279 ?auto_245281 ) ) ( SURFACE-AT ?auto_245278 ?auto_245280 ) ( ON ?auto_245278 ?auto_245284 ) ( CLEAR ?auto_245278 ) ( not ( = ?auto_245277 ?auto_245284 ) ) ( not ( = ?auto_245278 ?auto_245284 ) ) ( not ( = ?auto_245283 ?auto_245284 ) ) ( SURFACE-AT ?auto_245283 ?auto_245282 ) ( CLEAR ?auto_245283 ) ( IS-CRATE ?auto_245277 ) ( AVAILABLE ?auto_245279 ) ( TRUCK-AT ?auto_245285 ?auto_245280 ) ( LIFTING ?auto_245281 ?auto_245277 ) )
    :subtasks
    ( ( !LOAD ?auto_245281 ?auto_245277 ?auto_245285 ?auto_245280 )
      ( MAKE-2CRATE ?auto_245283 ?auto_245277 ?auto_245278 )
      ( MAKE-1CRATE-VERIFY ?auto_245277 ?auto_245278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245286 - SURFACE
      ?auto_245287 - SURFACE
      ?auto_245288 - SURFACE
    )
    :vars
    (
      ?auto_245291 - HOIST
      ?auto_245290 - PLACE
      ?auto_245292 - PLACE
      ?auto_245294 - HOIST
      ?auto_245289 - SURFACE
      ?auto_245293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245291 ?auto_245290 ) ( IS-CRATE ?auto_245288 ) ( not ( = ?auto_245287 ?auto_245288 ) ) ( not ( = ?auto_245286 ?auto_245287 ) ) ( not ( = ?auto_245286 ?auto_245288 ) ) ( not ( = ?auto_245292 ?auto_245290 ) ) ( HOIST-AT ?auto_245294 ?auto_245292 ) ( not ( = ?auto_245291 ?auto_245294 ) ) ( SURFACE-AT ?auto_245288 ?auto_245292 ) ( ON ?auto_245288 ?auto_245289 ) ( CLEAR ?auto_245288 ) ( not ( = ?auto_245287 ?auto_245289 ) ) ( not ( = ?auto_245288 ?auto_245289 ) ) ( not ( = ?auto_245286 ?auto_245289 ) ) ( SURFACE-AT ?auto_245286 ?auto_245290 ) ( CLEAR ?auto_245286 ) ( IS-CRATE ?auto_245287 ) ( AVAILABLE ?auto_245291 ) ( TRUCK-AT ?auto_245293 ?auto_245292 ) ( LIFTING ?auto_245294 ?auto_245287 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245287 ?auto_245288 )
      ( MAKE-2CRATE-VERIFY ?auto_245286 ?auto_245287 ?auto_245288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245295 - SURFACE
      ?auto_245296 - SURFACE
    )
    :vars
    (
      ?auto_245303 - HOIST
      ?auto_245300 - PLACE
      ?auto_245301 - SURFACE
      ?auto_245302 - PLACE
      ?auto_245297 - HOIST
      ?auto_245299 - SURFACE
      ?auto_245298 - TRUCK
      ?auto_245304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245303 ?auto_245300 ) ( IS-CRATE ?auto_245296 ) ( not ( = ?auto_245295 ?auto_245296 ) ) ( not ( = ?auto_245301 ?auto_245295 ) ) ( not ( = ?auto_245301 ?auto_245296 ) ) ( not ( = ?auto_245302 ?auto_245300 ) ) ( HOIST-AT ?auto_245297 ?auto_245302 ) ( not ( = ?auto_245303 ?auto_245297 ) ) ( SURFACE-AT ?auto_245296 ?auto_245302 ) ( ON ?auto_245296 ?auto_245299 ) ( CLEAR ?auto_245296 ) ( not ( = ?auto_245295 ?auto_245299 ) ) ( not ( = ?auto_245296 ?auto_245299 ) ) ( not ( = ?auto_245301 ?auto_245299 ) ) ( SURFACE-AT ?auto_245301 ?auto_245300 ) ( CLEAR ?auto_245301 ) ( IS-CRATE ?auto_245295 ) ( AVAILABLE ?auto_245303 ) ( TRUCK-AT ?auto_245298 ?auto_245302 ) ( AVAILABLE ?auto_245297 ) ( SURFACE-AT ?auto_245295 ?auto_245302 ) ( ON ?auto_245295 ?auto_245304 ) ( CLEAR ?auto_245295 ) ( not ( = ?auto_245295 ?auto_245304 ) ) ( not ( = ?auto_245296 ?auto_245304 ) ) ( not ( = ?auto_245301 ?auto_245304 ) ) ( not ( = ?auto_245299 ?auto_245304 ) ) )
    :subtasks
    ( ( !LIFT ?auto_245297 ?auto_245295 ?auto_245304 ?auto_245302 )
      ( MAKE-2CRATE ?auto_245301 ?auto_245295 ?auto_245296 )
      ( MAKE-1CRATE-VERIFY ?auto_245295 ?auto_245296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245305 - SURFACE
      ?auto_245306 - SURFACE
      ?auto_245307 - SURFACE
    )
    :vars
    (
      ?auto_245312 - HOIST
      ?auto_245314 - PLACE
      ?auto_245309 - PLACE
      ?auto_245313 - HOIST
      ?auto_245308 - SURFACE
      ?auto_245310 - TRUCK
      ?auto_245311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245312 ?auto_245314 ) ( IS-CRATE ?auto_245307 ) ( not ( = ?auto_245306 ?auto_245307 ) ) ( not ( = ?auto_245305 ?auto_245306 ) ) ( not ( = ?auto_245305 ?auto_245307 ) ) ( not ( = ?auto_245309 ?auto_245314 ) ) ( HOIST-AT ?auto_245313 ?auto_245309 ) ( not ( = ?auto_245312 ?auto_245313 ) ) ( SURFACE-AT ?auto_245307 ?auto_245309 ) ( ON ?auto_245307 ?auto_245308 ) ( CLEAR ?auto_245307 ) ( not ( = ?auto_245306 ?auto_245308 ) ) ( not ( = ?auto_245307 ?auto_245308 ) ) ( not ( = ?auto_245305 ?auto_245308 ) ) ( SURFACE-AT ?auto_245305 ?auto_245314 ) ( CLEAR ?auto_245305 ) ( IS-CRATE ?auto_245306 ) ( AVAILABLE ?auto_245312 ) ( TRUCK-AT ?auto_245310 ?auto_245309 ) ( AVAILABLE ?auto_245313 ) ( SURFACE-AT ?auto_245306 ?auto_245309 ) ( ON ?auto_245306 ?auto_245311 ) ( CLEAR ?auto_245306 ) ( not ( = ?auto_245306 ?auto_245311 ) ) ( not ( = ?auto_245307 ?auto_245311 ) ) ( not ( = ?auto_245305 ?auto_245311 ) ) ( not ( = ?auto_245308 ?auto_245311 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245306 ?auto_245307 )
      ( MAKE-2CRATE-VERIFY ?auto_245305 ?auto_245306 ?auto_245307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245315 - SURFACE
      ?auto_245316 - SURFACE
    )
    :vars
    (
      ?auto_245320 - HOIST
      ?auto_245323 - PLACE
      ?auto_245318 - SURFACE
      ?auto_245321 - PLACE
      ?auto_245324 - HOIST
      ?auto_245317 - SURFACE
      ?auto_245322 - SURFACE
      ?auto_245319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245320 ?auto_245323 ) ( IS-CRATE ?auto_245316 ) ( not ( = ?auto_245315 ?auto_245316 ) ) ( not ( = ?auto_245318 ?auto_245315 ) ) ( not ( = ?auto_245318 ?auto_245316 ) ) ( not ( = ?auto_245321 ?auto_245323 ) ) ( HOIST-AT ?auto_245324 ?auto_245321 ) ( not ( = ?auto_245320 ?auto_245324 ) ) ( SURFACE-AT ?auto_245316 ?auto_245321 ) ( ON ?auto_245316 ?auto_245317 ) ( CLEAR ?auto_245316 ) ( not ( = ?auto_245315 ?auto_245317 ) ) ( not ( = ?auto_245316 ?auto_245317 ) ) ( not ( = ?auto_245318 ?auto_245317 ) ) ( SURFACE-AT ?auto_245318 ?auto_245323 ) ( CLEAR ?auto_245318 ) ( IS-CRATE ?auto_245315 ) ( AVAILABLE ?auto_245320 ) ( AVAILABLE ?auto_245324 ) ( SURFACE-AT ?auto_245315 ?auto_245321 ) ( ON ?auto_245315 ?auto_245322 ) ( CLEAR ?auto_245315 ) ( not ( = ?auto_245315 ?auto_245322 ) ) ( not ( = ?auto_245316 ?auto_245322 ) ) ( not ( = ?auto_245318 ?auto_245322 ) ) ( not ( = ?auto_245317 ?auto_245322 ) ) ( TRUCK-AT ?auto_245319 ?auto_245323 ) )
    :subtasks
    ( ( !DRIVE ?auto_245319 ?auto_245323 ?auto_245321 )
      ( MAKE-2CRATE ?auto_245318 ?auto_245315 ?auto_245316 )
      ( MAKE-1CRATE-VERIFY ?auto_245315 ?auto_245316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245325 - SURFACE
      ?auto_245326 - SURFACE
      ?auto_245327 - SURFACE
    )
    :vars
    (
      ?auto_245333 - HOIST
      ?auto_245334 - PLACE
      ?auto_245332 - PLACE
      ?auto_245329 - HOIST
      ?auto_245328 - SURFACE
      ?auto_245331 - SURFACE
      ?auto_245330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245333 ?auto_245334 ) ( IS-CRATE ?auto_245327 ) ( not ( = ?auto_245326 ?auto_245327 ) ) ( not ( = ?auto_245325 ?auto_245326 ) ) ( not ( = ?auto_245325 ?auto_245327 ) ) ( not ( = ?auto_245332 ?auto_245334 ) ) ( HOIST-AT ?auto_245329 ?auto_245332 ) ( not ( = ?auto_245333 ?auto_245329 ) ) ( SURFACE-AT ?auto_245327 ?auto_245332 ) ( ON ?auto_245327 ?auto_245328 ) ( CLEAR ?auto_245327 ) ( not ( = ?auto_245326 ?auto_245328 ) ) ( not ( = ?auto_245327 ?auto_245328 ) ) ( not ( = ?auto_245325 ?auto_245328 ) ) ( SURFACE-AT ?auto_245325 ?auto_245334 ) ( CLEAR ?auto_245325 ) ( IS-CRATE ?auto_245326 ) ( AVAILABLE ?auto_245333 ) ( AVAILABLE ?auto_245329 ) ( SURFACE-AT ?auto_245326 ?auto_245332 ) ( ON ?auto_245326 ?auto_245331 ) ( CLEAR ?auto_245326 ) ( not ( = ?auto_245326 ?auto_245331 ) ) ( not ( = ?auto_245327 ?auto_245331 ) ) ( not ( = ?auto_245325 ?auto_245331 ) ) ( not ( = ?auto_245328 ?auto_245331 ) ) ( TRUCK-AT ?auto_245330 ?auto_245334 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245326 ?auto_245327 )
      ( MAKE-2CRATE-VERIFY ?auto_245325 ?auto_245326 ?auto_245327 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245354 - SURFACE
      ?auto_245355 - SURFACE
      ?auto_245356 - SURFACE
      ?auto_245353 - SURFACE
    )
    :vars
    (
      ?auto_245357 - HOIST
      ?auto_245358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245357 ?auto_245358 ) ( SURFACE-AT ?auto_245356 ?auto_245358 ) ( CLEAR ?auto_245356 ) ( LIFTING ?auto_245357 ?auto_245353 ) ( IS-CRATE ?auto_245353 ) ( not ( = ?auto_245356 ?auto_245353 ) ) ( ON ?auto_245355 ?auto_245354 ) ( ON ?auto_245356 ?auto_245355 ) ( not ( = ?auto_245354 ?auto_245355 ) ) ( not ( = ?auto_245354 ?auto_245356 ) ) ( not ( = ?auto_245354 ?auto_245353 ) ) ( not ( = ?auto_245355 ?auto_245356 ) ) ( not ( = ?auto_245355 ?auto_245353 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245356 ?auto_245353 )
      ( MAKE-3CRATE-VERIFY ?auto_245354 ?auto_245355 ?auto_245356 ?auto_245353 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245371 - SURFACE
      ?auto_245372 - SURFACE
      ?auto_245373 - SURFACE
      ?auto_245370 - SURFACE
    )
    :vars
    (
      ?auto_245374 - HOIST
      ?auto_245376 - PLACE
      ?auto_245375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245374 ?auto_245376 ) ( SURFACE-AT ?auto_245373 ?auto_245376 ) ( CLEAR ?auto_245373 ) ( IS-CRATE ?auto_245370 ) ( not ( = ?auto_245373 ?auto_245370 ) ) ( TRUCK-AT ?auto_245375 ?auto_245376 ) ( AVAILABLE ?auto_245374 ) ( IN ?auto_245370 ?auto_245375 ) ( ON ?auto_245373 ?auto_245372 ) ( not ( = ?auto_245372 ?auto_245373 ) ) ( not ( = ?auto_245372 ?auto_245370 ) ) ( ON ?auto_245372 ?auto_245371 ) ( not ( = ?auto_245371 ?auto_245372 ) ) ( not ( = ?auto_245371 ?auto_245373 ) ) ( not ( = ?auto_245371 ?auto_245370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245372 ?auto_245373 ?auto_245370 )
      ( MAKE-3CRATE-VERIFY ?auto_245371 ?auto_245372 ?auto_245373 ?auto_245370 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245392 - SURFACE
      ?auto_245393 - SURFACE
      ?auto_245394 - SURFACE
      ?auto_245391 - SURFACE
    )
    :vars
    (
      ?auto_245397 - HOIST
      ?auto_245396 - PLACE
      ?auto_245398 - TRUCK
      ?auto_245395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245397 ?auto_245396 ) ( SURFACE-AT ?auto_245394 ?auto_245396 ) ( CLEAR ?auto_245394 ) ( IS-CRATE ?auto_245391 ) ( not ( = ?auto_245394 ?auto_245391 ) ) ( AVAILABLE ?auto_245397 ) ( IN ?auto_245391 ?auto_245398 ) ( ON ?auto_245394 ?auto_245393 ) ( not ( = ?auto_245393 ?auto_245394 ) ) ( not ( = ?auto_245393 ?auto_245391 ) ) ( TRUCK-AT ?auto_245398 ?auto_245395 ) ( not ( = ?auto_245395 ?auto_245396 ) ) ( ON ?auto_245393 ?auto_245392 ) ( not ( = ?auto_245392 ?auto_245393 ) ) ( not ( = ?auto_245392 ?auto_245394 ) ) ( not ( = ?auto_245392 ?auto_245391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245393 ?auto_245394 ?auto_245391 )
      ( MAKE-3CRATE-VERIFY ?auto_245392 ?auto_245393 ?auto_245394 ?auto_245391 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245416 - SURFACE
      ?auto_245417 - SURFACE
      ?auto_245418 - SURFACE
      ?auto_245415 - SURFACE
    )
    :vars
    (
      ?auto_245423 - HOIST
      ?auto_245419 - PLACE
      ?auto_245422 - TRUCK
      ?auto_245421 - PLACE
      ?auto_245420 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245423 ?auto_245419 ) ( SURFACE-AT ?auto_245418 ?auto_245419 ) ( CLEAR ?auto_245418 ) ( IS-CRATE ?auto_245415 ) ( not ( = ?auto_245418 ?auto_245415 ) ) ( AVAILABLE ?auto_245423 ) ( ON ?auto_245418 ?auto_245417 ) ( not ( = ?auto_245417 ?auto_245418 ) ) ( not ( = ?auto_245417 ?auto_245415 ) ) ( TRUCK-AT ?auto_245422 ?auto_245421 ) ( not ( = ?auto_245421 ?auto_245419 ) ) ( HOIST-AT ?auto_245420 ?auto_245421 ) ( LIFTING ?auto_245420 ?auto_245415 ) ( not ( = ?auto_245423 ?auto_245420 ) ) ( ON ?auto_245417 ?auto_245416 ) ( not ( = ?auto_245416 ?auto_245417 ) ) ( not ( = ?auto_245416 ?auto_245418 ) ) ( not ( = ?auto_245416 ?auto_245415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245417 ?auto_245418 ?auto_245415 )
      ( MAKE-3CRATE-VERIFY ?auto_245416 ?auto_245417 ?auto_245418 ?auto_245415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245443 - SURFACE
      ?auto_245444 - SURFACE
      ?auto_245445 - SURFACE
      ?auto_245442 - SURFACE
    )
    :vars
    (
      ?auto_245451 - HOIST
      ?auto_245450 - PLACE
      ?auto_245446 - TRUCK
      ?auto_245449 - PLACE
      ?auto_245447 - HOIST
      ?auto_245448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245451 ?auto_245450 ) ( SURFACE-AT ?auto_245445 ?auto_245450 ) ( CLEAR ?auto_245445 ) ( IS-CRATE ?auto_245442 ) ( not ( = ?auto_245445 ?auto_245442 ) ) ( AVAILABLE ?auto_245451 ) ( ON ?auto_245445 ?auto_245444 ) ( not ( = ?auto_245444 ?auto_245445 ) ) ( not ( = ?auto_245444 ?auto_245442 ) ) ( TRUCK-AT ?auto_245446 ?auto_245449 ) ( not ( = ?auto_245449 ?auto_245450 ) ) ( HOIST-AT ?auto_245447 ?auto_245449 ) ( not ( = ?auto_245451 ?auto_245447 ) ) ( AVAILABLE ?auto_245447 ) ( SURFACE-AT ?auto_245442 ?auto_245449 ) ( ON ?auto_245442 ?auto_245448 ) ( CLEAR ?auto_245442 ) ( not ( = ?auto_245445 ?auto_245448 ) ) ( not ( = ?auto_245442 ?auto_245448 ) ) ( not ( = ?auto_245444 ?auto_245448 ) ) ( ON ?auto_245444 ?auto_245443 ) ( not ( = ?auto_245443 ?auto_245444 ) ) ( not ( = ?auto_245443 ?auto_245445 ) ) ( not ( = ?auto_245443 ?auto_245442 ) ) ( not ( = ?auto_245443 ?auto_245448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245444 ?auto_245445 ?auto_245442 )
      ( MAKE-3CRATE-VERIFY ?auto_245443 ?auto_245444 ?auto_245445 ?auto_245442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245471 - SURFACE
      ?auto_245472 - SURFACE
      ?auto_245473 - SURFACE
      ?auto_245470 - SURFACE
    )
    :vars
    (
      ?auto_245478 - HOIST
      ?auto_245477 - PLACE
      ?auto_245475 - PLACE
      ?auto_245479 - HOIST
      ?auto_245476 - SURFACE
      ?auto_245474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245478 ?auto_245477 ) ( SURFACE-AT ?auto_245473 ?auto_245477 ) ( CLEAR ?auto_245473 ) ( IS-CRATE ?auto_245470 ) ( not ( = ?auto_245473 ?auto_245470 ) ) ( AVAILABLE ?auto_245478 ) ( ON ?auto_245473 ?auto_245472 ) ( not ( = ?auto_245472 ?auto_245473 ) ) ( not ( = ?auto_245472 ?auto_245470 ) ) ( not ( = ?auto_245475 ?auto_245477 ) ) ( HOIST-AT ?auto_245479 ?auto_245475 ) ( not ( = ?auto_245478 ?auto_245479 ) ) ( AVAILABLE ?auto_245479 ) ( SURFACE-AT ?auto_245470 ?auto_245475 ) ( ON ?auto_245470 ?auto_245476 ) ( CLEAR ?auto_245470 ) ( not ( = ?auto_245473 ?auto_245476 ) ) ( not ( = ?auto_245470 ?auto_245476 ) ) ( not ( = ?auto_245472 ?auto_245476 ) ) ( TRUCK-AT ?auto_245474 ?auto_245477 ) ( ON ?auto_245472 ?auto_245471 ) ( not ( = ?auto_245471 ?auto_245472 ) ) ( not ( = ?auto_245471 ?auto_245473 ) ) ( not ( = ?auto_245471 ?auto_245470 ) ) ( not ( = ?auto_245471 ?auto_245476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245472 ?auto_245473 ?auto_245470 )
      ( MAKE-3CRATE-VERIFY ?auto_245471 ?auto_245472 ?auto_245473 ?auto_245470 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245499 - SURFACE
      ?auto_245500 - SURFACE
      ?auto_245501 - SURFACE
      ?auto_245498 - SURFACE
    )
    :vars
    (
      ?auto_245504 - HOIST
      ?auto_245505 - PLACE
      ?auto_245502 - PLACE
      ?auto_245506 - HOIST
      ?auto_245503 - SURFACE
      ?auto_245507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245504 ?auto_245505 ) ( IS-CRATE ?auto_245498 ) ( not ( = ?auto_245501 ?auto_245498 ) ) ( not ( = ?auto_245500 ?auto_245501 ) ) ( not ( = ?auto_245500 ?auto_245498 ) ) ( not ( = ?auto_245502 ?auto_245505 ) ) ( HOIST-AT ?auto_245506 ?auto_245502 ) ( not ( = ?auto_245504 ?auto_245506 ) ) ( AVAILABLE ?auto_245506 ) ( SURFACE-AT ?auto_245498 ?auto_245502 ) ( ON ?auto_245498 ?auto_245503 ) ( CLEAR ?auto_245498 ) ( not ( = ?auto_245501 ?auto_245503 ) ) ( not ( = ?auto_245498 ?auto_245503 ) ) ( not ( = ?auto_245500 ?auto_245503 ) ) ( TRUCK-AT ?auto_245507 ?auto_245505 ) ( SURFACE-AT ?auto_245500 ?auto_245505 ) ( CLEAR ?auto_245500 ) ( LIFTING ?auto_245504 ?auto_245501 ) ( IS-CRATE ?auto_245501 ) ( ON ?auto_245500 ?auto_245499 ) ( not ( = ?auto_245499 ?auto_245500 ) ) ( not ( = ?auto_245499 ?auto_245501 ) ) ( not ( = ?auto_245499 ?auto_245498 ) ) ( not ( = ?auto_245499 ?auto_245503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245500 ?auto_245501 ?auto_245498 )
      ( MAKE-3CRATE-VERIFY ?auto_245499 ?auto_245500 ?auto_245501 ?auto_245498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245527 - SURFACE
      ?auto_245528 - SURFACE
      ?auto_245529 - SURFACE
      ?auto_245526 - SURFACE
    )
    :vars
    (
      ?auto_245530 - HOIST
      ?auto_245534 - PLACE
      ?auto_245533 - PLACE
      ?auto_245531 - HOIST
      ?auto_245535 - SURFACE
      ?auto_245532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245530 ?auto_245534 ) ( IS-CRATE ?auto_245526 ) ( not ( = ?auto_245529 ?auto_245526 ) ) ( not ( = ?auto_245528 ?auto_245529 ) ) ( not ( = ?auto_245528 ?auto_245526 ) ) ( not ( = ?auto_245533 ?auto_245534 ) ) ( HOIST-AT ?auto_245531 ?auto_245533 ) ( not ( = ?auto_245530 ?auto_245531 ) ) ( AVAILABLE ?auto_245531 ) ( SURFACE-AT ?auto_245526 ?auto_245533 ) ( ON ?auto_245526 ?auto_245535 ) ( CLEAR ?auto_245526 ) ( not ( = ?auto_245529 ?auto_245535 ) ) ( not ( = ?auto_245526 ?auto_245535 ) ) ( not ( = ?auto_245528 ?auto_245535 ) ) ( TRUCK-AT ?auto_245532 ?auto_245534 ) ( SURFACE-AT ?auto_245528 ?auto_245534 ) ( CLEAR ?auto_245528 ) ( IS-CRATE ?auto_245529 ) ( AVAILABLE ?auto_245530 ) ( IN ?auto_245529 ?auto_245532 ) ( ON ?auto_245528 ?auto_245527 ) ( not ( = ?auto_245527 ?auto_245528 ) ) ( not ( = ?auto_245527 ?auto_245529 ) ) ( not ( = ?auto_245527 ?auto_245526 ) ) ( not ( = ?auto_245527 ?auto_245535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245528 ?auto_245529 ?auto_245526 )
      ( MAKE-3CRATE-VERIFY ?auto_245527 ?auto_245528 ?auto_245529 ?auto_245526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245605 - SURFACE
      ?auto_245606 - SURFACE
    )
    :vars
    (
      ?auto_245610 - HOIST
      ?auto_245611 - PLACE
      ?auto_245609 - SURFACE
      ?auto_245613 - PLACE
      ?auto_245608 - HOIST
      ?auto_245607 - SURFACE
      ?auto_245612 - TRUCK
      ?auto_245614 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245610 ?auto_245611 ) ( SURFACE-AT ?auto_245605 ?auto_245611 ) ( CLEAR ?auto_245605 ) ( IS-CRATE ?auto_245606 ) ( not ( = ?auto_245605 ?auto_245606 ) ) ( AVAILABLE ?auto_245610 ) ( ON ?auto_245605 ?auto_245609 ) ( not ( = ?auto_245609 ?auto_245605 ) ) ( not ( = ?auto_245609 ?auto_245606 ) ) ( not ( = ?auto_245613 ?auto_245611 ) ) ( HOIST-AT ?auto_245608 ?auto_245613 ) ( not ( = ?auto_245610 ?auto_245608 ) ) ( AVAILABLE ?auto_245608 ) ( SURFACE-AT ?auto_245606 ?auto_245613 ) ( ON ?auto_245606 ?auto_245607 ) ( CLEAR ?auto_245606 ) ( not ( = ?auto_245605 ?auto_245607 ) ) ( not ( = ?auto_245606 ?auto_245607 ) ) ( not ( = ?auto_245609 ?auto_245607 ) ) ( TRUCK-AT ?auto_245612 ?auto_245614 ) ( not ( = ?auto_245614 ?auto_245611 ) ) ( not ( = ?auto_245613 ?auto_245614 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_245612 ?auto_245614 ?auto_245611 )
      ( MAKE-1CRATE ?auto_245605 ?auto_245606 )
      ( MAKE-1CRATE-VERIFY ?auto_245605 ?auto_245606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245711 - SURFACE
      ?auto_245712 - SURFACE
    )
    :vars
    (
      ?auto_245717 - HOIST
      ?auto_245715 - PLACE
      ?auto_245713 - SURFACE
      ?auto_245716 - PLACE
      ?auto_245719 - HOIST
      ?auto_245718 - SURFACE
      ?auto_245714 - TRUCK
      ?auto_245720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245717 ?auto_245715 ) ( SURFACE-AT ?auto_245711 ?auto_245715 ) ( CLEAR ?auto_245711 ) ( IS-CRATE ?auto_245712 ) ( not ( = ?auto_245711 ?auto_245712 ) ) ( ON ?auto_245711 ?auto_245713 ) ( not ( = ?auto_245713 ?auto_245711 ) ) ( not ( = ?auto_245713 ?auto_245712 ) ) ( not ( = ?auto_245716 ?auto_245715 ) ) ( HOIST-AT ?auto_245719 ?auto_245716 ) ( not ( = ?auto_245717 ?auto_245719 ) ) ( AVAILABLE ?auto_245719 ) ( SURFACE-AT ?auto_245712 ?auto_245716 ) ( ON ?auto_245712 ?auto_245718 ) ( CLEAR ?auto_245712 ) ( not ( = ?auto_245711 ?auto_245718 ) ) ( not ( = ?auto_245712 ?auto_245718 ) ) ( not ( = ?auto_245713 ?auto_245718 ) ) ( TRUCK-AT ?auto_245714 ?auto_245715 ) ( LIFTING ?auto_245717 ?auto_245720 ) ( IS-CRATE ?auto_245720 ) ( not ( = ?auto_245711 ?auto_245720 ) ) ( not ( = ?auto_245712 ?auto_245720 ) ) ( not ( = ?auto_245713 ?auto_245720 ) ) ( not ( = ?auto_245718 ?auto_245720 ) ) )
    :subtasks
    ( ( !LOAD ?auto_245717 ?auto_245720 ?auto_245714 ?auto_245715 )
      ( MAKE-1CRATE ?auto_245711 ?auto_245712 )
      ( MAKE-1CRATE-VERIFY ?auto_245711 ?auto_245712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245820 - SURFACE
      ?auto_245821 - SURFACE
      ?auto_245822 - SURFACE
      ?auto_245819 - SURFACE
      ?auto_245823 - SURFACE
    )
    :vars
    (
      ?auto_245824 - HOIST
      ?auto_245825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245824 ?auto_245825 ) ( SURFACE-AT ?auto_245819 ?auto_245825 ) ( CLEAR ?auto_245819 ) ( LIFTING ?auto_245824 ?auto_245823 ) ( IS-CRATE ?auto_245823 ) ( not ( = ?auto_245819 ?auto_245823 ) ) ( ON ?auto_245821 ?auto_245820 ) ( ON ?auto_245822 ?auto_245821 ) ( ON ?auto_245819 ?auto_245822 ) ( not ( = ?auto_245820 ?auto_245821 ) ) ( not ( = ?auto_245820 ?auto_245822 ) ) ( not ( = ?auto_245820 ?auto_245819 ) ) ( not ( = ?auto_245820 ?auto_245823 ) ) ( not ( = ?auto_245821 ?auto_245822 ) ) ( not ( = ?auto_245821 ?auto_245819 ) ) ( not ( = ?auto_245821 ?auto_245823 ) ) ( not ( = ?auto_245822 ?auto_245819 ) ) ( not ( = ?auto_245822 ?auto_245823 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245819 ?auto_245823 )
      ( MAKE-4CRATE-VERIFY ?auto_245820 ?auto_245821 ?auto_245822 ?auto_245819 ?auto_245823 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245845 - SURFACE
      ?auto_245846 - SURFACE
      ?auto_245847 - SURFACE
      ?auto_245844 - SURFACE
      ?auto_245848 - SURFACE
    )
    :vars
    (
      ?auto_245849 - HOIST
      ?auto_245850 - PLACE
      ?auto_245851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245849 ?auto_245850 ) ( SURFACE-AT ?auto_245844 ?auto_245850 ) ( CLEAR ?auto_245844 ) ( IS-CRATE ?auto_245848 ) ( not ( = ?auto_245844 ?auto_245848 ) ) ( TRUCK-AT ?auto_245851 ?auto_245850 ) ( AVAILABLE ?auto_245849 ) ( IN ?auto_245848 ?auto_245851 ) ( ON ?auto_245844 ?auto_245847 ) ( not ( = ?auto_245847 ?auto_245844 ) ) ( not ( = ?auto_245847 ?auto_245848 ) ) ( ON ?auto_245846 ?auto_245845 ) ( ON ?auto_245847 ?auto_245846 ) ( not ( = ?auto_245845 ?auto_245846 ) ) ( not ( = ?auto_245845 ?auto_245847 ) ) ( not ( = ?auto_245845 ?auto_245844 ) ) ( not ( = ?auto_245845 ?auto_245848 ) ) ( not ( = ?auto_245846 ?auto_245847 ) ) ( not ( = ?auto_245846 ?auto_245844 ) ) ( not ( = ?auto_245846 ?auto_245848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245847 ?auto_245844 ?auto_245848 )
      ( MAKE-4CRATE-VERIFY ?auto_245845 ?auto_245846 ?auto_245847 ?auto_245844 ?auto_245848 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245875 - SURFACE
      ?auto_245876 - SURFACE
      ?auto_245877 - SURFACE
      ?auto_245874 - SURFACE
      ?auto_245878 - SURFACE
    )
    :vars
    (
      ?auto_245881 - HOIST
      ?auto_245879 - PLACE
      ?auto_245882 - TRUCK
      ?auto_245880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245881 ?auto_245879 ) ( SURFACE-AT ?auto_245874 ?auto_245879 ) ( CLEAR ?auto_245874 ) ( IS-CRATE ?auto_245878 ) ( not ( = ?auto_245874 ?auto_245878 ) ) ( AVAILABLE ?auto_245881 ) ( IN ?auto_245878 ?auto_245882 ) ( ON ?auto_245874 ?auto_245877 ) ( not ( = ?auto_245877 ?auto_245874 ) ) ( not ( = ?auto_245877 ?auto_245878 ) ) ( TRUCK-AT ?auto_245882 ?auto_245880 ) ( not ( = ?auto_245880 ?auto_245879 ) ) ( ON ?auto_245876 ?auto_245875 ) ( ON ?auto_245877 ?auto_245876 ) ( not ( = ?auto_245875 ?auto_245876 ) ) ( not ( = ?auto_245875 ?auto_245877 ) ) ( not ( = ?auto_245875 ?auto_245874 ) ) ( not ( = ?auto_245875 ?auto_245878 ) ) ( not ( = ?auto_245876 ?auto_245877 ) ) ( not ( = ?auto_245876 ?auto_245874 ) ) ( not ( = ?auto_245876 ?auto_245878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245877 ?auto_245874 ?auto_245878 )
      ( MAKE-4CRATE-VERIFY ?auto_245875 ?auto_245876 ?auto_245877 ?auto_245874 ?auto_245878 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245909 - SURFACE
      ?auto_245910 - SURFACE
      ?auto_245911 - SURFACE
      ?auto_245908 - SURFACE
      ?auto_245912 - SURFACE
    )
    :vars
    (
      ?auto_245915 - HOIST
      ?auto_245914 - PLACE
      ?auto_245913 - TRUCK
      ?auto_245917 - PLACE
      ?auto_245916 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245915 ?auto_245914 ) ( SURFACE-AT ?auto_245908 ?auto_245914 ) ( CLEAR ?auto_245908 ) ( IS-CRATE ?auto_245912 ) ( not ( = ?auto_245908 ?auto_245912 ) ) ( AVAILABLE ?auto_245915 ) ( ON ?auto_245908 ?auto_245911 ) ( not ( = ?auto_245911 ?auto_245908 ) ) ( not ( = ?auto_245911 ?auto_245912 ) ) ( TRUCK-AT ?auto_245913 ?auto_245917 ) ( not ( = ?auto_245917 ?auto_245914 ) ) ( HOIST-AT ?auto_245916 ?auto_245917 ) ( LIFTING ?auto_245916 ?auto_245912 ) ( not ( = ?auto_245915 ?auto_245916 ) ) ( ON ?auto_245910 ?auto_245909 ) ( ON ?auto_245911 ?auto_245910 ) ( not ( = ?auto_245909 ?auto_245910 ) ) ( not ( = ?auto_245909 ?auto_245911 ) ) ( not ( = ?auto_245909 ?auto_245908 ) ) ( not ( = ?auto_245909 ?auto_245912 ) ) ( not ( = ?auto_245910 ?auto_245911 ) ) ( not ( = ?auto_245910 ?auto_245908 ) ) ( not ( = ?auto_245910 ?auto_245912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245911 ?auto_245908 ?auto_245912 )
      ( MAKE-4CRATE-VERIFY ?auto_245909 ?auto_245910 ?auto_245911 ?auto_245908 ?auto_245912 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245947 - SURFACE
      ?auto_245948 - SURFACE
      ?auto_245949 - SURFACE
      ?auto_245946 - SURFACE
      ?auto_245950 - SURFACE
    )
    :vars
    (
      ?auto_245955 - HOIST
      ?auto_245951 - PLACE
      ?auto_245952 - TRUCK
      ?auto_245956 - PLACE
      ?auto_245954 - HOIST
      ?auto_245953 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245955 ?auto_245951 ) ( SURFACE-AT ?auto_245946 ?auto_245951 ) ( CLEAR ?auto_245946 ) ( IS-CRATE ?auto_245950 ) ( not ( = ?auto_245946 ?auto_245950 ) ) ( AVAILABLE ?auto_245955 ) ( ON ?auto_245946 ?auto_245949 ) ( not ( = ?auto_245949 ?auto_245946 ) ) ( not ( = ?auto_245949 ?auto_245950 ) ) ( TRUCK-AT ?auto_245952 ?auto_245956 ) ( not ( = ?auto_245956 ?auto_245951 ) ) ( HOIST-AT ?auto_245954 ?auto_245956 ) ( not ( = ?auto_245955 ?auto_245954 ) ) ( AVAILABLE ?auto_245954 ) ( SURFACE-AT ?auto_245950 ?auto_245956 ) ( ON ?auto_245950 ?auto_245953 ) ( CLEAR ?auto_245950 ) ( not ( = ?auto_245946 ?auto_245953 ) ) ( not ( = ?auto_245950 ?auto_245953 ) ) ( not ( = ?auto_245949 ?auto_245953 ) ) ( ON ?auto_245948 ?auto_245947 ) ( ON ?auto_245949 ?auto_245948 ) ( not ( = ?auto_245947 ?auto_245948 ) ) ( not ( = ?auto_245947 ?auto_245949 ) ) ( not ( = ?auto_245947 ?auto_245946 ) ) ( not ( = ?auto_245947 ?auto_245950 ) ) ( not ( = ?auto_245947 ?auto_245953 ) ) ( not ( = ?auto_245948 ?auto_245949 ) ) ( not ( = ?auto_245948 ?auto_245946 ) ) ( not ( = ?auto_245948 ?auto_245950 ) ) ( not ( = ?auto_245948 ?auto_245953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245949 ?auto_245946 ?auto_245950 )
      ( MAKE-4CRATE-VERIFY ?auto_245947 ?auto_245948 ?auto_245949 ?auto_245946 ?auto_245950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245986 - SURFACE
      ?auto_245987 - SURFACE
      ?auto_245988 - SURFACE
      ?auto_245985 - SURFACE
      ?auto_245989 - SURFACE
    )
    :vars
    (
      ?auto_245993 - HOIST
      ?auto_245992 - PLACE
      ?auto_245994 - PLACE
      ?auto_245995 - HOIST
      ?auto_245991 - SURFACE
      ?auto_245990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245993 ?auto_245992 ) ( SURFACE-AT ?auto_245985 ?auto_245992 ) ( CLEAR ?auto_245985 ) ( IS-CRATE ?auto_245989 ) ( not ( = ?auto_245985 ?auto_245989 ) ) ( AVAILABLE ?auto_245993 ) ( ON ?auto_245985 ?auto_245988 ) ( not ( = ?auto_245988 ?auto_245985 ) ) ( not ( = ?auto_245988 ?auto_245989 ) ) ( not ( = ?auto_245994 ?auto_245992 ) ) ( HOIST-AT ?auto_245995 ?auto_245994 ) ( not ( = ?auto_245993 ?auto_245995 ) ) ( AVAILABLE ?auto_245995 ) ( SURFACE-AT ?auto_245989 ?auto_245994 ) ( ON ?auto_245989 ?auto_245991 ) ( CLEAR ?auto_245989 ) ( not ( = ?auto_245985 ?auto_245991 ) ) ( not ( = ?auto_245989 ?auto_245991 ) ) ( not ( = ?auto_245988 ?auto_245991 ) ) ( TRUCK-AT ?auto_245990 ?auto_245992 ) ( ON ?auto_245987 ?auto_245986 ) ( ON ?auto_245988 ?auto_245987 ) ( not ( = ?auto_245986 ?auto_245987 ) ) ( not ( = ?auto_245986 ?auto_245988 ) ) ( not ( = ?auto_245986 ?auto_245985 ) ) ( not ( = ?auto_245986 ?auto_245989 ) ) ( not ( = ?auto_245986 ?auto_245991 ) ) ( not ( = ?auto_245987 ?auto_245988 ) ) ( not ( = ?auto_245987 ?auto_245985 ) ) ( not ( = ?auto_245987 ?auto_245989 ) ) ( not ( = ?auto_245987 ?auto_245991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245988 ?auto_245985 ?auto_245989 )
      ( MAKE-4CRATE-VERIFY ?auto_245986 ?auto_245987 ?auto_245988 ?auto_245985 ?auto_245989 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246025 - SURFACE
      ?auto_246026 - SURFACE
      ?auto_246027 - SURFACE
      ?auto_246024 - SURFACE
      ?auto_246028 - SURFACE
    )
    :vars
    (
      ?auto_246031 - HOIST
      ?auto_246029 - PLACE
      ?auto_246030 - PLACE
      ?auto_246033 - HOIST
      ?auto_246032 - SURFACE
      ?auto_246034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246031 ?auto_246029 ) ( IS-CRATE ?auto_246028 ) ( not ( = ?auto_246024 ?auto_246028 ) ) ( not ( = ?auto_246027 ?auto_246024 ) ) ( not ( = ?auto_246027 ?auto_246028 ) ) ( not ( = ?auto_246030 ?auto_246029 ) ) ( HOIST-AT ?auto_246033 ?auto_246030 ) ( not ( = ?auto_246031 ?auto_246033 ) ) ( AVAILABLE ?auto_246033 ) ( SURFACE-AT ?auto_246028 ?auto_246030 ) ( ON ?auto_246028 ?auto_246032 ) ( CLEAR ?auto_246028 ) ( not ( = ?auto_246024 ?auto_246032 ) ) ( not ( = ?auto_246028 ?auto_246032 ) ) ( not ( = ?auto_246027 ?auto_246032 ) ) ( TRUCK-AT ?auto_246034 ?auto_246029 ) ( SURFACE-AT ?auto_246027 ?auto_246029 ) ( CLEAR ?auto_246027 ) ( LIFTING ?auto_246031 ?auto_246024 ) ( IS-CRATE ?auto_246024 ) ( ON ?auto_246026 ?auto_246025 ) ( ON ?auto_246027 ?auto_246026 ) ( not ( = ?auto_246025 ?auto_246026 ) ) ( not ( = ?auto_246025 ?auto_246027 ) ) ( not ( = ?auto_246025 ?auto_246024 ) ) ( not ( = ?auto_246025 ?auto_246028 ) ) ( not ( = ?auto_246025 ?auto_246032 ) ) ( not ( = ?auto_246026 ?auto_246027 ) ) ( not ( = ?auto_246026 ?auto_246024 ) ) ( not ( = ?auto_246026 ?auto_246028 ) ) ( not ( = ?auto_246026 ?auto_246032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246027 ?auto_246024 ?auto_246028 )
      ( MAKE-4CRATE-VERIFY ?auto_246025 ?auto_246026 ?auto_246027 ?auto_246024 ?auto_246028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246064 - SURFACE
      ?auto_246065 - SURFACE
      ?auto_246066 - SURFACE
      ?auto_246063 - SURFACE
      ?auto_246067 - SURFACE
    )
    :vars
    (
      ?auto_246072 - HOIST
      ?auto_246069 - PLACE
      ?auto_246070 - PLACE
      ?auto_246071 - HOIST
      ?auto_246073 - SURFACE
      ?auto_246068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246072 ?auto_246069 ) ( IS-CRATE ?auto_246067 ) ( not ( = ?auto_246063 ?auto_246067 ) ) ( not ( = ?auto_246066 ?auto_246063 ) ) ( not ( = ?auto_246066 ?auto_246067 ) ) ( not ( = ?auto_246070 ?auto_246069 ) ) ( HOIST-AT ?auto_246071 ?auto_246070 ) ( not ( = ?auto_246072 ?auto_246071 ) ) ( AVAILABLE ?auto_246071 ) ( SURFACE-AT ?auto_246067 ?auto_246070 ) ( ON ?auto_246067 ?auto_246073 ) ( CLEAR ?auto_246067 ) ( not ( = ?auto_246063 ?auto_246073 ) ) ( not ( = ?auto_246067 ?auto_246073 ) ) ( not ( = ?auto_246066 ?auto_246073 ) ) ( TRUCK-AT ?auto_246068 ?auto_246069 ) ( SURFACE-AT ?auto_246066 ?auto_246069 ) ( CLEAR ?auto_246066 ) ( IS-CRATE ?auto_246063 ) ( AVAILABLE ?auto_246072 ) ( IN ?auto_246063 ?auto_246068 ) ( ON ?auto_246065 ?auto_246064 ) ( ON ?auto_246066 ?auto_246065 ) ( not ( = ?auto_246064 ?auto_246065 ) ) ( not ( = ?auto_246064 ?auto_246066 ) ) ( not ( = ?auto_246064 ?auto_246063 ) ) ( not ( = ?auto_246064 ?auto_246067 ) ) ( not ( = ?auto_246064 ?auto_246073 ) ) ( not ( = ?auto_246065 ?auto_246066 ) ) ( not ( = ?auto_246065 ?auto_246063 ) ) ( not ( = ?auto_246065 ?auto_246067 ) ) ( not ( = ?auto_246065 ?auto_246073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246066 ?auto_246063 ?auto_246067 )
      ( MAKE-4CRATE-VERIFY ?auto_246064 ?auto_246065 ?auto_246066 ?auto_246063 ?auto_246067 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246724 - SURFACE
      ?auto_246725 - SURFACE
      ?auto_246726 - SURFACE
      ?auto_246723 - SURFACE
      ?auto_246727 - SURFACE
      ?auto_246728 - SURFACE
    )
    :vars
    (
      ?auto_246730 - HOIST
      ?auto_246729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246730 ?auto_246729 ) ( SURFACE-AT ?auto_246727 ?auto_246729 ) ( CLEAR ?auto_246727 ) ( LIFTING ?auto_246730 ?auto_246728 ) ( IS-CRATE ?auto_246728 ) ( not ( = ?auto_246727 ?auto_246728 ) ) ( ON ?auto_246725 ?auto_246724 ) ( ON ?auto_246726 ?auto_246725 ) ( ON ?auto_246723 ?auto_246726 ) ( ON ?auto_246727 ?auto_246723 ) ( not ( = ?auto_246724 ?auto_246725 ) ) ( not ( = ?auto_246724 ?auto_246726 ) ) ( not ( = ?auto_246724 ?auto_246723 ) ) ( not ( = ?auto_246724 ?auto_246727 ) ) ( not ( = ?auto_246724 ?auto_246728 ) ) ( not ( = ?auto_246725 ?auto_246726 ) ) ( not ( = ?auto_246725 ?auto_246723 ) ) ( not ( = ?auto_246725 ?auto_246727 ) ) ( not ( = ?auto_246725 ?auto_246728 ) ) ( not ( = ?auto_246726 ?auto_246723 ) ) ( not ( = ?auto_246726 ?auto_246727 ) ) ( not ( = ?auto_246726 ?auto_246728 ) ) ( not ( = ?auto_246723 ?auto_246727 ) ) ( not ( = ?auto_246723 ?auto_246728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246727 ?auto_246728 )
      ( MAKE-5CRATE-VERIFY ?auto_246724 ?auto_246725 ?auto_246726 ?auto_246723 ?auto_246727 ?auto_246728 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246758 - SURFACE
      ?auto_246759 - SURFACE
      ?auto_246760 - SURFACE
      ?auto_246757 - SURFACE
      ?auto_246761 - SURFACE
      ?auto_246762 - SURFACE
    )
    :vars
    (
      ?auto_246763 - HOIST
      ?auto_246765 - PLACE
      ?auto_246764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246763 ?auto_246765 ) ( SURFACE-AT ?auto_246761 ?auto_246765 ) ( CLEAR ?auto_246761 ) ( IS-CRATE ?auto_246762 ) ( not ( = ?auto_246761 ?auto_246762 ) ) ( TRUCK-AT ?auto_246764 ?auto_246765 ) ( AVAILABLE ?auto_246763 ) ( IN ?auto_246762 ?auto_246764 ) ( ON ?auto_246761 ?auto_246757 ) ( not ( = ?auto_246757 ?auto_246761 ) ) ( not ( = ?auto_246757 ?auto_246762 ) ) ( ON ?auto_246759 ?auto_246758 ) ( ON ?auto_246760 ?auto_246759 ) ( ON ?auto_246757 ?auto_246760 ) ( not ( = ?auto_246758 ?auto_246759 ) ) ( not ( = ?auto_246758 ?auto_246760 ) ) ( not ( = ?auto_246758 ?auto_246757 ) ) ( not ( = ?auto_246758 ?auto_246761 ) ) ( not ( = ?auto_246758 ?auto_246762 ) ) ( not ( = ?auto_246759 ?auto_246760 ) ) ( not ( = ?auto_246759 ?auto_246757 ) ) ( not ( = ?auto_246759 ?auto_246761 ) ) ( not ( = ?auto_246759 ?auto_246762 ) ) ( not ( = ?auto_246760 ?auto_246757 ) ) ( not ( = ?auto_246760 ?auto_246761 ) ) ( not ( = ?auto_246760 ?auto_246762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246757 ?auto_246761 ?auto_246762 )
      ( MAKE-5CRATE-VERIFY ?auto_246758 ?auto_246759 ?auto_246760 ?auto_246757 ?auto_246761 ?auto_246762 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246798 - SURFACE
      ?auto_246799 - SURFACE
      ?auto_246800 - SURFACE
      ?auto_246797 - SURFACE
      ?auto_246801 - SURFACE
      ?auto_246802 - SURFACE
    )
    :vars
    (
      ?auto_246806 - HOIST
      ?auto_246804 - PLACE
      ?auto_246805 - TRUCK
      ?auto_246803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246806 ?auto_246804 ) ( SURFACE-AT ?auto_246801 ?auto_246804 ) ( CLEAR ?auto_246801 ) ( IS-CRATE ?auto_246802 ) ( not ( = ?auto_246801 ?auto_246802 ) ) ( AVAILABLE ?auto_246806 ) ( IN ?auto_246802 ?auto_246805 ) ( ON ?auto_246801 ?auto_246797 ) ( not ( = ?auto_246797 ?auto_246801 ) ) ( not ( = ?auto_246797 ?auto_246802 ) ) ( TRUCK-AT ?auto_246805 ?auto_246803 ) ( not ( = ?auto_246803 ?auto_246804 ) ) ( ON ?auto_246799 ?auto_246798 ) ( ON ?auto_246800 ?auto_246799 ) ( ON ?auto_246797 ?auto_246800 ) ( not ( = ?auto_246798 ?auto_246799 ) ) ( not ( = ?auto_246798 ?auto_246800 ) ) ( not ( = ?auto_246798 ?auto_246797 ) ) ( not ( = ?auto_246798 ?auto_246801 ) ) ( not ( = ?auto_246798 ?auto_246802 ) ) ( not ( = ?auto_246799 ?auto_246800 ) ) ( not ( = ?auto_246799 ?auto_246797 ) ) ( not ( = ?auto_246799 ?auto_246801 ) ) ( not ( = ?auto_246799 ?auto_246802 ) ) ( not ( = ?auto_246800 ?auto_246797 ) ) ( not ( = ?auto_246800 ?auto_246801 ) ) ( not ( = ?auto_246800 ?auto_246802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246797 ?auto_246801 ?auto_246802 )
      ( MAKE-5CRATE-VERIFY ?auto_246798 ?auto_246799 ?auto_246800 ?auto_246797 ?auto_246801 ?auto_246802 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246843 - SURFACE
      ?auto_246844 - SURFACE
      ?auto_246845 - SURFACE
      ?auto_246842 - SURFACE
      ?auto_246846 - SURFACE
      ?auto_246847 - SURFACE
    )
    :vars
    (
      ?auto_246849 - HOIST
      ?auto_246848 - PLACE
      ?auto_246851 - TRUCK
      ?auto_246850 - PLACE
      ?auto_246852 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_246849 ?auto_246848 ) ( SURFACE-AT ?auto_246846 ?auto_246848 ) ( CLEAR ?auto_246846 ) ( IS-CRATE ?auto_246847 ) ( not ( = ?auto_246846 ?auto_246847 ) ) ( AVAILABLE ?auto_246849 ) ( ON ?auto_246846 ?auto_246842 ) ( not ( = ?auto_246842 ?auto_246846 ) ) ( not ( = ?auto_246842 ?auto_246847 ) ) ( TRUCK-AT ?auto_246851 ?auto_246850 ) ( not ( = ?auto_246850 ?auto_246848 ) ) ( HOIST-AT ?auto_246852 ?auto_246850 ) ( LIFTING ?auto_246852 ?auto_246847 ) ( not ( = ?auto_246849 ?auto_246852 ) ) ( ON ?auto_246844 ?auto_246843 ) ( ON ?auto_246845 ?auto_246844 ) ( ON ?auto_246842 ?auto_246845 ) ( not ( = ?auto_246843 ?auto_246844 ) ) ( not ( = ?auto_246843 ?auto_246845 ) ) ( not ( = ?auto_246843 ?auto_246842 ) ) ( not ( = ?auto_246843 ?auto_246846 ) ) ( not ( = ?auto_246843 ?auto_246847 ) ) ( not ( = ?auto_246844 ?auto_246845 ) ) ( not ( = ?auto_246844 ?auto_246842 ) ) ( not ( = ?auto_246844 ?auto_246846 ) ) ( not ( = ?auto_246844 ?auto_246847 ) ) ( not ( = ?auto_246845 ?auto_246842 ) ) ( not ( = ?auto_246845 ?auto_246846 ) ) ( not ( = ?auto_246845 ?auto_246847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246842 ?auto_246846 ?auto_246847 )
      ( MAKE-5CRATE-VERIFY ?auto_246843 ?auto_246844 ?auto_246845 ?auto_246842 ?auto_246846 ?auto_246847 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246893 - SURFACE
      ?auto_246894 - SURFACE
      ?auto_246895 - SURFACE
      ?auto_246892 - SURFACE
      ?auto_246896 - SURFACE
      ?auto_246897 - SURFACE
    )
    :vars
    (
      ?auto_246899 - HOIST
      ?auto_246898 - PLACE
      ?auto_246902 - TRUCK
      ?auto_246900 - PLACE
      ?auto_246901 - HOIST
      ?auto_246903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246899 ?auto_246898 ) ( SURFACE-AT ?auto_246896 ?auto_246898 ) ( CLEAR ?auto_246896 ) ( IS-CRATE ?auto_246897 ) ( not ( = ?auto_246896 ?auto_246897 ) ) ( AVAILABLE ?auto_246899 ) ( ON ?auto_246896 ?auto_246892 ) ( not ( = ?auto_246892 ?auto_246896 ) ) ( not ( = ?auto_246892 ?auto_246897 ) ) ( TRUCK-AT ?auto_246902 ?auto_246900 ) ( not ( = ?auto_246900 ?auto_246898 ) ) ( HOIST-AT ?auto_246901 ?auto_246900 ) ( not ( = ?auto_246899 ?auto_246901 ) ) ( AVAILABLE ?auto_246901 ) ( SURFACE-AT ?auto_246897 ?auto_246900 ) ( ON ?auto_246897 ?auto_246903 ) ( CLEAR ?auto_246897 ) ( not ( = ?auto_246896 ?auto_246903 ) ) ( not ( = ?auto_246897 ?auto_246903 ) ) ( not ( = ?auto_246892 ?auto_246903 ) ) ( ON ?auto_246894 ?auto_246893 ) ( ON ?auto_246895 ?auto_246894 ) ( ON ?auto_246892 ?auto_246895 ) ( not ( = ?auto_246893 ?auto_246894 ) ) ( not ( = ?auto_246893 ?auto_246895 ) ) ( not ( = ?auto_246893 ?auto_246892 ) ) ( not ( = ?auto_246893 ?auto_246896 ) ) ( not ( = ?auto_246893 ?auto_246897 ) ) ( not ( = ?auto_246893 ?auto_246903 ) ) ( not ( = ?auto_246894 ?auto_246895 ) ) ( not ( = ?auto_246894 ?auto_246892 ) ) ( not ( = ?auto_246894 ?auto_246896 ) ) ( not ( = ?auto_246894 ?auto_246897 ) ) ( not ( = ?auto_246894 ?auto_246903 ) ) ( not ( = ?auto_246895 ?auto_246892 ) ) ( not ( = ?auto_246895 ?auto_246896 ) ) ( not ( = ?auto_246895 ?auto_246897 ) ) ( not ( = ?auto_246895 ?auto_246903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246892 ?auto_246896 ?auto_246897 )
      ( MAKE-5CRATE-VERIFY ?auto_246893 ?auto_246894 ?auto_246895 ?auto_246892 ?auto_246896 ?auto_246897 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246944 - SURFACE
      ?auto_246945 - SURFACE
      ?auto_246946 - SURFACE
      ?auto_246943 - SURFACE
      ?auto_246947 - SURFACE
      ?auto_246948 - SURFACE
    )
    :vars
    (
      ?auto_246954 - HOIST
      ?auto_246949 - PLACE
      ?auto_246950 - PLACE
      ?auto_246952 - HOIST
      ?auto_246953 - SURFACE
      ?auto_246951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246954 ?auto_246949 ) ( SURFACE-AT ?auto_246947 ?auto_246949 ) ( CLEAR ?auto_246947 ) ( IS-CRATE ?auto_246948 ) ( not ( = ?auto_246947 ?auto_246948 ) ) ( AVAILABLE ?auto_246954 ) ( ON ?auto_246947 ?auto_246943 ) ( not ( = ?auto_246943 ?auto_246947 ) ) ( not ( = ?auto_246943 ?auto_246948 ) ) ( not ( = ?auto_246950 ?auto_246949 ) ) ( HOIST-AT ?auto_246952 ?auto_246950 ) ( not ( = ?auto_246954 ?auto_246952 ) ) ( AVAILABLE ?auto_246952 ) ( SURFACE-AT ?auto_246948 ?auto_246950 ) ( ON ?auto_246948 ?auto_246953 ) ( CLEAR ?auto_246948 ) ( not ( = ?auto_246947 ?auto_246953 ) ) ( not ( = ?auto_246948 ?auto_246953 ) ) ( not ( = ?auto_246943 ?auto_246953 ) ) ( TRUCK-AT ?auto_246951 ?auto_246949 ) ( ON ?auto_246945 ?auto_246944 ) ( ON ?auto_246946 ?auto_246945 ) ( ON ?auto_246943 ?auto_246946 ) ( not ( = ?auto_246944 ?auto_246945 ) ) ( not ( = ?auto_246944 ?auto_246946 ) ) ( not ( = ?auto_246944 ?auto_246943 ) ) ( not ( = ?auto_246944 ?auto_246947 ) ) ( not ( = ?auto_246944 ?auto_246948 ) ) ( not ( = ?auto_246944 ?auto_246953 ) ) ( not ( = ?auto_246945 ?auto_246946 ) ) ( not ( = ?auto_246945 ?auto_246943 ) ) ( not ( = ?auto_246945 ?auto_246947 ) ) ( not ( = ?auto_246945 ?auto_246948 ) ) ( not ( = ?auto_246945 ?auto_246953 ) ) ( not ( = ?auto_246946 ?auto_246943 ) ) ( not ( = ?auto_246946 ?auto_246947 ) ) ( not ( = ?auto_246946 ?auto_246948 ) ) ( not ( = ?auto_246946 ?auto_246953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246943 ?auto_246947 ?auto_246948 )
      ( MAKE-5CRATE-VERIFY ?auto_246944 ?auto_246945 ?auto_246946 ?auto_246943 ?auto_246947 ?auto_246948 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246995 - SURFACE
      ?auto_246996 - SURFACE
      ?auto_246997 - SURFACE
      ?auto_246994 - SURFACE
      ?auto_246998 - SURFACE
      ?auto_246999 - SURFACE
    )
    :vars
    (
      ?auto_247001 - HOIST
      ?auto_247002 - PLACE
      ?auto_247003 - PLACE
      ?auto_247000 - HOIST
      ?auto_247005 - SURFACE
      ?auto_247004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_247001 ?auto_247002 ) ( IS-CRATE ?auto_246999 ) ( not ( = ?auto_246998 ?auto_246999 ) ) ( not ( = ?auto_246994 ?auto_246998 ) ) ( not ( = ?auto_246994 ?auto_246999 ) ) ( not ( = ?auto_247003 ?auto_247002 ) ) ( HOIST-AT ?auto_247000 ?auto_247003 ) ( not ( = ?auto_247001 ?auto_247000 ) ) ( AVAILABLE ?auto_247000 ) ( SURFACE-AT ?auto_246999 ?auto_247003 ) ( ON ?auto_246999 ?auto_247005 ) ( CLEAR ?auto_246999 ) ( not ( = ?auto_246998 ?auto_247005 ) ) ( not ( = ?auto_246999 ?auto_247005 ) ) ( not ( = ?auto_246994 ?auto_247005 ) ) ( TRUCK-AT ?auto_247004 ?auto_247002 ) ( SURFACE-AT ?auto_246994 ?auto_247002 ) ( CLEAR ?auto_246994 ) ( LIFTING ?auto_247001 ?auto_246998 ) ( IS-CRATE ?auto_246998 ) ( ON ?auto_246996 ?auto_246995 ) ( ON ?auto_246997 ?auto_246996 ) ( ON ?auto_246994 ?auto_246997 ) ( not ( = ?auto_246995 ?auto_246996 ) ) ( not ( = ?auto_246995 ?auto_246997 ) ) ( not ( = ?auto_246995 ?auto_246994 ) ) ( not ( = ?auto_246995 ?auto_246998 ) ) ( not ( = ?auto_246995 ?auto_246999 ) ) ( not ( = ?auto_246995 ?auto_247005 ) ) ( not ( = ?auto_246996 ?auto_246997 ) ) ( not ( = ?auto_246996 ?auto_246994 ) ) ( not ( = ?auto_246996 ?auto_246998 ) ) ( not ( = ?auto_246996 ?auto_246999 ) ) ( not ( = ?auto_246996 ?auto_247005 ) ) ( not ( = ?auto_246997 ?auto_246994 ) ) ( not ( = ?auto_246997 ?auto_246998 ) ) ( not ( = ?auto_246997 ?auto_246999 ) ) ( not ( = ?auto_246997 ?auto_247005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246994 ?auto_246998 ?auto_246999 )
      ( MAKE-5CRATE-VERIFY ?auto_246995 ?auto_246996 ?auto_246997 ?auto_246994 ?auto_246998 ?auto_246999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_247046 - SURFACE
      ?auto_247047 - SURFACE
      ?auto_247048 - SURFACE
      ?auto_247045 - SURFACE
      ?auto_247049 - SURFACE
      ?auto_247050 - SURFACE
    )
    :vars
    (
      ?auto_247053 - HOIST
      ?auto_247052 - PLACE
      ?auto_247056 - PLACE
      ?auto_247054 - HOIST
      ?auto_247055 - SURFACE
      ?auto_247051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_247053 ?auto_247052 ) ( IS-CRATE ?auto_247050 ) ( not ( = ?auto_247049 ?auto_247050 ) ) ( not ( = ?auto_247045 ?auto_247049 ) ) ( not ( = ?auto_247045 ?auto_247050 ) ) ( not ( = ?auto_247056 ?auto_247052 ) ) ( HOIST-AT ?auto_247054 ?auto_247056 ) ( not ( = ?auto_247053 ?auto_247054 ) ) ( AVAILABLE ?auto_247054 ) ( SURFACE-AT ?auto_247050 ?auto_247056 ) ( ON ?auto_247050 ?auto_247055 ) ( CLEAR ?auto_247050 ) ( not ( = ?auto_247049 ?auto_247055 ) ) ( not ( = ?auto_247050 ?auto_247055 ) ) ( not ( = ?auto_247045 ?auto_247055 ) ) ( TRUCK-AT ?auto_247051 ?auto_247052 ) ( SURFACE-AT ?auto_247045 ?auto_247052 ) ( CLEAR ?auto_247045 ) ( IS-CRATE ?auto_247049 ) ( AVAILABLE ?auto_247053 ) ( IN ?auto_247049 ?auto_247051 ) ( ON ?auto_247047 ?auto_247046 ) ( ON ?auto_247048 ?auto_247047 ) ( ON ?auto_247045 ?auto_247048 ) ( not ( = ?auto_247046 ?auto_247047 ) ) ( not ( = ?auto_247046 ?auto_247048 ) ) ( not ( = ?auto_247046 ?auto_247045 ) ) ( not ( = ?auto_247046 ?auto_247049 ) ) ( not ( = ?auto_247046 ?auto_247050 ) ) ( not ( = ?auto_247046 ?auto_247055 ) ) ( not ( = ?auto_247047 ?auto_247048 ) ) ( not ( = ?auto_247047 ?auto_247045 ) ) ( not ( = ?auto_247047 ?auto_247049 ) ) ( not ( = ?auto_247047 ?auto_247050 ) ) ( not ( = ?auto_247047 ?auto_247055 ) ) ( not ( = ?auto_247048 ?auto_247045 ) ) ( not ( = ?auto_247048 ?auto_247049 ) ) ( not ( = ?auto_247048 ?auto_247050 ) ) ( not ( = ?auto_247048 ?auto_247055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_247045 ?auto_247049 ?auto_247050 )
      ( MAKE-5CRATE-VERIFY ?auto_247046 ?auto_247047 ?auto_247048 ?auto_247045 ?auto_247049 ?auto_247050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248255 - SURFACE
      ?auto_248256 - SURFACE
      ?auto_248257 - SURFACE
      ?auto_248254 - SURFACE
      ?auto_248258 - SURFACE
      ?auto_248260 - SURFACE
      ?auto_248259 - SURFACE
    )
    :vars
    (
      ?auto_248262 - HOIST
      ?auto_248261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248262 ?auto_248261 ) ( SURFACE-AT ?auto_248260 ?auto_248261 ) ( CLEAR ?auto_248260 ) ( LIFTING ?auto_248262 ?auto_248259 ) ( IS-CRATE ?auto_248259 ) ( not ( = ?auto_248260 ?auto_248259 ) ) ( ON ?auto_248256 ?auto_248255 ) ( ON ?auto_248257 ?auto_248256 ) ( ON ?auto_248254 ?auto_248257 ) ( ON ?auto_248258 ?auto_248254 ) ( ON ?auto_248260 ?auto_248258 ) ( not ( = ?auto_248255 ?auto_248256 ) ) ( not ( = ?auto_248255 ?auto_248257 ) ) ( not ( = ?auto_248255 ?auto_248254 ) ) ( not ( = ?auto_248255 ?auto_248258 ) ) ( not ( = ?auto_248255 ?auto_248260 ) ) ( not ( = ?auto_248255 ?auto_248259 ) ) ( not ( = ?auto_248256 ?auto_248257 ) ) ( not ( = ?auto_248256 ?auto_248254 ) ) ( not ( = ?auto_248256 ?auto_248258 ) ) ( not ( = ?auto_248256 ?auto_248260 ) ) ( not ( = ?auto_248256 ?auto_248259 ) ) ( not ( = ?auto_248257 ?auto_248254 ) ) ( not ( = ?auto_248257 ?auto_248258 ) ) ( not ( = ?auto_248257 ?auto_248260 ) ) ( not ( = ?auto_248257 ?auto_248259 ) ) ( not ( = ?auto_248254 ?auto_248258 ) ) ( not ( = ?auto_248254 ?auto_248260 ) ) ( not ( = ?auto_248254 ?auto_248259 ) ) ( not ( = ?auto_248258 ?auto_248260 ) ) ( not ( = ?auto_248258 ?auto_248259 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_248260 ?auto_248259 )
      ( MAKE-6CRATE-VERIFY ?auto_248255 ?auto_248256 ?auto_248257 ?auto_248254 ?auto_248258 ?auto_248260 ?auto_248259 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248299 - SURFACE
      ?auto_248300 - SURFACE
      ?auto_248301 - SURFACE
      ?auto_248298 - SURFACE
      ?auto_248302 - SURFACE
      ?auto_248304 - SURFACE
      ?auto_248303 - SURFACE
    )
    :vars
    (
      ?auto_248305 - HOIST
      ?auto_248307 - PLACE
      ?auto_248306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248305 ?auto_248307 ) ( SURFACE-AT ?auto_248304 ?auto_248307 ) ( CLEAR ?auto_248304 ) ( IS-CRATE ?auto_248303 ) ( not ( = ?auto_248304 ?auto_248303 ) ) ( TRUCK-AT ?auto_248306 ?auto_248307 ) ( AVAILABLE ?auto_248305 ) ( IN ?auto_248303 ?auto_248306 ) ( ON ?auto_248304 ?auto_248302 ) ( not ( = ?auto_248302 ?auto_248304 ) ) ( not ( = ?auto_248302 ?auto_248303 ) ) ( ON ?auto_248300 ?auto_248299 ) ( ON ?auto_248301 ?auto_248300 ) ( ON ?auto_248298 ?auto_248301 ) ( ON ?auto_248302 ?auto_248298 ) ( not ( = ?auto_248299 ?auto_248300 ) ) ( not ( = ?auto_248299 ?auto_248301 ) ) ( not ( = ?auto_248299 ?auto_248298 ) ) ( not ( = ?auto_248299 ?auto_248302 ) ) ( not ( = ?auto_248299 ?auto_248304 ) ) ( not ( = ?auto_248299 ?auto_248303 ) ) ( not ( = ?auto_248300 ?auto_248301 ) ) ( not ( = ?auto_248300 ?auto_248298 ) ) ( not ( = ?auto_248300 ?auto_248302 ) ) ( not ( = ?auto_248300 ?auto_248304 ) ) ( not ( = ?auto_248300 ?auto_248303 ) ) ( not ( = ?auto_248301 ?auto_248298 ) ) ( not ( = ?auto_248301 ?auto_248302 ) ) ( not ( = ?auto_248301 ?auto_248304 ) ) ( not ( = ?auto_248301 ?auto_248303 ) ) ( not ( = ?auto_248298 ?auto_248302 ) ) ( not ( = ?auto_248298 ?auto_248304 ) ) ( not ( = ?auto_248298 ?auto_248303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248302 ?auto_248304 ?auto_248303 )
      ( MAKE-6CRATE-VERIFY ?auto_248299 ?auto_248300 ?auto_248301 ?auto_248298 ?auto_248302 ?auto_248304 ?auto_248303 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248350 - SURFACE
      ?auto_248351 - SURFACE
      ?auto_248352 - SURFACE
      ?auto_248349 - SURFACE
      ?auto_248353 - SURFACE
      ?auto_248355 - SURFACE
      ?auto_248354 - SURFACE
    )
    :vars
    (
      ?auto_248359 - HOIST
      ?auto_248356 - PLACE
      ?auto_248357 - TRUCK
      ?auto_248358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248359 ?auto_248356 ) ( SURFACE-AT ?auto_248355 ?auto_248356 ) ( CLEAR ?auto_248355 ) ( IS-CRATE ?auto_248354 ) ( not ( = ?auto_248355 ?auto_248354 ) ) ( AVAILABLE ?auto_248359 ) ( IN ?auto_248354 ?auto_248357 ) ( ON ?auto_248355 ?auto_248353 ) ( not ( = ?auto_248353 ?auto_248355 ) ) ( not ( = ?auto_248353 ?auto_248354 ) ) ( TRUCK-AT ?auto_248357 ?auto_248358 ) ( not ( = ?auto_248358 ?auto_248356 ) ) ( ON ?auto_248351 ?auto_248350 ) ( ON ?auto_248352 ?auto_248351 ) ( ON ?auto_248349 ?auto_248352 ) ( ON ?auto_248353 ?auto_248349 ) ( not ( = ?auto_248350 ?auto_248351 ) ) ( not ( = ?auto_248350 ?auto_248352 ) ) ( not ( = ?auto_248350 ?auto_248349 ) ) ( not ( = ?auto_248350 ?auto_248353 ) ) ( not ( = ?auto_248350 ?auto_248355 ) ) ( not ( = ?auto_248350 ?auto_248354 ) ) ( not ( = ?auto_248351 ?auto_248352 ) ) ( not ( = ?auto_248351 ?auto_248349 ) ) ( not ( = ?auto_248351 ?auto_248353 ) ) ( not ( = ?auto_248351 ?auto_248355 ) ) ( not ( = ?auto_248351 ?auto_248354 ) ) ( not ( = ?auto_248352 ?auto_248349 ) ) ( not ( = ?auto_248352 ?auto_248353 ) ) ( not ( = ?auto_248352 ?auto_248355 ) ) ( not ( = ?auto_248352 ?auto_248354 ) ) ( not ( = ?auto_248349 ?auto_248353 ) ) ( not ( = ?auto_248349 ?auto_248355 ) ) ( not ( = ?auto_248349 ?auto_248354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248353 ?auto_248355 ?auto_248354 )
      ( MAKE-6CRATE-VERIFY ?auto_248350 ?auto_248351 ?auto_248352 ?auto_248349 ?auto_248353 ?auto_248355 ?auto_248354 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248407 - SURFACE
      ?auto_248408 - SURFACE
      ?auto_248409 - SURFACE
      ?auto_248406 - SURFACE
      ?auto_248410 - SURFACE
      ?auto_248412 - SURFACE
      ?auto_248411 - SURFACE
    )
    :vars
    (
      ?auto_248417 - HOIST
      ?auto_248415 - PLACE
      ?auto_248414 - TRUCK
      ?auto_248416 - PLACE
      ?auto_248413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_248417 ?auto_248415 ) ( SURFACE-AT ?auto_248412 ?auto_248415 ) ( CLEAR ?auto_248412 ) ( IS-CRATE ?auto_248411 ) ( not ( = ?auto_248412 ?auto_248411 ) ) ( AVAILABLE ?auto_248417 ) ( ON ?auto_248412 ?auto_248410 ) ( not ( = ?auto_248410 ?auto_248412 ) ) ( not ( = ?auto_248410 ?auto_248411 ) ) ( TRUCK-AT ?auto_248414 ?auto_248416 ) ( not ( = ?auto_248416 ?auto_248415 ) ) ( HOIST-AT ?auto_248413 ?auto_248416 ) ( LIFTING ?auto_248413 ?auto_248411 ) ( not ( = ?auto_248417 ?auto_248413 ) ) ( ON ?auto_248408 ?auto_248407 ) ( ON ?auto_248409 ?auto_248408 ) ( ON ?auto_248406 ?auto_248409 ) ( ON ?auto_248410 ?auto_248406 ) ( not ( = ?auto_248407 ?auto_248408 ) ) ( not ( = ?auto_248407 ?auto_248409 ) ) ( not ( = ?auto_248407 ?auto_248406 ) ) ( not ( = ?auto_248407 ?auto_248410 ) ) ( not ( = ?auto_248407 ?auto_248412 ) ) ( not ( = ?auto_248407 ?auto_248411 ) ) ( not ( = ?auto_248408 ?auto_248409 ) ) ( not ( = ?auto_248408 ?auto_248406 ) ) ( not ( = ?auto_248408 ?auto_248410 ) ) ( not ( = ?auto_248408 ?auto_248412 ) ) ( not ( = ?auto_248408 ?auto_248411 ) ) ( not ( = ?auto_248409 ?auto_248406 ) ) ( not ( = ?auto_248409 ?auto_248410 ) ) ( not ( = ?auto_248409 ?auto_248412 ) ) ( not ( = ?auto_248409 ?auto_248411 ) ) ( not ( = ?auto_248406 ?auto_248410 ) ) ( not ( = ?auto_248406 ?auto_248412 ) ) ( not ( = ?auto_248406 ?auto_248411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248410 ?auto_248412 ?auto_248411 )
      ( MAKE-6CRATE-VERIFY ?auto_248407 ?auto_248408 ?auto_248409 ?auto_248406 ?auto_248410 ?auto_248412 ?auto_248411 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248470 - SURFACE
      ?auto_248471 - SURFACE
      ?auto_248472 - SURFACE
      ?auto_248469 - SURFACE
      ?auto_248473 - SURFACE
      ?auto_248475 - SURFACE
      ?auto_248474 - SURFACE
    )
    :vars
    (
      ?auto_248479 - HOIST
      ?auto_248478 - PLACE
      ?auto_248480 - TRUCK
      ?auto_248477 - PLACE
      ?auto_248476 - HOIST
      ?auto_248481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248479 ?auto_248478 ) ( SURFACE-AT ?auto_248475 ?auto_248478 ) ( CLEAR ?auto_248475 ) ( IS-CRATE ?auto_248474 ) ( not ( = ?auto_248475 ?auto_248474 ) ) ( AVAILABLE ?auto_248479 ) ( ON ?auto_248475 ?auto_248473 ) ( not ( = ?auto_248473 ?auto_248475 ) ) ( not ( = ?auto_248473 ?auto_248474 ) ) ( TRUCK-AT ?auto_248480 ?auto_248477 ) ( not ( = ?auto_248477 ?auto_248478 ) ) ( HOIST-AT ?auto_248476 ?auto_248477 ) ( not ( = ?auto_248479 ?auto_248476 ) ) ( AVAILABLE ?auto_248476 ) ( SURFACE-AT ?auto_248474 ?auto_248477 ) ( ON ?auto_248474 ?auto_248481 ) ( CLEAR ?auto_248474 ) ( not ( = ?auto_248475 ?auto_248481 ) ) ( not ( = ?auto_248474 ?auto_248481 ) ) ( not ( = ?auto_248473 ?auto_248481 ) ) ( ON ?auto_248471 ?auto_248470 ) ( ON ?auto_248472 ?auto_248471 ) ( ON ?auto_248469 ?auto_248472 ) ( ON ?auto_248473 ?auto_248469 ) ( not ( = ?auto_248470 ?auto_248471 ) ) ( not ( = ?auto_248470 ?auto_248472 ) ) ( not ( = ?auto_248470 ?auto_248469 ) ) ( not ( = ?auto_248470 ?auto_248473 ) ) ( not ( = ?auto_248470 ?auto_248475 ) ) ( not ( = ?auto_248470 ?auto_248474 ) ) ( not ( = ?auto_248470 ?auto_248481 ) ) ( not ( = ?auto_248471 ?auto_248472 ) ) ( not ( = ?auto_248471 ?auto_248469 ) ) ( not ( = ?auto_248471 ?auto_248473 ) ) ( not ( = ?auto_248471 ?auto_248475 ) ) ( not ( = ?auto_248471 ?auto_248474 ) ) ( not ( = ?auto_248471 ?auto_248481 ) ) ( not ( = ?auto_248472 ?auto_248469 ) ) ( not ( = ?auto_248472 ?auto_248473 ) ) ( not ( = ?auto_248472 ?auto_248475 ) ) ( not ( = ?auto_248472 ?auto_248474 ) ) ( not ( = ?auto_248472 ?auto_248481 ) ) ( not ( = ?auto_248469 ?auto_248473 ) ) ( not ( = ?auto_248469 ?auto_248475 ) ) ( not ( = ?auto_248469 ?auto_248474 ) ) ( not ( = ?auto_248469 ?auto_248481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248473 ?auto_248475 ?auto_248474 )
      ( MAKE-6CRATE-VERIFY ?auto_248470 ?auto_248471 ?auto_248472 ?auto_248469 ?auto_248473 ?auto_248475 ?auto_248474 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248534 - SURFACE
      ?auto_248535 - SURFACE
      ?auto_248536 - SURFACE
      ?auto_248533 - SURFACE
      ?auto_248537 - SURFACE
      ?auto_248539 - SURFACE
      ?auto_248538 - SURFACE
    )
    :vars
    (
      ?auto_248542 - HOIST
      ?auto_248545 - PLACE
      ?auto_248543 - PLACE
      ?auto_248541 - HOIST
      ?auto_248540 - SURFACE
      ?auto_248544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248542 ?auto_248545 ) ( SURFACE-AT ?auto_248539 ?auto_248545 ) ( CLEAR ?auto_248539 ) ( IS-CRATE ?auto_248538 ) ( not ( = ?auto_248539 ?auto_248538 ) ) ( AVAILABLE ?auto_248542 ) ( ON ?auto_248539 ?auto_248537 ) ( not ( = ?auto_248537 ?auto_248539 ) ) ( not ( = ?auto_248537 ?auto_248538 ) ) ( not ( = ?auto_248543 ?auto_248545 ) ) ( HOIST-AT ?auto_248541 ?auto_248543 ) ( not ( = ?auto_248542 ?auto_248541 ) ) ( AVAILABLE ?auto_248541 ) ( SURFACE-AT ?auto_248538 ?auto_248543 ) ( ON ?auto_248538 ?auto_248540 ) ( CLEAR ?auto_248538 ) ( not ( = ?auto_248539 ?auto_248540 ) ) ( not ( = ?auto_248538 ?auto_248540 ) ) ( not ( = ?auto_248537 ?auto_248540 ) ) ( TRUCK-AT ?auto_248544 ?auto_248545 ) ( ON ?auto_248535 ?auto_248534 ) ( ON ?auto_248536 ?auto_248535 ) ( ON ?auto_248533 ?auto_248536 ) ( ON ?auto_248537 ?auto_248533 ) ( not ( = ?auto_248534 ?auto_248535 ) ) ( not ( = ?auto_248534 ?auto_248536 ) ) ( not ( = ?auto_248534 ?auto_248533 ) ) ( not ( = ?auto_248534 ?auto_248537 ) ) ( not ( = ?auto_248534 ?auto_248539 ) ) ( not ( = ?auto_248534 ?auto_248538 ) ) ( not ( = ?auto_248534 ?auto_248540 ) ) ( not ( = ?auto_248535 ?auto_248536 ) ) ( not ( = ?auto_248535 ?auto_248533 ) ) ( not ( = ?auto_248535 ?auto_248537 ) ) ( not ( = ?auto_248535 ?auto_248539 ) ) ( not ( = ?auto_248535 ?auto_248538 ) ) ( not ( = ?auto_248535 ?auto_248540 ) ) ( not ( = ?auto_248536 ?auto_248533 ) ) ( not ( = ?auto_248536 ?auto_248537 ) ) ( not ( = ?auto_248536 ?auto_248539 ) ) ( not ( = ?auto_248536 ?auto_248538 ) ) ( not ( = ?auto_248536 ?auto_248540 ) ) ( not ( = ?auto_248533 ?auto_248537 ) ) ( not ( = ?auto_248533 ?auto_248539 ) ) ( not ( = ?auto_248533 ?auto_248538 ) ) ( not ( = ?auto_248533 ?auto_248540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248537 ?auto_248539 ?auto_248538 )
      ( MAKE-6CRATE-VERIFY ?auto_248534 ?auto_248535 ?auto_248536 ?auto_248533 ?auto_248537 ?auto_248539 ?auto_248538 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248598 - SURFACE
      ?auto_248599 - SURFACE
      ?auto_248600 - SURFACE
      ?auto_248597 - SURFACE
      ?auto_248601 - SURFACE
      ?auto_248603 - SURFACE
      ?auto_248602 - SURFACE
    )
    :vars
    (
      ?auto_248605 - HOIST
      ?auto_248604 - PLACE
      ?auto_248609 - PLACE
      ?auto_248607 - HOIST
      ?auto_248608 - SURFACE
      ?auto_248606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248605 ?auto_248604 ) ( IS-CRATE ?auto_248602 ) ( not ( = ?auto_248603 ?auto_248602 ) ) ( not ( = ?auto_248601 ?auto_248603 ) ) ( not ( = ?auto_248601 ?auto_248602 ) ) ( not ( = ?auto_248609 ?auto_248604 ) ) ( HOIST-AT ?auto_248607 ?auto_248609 ) ( not ( = ?auto_248605 ?auto_248607 ) ) ( AVAILABLE ?auto_248607 ) ( SURFACE-AT ?auto_248602 ?auto_248609 ) ( ON ?auto_248602 ?auto_248608 ) ( CLEAR ?auto_248602 ) ( not ( = ?auto_248603 ?auto_248608 ) ) ( not ( = ?auto_248602 ?auto_248608 ) ) ( not ( = ?auto_248601 ?auto_248608 ) ) ( TRUCK-AT ?auto_248606 ?auto_248604 ) ( SURFACE-AT ?auto_248601 ?auto_248604 ) ( CLEAR ?auto_248601 ) ( LIFTING ?auto_248605 ?auto_248603 ) ( IS-CRATE ?auto_248603 ) ( ON ?auto_248599 ?auto_248598 ) ( ON ?auto_248600 ?auto_248599 ) ( ON ?auto_248597 ?auto_248600 ) ( ON ?auto_248601 ?auto_248597 ) ( not ( = ?auto_248598 ?auto_248599 ) ) ( not ( = ?auto_248598 ?auto_248600 ) ) ( not ( = ?auto_248598 ?auto_248597 ) ) ( not ( = ?auto_248598 ?auto_248601 ) ) ( not ( = ?auto_248598 ?auto_248603 ) ) ( not ( = ?auto_248598 ?auto_248602 ) ) ( not ( = ?auto_248598 ?auto_248608 ) ) ( not ( = ?auto_248599 ?auto_248600 ) ) ( not ( = ?auto_248599 ?auto_248597 ) ) ( not ( = ?auto_248599 ?auto_248601 ) ) ( not ( = ?auto_248599 ?auto_248603 ) ) ( not ( = ?auto_248599 ?auto_248602 ) ) ( not ( = ?auto_248599 ?auto_248608 ) ) ( not ( = ?auto_248600 ?auto_248597 ) ) ( not ( = ?auto_248600 ?auto_248601 ) ) ( not ( = ?auto_248600 ?auto_248603 ) ) ( not ( = ?auto_248600 ?auto_248602 ) ) ( not ( = ?auto_248600 ?auto_248608 ) ) ( not ( = ?auto_248597 ?auto_248601 ) ) ( not ( = ?auto_248597 ?auto_248603 ) ) ( not ( = ?auto_248597 ?auto_248602 ) ) ( not ( = ?auto_248597 ?auto_248608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248601 ?auto_248603 ?auto_248602 )
      ( MAKE-6CRATE-VERIFY ?auto_248598 ?auto_248599 ?auto_248600 ?auto_248597 ?auto_248601 ?auto_248603 ?auto_248602 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248662 - SURFACE
      ?auto_248663 - SURFACE
      ?auto_248664 - SURFACE
      ?auto_248661 - SURFACE
      ?auto_248665 - SURFACE
      ?auto_248667 - SURFACE
      ?auto_248666 - SURFACE
    )
    :vars
    (
      ?auto_248671 - HOIST
      ?auto_248669 - PLACE
      ?auto_248673 - PLACE
      ?auto_248670 - HOIST
      ?auto_248668 - SURFACE
      ?auto_248672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248671 ?auto_248669 ) ( IS-CRATE ?auto_248666 ) ( not ( = ?auto_248667 ?auto_248666 ) ) ( not ( = ?auto_248665 ?auto_248667 ) ) ( not ( = ?auto_248665 ?auto_248666 ) ) ( not ( = ?auto_248673 ?auto_248669 ) ) ( HOIST-AT ?auto_248670 ?auto_248673 ) ( not ( = ?auto_248671 ?auto_248670 ) ) ( AVAILABLE ?auto_248670 ) ( SURFACE-AT ?auto_248666 ?auto_248673 ) ( ON ?auto_248666 ?auto_248668 ) ( CLEAR ?auto_248666 ) ( not ( = ?auto_248667 ?auto_248668 ) ) ( not ( = ?auto_248666 ?auto_248668 ) ) ( not ( = ?auto_248665 ?auto_248668 ) ) ( TRUCK-AT ?auto_248672 ?auto_248669 ) ( SURFACE-AT ?auto_248665 ?auto_248669 ) ( CLEAR ?auto_248665 ) ( IS-CRATE ?auto_248667 ) ( AVAILABLE ?auto_248671 ) ( IN ?auto_248667 ?auto_248672 ) ( ON ?auto_248663 ?auto_248662 ) ( ON ?auto_248664 ?auto_248663 ) ( ON ?auto_248661 ?auto_248664 ) ( ON ?auto_248665 ?auto_248661 ) ( not ( = ?auto_248662 ?auto_248663 ) ) ( not ( = ?auto_248662 ?auto_248664 ) ) ( not ( = ?auto_248662 ?auto_248661 ) ) ( not ( = ?auto_248662 ?auto_248665 ) ) ( not ( = ?auto_248662 ?auto_248667 ) ) ( not ( = ?auto_248662 ?auto_248666 ) ) ( not ( = ?auto_248662 ?auto_248668 ) ) ( not ( = ?auto_248663 ?auto_248664 ) ) ( not ( = ?auto_248663 ?auto_248661 ) ) ( not ( = ?auto_248663 ?auto_248665 ) ) ( not ( = ?auto_248663 ?auto_248667 ) ) ( not ( = ?auto_248663 ?auto_248666 ) ) ( not ( = ?auto_248663 ?auto_248668 ) ) ( not ( = ?auto_248664 ?auto_248661 ) ) ( not ( = ?auto_248664 ?auto_248665 ) ) ( not ( = ?auto_248664 ?auto_248667 ) ) ( not ( = ?auto_248664 ?auto_248666 ) ) ( not ( = ?auto_248664 ?auto_248668 ) ) ( not ( = ?auto_248661 ?auto_248665 ) ) ( not ( = ?auto_248661 ?auto_248667 ) ) ( not ( = ?auto_248661 ?auto_248666 ) ) ( not ( = ?auto_248661 ?auto_248668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248665 ?auto_248667 ?auto_248666 )
      ( MAKE-6CRATE-VERIFY ?auto_248662 ?auto_248663 ?auto_248664 ?auto_248661 ?auto_248665 ?auto_248667 ?auto_248666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_249131 - SURFACE
      ?auto_249132 - SURFACE
    )
    :vars
    (
      ?auto_249133 - HOIST
      ?auto_249136 - PLACE
      ?auto_249137 - SURFACE
      ?auto_249135 - TRUCK
      ?auto_249139 - PLACE
      ?auto_249134 - HOIST
      ?auto_249138 - SURFACE
      ?auto_249140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_249133 ?auto_249136 ) ( SURFACE-AT ?auto_249131 ?auto_249136 ) ( CLEAR ?auto_249131 ) ( IS-CRATE ?auto_249132 ) ( not ( = ?auto_249131 ?auto_249132 ) ) ( AVAILABLE ?auto_249133 ) ( ON ?auto_249131 ?auto_249137 ) ( not ( = ?auto_249137 ?auto_249131 ) ) ( not ( = ?auto_249137 ?auto_249132 ) ) ( TRUCK-AT ?auto_249135 ?auto_249139 ) ( not ( = ?auto_249139 ?auto_249136 ) ) ( HOIST-AT ?auto_249134 ?auto_249139 ) ( not ( = ?auto_249133 ?auto_249134 ) ) ( SURFACE-AT ?auto_249132 ?auto_249139 ) ( ON ?auto_249132 ?auto_249138 ) ( CLEAR ?auto_249132 ) ( not ( = ?auto_249131 ?auto_249138 ) ) ( not ( = ?auto_249132 ?auto_249138 ) ) ( not ( = ?auto_249137 ?auto_249138 ) ) ( LIFTING ?auto_249134 ?auto_249140 ) ( IS-CRATE ?auto_249140 ) ( not ( = ?auto_249131 ?auto_249140 ) ) ( not ( = ?auto_249132 ?auto_249140 ) ) ( not ( = ?auto_249137 ?auto_249140 ) ) ( not ( = ?auto_249138 ?auto_249140 ) ) )
    :subtasks
    ( ( !LOAD ?auto_249134 ?auto_249140 ?auto_249135 ?auto_249139 )
      ( MAKE-1CRATE ?auto_249131 ?auto_249132 )
      ( MAKE-1CRATE-VERIFY ?auto_249131 ?auto_249132 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250611 - SURFACE
      ?auto_250612 - SURFACE
      ?auto_250613 - SURFACE
      ?auto_250610 - SURFACE
      ?auto_250614 - SURFACE
      ?auto_250616 - SURFACE
      ?auto_250615 - SURFACE
      ?auto_250617 - SURFACE
    )
    :vars
    (
      ?auto_250619 - HOIST
      ?auto_250618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250619 ?auto_250618 ) ( SURFACE-AT ?auto_250615 ?auto_250618 ) ( CLEAR ?auto_250615 ) ( LIFTING ?auto_250619 ?auto_250617 ) ( IS-CRATE ?auto_250617 ) ( not ( = ?auto_250615 ?auto_250617 ) ) ( ON ?auto_250612 ?auto_250611 ) ( ON ?auto_250613 ?auto_250612 ) ( ON ?auto_250610 ?auto_250613 ) ( ON ?auto_250614 ?auto_250610 ) ( ON ?auto_250616 ?auto_250614 ) ( ON ?auto_250615 ?auto_250616 ) ( not ( = ?auto_250611 ?auto_250612 ) ) ( not ( = ?auto_250611 ?auto_250613 ) ) ( not ( = ?auto_250611 ?auto_250610 ) ) ( not ( = ?auto_250611 ?auto_250614 ) ) ( not ( = ?auto_250611 ?auto_250616 ) ) ( not ( = ?auto_250611 ?auto_250615 ) ) ( not ( = ?auto_250611 ?auto_250617 ) ) ( not ( = ?auto_250612 ?auto_250613 ) ) ( not ( = ?auto_250612 ?auto_250610 ) ) ( not ( = ?auto_250612 ?auto_250614 ) ) ( not ( = ?auto_250612 ?auto_250616 ) ) ( not ( = ?auto_250612 ?auto_250615 ) ) ( not ( = ?auto_250612 ?auto_250617 ) ) ( not ( = ?auto_250613 ?auto_250610 ) ) ( not ( = ?auto_250613 ?auto_250614 ) ) ( not ( = ?auto_250613 ?auto_250616 ) ) ( not ( = ?auto_250613 ?auto_250615 ) ) ( not ( = ?auto_250613 ?auto_250617 ) ) ( not ( = ?auto_250610 ?auto_250614 ) ) ( not ( = ?auto_250610 ?auto_250616 ) ) ( not ( = ?auto_250610 ?auto_250615 ) ) ( not ( = ?auto_250610 ?auto_250617 ) ) ( not ( = ?auto_250614 ?auto_250616 ) ) ( not ( = ?auto_250614 ?auto_250615 ) ) ( not ( = ?auto_250614 ?auto_250617 ) ) ( not ( = ?auto_250616 ?auto_250615 ) ) ( not ( = ?auto_250616 ?auto_250617 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250615 ?auto_250617 )
      ( MAKE-7CRATE-VERIFY ?auto_250611 ?auto_250612 ?auto_250613 ?auto_250610 ?auto_250614 ?auto_250616 ?auto_250615 ?auto_250617 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250666 - SURFACE
      ?auto_250667 - SURFACE
      ?auto_250668 - SURFACE
      ?auto_250665 - SURFACE
      ?auto_250669 - SURFACE
      ?auto_250671 - SURFACE
      ?auto_250670 - SURFACE
      ?auto_250672 - SURFACE
    )
    :vars
    (
      ?auto_250673 - HOIST
      ?auto_250675 - PLACE
      ?auto_250674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250673 ?auto_250675 ) ( SURFACE-AT ?auto_250670 ?auto_250675 ) ( CLEAR ?auto_250670 ) ( IS-CRATE ?auto_250672 ) ( not ( = ?auto_250670 ?auto_250672 ) ) ( TRUCK-AT ?auto_250674 ?auto_250675 ) ( AVAILABLE ?auto_250673 ) ( IN ?auto_250672 ?auto_250674 ) ( ON ?auto_250670 ?auto_250671 ) ( not ( = ?auto_250671 ?auto_250670 ) ) ( not ( = ?auto_250671 ?auto_250672 ) ) ( ON ?auto_250667 ?auto_250666 ) ( ON ?auto_250668 ?auto_250667 ) ( ON ?auto_250665 ?auto_250668 ) ( ON ?auto_250669 ?auto_250665 ) ( ON ?auto_250671 ?auto_250669 ) ( not ( = ?auto_250666 ?auto_250667 ) ) ( not ( = ?auto_250666 ?auto_250668 ) ) ( not ( = ?auto_250666 ?auto_250665 ) ) ( not ( = ?auto_250666 ?auto_250669 ) ) ( not ( = ?auto_250666 ?auto_250671 ) ) ( not ( = ?auto_250666 ?auto_250670 ) ) ( not ( = ?auto_250666 ?auto_250672 ) ) ( not ( = ?auto_250667 ?auto_250668 ) ) ( not ( = ?auto_250667 ?auto_250665 ) ) ( not ( = ?auto_250667 ?auto_250669 ) ) ( not ( = ?auto_250667 ?auto_250671 ) ) ( not ( = ?auto_250667 ?auto_250670 ) ) ( not ( = ?auto_250667 ?auto_250672 ) ) ( not ( = ?auto_250668 ?auto_250665 ) ) ( not ( = ?auto_250668 ?auto_250669 ) ) ( not ( = ?auto_250668 ?auto_250671 ) ) ( not ( = ?auto_250668 ?auto_250670 ) ) ( not ( = ?auto_250668 ?auto_250672 ) ) ( not ( = ?auto_250665 ?auto_250669 ) ) ( not ( = ?auto_250665 ?auto_250671 ) ) ( not ( = ?auto_250665 ?auto_250670 ) ) ( not ( = ?auto_250665 ?auto_250672 ) ) ( not ( = ?auto_250669 ?auto_250671 ) ) ( not ( = ?auto_250669 ?auto_250670 ) ) ( not ( = ?auto_250669 ?auto_250672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250671 ?auto_250670 ?auto_250672 )
      ( MAKE-7CRATE-VERIFY ?auto_250666 ?auto_250667 ?auto_250668 ?auto_250665 ?auto_250669 ?auto_250671 ?auto_250670 ?auto_250672 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250729 - SURFACE
      ?auto_250730 - SURFACE
      ?auto_250731 - SURFACE
      ?auto_250728 - SURFACE
      ?auto_250732 - SURFACE
      ?auto_250734 - SURFACE
      ?auto_250733 - SURFACE
      ?auto_250735 - SURFACE
    )
    :vars
    (
      ?auto_250739 - HOIST
      ?auto_250738 - PLACE
      ?auto_250736 - TRUCK
      ?auto_250737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250739 ?auto_250738 ) ( SURFACE-AT ?auto_250733 ?auto_250738 ) ( CLEAR ?auto_250733 ) ( IS-CRATE ?auto_250735 ) ( not ( = ?auto_250733 ?auto_250735 ) ) ( AVAILABLE ?auto_250739 ) ( IN ?auto_250735 ?auto_250736 ) ( ON ?auto_250733 ?auto_250734 ) ( not ( = ?auto_250734 ?auto_250733 ) ) ( not ( = ?auto_250734 ?auto_250735 ) ) ( TRUCK-AT ?auto_250736 ?auto_250737 ) ( not ( = ?auto_250737 ?auto_250738 ) ) ( ON ?auto_250730 ?auto_250729 ) ( ON ?auto_250731 ?auto_250730 ) ( ON ?auto_250728 ?auto_250731 ) ( ON ?auto_250732 ?auto_250728 ) ( ON ?auto_250734 ?auto_250732 ) ( not ( = ?auto_250729 ?auto_250730 ) ) ( not ( = ?auto_250729 ?auto_250731 ) ) ( not ( = ?auto_250729 ?auto_250728 ) ) ( not ( = ?auto_250729 ?auto_250732 ) ) ( not ( = ?auto_250729 ?auto_250734 ) ) ( not ( = ?auto_250729 ?auto_250733 ) ) ( not ( = ?auto_250729 ?auto_250735 ) ) ( not ( = ?auto_250730 ?auto_250731 ) ) ( not ( = ?auto_250730 ?auto_250728 ) ) ( not ( = ?auto_250730 ?auto_250732 ) ) ( not ( = ?auto_250730 ?auto_250734 ) ) ( not ( = ?auto_250730 ?auto_250733 ) ) ( not ( = ?auto_250730 ?auto_250735 ) ) ( not ( = ?auto_250731 ?auto_250728 ) ) ( not ( = ?auto_250731 ?auto_250732 ) ) ( not ( = ?auto_250731 ?auto_250734 ) ) ( not ( = ?auto_250731 ?auto_250733 ) ) ( not ( = ?auto_250731 ?auto_250735 ) ) ( not ( = ?auto_250728 ?auto_250732 ) ) ( not ( = ?auto_250728 ?auto_250734 ) ) ( not ( = ?auto_250728 ?auto_250733 ) ) ( not ( = ?auto_250728 ?auto_250735 ) ) ( not ( = ?auto_250732 ?auto_250734 ) ) ( not ( = ?auto_250732 ?auto_250733 ) ) ( not ( = ?auto_250732 ?auto_250735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250734 ?auto_250733 ?auto_250735 )
      ( MAKE-7CRATE-VERIFY ?auto_250729 ?auto_250730 ?auto_250731 ?auto_250728 ?auto_250732 ?auto_250734 ?auto_250733 ?auto_250735 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250799 - SURFACE
      ?auto_250800 - SURFACE
      ?auto_250801 - SURFACE
      ?auto_250798 - SURFACE
      ?auto_250802 - SURFACE
      ?auto_250804 - SURFACE
      ?auto_250803 - SURFACE
      ?auto_250805 - SURFACE
    )
    :vars
    (
      ?auto_250806 - HOIST
      ?auto_250810 - PLACE
      ?auto_250807 - TRUCK
      ?auto_250809 - PLACE
      ?auto_250808 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_250806 ?auto_250810 ) ( SURFACE-AT ?auto_250803 ?auto_250810 ) ( CLEAR ?auto_250803 ) ( IS-CRATE ?auto_250805 ) ( not ( = ?auto_250803 ?auto_250805 ) ) ( AVAILABLE ?auto_250806 ) ( ON ?auto_250803 ?auto_250804 ) ( not ( = ?auto_250804 ?auto_250803 ) ) ( not ( = ?auto_250804 ?auto_250805 ) ) ( TRUCK-AT ?auto_250807 ?auto_250809 ) ( not ( = ?auto_250809 ?auto_250810 ) ) ( HOIST-AT ?auto_250808 ?auto_250809 ) ( LIFTING ?auto_250808 ?auto_250805 ) ( not ( = ?auto_250806 ?auto_250808 ) ) ( ON ?auto_250800 ?auto_250799 ) ( ON ?auto_250801 ?auto_250800 ) ( ON ?auto_250798 ?auto_250801 ) ( ON ?auto_250802 ?auto_250798 ) ( ON ?auto_250804 ?auto_250802 ) ( not ( = ?auto_250799 ?auto_250800 ) ) ( not ( = ?auto_250799 ?auto_250801 ) ) ( not ( = ?auto_250799 ?auto_250798 ) ) ( not ( = ?auto_250799 ?auto_250802 ) ) ( not ( = ?auto_250799 ?auto_250804 ) ) ( not ( = ?auto_250799 ?auto_250803 ) ) ( not ( = ?auto_250799 ?auto_250805 ) ) ( not ( = ?auto_250800 ?auto_250801 ) ) ( not ( = ?auto_250800 ?auto_250798 ) ) ( not ( = ?auto_250800 ?auto_250802 ) ) ( not ( = ?auto_250800 ?auto_250804 ) ) ( not ( = ?auto_250800 ?auto_250803 ) ) ( not ( = ?auto_250800 ?auto_250805 ) ) ( not ( = ?auto_250801 ?auto_250798 ) ) ( not ( = ?auto_250801 ?auto_250802 ) ) ( not ( = ?auto_250801 ?auto_250804 ) ) ( not ( = ?auto_250801 ?auto_250803 ) ) ( not ( = ?auto_250801 ?auto_250805 ) ) ( not ( = ?auto_250798 ?auto_250802 ) ) ( not ( = ?auto_250798 ?auto_250804 ) ) ( not ( = ?auto_250798 ?auto_250803 ) ) ( not ( = ?auto_250798 ?auto_250805 ) ) ( not ( = ?auto_250802 ?auto_250804 ) ) ( not ( = ?auto_250802 ?auto_250803 ) ) ( not ( = ?auto_250802 ?auto_250805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250804 ?auto_250803 ?auto_250805 )
      ( MAKE-7CRATE-VERIFY ?auto_250799 ?auto_250800 ?auto_250801 ?auto_250798 ?auto_250802 ?auto_250804 ?auto_250803 ?auto_250805 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250876 - SURFACE
      ?auto_250877 - SURFACE
      ?auto_250878 - SURFACE
      ?auto_250875 - SURFACE
      ?auto_250879 - SURFACE
      ?auto_250881 - SURFACE
      ?auto_250880 - SURFACE
      ?auto_250882 - SURFACE
    )
    :vars
    (
      ?auto_250886 - HOIST
      ?auto_250883 - PLACE
      ?auto_250884 - TRUCK
      ?auto_250887 - PLACE
      ?auto_250888 - HOIST
      ?auto_250885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250886 ?auto_250883 ) ( SURFACE-AT ?auto_250880 ?auto_250883 ) ( CLEAR ?auto_250880 ) ( IS-CRATE ?auto_250882 ) ( not ( = ?auto_250880 ?auto_250882 ) ) ( AVAILABLE ?auto_250886 ) ( ON ?auto_250880 ?auto_250881 ) ( not ( = ?auto_250881 ?auto_250880 ) ) ( not ( = ?auto_250881 ?auto_250882 ) ) ( TRUCK-AT ?auto_250884 ?auto_250887 ) ( not ( = ?auto_250887 ?auto_250883 ) ) ( HOIST-AT ?auto_250888 ?auto_250887 ) ( not ( = ?auto_250886 ?auto_250888 ) ) ( AVAILABLE ?auto_250888 ) ( SURFACE-AT ?auto_250882 ?auto_250887 ) ( ON ?auto_250882 ?auto_250885 ) ( CLEAR ?auto_250882 ) ( not ( = ?auto_250880 ?auto_250885 ) ) ( not ( = ?auto_250882 ?auto_250885 ) ) ( not ( = ?auto_250881 ?auto_250885 ) ) ( ON ?auto_250877 ?auto_250876 ) ( ON ?auto_250878 ?auto_250877 ) ( ON ?auto_250875 ?auto_250878 ) ( ON ?auto_250879 ?auto_250875 ) ( ON ?auto_250881 ?auto_250879 ) ( not ( = ?auto_250876 ?auto_250877 ) ) ( not ( = ?auto_250876 ?auto_250878 ) ) ( not ( = ?auto_250876 ?auto_250875 ) ) ( not ( = ?auto_250876 ?auto_250879 ) ) ( not ( = ?auto_250876 ?auto_250881 ) ) ( not ( = ?auto_250876 ?auto_250880 ) ) ( not ( = ?auto_250876 ?auto_250882 ) ) ( not ( = ?auto_250876 ?auto_250885 ) ) ( not ( = ?auto_250877 ?auto_250878 ) ) ( not ( = ?auto_250877 ?auto_250875 ) ) ( not ( = ?auto_250877 ?auto_250879 ) ) ( not ( = ?auto_250877 ?auto_250881 ) ) ( not ( = ?auto_250877 ?auto_250880 ) ) ( not ( = ?auto_250877 ?auto_250882 ) ) ( not ( = ?auto_250877 ?auto_250885 ) ) ( not ( = ?auto_250878 ?auto_250875 ) ) ( not ( = ?auto_250878 ?auto_250879 ) ) ( not ( = ?auto_250878 ?auto_250881 ) ) ( not ( = ?auto_250878 ?auto_250880 ) ) ( not ( = ?auto_250878 ?auto_250882 ) ) ( not ( = ?auto_250878 ?auto_250885 ) ) ( not ( = ?auto_250875 ?auto_250879 ) ) ( not ( = ?auto_250875 ?auto_250881 ) ) ( not ( = ?auto_250875 ?auto_250880 ) ) ( not ( = ?auto_250875 ?auto_250882 ) ) ( not ( = ?auto_250875 ?auto_250885 ) ) ( not ( = ?auto_250879 ?auto_250881 ) ) ( not ( = ?auto_250879 ?auto_250880 ) ) ( not ( = ?auto_250879 ?auto_250882 ) ) ( not ( = ?auto_250879 ?auto_250885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250881 ?auto_250880 ?auto_250882 )
      ( MAKE-7CRATE-VERIFY ?auto_250876 ?auto_250877 ?auto_250878 ?auto_250875 ?auto_250879 ?auto_250881 ?auto_250880 ?auto_250882 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250954 - SURFACE
      ?auto_250955 - SURFACE
      ?auto_250956 - SURFACE
      ?auto_250953 - SURFACE
      ?auto_250957 - SURFACE
      ?auto_250959 - SURFACE
      ?auto_250958 - SURFACE
      ?auto_250960 - SURFACE
    )
    :vars
    (
      ?auto_250962 - HOIST
      ?auto_250961 - PLACE
      ?auto_250963 - PLACE
      ?auto_250964 - HOIST
      ?auto_250966 - SURFACE
      ?auto_250965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250962 ?auto_250961 ) ( SURFACE-AT ?auto_250958 ?auto_250961 ) ( CLEAR ?auto_250958 ) ( IS-CRATE ?auto_250960 ) ( not ( = ?auto_250958 ?auto_250960 ) ) ( AVAILABLE ?auto_250962 ) ( ON ?auto_250958 ?auto_250959 ) ( not ( = ?auto_250959 ?auto_250958 ) ) ( not ( = ?auto_250959 ?auto_250960 ) ) ( not ( = ?auto_250963 ?auto_250961 ) ) ( HOIST-AT ?auto_250964 ?auto_250963 ) ( not ( = ?auto_250962 ?auto_250964 ) ) ( AVAILABLE ?auto_250964 ) ( SURFACE-AT ?auto_250960 ?auto_250963 ) ( ON ?auto_250960 ?auto_250966 ) ( CLEAR ?auto_250960 ) ( not ( = ?auto_250958 ?auto_250966 ) ) ( not ( = ?auto_250960 ?auto_250966 ) ) ( not ( = ?auto_250959 ?auto_250966 ) ) ( TRUCK-AT ?auto_250965 ?auto_250961 ) ( ON ?auto_250955 ?auto_250954 ) ( ON ?auto_250956 ?auto_250955 ) ( ON ?auto_250953 ?auto_250956 ) ( ON ?auto_250957 ?auto_250953 ) ( ON ?auto_250959 ?auto_250957 ) ( not ( = ?auto_250954 ?auto_250955 ) ) ( not ( = ?auto_250954 ?auto_250956 ) ) ( not ( = ?auto_250954 ?auto_250953 ) ) ( not ( = ?auto_250954 ?auto_250957 ) ) ( not ( = ?auto_250954 ?auto_250959 ) ) ( not ( = ?auto_250954 ?auto_250958 ) ) ( not ( = ?auto_250954 ?auto_250960 ) ) ( not ( = ?auto_250954 ?auto_250966 ) ) ( not ( = ?auto_250955 ?auto_250956 ) ) ( not ( = ?auto_250955 ?auto_250953 ) ) ( not ( = ?auto_250955 ?auto_250957 ) ) ( not ( = ?auto_250955 ?auto_250959 ) ) ( not ( = ?auto_250955 ?auto_250958 ) ) ( not ( = ?auto_250955 ?auto_250960 ) ) ( not ( = ?auto_250955 ?auto_250966 ) ) ( not ( = ?auto_250956 ?auto_250953 ) ) ( not ( = ?auto_250956 ?auto_250957 ) ) ( not ( = ?auto_250956 ?auto_250959 ) ) ( not ( = ?auto_250956 ?auto_250958 ) ) ( not ( = ?auto_250956 ?auto_250960 ) ) ( not ( = ?auto_250956 ?auto_250966 ) ) ( not ( = ?auto_250953 ?auto_250957 ) ) ( not ( = ?auto_250953 ?auto_250959 ) ) ( not ( = ?auto_250953 ?auto_250958 ) ) ( not ( = ?auto_250953 ?auto_250960 ) ) ( not ( = ?auto_250953 ?auto_250966 ) ) ( not ( = ?auto_250957 ?auto_250959 ) ) ( not ( = ?auto_250957 ?auto_250958 ) ) ( not ( = ?auto_250957 ?auto_250960 ) ) ( not ( = ?auto_250957 ?auto_250966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250959 ?auto_250958 ?auto_250960 )
      ( MAKE-7CRATE-VERIFY ?auto_250954 ?auto_250955 ?auto_250956 ?auto_250953 ?auto_250957 ?auto_250959 ?auto_250958 ?auto_250960 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251032 - SURFACE
      ?auto_251033 - SURFACE
      ?auto_251034 - SURFACE
      ?auto_251031 - SURFACE
      ?auto_251035 - SURFACE
      ?auto_251037 - SURFACE
      ?auto_251036 - SURFACE
      ?auto_251038 - SURFACE
    )
    :vars
    (
      ?auto_251042 - HOIST
      ?auto_251044 - PLACE
      ?auto_251040 - PLACE
      ?auto_251043 - HOIST
      ?auto_251041 - SURFACE
      ?auto_251039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251042 ?auto_251044 ) ( IS-CRATE ?auto_251038 ) ( not ( = ?auto_251036 ?auto_251038 ) ) ( not ( = ?auto_251037 ?auto_251036 ) ) ( not ( = ?auto_251037 ?auto_251038 ) ) ( not ( = ?auto_251040 ?auto_251044 ) ) ( HOIST-AT ?auto_251043 ?auto_251040 ) ( not ( = ?auto_251042 ?auto_251043 ) ) ( AVAILABLE ?auto_251043 ) ( SURFACE-AT ?auto_251038 ?auto_251040 ) ( ON ?auto_251038 ?auto_251041 ) ( CLEAR ?auto_251038 ) ( not ( = ?auto_251036 ?auto_251041 ) ) ( not ( = ?auto_251038 ?auto_251041 ) ) ( not ( = ?auto_251037 ?auto_251041 ) ) ( TRUCK-AT ?auto_251039 ?auto_251044 ) ( SURFACE-AT ?auto_251037 ?auto_251044 ) ( CLEAR ?auto_251037 ) ( LIFTING ?auto_251042 ?auto_251036 ) ( IS-CRATE ?auto_251036 ) ( ON ?auto_251033 ?auto_251032 ) ( ON ?auto_251034 ?auto_251033 ) ( ON ?auto_251031 ?auto_251034 ) ( ON ?auto_251035 ?auto_251031 ) ( ON ?auto_251037 ?auto_251035 ) ( not ( = ?auto_251032 ?auto_251033 ) ) ( not ( = ?auto_251032 ?auto_251034 ) ) ( not ( = ?auto_251032 ?auto_251031 ) ) ( not ( = ?auto_251032 ?auto_251035 ) ) ( not ( = ?auto_251032 ?auto_251037 ) ) ( not ( = ?auto_251032 ?auto_251036 ) ) ( not ( = ?auto_251032 ?auto_251038 ) ) ( not ( = ?auto_251032 ?auto_251041 ) ) ( not ( = ?auto_251033 ?auto_251034 ) ) ( not ( = ?auto_251033 ?auto_251031 ) ) ( not ( = ?auto_251033 ?auto_251035 ) ) ( not ( = ?auto_251033 ?auto_251037 ) ) ( not ( = ?auto_251033 ?auto_251036 ) ) ( not ( = ?auto_251033 ?auto_251038 ) ) ( not ( = ?auto_251033 ?auto_251041 ) ) ( not ( = ?auto_251034 ?auto_251031 ) ) ( not ( = ?auto_251034 ?auto_251035 ) ) ( not ( = ?auto_251034 ?auto_251037 ) ) ( not ( = ?auto_251034 ?auto_251036 ) ) ( not ( = ?auto_251034 ?auto_251038 ) ) ( not ( = ?auto_251034 ?auto_251041 ) ) ( not ( = ?auto_251031 ?auto_251035 ) ) ( not ( = ?auto_251031 ?auto_251037 ) ) ( not ( = ?auto_251031 ?auto_251036 ) ) ( not ( = ?auto_251031 ?auto_251038 ) ) ( not ( = ?auto_251031 ?auto_251041 ) ) ( not ( = ?auto_251035 ?auto_251037 ) ) ( not ( = ?auto_251035 ?auto_251036 ) ) ( not ( = ?auto_251035 ?auto_251038 ) ) ( not ( = ?auto_251035 ?auto_251041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251037 ?auto_251036 ?auto_251038 )
      ( MAKE-7CRATE-VERIFY ?auto_251032 ?auto_251033 ?auto_251034 ?auto_251031 ?auto_251035 ?auto_251037 ?auto_251036 ?auto_251038 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251110 - SURFACE
      ?auto_251111 - SURFACE
      ?auto_251112 - SURFACE
      ?auto_251109 - SURFACE
      ?auto_251113 - SURFACE
      ?auto_251115 - SURFACE
      ?auto_251114 - SURFACE
      ?auto_251116 - SURFACE
    )
    :vars
    (
      ?auto_251122 - HOIST
      ?auto_251119 - PLACE
      ?auto_251120 - PLACE
      ?auto_251118 - HOIST
      ?auto_251121 - SURFACE
      ?auto_251117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251122 ?auto_251119 ) ( IS-CRATE ?auto_251116 ) ( not ( = ?auto_251114 ?auto_251116 ) ) ( not ( = ?auto_251115 ?auto_251114 ) ) ( not ( = ?auto_251115 ?auto_251116 ) ) ( not ( = ?auto_251120 ?auto_251119 ) ) ( HOIST-AT ?auto_251118 ?auto_251120 ) ( not ( = ?auto_251122 ?auto_251118 ) ) ( AVAILABLE ?auto_251118 ) ( SURFACE-AT ?auto_251116 ?auto_251120 ) ( ON ?auto_251116 ?auto_251121 ) ( CLEAR ?auto_251116 ) ( not ( = ?auto_251114 ?auto_251121 ) ) ( not ( = ?auto_251116 ?auto_251121 ) ) ( not ( = ?auto_251115 ?auto_251121 ) ) ( TRUCK-AT ?auto_251117 ?auto_251119 ) ( SURFACE-AT ?auto_251115 ?auto_251119 ) ( CLEAR ?auto_251115 ) ( IS-CRATE ?auto_251114 ) ( AVAILABLE ?auto_251122 ) ( IN ?auto_251114 ?auto_251117 ) ( ON ?auto_251111 ?auto_251110 ) ( ON ?auto_251112 ?auto_251111 ) ( ON ?auto_251109 ?auto_251112 ) ( ON ?auto_251113 ?auto_251109 ) ( ON ?auto_251115 ?auto_251113 ) ( not ( = ?auto_251110 ?auto_251111 ) ) ( not ( = ?auto_251110 ?auto_251112 ) ) ( not ( = ?auto_251110 ?auto_251109 ) ) ( not ( = ?auto_251110 ?auto_251113 ) ) ( not ( = ?auto_251110 ?auto_251115 ) ) ( not ( = ?auto_251110 ?auto_251114 ) ) ( not ( = ?auto_251110 ?auto_251116 ) ) ( not ( = ?auto_251110 ?auto_251121 ) ) ( not ( = ?auto_251111 ?auto_251112 ) ) ( not ( = ?auto_251111 ?auto_251109 ) ) ( not ( = ?auto_251111 ?auto_251113 ) ) ( not ( = ?auto_251111 ?auto_251115 ) ) ( not ( = ?auto_251111 ?auto_251114 ) ) ( not ( = ?auto_251111 ?auto_251116 ) ) ( not ( = ?auto_251111 ?auto_251121 ) ) ( not ( = ?auto_251112 ?auto_251109 ) ) ( not ( = ?auto_251112 ?auto_251113 ) ) ( not ( = ?auto_251112 ?auto_251115 ) ) ( not ( = ?auto_251112 ?auto_251114 ) ) ( not ( = ?auto_251112 ?auto_251116 ) ) ( not ( = ?auto_251112 ?auto_251121 ) ) ( not ( = ?auto_251109 ?auto_251113 ) ) ( not ( = ?auto_251109 ?auto_251115 ) ) ( not ( = ?auto_251109 ?auto_251114 ) ) ( not ( = ?auto_251109 ?auto_251116 ) ) ( not ( = ?auto_251109 ?auto_251121 ) ) ( not ( = ?auto_251113 ?auto_251115 ) ) ( not ( = ?auto_251113 ?auto_251114 ) ) ( not ( = ?auto_251113 ?auto_251116 ) ) ( not ( = ?auto_251113 ?auto_251121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251115 ?auto_251114 ?auto_251116 )
      ( MAKE-7CRATE-VERIFY ?auto_251110 ?auto_251111 ?auto_251112 ?auto_251109 ?auto_251113 ?auto_251115 ?auto_251114 ?auto_251116 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254004 - SURFACE
      ?auto_254005 - SURFACE
      ?auto_254006 - SURFACE
      ?auto_254003 - SURFACE
      ?auto_254007 - SURFACE
      ?auto_254009 - SURFACE
      ?auto_254008 - SURFACE
      ?auto_254010 - SURFACE
      ?auto_254011 - SURFACE
    )
    :vars
    (
      ?auto_254013 - HOIST
      ?auto_254012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_254013 ?auto_254012 ) ( SURFACE-AT ?auto_254010 ?auto_254012 ) ( CLEAR ?auto_254010 ) ( LIFTING ?auto_254013 ?auto_254011 ) ( IS-CRATE ?auto_254011 ) ( not ( = ?auto_254010 ?auto_254011 ) ) ( ON ?auto_254005 ?auto_254004 ) ( ON ?auto_254006 ?auto_254005 ) ( ON ?auto_254003 ?auto_254006 ) ( ON ?auto_254007 ?auto_254003 ) ( ON ?auto_254009 ?auto_254007 ) ( ON ?auto_254008 ?auto_254009 ) ( ON ?auto_254010 ?auto_254008 ) ( not ( = ?auto_254004 ?auto_254005 ) ) ( not ( = ?auto_254004 ?auto_254006 ) ) ( not ( = ?auto_254004 ?auto_254003 ) ) ( not ( = ?auto_254004 ?auto_254007 ) ) ( not ( = ?auto_254004 ?auto_254009 ) ) ( not ( = ?auto_254004 ?auto_254008 ) ) ( not ( = ?auto_254004 ?auto_254010 ) ) ( not ( = ?auto_254004 ?auto_254011 ) ) ( not ( = ?auto_254005 ?auto_254006 ) ) ( not ( = ?auto_254005 ?auto_254003 ) ) ( not ( = ?auto_254005 ?auto_254007 ) ) ( not ( = ?auto_254005 ?auto_254009 ) ) ( not ( = ?auto_254005 ?auto_254008 ) ) ( not ( = ?auto_254005 ?auto_254010 ) ) ( not ( = ?auto_254005 ?auto_254011 ) ) ( not ( = ?auto_254006 ?auto_254003 ) ) ( not ( = ?auto_254006 ?auto_254007 ) ) ( not ( = ?auto_254006 ?auto_254009 ) ) ( not ( = ?auto_254006 ?auto_254008 ) ) ( not ( = ?auto_254006 ?auto_254010 ) ) ( not ( = ?auto_254006 ?auto_254011 ) ) ( not ( = ?auto_254003 ?auto_254007 ) ) ( not ( = ?auto_254003 ?auto_254009 ) ) ( not ( = ?auto_254003 ?auto_254008 ) ) ( not ( = ?auto_254003 ?auto_254010 ) ) ( not ( = ?auto_254003 ?auto_254011 ) ) ( not ( = ?auto_254007 ?auto_254009 ) ) ( not ( = ?auto_254007 ?auto_254008 ) ) ( not ( = ?auto_254007 ?auto_254010 ) ) ( not ( = ?auto_254007 ?auto_254011 ) ) ( not ( = ?auto_254009 ?auto_254008 ) ) ( not ( = ?auto_254009 ?auto_254010 ) ) ( not ( = ?auto_254009 ?auto_254011 ) ) ( not ( = ?auto_254008 ?auto_254010 ) ) ( not ( = ?auto_254008 ?auto_254011 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_254010 ?auto_254011 )
      ( MAKE-8CRATE-VERIFY ?auto_254004 ?auto_254005 ?auto_254006 ?auto_254003 ?auto_254007 ?auto_254009 ?auto_254008 ?auto_254010 ?auto_254011 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254071 - SURFACE
      ?auto_254072 - SURFACE
      ?auto_254073 - SURFACE
      ?auto_254070 - SURFACE
      ?auto_254074 - SURFACE
      ?auto_254076 - SURFACE
      ?auto_254075 - SURFACE
      ?auto_254077 - SURFACE
      ?auto_254078 - SURFACE
    )
    :vars
    (
      ?auto_254081 - HOIST
      ?auto_254080 - PLACE
      ?auto_254079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254081 ?auto_254080 ) ( SURFACE-AT ?auto_254077 ?auto_254080 ) ( CLEAR ?auto_254077 ) ( IS-CRATE ?auto_254078 ) ( not ( = ?auto_254077 ?auto_254078 ) ) ( TRUCK-AT ?auto_254079 ?auto_254080 ) ( AVAILABLE ?auto_254081 ) ( IN ?auto_254078 ?auto_254079 ) ( ON ?auto_254077 ?auto_254075 ) ( not ( = ?auto_254075 ?auto_254077 ) ) ( not ( = ?auto_254075 ?auto_254078 ) ) ( ON ?auto_254072 ?auto_254071 ) ( ON ?auto_254073 ?auto_254072 ) ( ON ?auto_254070 ?auto_254073 ) ( ON ?auto_254074 ?auto_254070 ) ( ON ?auto_254076 ?auto_254074 ) ( ON ?auto_254075 ?auto_254076 ) ( not ( = ?auto_254071 ?auto_254072 ) ) ( not ( = ?auto_254071 ?auto_254073 ) ) ( not ( = ?auto_254071 ?auto_254070 ) ) ( not ( = ?auto_254071 ?auto_254074 ) ) ( not ( = ?auto_254071 ?auto_254076 ) ) ( not ( = ?auto_254071 ?auto_254075 ) ) ( not ( = ?auto_254071 ?auto_254077 ) ) ( not ( = ?auto_254071 ?auto_254078 ) ) ( not ( = ?auto_254072 ?auto_254073 ) ) ( not ( = ?auto_254072 ?auto_254070 ) ) ( not ( = ?auto_254072 ?auto_254074 ) ) ( not ( = ?auto_254072 ?auto_254076 ) ) ( not ( = ?auto_254072 ?auto_254075 ) ) ( not ( = ?auto_254072 ?auto_254077 ) ) ( not ( = ?auto_254072 ?auto_254078 ) ) ( not ( = ?auto_254073 ?auto_254070 ) ) ( not ( = ?auto_254073 ?auto_254074 ) ) ( not ( = ?auto_254073 ?auto_254076 ) ) ( not ( = ?auto_254073 ?auto_254075 ) ) ( not ( = ?auto_254073 ?auto_254077 ) ) ( not ( = ?auto_254073 ?auto_254078 ) ) ( not ( = ?auto_254070 ?auto_254074 ) ) ( not ( = ?auto_254070 ?auto_254076 ) ) ( not ( = ?auto_254070 ?auto_254075 ) ) ( not ( = ?auto_254070 ?auto_254077 ) ) ( not ( = ?auto_254070 ?auto_254078 ) ) ( not ( = ?auto_254074 ?auto_254076 ) ) ( not ( = ?auto_254074 ?auto_254075 ) ) ( not ( = ?auto_254074 ?auto_254077 ) ) ( not ( = ?auto_254074 ?auto_254078 ) ) ( not ( = ?auto_254076 ?auto_254075 ) ) ( not ( = ?auto_254076 ?auto_254077 ) ) ( not ( = ?auto_254076 ?auto_254078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254075 ?auto_254077 ?auto_254078 )
      ( MAKE-8CRATE-VERIFY ?auto_254071 ?auto_254072 ?auto_254073 ?auto_254070 ?auto_254074 ?auto_254076 ?auto_254075 ?auto_254077 ?auto_254078 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254147 - SURFACE
      ?auto_254148 - SURFACE
      ?auto_254149 - SURFACE
      ?auto_254146 - SURFACE
      ?auto_254150 - SURFACE
      ?auto_254152 - SURFACE
      ?auto_254151 - SURFACE
      ?auto_254153 - SURFACE
      ?auto_254154 - SURFACE
    )
    :vars
    (
      ?auto_254158 - HOIST
      ?auto_254156 - PLACE
      ?auto_254155 - TRUCK
      ?auto_254157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_254158 ?auto_254156 ) ( SURFACE-AT ?auto_254153 ?auto_254156 ) ( CLEAR ?auto_254153 ) ( IS-CRATE ?auto_254154 ) ( not ( = ?auto_254153 ?auto_254154 ) ) ( AVAILABLE ?auto_254158 ) ( IN ?auto_254154 ?auto_254155 ) ( ON ?auto_254153 ?auto_254151 ) ( not ( = ?auto_254151 ?auto_254153 ) ) ( not ( = ?auto_254151 ?auto_254154 ) ) ( TRUCK-AT ?auto_254155 ?auto_254157 ) ( not ( = ?auto_254157 ?auto_254156 ) ) ( ON ?auto_254148 ?auto_254147 ) ( ON ?auto_254149 ?auto_254148 ) ( ON ?auto_254146 ?auto_254149 ) ( ON ?auto_254150 ?auto_254146 ) ( ON ?auto_254152 ?auto_254150 ) ( ON ?auto_254151 ?auto_254152 ) ( not ( = ?auto_254147 ?auto_254148 ) ) ( not ( = ?auto_254147 ?auto_254149 ) ) ( not ( = ?auto_254147 ?auto_254146 ) ) ( not ( = ?auto_254147 ?auto_254150 ) ) ( not ( = ?auto_254147 ?auto_254152 ) ) ( not ( = ?auto_254147 ?auto_254151 ) ) ( not ( = ?auto_254147 ?auto_254153 ) ) ( not ( = ?auto_254147 ?auto_254154 ) ) ( not ( = ?auto_254148 ?auto_254149 ) ) ( not ( = ?auto_254148 ?auto_254146 ) ) ( not ( = ?auto_254148 ?auto_254150 ) ) ( not ( = ?auto_254148 ?auto_254152 ) ) ( not ( = ?auto_254148 ?auto_254151 ) ) ( not ( = ?auto_254148 ?auto_254153 ) ) ( not ( = ?auto_254148 ?auto_254154 ) ) ( not ( = ?auto_254149 ?auto_254146 ) ) ( not ( = ?auto_254149 ?auto_254150 ) ) ( not ( = ?auto_254149 ?auto_254152 ) ) ( not ( = ?auto_254149 ?auto_254151 ) ) ( not ( = ?auto_254149 ?auto_254153 ) ) ( not ( = ?auto_254149 ?auto_254154 ) ) ( not ( = ?auto_254146 ?auto_254150 ) ) ( not ( = ?auto_254146 ?auto_254152 ) ) ( not ( = ?auto_254146 ?auto_254151 ) ) ( not ( = ?auto_254146 ?auto_254153 ) ) ( not ( = ?auto_254146 ?auto_254154 ) ) ( not ( = ?auto_254150 ?auto_254152 ) ) ( not ( = ?auto_254150 ?auto_254151 ) ) ( not ( = ?auto_254150 ?auto_254153 ) ) ( not ( = ?auto_254150 ?auto_254154 ) ) ( not ( = ?auto_254152 ?auto_254151 ) ) ( not ( = ?auto_254152 ?auto_254153 ) ) ( not ( = ?auto_254152 ?auto_254154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254151 ?auto_254153 ?auto_254154 )
      ( MAKE-8CRATE-VERIFY ?auto_254147 ?auto_254148 ?auto_254149 ?auto_254146 ?auto_254150 ?auto_254152 ?auto_254151 ?auto_254153 ?auto_254154 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254231 - SURFACE
      ?auto_254232 - SURFACE
      ?auto_254233 - SURFACE
      ?auto_254230 - SURFACE
      ?auto_254234 - SURFACE
      ?auto_254236 - SURFACE
      ?auto_254235 - SURFACE
      ?auto_254237 - SURFACE
      ?auto_254238 - SURFACE
    )
    :vars
    (
      ?auto_254239 - HOIST
      ?auto_254243 - PLACE
      ?auto_254240 - TRUCK
      ?auto_254242 - PLACE
      ?auto_254241 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_254239 ?auto_254243 ) ( SURFACE-AT ?auto_254237 ?auto_254243 ) ( CLEAR ?auto_254237 ) ( IS-CRATE ?auto_254238 ) ( not ( = ?auto_254237 ?auto_254238 ) ) ( AVAILABLE ?auto_254239 ) ( ON ?auto_254237 ?auto_254235 ) ( not ( = ?auto_254235 ?auto_254237 ) ) ( not ( = ?auto_254235 ?auto_254238 ) ) ( TRUCK-AT ?auto_254240 ?auto_254242 ) ( not ( = ?auto_254242 ?auto_254243 ) ) ( HOIST-AT ?auto_254241 ?auto_254242 ) ( LIFTING ?auto_254241 ?auto_254238 ) ( not ( = ?auto_254239 ?auto_254241 ) ) ( ON ?auto_254232 ?auto_254231 ) ( ON ?auto_254233 ?auto_254232 ) ( ON ?auto_254230 ?auto_254233 ) ( ON ?auto_254234 ?auto_254230 ) ( ON ?auto_254236 ?auto_254234 ) ( ON ?auto_254235 ?auto_254236 ) ( not ( = ?auto_254231 ?auto_254232 ) ) ( not ( = ?auto_254231 ?auto_254233 ) ) ( not ( = ?auto_254231 ?auto_254230 ) ) ( not ( = ?auto_254231 ?auto_254234 ) ) ( not ( = ?auto_254231 ?auto_254236 ) ) ( not ( = ?auto_254231 ?auto_254235 ) ) ( not ( = ?auto_254231 ?auto_254237 ) ) ( not ( = ?auto_254231 ?auto_254238 ) ) ( not ( = ?auto_254232 ?auto_254233 ) ) ( not ( = ?auto_254232 ?auto_254230 ) ) ( not ( = ?auto_254232 ?auto_254234 ) ) ( not ( = ?auto_254232 ?auto_254236 ) ) ( not ( = ?auto_254232 ?auto_254235 ) ) ( not ( = ?auto_254232 ?auto_254237 ) ) ( not ( = ?auto_254232 ?auto_254238 ) ) ( not ( = ?auto_254233 ?auto_254230 ) ) ( not ( = ?auto_254233 ?auto_254234 ) ) ( not ( = ?auto_254233 ?auto_254236 ) ) ( not ( = ?auto_254233 ?auto_254235 ) ) ( not ( = ?auto_254233 ?auto_254237 ) ) ( not ( = ?auto_254233 ?auto_254238 ) ) ( not ( = ?auto_254230 ?auto_254234 ) ) ( not ( = ?auto_254230 ?auto_254236 ) ) ( not ( = ?auto_254230 ?auto_254235 ) ) ( not ( = ?auto_254230 ?auto_254237 ) ) ( not ( = ?auto_254230 ?auto_254238 ) ) ( not ( = ?auto_254234 ?auto_254236 ) ) ( not ( = ?auto_254234 ?auto_254235 ) ) ( not ( = ?auto_254234 ?auto_254237 ) ) ( not ( = ?auto_254234 ?auto_254238 ) ) ( not ( = ?auto_254236 ?auto_254235 ) ) ( not ( = ?auto_254236 ?auto_254237 ) ) ( not ( = ?auto_254236 ?auto_254238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254235 ?auto_254237 ?auto_254238 )
      ( MAKE-8CRATE-VERIFY ?auto_254231 ?auto_254232 ?auto_254233 ?auto_254230 ?auto_254234 ?auto_254236 ?auto_254235 ?auto_254237 ?auto_254238 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254323 - SURFACE
      ?auto_254324 - SURFACE
      ?auto_254325 - SURFACE
      ?auto_254322 - SURFACE
      ?auto_254326 - SURFACE
      ?auto_254328 - SURFACE
      ?auto_254327 - SURFACE
      ?auto_254329 - SURFACE
      ?auto_254330 - SURFACE
    )
    :vars
    (
      ?auto_254334 - HOIST
      ?auto_254335 - PLACE
      ?auto_254333 - TRUCK
      ?auto_254331 - PLACE
      ?auto_254332 - HOIST
      ?auto_254336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_254334 ?auto_254335 ) ( SURFACE-AT ?auto_254329 ?auto_254335 ) ( CLEAR ?auto_254329 ) ( IS-CRATE ?auto_254330 ) ( not ( = ?auto_254329 ?auto_254330 ) ) ( AVAILABLE ?auto_254334 ) ( ON ?auto_254329 ?auto_254327 ) ( not ( = ?auto_254327 ?auto_254329 ) ) ( not ( = ?auto_254327 ?auto_254330 ) ) ( TRUCK-AT ?auto_254333 ?auto_254331 ) ( not ( = ?auto_254331 ?auto_254335 ) ) ( HOIST-AT ?auto_254332 ?auto_254331 ) ( not ( = ?auto_254334 ?auto_254332 ) ) ( AVAILABLE ?auto_254332 ) ( SURFACE-AT ?auto_254330 ?auto_254331 ) ( ON ?auto_254330 ?auto_254336 ) ( CLEAR ?auto_254330 ) ( not ( = ?auto_254329 ?auto_254336 ) ) ( not ( = ?auto_254330 ?auto_254336 ) ) ( not ( = ?auto_254327 ?auto_254336 ) ) ( ON ?auto_254324 ?auto_254323 ) ( ON ?auto_254325 ?auto_254324 ) ( ON ?auto_254322 ?auto_254325 ) ( ON ?auto_254326 ?auto_254322 ) ( ON ?auto_254328 ?auto_254326 ) ( ON ?auto_254327 ?auto_254328 ) ( not ( = ?auto_254323 ?auto_254324 ) ) ( not ( = ?auto_254323 ?auto_254325 ) ) ( not ( = ?auto_254323 ?auto_254322 ) ) ( not ( = ?auto_254323 ?auto_254326 ) ) ( not ( = ?auto_254323 ?auto_254328 ) ) ( not ( = ?auto_254323 ?auto_254327 ) ) ( not ( = ?auto_254323 ?auto_254329 ) ) ( not ( = ?auto_254323 ?auto_254330 ) ) ( not ( = ?auto_254323 ?auto_254336 ) ) ( not ( = ?auto_254324 ?auto_254325 ) ) ( not ( = ?auto_254324 ?auto_254322 ) ) ( not ( = ?auto_254324 ?auto_254326 ) ) ( not ( = ?auto_254324 ?auto_254328 ) ) ( not ( = ?auto_254324 ?auto_254327 ) ) ( not ( = ?auto_254324 ?auto_254329 ) ) ( not ( = ?auto_254324 ?auto_254330 ) ) ( not ( = ?auto_254324 ?auto_254336 ) ) ( not ( = ?auto_254325 ?auto_254322 ) ) ( not ( = ?auto_254325 ?auto_254326 ) ) ( not ( = ?auto_254325 ?auto_254328 ) ) ( not ( = ?auto_254325 ?auto_254327 ) ) ( not ( = ?auto_254325 ?auto_254329 ) ) ( not ( = ?auto_254325 ?auto_254330 ) ) ( not ( = ?auto_254325 ?auto_254336 ) ) ( not ( = ?auto_254322 ?auto_254326 ) ) ( not ( = ?auto_254322 ?auto_254328 ) ) ( not ( = ?auto_254322 ?auto_254327 ) ) ( not ( = ?auto_254322 ?auto_254329 ) ) ( not ( = ?auto_254322 ?auto_254330 ) ) ( not ( = ?auto_254322 ?auto_254336 ) ) ( not ( = ?auto_254326 ?auto_254328 ) ) ( not ( = ?auto_254326 ?auto_254327 ) ) ( not ( = ?auto_254326 ?auto_254329 ) ) ( not ( = ?auto_254326 ?auto_254330 ) ) ( not ( = ?auto_254326 ?auto_254336 ) ) ( not ( = ?auto_254328 ?auto_254327 ) ) ( not ( = ?auto_254328 ?auto_254329 ) ) ( not ( = ?auto_254328 ?auto_254330 ) ) ( not ( = ?auto_254328 ?auto_254336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254327 ?auto_254329 ?auto_254330 )
      ( MAKE-8CRATE-VERIFY ?auto_254323 ?auto_254324 ?auto_254325 ?auto_254322 ?auto_254326 ?auto_254328 ?auto_254327 ?auto_254329 ?auto_254330 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254416 - SURFACE
      ?auto_254417 - SURFACE
      ?auto_254418 - SURFACE
      ?auto_254415 - SURFACE
      ?auto_254419 - SURFACE
      ?auto_254421 - SURFACE
      ?auto_254420 - SURFACE
      ?auto_254422 - SURFACE
      ?auto_254423 - SURFACE
    )
    :vars
    (
      ?auto_254429 - HOIST
      ?auto_254424 - PLACE
      ?auto_254426 - PLACE
      ?auto_254427 - HOIST
      ?auto_254428 - SURFACE
      ?auto_254425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254429 ?auto_254424 ) ( SURFACE-AT ?auto_254422 ?auto_254424 ) ( CLEAR ?auto_254422 ) ( IS-CRATE ?auto_254423 ) ( not ( = ?auto_254422 ?auto_254423 ) ) ( AVAILABLE ?auto_254429 ) ( ON ?auto_254422 ?auto_254420 ) ( not ( = ?auto_254420 ?auto_254422 ) ) ( not ( = ?auto_254420 ?auto_254423 ) ) ( not ( = ?auto_254426 ?auto_254424 ) ) ( HOIST-AT ?auto_254427 ?auto_254426 ) ( not ( = ?auto_254429 ?auto_254427 ) ) ( AVAILABLE ?auto_254427 ) ( SURFACE-AT ?auto_254423 ?auto_254426 ) ( ON ?auto_254423 ?auto_254428 ) ( CLEAR ?auto_254423 ) ( not ( = ?auto_254422 ?auto_254428 ) ) ( not ( = ?auto_254423 ?auto_254428 ) ) ( not ( = ?auto_254420 ?auto_254428 ) ) ( TRUCK-AT ?auto_254425 ?auto_254424 ) ( ON ?auto_254417 ?auto_254416 ) ( ON ?auto_254418 ?auto_254417 ) ( ON ?auto_254415 ?auto_254418 ) ( ON ?auto_254419 ?auto_254415 ) ( ON ?auto_254421 ?auto_254419 ) ( ON ?auto_254420 ?auto_254421 ) ( not ( = ?auto_254416 ?auto_254417 ) ) ( not ( = ?auto_254416 ?auto_254418 ) ) ( not ( = ?auto_254416 ?auto_254415 ) ) ( not ( = ?auto_254416 ?auto_254419 ) ) ( not ( = ?auto_254416 ?auto_254421 ) ) ( not ( = ?auto_254416 ?auto_254420 ) ) ( not ( = ?auto_254416 ?auto_254422 ) ) ( not ( = ?auto_254416 ?auto_254423 ) ) ( not ( = ?auto_254416 ?auto_254428 ) ) ( not ( = ?auto_254417 ?auto_254418 ) ) ( not ( = ?auto_254417 ?auto_254415 ) ) ( not ( = ?auto_254417 ?auto_254419 ) ) ( not ( = ?auto_254417 ?auto_254421 ) ) ( not ( = ?auto_254417 ?auto_254420 ) ) ( not ( = ?auto_254417 ?auto_254422 ) ) ( not ( = ?auto_254417 ?auto_254423 ) ) ( not ( = ?auto_254417 ?auto_254428 ) ) ( not ( = ?auto_254418 ?auto_254415 ) ) ( not ( = ?auto_254418 ?auto_254419 ) ) ( not ( = ?auto_254418 ?auto_254421 ) ) ( not ( = ?auto_254418 ?auto_254420 ) ) ( not ( = ?auto_254418 ?auto_254422 ) ) ( not ( = ?auto_254418 ?auto_254423 ) ) ( not ( = ?auto_254418 ?auto_254428 ) ) ( not ( = ?auto_254415 ?auto_254419 ) ) ( not ( = ?auto_254415 ?auto_254421 ) ) ( not ( = ?auto_254415 ?auto_254420 ) ) ( not ( = ?auto_254415 ?auto_254422 ) ) ( not ( = ?auto_254415 ?auto_254423 ) ) ( not ( = ?auto_254415 ?auto_254428 ) ) ( not ( = ?auto_254419 ?auto_254421 ) ) ( not ( = ?auto_254419 ?auto_254420 ) ) ( not ( = ?auto_254419 ?auto_254422 ) ) ( not ( = ?auto_254419 ?auto_254423 ) ) ( not ( = ?auto_254419 ?auto_254428 ) ) ( not ( = ?auto_254421 ?auto_254420 ) ) ( not ( = ?auto_254421 ?auto_254422 ) ) ( not ( = ?auto_254421 ?auto_254423 ) ) ( not ( = ?auto_254421 ?auto_254428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254420 ?auto_254422 ?auto_254423 )
      ( MAKE-8CRATE-VERIFY ?auto_254416 ?auto_254417 ?auto_254418 ?auto_254415 ?auto_254419 ?auto_254421 ?auto_254420 ?auto_254422 ?auto_254423 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254509 - SURFACE
      ?auto_254510 - SURFACE
      ?auto_254511 - SURFACE
      ?auto_254508 - SURFACE
      ?auto_254512 - SURFACE
      ?auto_254514 - SURFACE
      ?auto_254513 - SURFACE
      ?auto_254515 - SURFACE
      ?auto_254516 - SURFACE
    )
    :vars
    (
      ?auto_254520 - HOIST
      ?auto_254517 - PLACE
      ?auto_254521 - PLACE
      ?auto_254519 - HOIST
      ?auto_254522 - SURFACE
      ?auto_254518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254520 ?auto_254517 ) ( IS-CRATE ?auto_254516 ) ( not ( = ?auto_254515 ?auto_254516 ) ) ( not ( = ?auto_254513 ?auto_254515 ) ) ( not ( = ?auto_254513 ?auto_254516 ) ) ( not ( = ?auto_254521 ?auto_254517 ) ) ( HOIST-AT ?auto_254519 ?auto_254521 ) ( not ( = ?auto_254520 ?auto_254519 ) ) ( AVAILABLE ?auto_254519 ) ( SURFACE-AT ?auto_254516 ?auto_254521 ) ( ON ?auto_254516 ?auto_254522 ) ( CLEAR ?auto_254516 ) ( not ( = ?auto_254515 ?auto_254522 ) ) ( not ( = ?auto_254516 ?auto_254522 ) ) ( not ( = ?auto_254513 ?auto_254522 ) ) ( TRUCK-AT ?auto_254518 ?auto_254517 ) ( SURFACE-AT ?auto_254513 ?auto_254517 ) ( CLEAR ?auto_254513 ) ( LIFTING ?auto_254520 ?auto_254515 ) ( IS-CRATE ?auto_254515 ) ( ON ?auto_254510 ?auto_254509 ) ( ON ?auto_254511 ?auto_254510 ) ( ON ?auto_254508 ?auto_254511 ) ( ON ?auto_254512 ?auto_254508 ) ( ON ?auto_254514 ?auto_254512 ) ( ON ?auto_254513 ?auto_254514 ) ( not ( = ?auto_254509 ?auto_254510 ) ) ( not ( = ?auto_254509 ?auto_254511 ) ) ( not ( = ?auto_254509 ?auto_254508 ) ) ( not ( = ?auto_254509 ?auto_254512 ) ) ( not ( = ?auto_254509 ?auto_254514 ) ) ( not ( = ?auto_254509 ?auto_254513 ) ) ( not ( = ?auto_254509 ?auto_254515 ) ) ( not ( = ?auto_254509 ?auto_254516 ) ) ( not ( = ?auto_254509 ?auto_254522 ) ) ( not ( = ?auto_254510 ?auto_254511 ) ) ( not ( = ?auto_254510 ?auto_254508 ) ) ( not ( = ?auto_254510 ?auto_254512 ) ) ( not ( = ?auto_254510 ?auto_254514 ) ) ( not ( = ?auto_254510 ?auto_254513 ) ) ( not ( = ?auto_254510 ?auto_254515 ) ) ( not ( = ?auto_254510 ?auto_254516 ) ) ( not ( = ?auto_254510 ?auto_254522 ) ) ( not ( = ?auto_254511 ?auto_254508 ) ) ( not ( = ?auto_254511 ?auto_254512 ) ) ( not ( = ?auto_254511 ?auto_254514 ) ) ( not ( = ?auto_254511 ?auto_254513 ) ) ( not ( = ?auto_254511 ?auto_254515 ) ) ( not ( = ?auto_254511 ?auto_254516 ) ) ( not ( = ?auto_254511 ?auto_254522 ) ) ( not ( = ?auto_254508 ?auto_254512 ) ) ( not ( = ?auto_254508 ?auto_254514 ) ) ( not ( = ?auto_254508 ?auto_254513 ) ) ( not ( = ?auto_254508 ?auto_254515 ) ) ( not ( = ?auto_254508 ?auto_254516 ) ) ( not ( = ?auto_254508 ?auto_254522 ) ) ( not ( = ?auto_254512 ?auto_254514 ) ) ( not ( = ?auto_254512 ?auto_254513 ) ) ( not ( = ?auto_254512 ?auto_254515 ) ) ( not ( = ?auto_254512 ?auto_254516 ) ) ( not ( = ?auto_254512 ?auto_254522 ) ) ( not ( = ?auto_254514 ?auto_254513 ) ) ( not ( = ?auto_254514 ?auto_254515 ) ) ( not ( = ?auto_254514 ?auto_254516 ) ) ( not ( = ?auto_254514 ?auto_254522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254513 ?auto_254515 ?auto_254516 )
      ( MAKE-8CRATE-VERIFY ?auto_254509 ?auto_254510 ?auto_254511 ?auto_254508 ?auto_254512 ?auto_254514 ?auto_254513 ?auto_254515 ?auto_254516 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254602 - SURFACE
      ?auto_254603 - SURFACE
      ?auto_254604 - SURFACE
      ?auto_254601 - SURFACE
      ?auto_254605 - SURFACE
      ?auto_254607 - SURFACE
      ?auto_254606 - SURFACE
      ?auto_254608 - SURFACE
      ?auto_254609 - SURFACE
    )
    :vars
    (
      ?auto_254611 - HOIST
      ?auto_254612 - PLACE
      ?auto_254615 - PLACE
      ?auto_254614 - HOIST
      ?auto_254613 - SURFACE
      ?auto_254610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254611 ?auto_254612 ) ( IS-CRATE ?auto_254609 ) ( not ( = ?auto_254608 ?auto_254609 ) ) ( not ( = ?auto_254606 ?auto_254608 ) ) ( not ( = ?auto_254606 ?auto_254609 ) ) ( not ( = ?auto_254615 ?auto_254612 ) ) ( HOIST-AT ?auto_254614 ?auto_254615 ) ( not ( = ?auto_254611 ?auto_254614 ) ) ( AVAILABLE ?auto_254614 ) ( SURFACE-AT ?auto_254609 ?auto_254615 ) ( ON ?auto_254609 ?auto_254613 ) ( CLEAR ?auto_254609 ) ( not ( = ?auto_254608 ?auto_254613 ) ) ( not ( = ?auto_254609 ?auto_254613 ) ) ( not ( = ?auto_254606 ?auto_254613 ) ) ( TRUCK-AT ?auto_254610 ?auto_254612 ) ( SURFACE-AT ?auto_254606 ?auto_254612 ) ( CLEAR ?auto_254606 ) ( IS-CRATE ?auto_254608 ) ( AVAILABLE ?auto_254611 ) ( IN ?auto_254608 ?auto_254610 ) ( ON ?auto_254603 ?auto_254602 ) ( ON ?auto_254604 ?auto_254603 ) ( ON ?auto_254601 ?auto_254604 ) ( ON ?auto_254605 ?auto_254601 ) ( ON ?auto_254607 ?auto_254605 ) ( ON ?auto_254606 ?auto_254607 ) ( not ( = ?auto_254602 ?auto_254603 ) ) ( not ( = ?auto_254602 ?auto_254604 ) ) ( not ( = ?auto_254602 ?auto_254601 ) ) ( not ( = ?auto_254602 ?auto_254605 ) ) ( not ( = ?auto_254602 ?auto_254607 ) ) ( not ( = ?auto_254602 ?auto_254606 ) ) ( not ( = ?auto_254602 ?auto_254608 ) ) ( not ( = ?auto_254602 ?auto_254609 ) ) ( not ( = ?auto_254602 ?auto_254613 ) ) ( not ( = ?auto_254603 ?auto_254604 ) ) ( not ( = ?auto_254603 ?auto_254601 ) ) ( not ( = ?auto_254603 ?auto_254605 ) ) ( not ( = ?auto_254603 ?auto_254607 ) ) ( not ( = ?auto_254603 ?auto_254606 ) ) ( not ( = ?auto_254603 ?auto_254608 ) ) ( not ( = ?auto_254603 ?auto_254609 ) ) ( not ( = ?auto_254603 ?auto_254613 ) ) ( not ( = ?auto_254604 ?auto_254601 ) ) ( not ( = ?auto_254604 ?auto_254605 ) ) ( not ( = ?auto_254604 ?auto_254607 ) ) ( not ( = ?auto_254604 ?auto_254606 ) ) ( not ( = ?auto_254604 ?auto_254608 ) ) ( not ( = ?auto_254604 ?auto_254609 ) ) ( not ( = ?auto_254604 ?auto_254613 ) ) ( not ( = ?auto_254601 ?auto_254605 ) ) ( not ( = ?auto_254601 ?auto_254607 ) ) ( not ( = ?auto_254601 ?auto_254606 ) ) ( not ( = ?auto_254601 ?auto_254608 ) ) ( not ( = ?auto_254601 ?auto_254609 ) ) ( not ( = ?auto_254601 ?auto_254613 ) ) ( not ( = ?auto_254605 ?auto_254607 ) ) ( not ( = ?auto_254605 ?auto_254606 ) ) ( not ( = ?auto_254605 ?auto_254608 ) ) ( not ( = ?auto_254605 ?auto_254609 ) ) ( not ( = ?auto_254605 ?auto_254613 ) ) ( not ( = ?auto_254607 ?auto_254606 ) ) ( not ( = ?auto_254607 ?auto_254608 ) ) ( not ( = ?auto_254607 ?auto_254609 ) ) ( not ( = ?auto_254607 ?auto_254613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254606 ?auto_254608 ?auto_254609 )
      ( MAKE-8CRATE-VERIFY ?auto_254602 ?auto_254603 ?auto_254604 ?auto_254601 ?auto_254605 ?auto_254607 ?auto_254606 ?auto_254608 ?auto_254609 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258700 - SURFACE
      ?auto_258701 - SURFACE
      ?auto_258702 - SURFACE
      ?auto_258699 - SURFACE
      ?auto_258703 - SURFACE
      ?auto_258705 - SURFACE
      ?auto_258704 - SURFACE
      ?auto_258706 - SURFACE
      ?auto_258707 - SURFACE
      ?auto_258708 - SURFACE
    )
    :vars
    (
      ?auto_258710 - HOIST
      ?auto_258709 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258710 ?auto_258709 ) ( SURFACE-AT ?auto_258707 ?auto_258709 ) ( CLEAR ?auto_258707 ) ( LIFTING ?auto_258710 ?auto_258708 ) ( IS-CRATE ?auto_258708 ) ( not ( = ?auto_258707 ?auto_258708 ) ) ( ON ?auto_258701 ?auto_258700 ) ( ON ?auto_258702 ?auto_258701 ) ( ON ?auto_258699 ?auto_258702 ) ( ON ?auto_258703 ?auto_258699 ) ( ON ?auto_258705 ?auto_258703 ) ( ON ?auto_258704 ?auto_258705 ) ( ON ?auto_258706 ?auto_258704 ) ( ON ?auto_258707 ?auto_258706 ) ( not ( = ?auto_258700 ?auto_258701 ) ) ( not ( = ?auto_258700 ?auto_258702 ) ) ( not ( = ?auto_258700 ?auto_258699 ) ) ( not ( = ?auto_258700 ?auto_258703 ) ) ( not ( = ?auto_258700 ?auto_258705 ) ) ( not ( = ?auto_258700 ?auto_258704 ) ) ( not ( = ?auto_258700 ?auto_258706 ) ) ( not ( = ?auto_258700 ?auto_258707 ) ) ( not ( = ?auto_258700 ?auto_258708 ) ) ( not ( = ?auto_258701 ?auto_258702 ) ) ( not ( = ?auto_258701 ?auto_258699 ) ) ( not ( = ?auto_258701 ?auto_258703 ) ) ( not ( = ?auto_258701 ?auto_258705 ) ) ( not ( = ?auto_258701 ?auto_258704 ) ) ( not ( = ?auto_258701 ?auto_258706 ) ) ( not ( = ?auto_258701 ?auto_258707 ) ) ( not ( = ?auto_258701 ?auto_258708 ) ) ( not ( = ?auto_258702 ?auto_258699 ) ) ( not ( = ?auto_258702 ?auto_258703 ) ) ( not ( = ?auto_258702 ?auto_258705 ) ) ( not ( = ?auto_258702 ?auto_258704 ) ) ( not ( = ?auto_258702 ?auto_258706 ) ) ( not ( = ?auto_258702 ?auto_258707 ) ) ( not ( = ?auto_258702 ?auto_258708 ) ) ( not ( = ?auto_258699 ?auto_258703 ) ) ( not ( = ?auto_258699 ?auto_258705 ) ) ( not ( = ?auto_258699 ?auto_258704 ) ) ( not ( = ?auto_258699 ?auto_258706 ) ) ( not ( = ?auto_258699 ?auto_258707 ) ) ( not ( = ?auto_258699 ?auto_258708 ) ) ( not ( = ?auto_258703 ?auto_258705 ) ) ( not ( = ?auto_258703 ?auto_258704 ) ) ( not ( = ?auto_258703 ?auto_258706 ) ) ( not ( = ?auto_258703 ?auto_258707 ) ) ( not ( = ?auto_258703 ?auto_258708 ) ) ( not ( = ?auto_258705 ?auto_258704 ) ) ( not ( = ?auto_258705 ?auto_258706 ) ) ( not ( = ?auto_258705 ?auto_258707 ) ) ( not ( = ?auto_258705 ?auto_258708 ) ) ( not ( = ?auto_258704 ?auto_258706 ) ) ( not ( = ?auto_258704 ?auto_258707 ) ) ( not ( = ?auto_258704 ?auto_258708 ) ) ( not ( = ?auto_258706 ?auto_258707 ) ) ( not ( = ?auto_258706 ?auto_258708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_258707 ?auto_258708 )
      ( MAKE-9CRATE-VERIFY ?auto_258700 ?auto_258701 ?auto_258702 ?auto_258699 ?auto_258703 ?auto_258705 ?auto_258704 ?auto_258706 ?auto_258707 ?auto_258708 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258780 - SURFACE
      ?auto_258781 - SURFACE
      ?auto_258782 - SURFACE
      ?auto_258779 - SURFACE
      ?auto_258783 - SURFACE
      ?auto_258785 - SURFACE
      ?auto_258784 - SURFACE
      ?auto_258786 - SURFACE
      ?auto_258787 - SURFACE
      ?auto_258788 - SURFACE
    )
    :vars
    (
      ?auto_258791 - HOIST
      ?auto_258790 - PLACE
      ?auto_258789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258791 ?auto_258790 ) ( SURFACE-AT ?auto_258787 ?auto_258790 ) ( CLEAR ?auto_258787 ) ( IS-CRATE ?auto_258788 ) ( not ( = ?auto_258787 ?auto_258788 ) ) ( TRUCK-AT ?auto_258789 ?auto_258790 ) ( AVAILABLE ?auto_258791 ) ( IN ?auto_258788 ?auto_258789 ) ( ON ?auto_258787 ?auto_258786 ) ( not ( = ?auto_258786 ?auto_258787 ) ) ( not ( = ?auto_258786 ?auto_258788 ) ) ( ON ?auto_258781 ?auto_258780 ) ( ON ?auto_258782 ?auto_258781 ) ( ON ?auto_258779 ?auto_258782 ) ( ON ?auto_258783 ?auto_258779 ) ( ON ?auto_258785 ?auto_258783 ) ( ON ?auto_258784 ?auto_258785 ) ( ON ?auto_258786 ?auto_258784 ) ( not ( = ?auto_258780 ?auto_258781 ) ) ( not ( = ?auto_258780 ?auto_258782 ) ) ( not ( = ?auto_258780 ?auto_258779 ) ) ( not ( = ?auto_258780 ?auto_258783 ) ) ( not ( = ?auto_258780 ?auto_258785 ) ) ( not ( = ?auto_258780 ?auto_258784 ) ) ( not ( = ?auto_258780 ?auto_258786 ) ) ( not ( = ?auto_258780 ?auto_258787 ) ) ( not ( = ?auto_258780 ?auto_258788 ) ) ( not ( = ?auto_258781 ?auto_258782 ) ) ( not ( = ?auto_258781 ?auto_258779 ) ) ( not ( = ?auto_258781 ?auto_258783 ) ) ( not ( = ?auto_258781 ?auto_258785 ) ) ( not ( = ?auto_258781 ?auto_258784 ) ) ( not ( = ?auto_258781 ?auto_258786 ) ) ( not ( = ?auto_258781 ?auto_258787 ) ) ( not ( = ?auto_258781 ?auto_258788 ) ) ( not ( = ?auto_258782 ?auto_258779 ) ) ( not ( = ?auto_258782 ?auto_258783 ) ) ( not ( = ?auto_258782 ?auto_258785 ) ) ( not ( = ?auto_258782 ?auto_258784 ) ) ( not ( = ?auto_258782 ?auto_258786 ) ) ( not ( = ?auto_258782 ?auto_258787 ) ) ( not ( = ?auto_258782 ?auto_258788 ) ) ( not ( = ?auto_258779 ?auto_258783 ) ) ( not ( = ?auto_258779 ?auto_258785 ) ) ( not ( = ?auto_258779 ?auto_258784 ) ) ( not ( = ?auto_258779 ?auto_258786 ) ) ( not ( = ?auto_258779 ?auto_258787 ) ) ( not ( = ?auto_258779 ?auto_258788 ) ) ( not ( = ?auto_258783 ?auto_258785 ) ) ( not ( = ?auto_258783 ?auto_258784 ) ) ( not ( = ?auto_258783 ?auto_258786 ) ) ( not ( = ?auto_258783 ?auto_258787 ) ) ( not ( = ?auto_258783 ?auto_258788 ) ) ( not ( = ?auto_258785 ?auto_258784 ) ) ( not ( = ?auto_258785 ?auto_258786 ) ) ( not ( = ?auto_258785 ?auto_258787 ) ) ( not ( = ?auto_258785 ?auto_258788 ) ) ( not ( = ?auto_258784 ?auto_258786 ) ) ( not ( = ?auto_258784 ?auto_258787 ) ) ( not ( = ?auto_258784 ?auto_258788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258786 ?auto_258787 ?auto_258788 )
      ( MAKE-9CRATE-VERIFY ?auto_258780 ?auto_258781 ?auto_258782 ?auto_258779 ?auto_258783 ?auto_258785 ?auto_258784 ?auto_258786 ?auto_258787 ?auto_258788 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258870 - SURFACE
      ?auto_258871 - SURFACE
      ?auto_258872 - SURFACE
      ?auto_258869 - SURFACE
      ?auto_258873 - SURFACE
      ?auto_258875 - SURFACE
      ?auto_258874 - SURFACE
      ?auto_258876 - SURFACE
      ?auto_258877 - SURFACE
      ?auto_258878 - SURFACE
    )
    :vars
    (
      ?auto_258882 - HOIST
      ?auto_258879 - PLACE
      ?auto_258880 - TRUCK
      ?auto_258881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258882 ?auto_258879 ) ( SURFACE-AT ?auto_258877 ?auto_258879 ) ( CLEAR ?auto_258877 ) ( IS-CRATE ?auto_258878 ) ( not ( = ?auto_258877 ?auto_258878 ) ) ( AVAILABLE ?auto_258882 ) ( IN ?auto_258878 ?auto_258880 ) ( ON ?auto_258877 ?auto_258876 ) ( not ( = ?auto_258876 ?auto_258877 ) ) ( not ( = ?auto_258876 ?auto_258878 ) ) ( TRUCK-AT ?auto_258880 ?auto_258881 ) ( not ( = ?auto_258881 ?auto_258879 ) ) ( ON ?auto_258871 ?auto_258870 ) ( ON ?auto_258872 ?auto_258871 ) ( ON ?auto_258869 ?auto_258872 ) ( ON ?auto_258873 ?auto_258869 ) ( ON ?auto_258875 ?auto_258873 ) ( ON ?auto_258874 ?auto_258875 ) ( ON ?auto_258876 ?auto_258874 ) ( not ( = ?auto_258870 ?auto_258871 ) ) ( not ( = ?auto_258870 ?auto_258872 ) ) ( not ( = ?auto_258870 ?auto_258869 ) ) ( not ( = ?auto_258870 ?auto_258873 ) ) ( not ( = ?auto_258870 ?auto_258875 ) ) ( not ( = ?auto_258870 ?auto_258874 ) ) ( not ( = ?auto_258870 ?auto_258876 ) ) ( not ( = ?auto_258870 ?auto_258877 ) ) ( not ( = ?auto_258870 ?auto_258878 ) ) ( not ( = ?auto_258871 ?auto_258872 ) ) ( not ( = ?auto_258871 ?auto_258869 ) ) ( not ( = ?auto_258871 ?auto_258873 ) ) ( not ( = ?auto_258871 ?auto_258875 ) ) ( not ( = ?auto_258871 ?auto_258874 ) ) ( not ( = ?auto_258871 ?auto_258876 ) ) ( not ( = ?auto_258871 ?auto_258877 ) ) ( not ( = ?auto_258871 ?auto_258878 ) ) ( not ( = ?auto_258872 ?auto_258869 ) ) ( not ( = ?auto_258872 ?auto_258873 ) ) ( not ( = ?auto_258872 ?auto_258875 ) ) ( not ( = ?auto_258872 ?auto_258874 ) ) ( not ( = ?auto_258872 ?auto_258876 ) ) ( not ( = ?auto_258872 ?auto_258877 ) ) ( not ( = ?auto_258872 ?auto_258878 ) ) ( not ( = ?auto_258869 ?auto_258873 ) ) ( not ( = ?auto_258869 ?auto_258875 ) ) ( not ( = ?auto_258869 ?auto_258874 ) ) ( not ( = ?auto_258869 ?auto_258876 ) ) ( not ( = ?auto_258869 ?auto_258877 ) ) ( not ( = ?auto_258869 ?auto_258878 ) ) ( not ( = ?auto_258873 ?auto_258875 ) ) ( not ( = ?auto_258873 ?auto_258874 ) ) ( not ( = ?auto_258873 ?auto_258876 ) ) ( not ( = ?auto_258873 ?auto_258877 ) ) ( not ( = ?auto_258873 ?auto_258878 ) ) ( not ( = ?auto_258875 ?auto_258874 ) ) ( not ( = ?auto_258875 ?auto_258876 ) ) ( not ( = ?auto_258875 ?auto_258877 ) ) ( not ( = ?auto_258875 ?auto_258878 ) ) ( not ( = ?auto_258874 ?auto_258876 ) ) ( not ( = ?auto_258874 ?auto_258877 ) ) ( not ( = ?auto_258874 ?auto_258878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258876 ?auto_258877 ?auto_258878 )
      ( MAKE-9CRATE-VERIFY ?auto_258870 ?auto_258871 ?auto_258872 ?auto_258869 ?auto_258873 ?auto_258875 ?auto_258874 ?auto_258876 ?auto_258877 ?auto_258878 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258969 - SURFACE
      ?auto_258970 - SURFACE
      ?auto_258971 - SURFACE
      ?auto_258968 - SURFACE
      ?auto_258972 - SURFACE
      ?auto_258974 - SURFACE
      ?auto_258973 - SURFACE
      ?auto_258975 - SURFACE
      ?auto_258976 - SURFACE
      ?auto_258977 - SURFACE
    )
    :vars
    (
      ?auto_258978 - HOIST
      ?auto_258979 - PLACE
      ?auto_258982 - TRUCK
      ?auto_258981 - PLACE
      ?auto_258980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_258978 ?auto_258979 ) ( SURFACE-AT ?auto_258976 ?auto_258979 ) ( CLEAR ?auto_258976 ) ( IS-CRATE ?auto_258977 ) ( not ( = ?auto_258976 ?auto_258977 ) ) ( AVAILABLE ?auto_258978 ) ( ON ?auto_258976 ?auto_258975 ) ( not ( = ?auto_258975 ?auto_258976 ) ) ( not ( = ?auto_258975 ?auto_258977 ) ) ( TRUCK-AT ?auto_258982 ?auto_258981 ) ( not ( = ?auto_258981 ?auto_258979 ) ) ( HOIST-AT ?auto_258980 ?auto_258981 ) ( LIFTING ?auto_258980 ?auto_258977 ) ( not ( = ?auto_258978 ?auto_258980 ) ) ( ON ?auto_258970 ?auto_258969 ) ( ON ?auto_258971 ?auto_258970 ) ( ON ?auto_258968 ?auto_258971 ) ( ON ?auto_258972 ?auto_258968 ) ( ON ?auto_258974 ?auto_258972 ) ( ON ?auto_258973 ?auto_258974 ) ( ON ?auto_258975 ?auto_258973 ) ( not ( = ?auto_258969 ?auto_258970 ) ) ( not ( = ?auto_258969 ?auto_258971 ) ) ( not ( = ?auto_258969 ?auto_258968 ) ) ( not ( = ?auto_258969 ?auto_258972 ) ) ( not ( = ?auto_258969 ?auto_258974 ) ) ( not ( = ?auto_258969 ?auto_258973 ) ) ( not ( = ?auto_258969 ?auto_258975 ) ) ( not ( = ?auto_258969 ?auto_258976 ) ) ( not ( = ?auto_258969 ?auto_258977 ) ) ( not ( = ?auto_258970 ?auto_258971 ) ) ( not ( = ?auto_258970 ?auto_258968 ) ) ( not ( = ?auto_258970 ?auto_258972 ) ) ( not ( = ?auto_258970 ?auto_258974 ) ) ( not ( = ?auto_258970 ?auto_258973 ) ) ( not ( = ?auto_258970 ?auto_258975 ) ) ( not ( = ?auto_258970 ?auto_258976 ) ) ( not ( = ?auto_258970 ?auto_258977 ) ) ( not ( = ?auto_258971 ?auto_258968 ) ) ( not ( = ?auto_258971 ?auto_258972 ) ) ( not ( = ?auto_258971 ?auto_258974 ) ) ( not ( = ?auto_258971 ?auto_258973 ) ) ( not ( = ?auto_258971 ?auto_258975 ) ) ( not ( = ?auto_258971 ?auto_258976 ) ) ( not ( = ?auto_258971 ?auto_258977 ) ) ( not ( = ?auto_258968 ?auto_258972 ) ) ( not ( = ?auto_258968 ?auto_258974 ) ) ( not ( = ?auto_258968 ?auto_258973 ) ) ( not ( = ?auto_258968 ?auto_258975 ) ) ( not ( = ?auto_258968 ?auto_258976 ) ) ( not ( = ?auto_258968 ?auto_258977 ) ) ( not ( = ?auto_258972 ?auto_258974 ) ) ( not ( = ?auto_258972 ?auto_258973 ) ) ( not ( = ?auto_258972 ?auto_258975 ) ) ( not ( = ?auto_258972 ?auto_258976 ) ) ( not ( = ?auto_258972 ?auto_258977 ) ) ( not ( = ?auto_258974 ?auto_258973 ) ) ( not ( = ?auto_258974 ?auto_258975 ) ) ( not ( = ?auto_258974 ?auto_258976 ) ) ( not ( = ?auto_258974 ?auto_258977 ) ) ( not ( = ?auto_258973 ?auto_258975 ) ) ( not ( = ?auto_258973 ?auto_258976 ) ) ( not ( = ?auto_258973 ?auto_258977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258975 ?auto_258976 ?auto_258977 )
      ( MAKE-9CRATE-VERIFY ?auto_258969 ?auto_258970 ?auto_258971 ?auto_258968 ?auto_258972 ?auto_258974 ?auto_258973 ?auto_258975 ?auto_258976 ?auto_258977 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_259077 - SURFACE
      ?auto_259078 - SURFACE
      ?auto_259079 - SURFACE
      ?auto_259076 - SURFACE
      ?auto_259080 - SURFACE
      ?auto_259082 - SURFACE
      ?auto_259081 - SURFACE
      ?auto_259083 - SURFACE
      ?auto_259084 - SURFACE
      ?auto_259085 - SURFACE
    )
    :vars
    (
      ?auto_259090 - HOIST
      ?auto_259089 - PLACE
      ?auto_259087 - TRUCK
      ?auto_259086 - PLACE
      ?auto_259091 - HOIST
      ?auto_259088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_259090 ?auto_259089 ) ( SURFACE-AT ?auto_259084 ?auto_259089 ) ( CLEAR ?auto_259084 ) ( IS-CRATE ?auto_259085 ) ( not ( = ?auto_259084 ?auto_259085 ) ) ( AVAILABLE ?auto_259090 ) ( ON ?auto_259084 ?auto_259083 ) ( not ( = ?auto_259083 ?auto_259084 ) ) ( not ( = ?auto_259083 ?auto_259085 ) ) ( TRUCK-AT ?auto_259087 ?auto_259086 ) ( not ( = ?auto_259086 ?auto_259089 ) ) ( HOIST-AT ?auto_259091 ?auto_259086 ) ( not ( = ?auto_259090 ?auto_259091 ) ) ( AVAILABLE ?auto_259091 ) ( SURFACE-AT ?auto_259085 ?auto_259086 ) ( ON ?auto_259085 ?auto_259088 ) ( CLEAR ?auto_259085 ) ( not ( = ?auto_259084 ?auto_259088 ) ) ( not ( = ?auto_259085 ?auto_259088 ) ) ( not ( = ?auto_259083 ?auto_259088 ) ) ( ON ?auto_259078 ?auto_259077 ) ( ON ?auto_259079 ?auto_259078 ) ( ON ?auto_259076 ?auto_259079 ) ( ON ?auto_259080 ?auto_259076 ) ( ON ?auto_259082 ?auto_259080 ) ( ON ?auto_259081 ?auto_259082 ) ( ON ?auto_259083 ?auto_259081 ) ( not ( = ?auto_259077 ?auto_259078 ) ) ( not ( = ?auto_259077 ?auto_259079 ) ) ( not ( = ?auto_259077 ?auto_259076 ) ) ( not ( = ?auto_259077 ?auto_259080 ) ) ( not ( = ?auto_259077 ?auto_259082 ) ) ( not ( = ?auto_259077 ?auto_259081 ) ) ( not ( = ?auto_259077 ?auto_259083 ) ) ( not ( = ?auto_259077 ?auto_259084 ) ) ( not ( = ?auto_259077 ?auto_259085 ) ) ( not ( = ?auto_259077 ?auto_259088 ) ) ( not ( = ?auto_259078 ?auto_259079 ) ) ( not ( = ?auto_259078 ?auto_259076 ) ) ( not ( = ?auto_259078 ?auto_259080 ) ) ( not ( = ?auto_259078 ?auto_259082 ) ) ( not ( = ?auto_259078 ?auto_259081 ) ) ( not ( = ?auto_259078 ?auto_259083 ) ) ( not ( = ?auto_259078 ?auto_259084 ) ) ( not ( = ?auto_259078 ?auto_259085 ) ) ( not ( = ?auto_259078 ?auto_259088 ) ) ( not ( = ?auto_259079 ?auto_259076 ) ) ( not ( = ?auto_259079 ?auto_259080 ) ) ( not ( = ?auto_259079 ?auto_259082 ) ) ( not ( = ?auto_259079 ?auto_259081 ) ) ( not ( = ?auto_259079 ?auto_259083 ) ) ( not ( = ?auto_259079 ?auto_259084 ) ) ( not ( = ?auto_259079 ?auto_259085 ) ) ( not ( = ?auto_259079 ?auto_259088 ) ) ( not ( = ?auto_259076 ?auto_259080 ) ) ( not ( = ?auto_259076 ?auto_259082 ) ) ( not ( = ?auto_259076 ?auto_259081 ) ) ( not ( = ?auto_259076 ?auto_259083 ) ) ( not ( = ?auto_259076 ?auto_259084 ) ) ( not ( = ?auto_259076 ?auto_259085 ) ) ( not ( = ?auto_259076 ?auto_259088 ) ) ( not ( = ?auto_259080 ?auto_259082 ) ) ( not ( = ?auto_259080 ?auto_259081 ) ) ( not ( = ?auto_259080 ?auto_259083 ) ) ( not ( = ?auto_259080 ?auto_259084 ) ) ( not ( = ?auto_259080 ?auto_259085 ) ) ( not ( = ?auto_259080 ?auto_259088 ) ) ( not ( = ?auto_259082 ?auto_259081 ) ) ( not ( = ?auto_259082 ?auto_259083 ) ) ( not ( = ?auto_259082 ?auto_259084 ) ) ( not ( = ?auto_259082 ?auto_259085 ) ) ( not ( = ?auto_259082 ?auto_259088 ) ) ( not ( = ?auto_259081 ?auto_259083 ) ) ( not ( = ?auto_259081 ?auto_259084 ) ) ( not ( = ?auto_259081 ?auto_259085 ) ) ( not ( = ?auto_259081 ?auto_259088 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_259083 ?auto_259084 ?auto_259085 )
      ( MAKE-9CRATE-VERIFY ?auto_259077 ?auto_259078 ?auto_259079 ?auto_259076 ?auto_259080 ?auto_259082 ?auto_259081 ?auto_259083 ?auto_259084 ?auto_259085 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_259186 - SURFACE
      ?auto_259187 - SURFACE
      ?auto_259188 - SURFACE
      ?auto_259185 - SURFACE
      ?auto_259189 - SURFACE
      ?auto_259191 - SURFACE
      ?auto_259190 - SURFACE
      ?auto_259192 - SURFACE
      ?auto_259193 - SURFACE
      ?auto_259194 - SURFACE
    )
    :vars
    (
      ?auto_259200 - HOIST
      ?auto_259197 - PLACE
      ?auto_259198 - PLACE
      ?auto_259195 - HOIST
      ?auto_259199 - SURFACE
      ?auto_259196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_259200 ?auto_259197 ) ( SURFACE-AT ?auto_259193 ?auto_259197 ) ( CLEAR ?auto_259193 ) ( IS-CRATE ?auto_259194 ) ( not ( = ?auto_259193 ?auto_259194 ) ) ( AVAILABLE ?auto_259200 ) ( ON ?auto_259193 ?auto_259192 ) ( not ( = ?auto_259192 ?auto_259193 ) ) ( not ( = ?auto_259192 ?auto_259194 ) ) ( not ( = ?auto_259198 ?auto_259197 ) ) ( HOIST-AT ?auto_259195 ?auto_259198 ) ( not ( = ?auto_259200 ?auto_259195 ) ) ( AVAILABLE ?auto_259195 ) ( SURFACE-AT ?auto_259194 ?auto_259198 ) ( ON ?auto_259194 ?auto_259199 ) ( CLEAR ?auto_259194 ) ( not ( = ?auto_259193 ?auto_259199 ) ) ( not ( = ?auto_259194 ?auto_259199 ) ) ( not ( = ?auto_259192 ?auto_259199 ) ) ( TRUCK-AT ?auto_259196 ?auto_259197 ) ( ON ?auto_259187 ?auto_259186 ) ( ON ?auto_259188 ?auto_259187 ) ( ON ?auto_259185 ?auto_259188 ) ( ON ?auto_259189 ?auto_259185 ) ( ON ?auto_259191 ?auto_259189 ) ( ON ?auto_259190 ?auto_259191 ) ( ON ?auto_259192 ?auto_259190 ) ( not ( = ?auto_259186 ?auto_259187 ) ) ( not ( = ?auto_259186 ?auto_259188 ) ) ( not ( = ?auto_259186 ?auto_259185 ) ) ( not ( = ?auto_259186 ?auto_259189 ) ) ( not ( = ?auto_259186 ?auto_259191 ) ) ( not ( = ?auto_259186 ?auto_259190 ) ) ( not ( = ?auto_259186 ?auto_259192 ) ) ( not ( = ?auto_259186 ?auto_259193 ) ) ( not ( = ?auto_259186 ?auto_259194 ) ) ( not ( = ?auto_259186 ?auto_259199 ) ) ( not ( = ?auto_259187 ?auto_259188 ) ) ( not ( = ?auto_259187 ?auto_259185 ) ) ( not ( = ?auto_259187 ?auto_259189 ) ) ( not ( = ?auto_259187 ?auto_259191 ) ) ( not ( = ?auto_259187 ?auto_259190 ) ) ( not ( = ?auto_259187 ?auto_259192 ) ) ( not ( = ?auto_259187 ?auto_259193 ) ) ( not ( = ?auto_259187 ?auto_259194 ) ) ( not ( = ?auto_259187 ?auto_259199 ) ) ( not ( = ?auto_259188 ?auto_259185 ) ) ( not ( = ?auto_259188 ?auto_259189 ) ) ( not ( = ?auto_259188 ?auto_259191 ) ) ( not ( = ?auto_259188 ?auto_259190 ) ) ( not ( = ?auto_259188 ?auto_259192 ) ) ( not ( = ?auto_259188 ?auto_259193 ) ) ( not ( = ?auto_259188 ?auto_259194 ) ) ( not ( = ?auto_259188 ?auto_259199 ) ) ( not ( = ?auto_259185 ?auto_259189 ) ) ( not ( = ?auto_259185 ?auto_259191 ) ) ( not ( = ?auto_259185 ?auto_259190 ) ) ( not ( = ?auto_259185 ?auto_259192 ) ) ( not ( = ?auto_259185 ?auto_259193 ) ) ( not ( = ?auto_259185 ?auto_259194 ) ) ( not ( = ?auto_259185 ?auto_259199 ) ) ( not ( = ?auto_259189 ?auto_259191 ) ) ( not ( = ?auto_259189 ?auto_259190 ) ) ( not ( = ?auto_259189 ?auto_259192 ) ) ( not ( = ?auto_259189 ?auto_259193 ) ) ( not ( = ?auto_259189 ?auto_259194 ) ) ( not ( = ?auto_259189 ?auto_259199 ) ) ( not ( = ?auto_259191 ?auto_259190 ) ) ( not ( = ?auto_259191 ?auto_259192 ) ) ( not ( = ?auto_259191 ?auto_259193 ) ) ( not ( = ?auto_259191 ?auto_259194 ) ) ( not ( = ?auto_259191 ?auto_259199 ) ) ( not ( = ?auto_259190 ?auto_259192 ) ) ( not ( = ?auto_259190 ?auto_259193 ) ) ( not ( = ?auto_259190 ?auto_259194 ) ) ( not ( = ?auto_259190 ?auto_259199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_259192 ?auto_259193 ?auto_259194 )
      ( MAKE-9CRATE-VERIFY ?auto_259186 ?auto_259187 ?auto_259188 ?auto_259185 ?auto_259189 ?auto_259191 ?auto_259190 ?auto_259192 ?auto_259193 ?auto_259194 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_259295 - SURFACE
      ?auto_259296 - SURFACE
      ?auto_259297 - SURFACE
      ?auto_259294 - SURFACE
      ?auto_259298 - SURFACE
      ?auto_259300 - SURFACE
      ?auto_259299 - SURFACE
      ?auto_259301 - SURFACE
      ?auto_259302 - SURFACE
      ?auto_259303 - SURFACE
    )
    :vars
    (
      ?auto_259307 - HOIST
      ?auto_259306 - PLACE
      ?auto_259305 - PLACE
      ?auto_259304 - HOIST
      ?auto_259309 - SURFACE
      ?auto_259308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_259307 ?auto_259306 ) ( IS-CRATE ?auto_259303 ) ( not ( = ?auto_259302 ?auto_259303 ) ) ( not ( = ?auto_259301 ?auto_259302 ) ) ( not ( = ?auto_259301 ?auto_259303 ) ) ( not ( = ?auto_259305 ?auto_259306 ) ) ( HOIST-AT ?auto_259304 ?auto_259305 ) ( not ( = ?auto_259307 ?auto_259304 ) ) ( AVAILABLE ?auto_259304 ) ( SURFACE-AT ?auto_259303 ?auto_259305 ) ( ON ?auto_259303 ?auto_259309 ) ( CLEAR ?auto_259303 ) ( not ( = ?auto_259302 ?auto_259309 ) ) ( not ( = ?auto_259303 ?auto_259309 ) ) ( not ( = ?auto_259301 ?auto_259309 ) ) ( TRUCK-AT ?auto_259308 ?auto_259306 ) ( SURFACE-AT ?auto_259301 ?auto_259306 ) ( CLEAR ?auto_259301 ) ( LIFTING ?auto_259307 ?auto_259302 ) ( IS-CRATE ?auto_259302 ) ( ON ?auto_259296 ?auto_259295 ) ( ON ?auto_259297 ?auto_259296 ) ( ON ?auto_259294 ?auto_259297 ) ( ON ?auto_259298 ?auto_259294 ) ( ON ?auto_259300 ?auto_259298 ) ( ON ?auto_259299 ?auto_259300 ) ( ON ?auto_259301 ?auto_259299 ) ( not ( = ?auto_259295 ?auto_259296 ) ) ( not ( = ?auto_259295 ?auto_259297 ) ) ( not ( = ?auto_259295 ?auto_259294 ) ) ( not ( = ?auto_259295 ?auto_259298 ) ) ( not ( = ?auto_259295 ?auto_259300 ) ) ( not ( = ?auto_259295 ?auto_259299 ) ) ( not ( = ?auto_259295 ?auto_259301 ) ) ( not ( = ?auto_259295 ?auto_259302 ) ) ( not ( = ?auto_259295 ?auto_259303 ) ) ( not ( = ?auto_259295 ?auto_259309 ) ) ( not ( = ?auto_259296 ?auto_259297 ) ) ( not ( = ?auto_259296 ?auto_259294 ) ) ( not ( = ?auto_259296 ?auto_259298 ) ) ( not ( = ?auto_259296 ?auto_259300 ) ) ( not ( = ?auto_259296 ?auto_259299 ) ) ( not ( = ?auto_259296 ?auto_259301 ) ) ( not ( = ?auto_259296 ?auto_259302 ) ) ( not ( = ?auto_259296 ?auto_259303 ) ) ( not ( = ?auto_259296 ?auto_259309 ) ) ( not ( = ?auto_259297 ?auto_259294 ) ) ( not ( = ?auto_259297 ?auto_259298 ) ) ( not ( = ?auto_259297 ?auto_259300 ) ) ( not ( = ?auto_259297 ?auto_259299 ) ) ( not ( = ?auto_259297 ?auto_259301 ) ) ( not ( = ?auto_259297 ?auto_259302 ) ) ( not ( = ?auto_259297 ?auto_259303 ) ) ( not ( = ?auto_259297 ?auto_259309 ) ) ( not ( = ?auto_259294 ?auto_259298 ) ) ( not ( = ?auto_259294 ?auto_259300 ) ) ( not ( = ?auto_259294 ?auto_259299 ) ) ( not ( = ?auto_259294 ?auto_259301 ) ) ( not ( = ?auto_259294 ?auto_259302 ) ) ( not ( = ?auto_259294 ?auto_259303 ) ) ( not ( = ?auto_259294 ?auto_259309 ) ) ( not ( = ?auto_259298 ?auto_259300 ) ) ( not ( = ?auto_259298 ?auto_259299 ) ) ( not ( = ?auto_259298 ?auto_259301 ) ) ( not ( = ?auto_259298 ?auto_259302 ) ) ( not ( = ?auto_259298 ?auto_259303 ) ) ( not ( = ?auto_259298 ?auto_259309 ) ) ( not ( = ?auto_259300 ?auto_259299 ) ) ( not ( = ?auto_259300 ?auto_259301 ) ) ( not ( = ?auto_259300 ?auto_259302 ) ) ( not ( = ?auto_259300 ?auto_259303 ) ) ( not ( = ?auto_259300 ?auto_259309 ) ) ( not ( = ?auto_259299 ?auto_259301 ) ) ( not ( = ?auto_259299 ?auto_259302 ) ) ( not ( = ?auto_259299 ?auto_259303 ) ) ( not ( = ?auto_259299 ?auto_259309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_259301 ?auto_259302 ?auto_259303 )
      ( MAKE-9CRATE-VERIFY ?auto_259295 ?auto_259296 ?auto_259297 ?auto_259294 ?auto_259298 ?auto_259300 ?auto_259299 ?auto_259301 ?auto_259302 ?auto_259303 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_259404 - SURFACE
      ?auto_259405 - SURFACE
      ?auto_259406 - SURFACE
      ?auto_259403 - SURFACE
      ?auto_259407 - SURFACE
      ?auto_259409 - SURFACE
      ?auto_259408 - SURFACE
      ?auto_259410 - SURFACE
      ?auto_259411 - SURFACE
      ?auto_259412 - SURFACE
    )
    :vars
    (
      ?auto_259413 - HOIST
      ?auto_259416 - PLACE
      ?auto_259417 - PLACE
      ?auto_259415 - HOIST
      ?auto_259418 - SURFACE
      ?auto_259414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_259413 ?auto_259416 ) ( IS-CRATE ?auto_259412 ) ( not ( = ?auto_259411 ?auto_259412 ) ) ( not ( = ?auto_259410 ?auto_259411 ) ) ( not ( = ?auto_259410 ?auto_259412 ) ) ( not ( = ?auto_259417 ?auto_259416 ) ) ( HOIST-AT ?auto_259415 ?auto_259417 ) ( not ( = ?auto_259413 ?auto_259415 ) ) ( AVAILABLE ?auto_259415 ) ( SURFACE-AT ?auto_259412 ?auto_259417 ) ( ON ?auto_259412 ?auto_259418 ) ( CLEAR ?auto_259412 ) ( not ( = ?auto_259411 ?auto_259418 ) ) ( not ( = ?auto_259412 ?auto_259418 ) ) ( not ( = ?auto_259410 ?auto_259418 ) ) ( TRUCK-AT ?auto_259414 ?auto_259416 ) ( SURFACE-AT ?auto_259410 ?auto_259416 ) ( CLEAR ?auto_259410 ) ( IS-CRATE ?auto_259411 ) ( AVAILABLE ?auto_259413 ) ( IN ?auto_259411 ?auto_259414 ) ( ON ?auto_259405 ?auto_259404 ) ( ON ?auto_259406 ?auto_259405 ) ( ON ?auto_259403 ?auto_259406 ) ( ON ?auto_259407 ?auto_259403 ) ( ON ?auto_259409 ?auto_259407 ) ( ON ?auto_259408 ?auto_259409 ) ( ON ?auto_259410 ?auto_259408 ) ( not ( = ?auto_259404 ?auto_259405 ) ) ( not ( = ?auto_259404 ?auto_259406 ) ) ( not ( = ?auto_259404 ?auto_259403 ) ) ( not ( = ?auto_259404 ?auto_259407 ) ) ( not ( = ?auto_259404 ?auto_259409 ) ) ( not ( = ?auto_259404 ?auto_259408 ) ) ( not ( = ?auto_259404 ?auto_259410 ) ) ( not ( = ?auto_259404 ?auto_259411 ) ) ( not ( = ?auto_259404 ?auto_259412 ) ) ( not ( = ?auto_259404 ?auto_259418 ) ) ( not ( = ?auto_259405 ?auto_259406 ) ) ( not ( = ?auto_259405 ?auto_259403 ) ) ( not ( = ?auto_259405 ?auto_259407 ) ) ( not ( = ?auto_259405 ?auto_259409 ) ) ( not ( = ?auto_259405 ?auto_259408 ) ) ( not ( = ?auto_259405 ?auto_259410 ) ) ( not ( = ?auto_259405 ?auto_259411 ) ) ( not ( = ?auto_259405 ?auto_259412 ) ) ( not ( = ?auto_259405 ?auto_259418 ) ) ( not ( = ?auto_259406 ?auto_259403 ) ) ( not ( = ?auto_259406 ?auto_259407 ) ) ( not ( = ?auto_259406 ?auto_259409 ) ) ( not ( = ?auto_259406 ?auto_259408 ) ) ( not ( = ?auto_259406 ?auto_259410 ) ) ( not ( = ?auto_259406 ?auto_259411 ) ) ( not ( = ?auto_259406 ?auto_259412 ) ) ( not ( = ?auto_259406 ?auto_259418 ) ) ( not ( = ?auto_259403 ?auto_259407 ) ) ( not ( = ?auto_259403 ?auto_259409 ) ) ( not ( = ?auto_259403 ?auto_259408 ) ) ( not ( = ?auto_259403 ?auto_259410 ) ) ( not ( = ?auto_259403 ?auto_259411 ) ) ( not ( = ?auto_259403 ?auto_259412 ) ) ( not ( = ?auto_259403 ?auto_259418 ) ) ( not ( = ?auto_259407 ?auto_259409 ) ) ( not ( = ?auto_259407 ?auto_259408 ) ) ( not ( = ?auto_259407 ?auto_259410 ) ) ( not ( = ?auto_259407 ?auto_259411 ) ) ( not ( = ?auto_259407 ?auto_259412 ) ) ( not ( = ?auto_259407 ?auto_259418 ) ) ( not ( = ?auto_259409 ?auto_259408 ) ) ( not ( = ?auto_259409 ?auto_259410 ) ) ( not ( = ?auto_259409 ?auto_259411 ) ) ( not ( = ?auto_259409 ?auto_259412 ) ) ( not ( = ?auto_259409 ?auto_259418 ) ) ( not ( = ?auto_259408 ?auto_259410 ) ) ( not ( = ?auto_259408 ?auto_259411 ) ) ( not ( = ?auto_259408 ?auto_259412 ) ) ( not ( = ?auto_259408 ?auto_259418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_259410 ?auto_259411 ?auto_259412 )
      ( MAKE-9CRATE-VERIFY ?auto_259404 ?auto_259405 ?auto_259406 ?auto_259403 ?auto_259407 ?auto_259409 ?auto_259408 ?auto_259410 ?auto_259411 ?auto_259412 ) )
  )

)

