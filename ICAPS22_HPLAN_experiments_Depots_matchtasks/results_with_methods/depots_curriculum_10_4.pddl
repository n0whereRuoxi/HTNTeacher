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

  ( :method MAKE-10CRATE-VERIFY
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
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8134 - SURFACE
      ?auto_8135 - SURFACE
    )
    :vars
    (
      ?auto_8136 - HOIST
      ?auto_8137 - PLACE
      ?auto_8139 - PLACE
      ?auto_8140 - HOIST
      ?auto_8141 - SURFACE
      ?auto_8138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8136 ?auto_8137 ) ( SURFACE-AT ?auto_8134 ?auto_8137 ) ( CLEAR ?auto_8134 ) ( IS-CRATE ?auto_8135 ) ( AVAILABLE ?auto_8136 ) ( not ( = ?auto_8139 ?auto_8137 ) ) ( HOIST-AT ?auto_8140 ?auto_8139 ) ( AVAILABLE ?auto_8140 ) ( SURFACE-AT ?auto_8135 ?auto_8139 ) ( ON ?auto_8135 ?auto_8141 ) ( CLEAR ?auto_8135 ) ( TRUCK-AT ?auto_8138 ?auto_8137 ) ( not ( = ?auto_8134 ?auto_8135 ) ) ( not ( = ?auto_8134 ?auto_8141 ) ) ( not ( = ?auto_8135 ?auto_8141 ) ) ( not ( = ?auto_8136 ?auto_8140 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8138 ?auto_8137 ?auto_8139 )
      ( !LIFT ?auto_8140 ?auto_8135 ?auto_8141 ?auto_8139 )
      ( !LOAD ?auto_8140 ?auto_8135 ?auto_8138 ?auto_8139 )
      ( !DRIVE ?auto_8138 ?auto_8139 ?auto_8137 )
      ( !UNLOAD ?auto_8136 ?auto_8135 ?auto_8138 ?auto_8137 )
      ( !DROP ?auto_8136 ?auto_8135 ?auto_8134 ?auto_8137 )
      ( MAKE-1CRATE-VERIFY ?auto_8134 ?auto_8135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8144 - SURFACE
      ?auto_8145 - SURFACE
    )
    :vars
    (
      ?auto_8146 - HOIST
      ?auto_8147 - PLACE
      ?auto_8149 - PLACE
      ?auto_8150 - HOIST
      ?auto_8151 - SURFACE
      ?auto_8148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8146 ?auto_8147 ) ( SURFACE-AT ?auto_8144 ?auto_8147 ) ( CLEAR ?auto_8144 ) ( IS-CRATE ?auto_8145 ) ( AVAILABLE ?auto_8146 ) ( not ( = ?auto_8149 ?auto_8147 ) ) ( HOIST-AT ?auto_8150 ?auto_8149 ) ( AVAILABLE ?auto_8150 ) ( SURFACE-AT ?auto_8145 ?auto_8149 ) ( ON ?auto_8145 ?auto_8151 ) ( CLEAR ?auto_8145 ) ( TRUCK-AT ?auto_8148 ?auto_8147 ) ( not ( = ?auto_8144 ?auto_8145 ) ) ( not ( = ?auto_8144 ?auto_8151 ) ) ( not ( = ?auto_8145 ?auto_8151 ) ) ( not ( = ?auto_8146 ?auto_8150 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8148 ?auto_8147 ?auto_8149 )
      ( !LIFT ?auto_8150 ?auto_8145 ?auto_8151 ?auto_8149 )
      ( !LOAD ?auto_8150 ?auto_8145 ?auto_8148 ?auto_8149 )
      ( !DRIVE ?auto_8148 ?auto_8149 ?auto_8147 )
      ( !UNLOAD ?auto_8146 ?auto_8145 ?auto_8148 ?auto_8147 )
      ( !DROP ?auto_8146 ?auto_8145 ?auto_8144 ?auto_8147 )
      ( MAKE-1CRATE-VERIFY ?auto_8144 ?auto_8145 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8155 - SURFACE
      ?auto_8156 - SURFACE
      ?auto_8157 - SURFACE
    )
    :vars
    (
      ?auto_8161 - HOIST
      ?auto_8163 - PLACE
      ?auto_8160 - PLACE
      ?auto_8162 - HOIST
      ?auto_8158 - SURFACE
      ?auto_8165 - PLACE
      ?auto_8166 - HOIST
      ?auto_8164 - SURFACE
      ?auto_8159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8161 ?auto_8163 ) ( IS-CRATE ?auto_8157 ) ( not ( = ?auto_8160 ?auto_8163 ) ) ( HOIST-AT ?auto_8162 ?auto_8160 ) ( AVAILABLE ?auto_8162 ) ( SURFACE-AT ?auto_8157 ?auto_8160 ) ( ON ?auto_8157 ?auto_8158 ) ( CLEAR ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( not ( = ?auto_8156 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8161 ?auto_8162 ) ) ( SURFACE-AT ?auto_8155 ?auto_8163 ) ( CLEAR ?auto_8155 ) ( IS-CRATE ?auto_8156 ) ( AVAILABLE ?auto_8161 ) ( not ( = ?auto_8165 ?auto_8163 ) ) ( HOIST-AT ?auto_8166 ?auto_8165 ) ( AVAILABLE ?auto_8166 ) ( SURFACE-AT ?auto_8156 ?auto_8165 ) ( ON ?auto_8156 ?auto_8164 ) ( CLEAR ?auto_8156 ) ( TRUCK-AT ?auto_8159 ?auto_8163 ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8164 ) ) ( not ( = ?auto_8156 ?auto_8164 ) ) ( not ( = ?auto_8161 ?auto_8166 ) ) ( not ( = ?auto_8155 ?auto_8157 ) ) ( not ( = ?auto_8155 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8164 ) ) ( not ( = ?auto_8160 ?auto_8165 ) ) ( not ( = ?auto_8162 ?auto_8166 ) ) ( not ( = ?auto_8158 ?auto_8164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8155 ?auto_8156 )
      ( MAKE-1CRATE ?auto_8156 ?auto_8157 )
      ( MAKE-2CRATE-VERIFY ?auto_8155 ?auto_8156 ?auto_8157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8169 - SURFACE
      ?auto_8170 - SURFACE
    )
    :vars
    (
      ?auto_8171 - HOIST
      ?auto_8172 - PLACE
      ?auto_8174 - PLACE
      ?auto_8175 - HOIST
      ?auto_8176 - SURFACE
      ?auto_8173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8171 ?auto_8172 ) ( SURFACE-AT ?auto_8169 ?auto_8172 ) ( CLEAR ?auto_8169 ) ( IS-CRATE ?auto_8170 ) ( AVAILABLE ?auto_8171 ) ( not ( = ?auto_8174 ?auto_8172 ) ) ( HOIST-AT ?auto_8175 ?auto_8174 ) ( AVAILABLE ?auto_8175 ) ( SURFACE-AT ?auto_8170 ?auto_8174 ) ( ON ?auto_8170 ?auto_8176 ) ( CLEAR ?auto_8170 ) ( TRUCK-AT ?auto_8173 ?auto_8172 ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( not ( = ?auto_8169 ?auto_8176 ) ) ( not ( = ?auto_8170 ?auto_8176 ) ) ( not ( = ?auto_8171 ?auto_8175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8173 ?auto_8172 ?auto_8174 )
      ( !LIFT ?auto_8175 ?auto_8170 ?auto_8176 ?auto_8174 )
      ( !LOAD ?auto_8175 ?auto_8170 ?auto_8173 ?auto_8174 )
      ( !DRIVE ?auto_8173 ?auto_8174 ?auto_8172 )
      ( !UNLOAD ?auto_8171 ?auto_8170 ?auto_8173 ?auto_8172 )
      ( !DROP ?auto_8171 ?auto_8170 ?auto_8169 ?auto_8172 )
      ( MAKE-1CRATE-VERIFY ?auto_8169 ?auto_8170 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8181 - SURFACE
      ?auto_8182 - SURFACE
      ?auto_8183 - SURFACE
      ?auto_8184 - SURFACE
    )
    :vars
    (
      ?auto_8185 - HOIST
      ?auto_8190 - PLACE
      ?auto_8189 - PLACE
      ?auto_8186 - HOIST
      ?auto_8188 - SURFACE
      ?auto_8191 - PLACE
      ?auto_8194 - HOIST
      ?auto_8193 - SURFACE
      ?auto_8196 - PLACE
      ?auto_8195 - HOIST
      ?auto_8192 - SURFACE
      ?auto_8187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8185 ?auto_8190 ) ( IS-CRATE ?auto_8184 ) ( not ( = ?auto_8189 ?auto_8190 ) ) ( HOIST-AT ?auto_8186 ?auto_8189 ) ( AVAILABLE ?auto_8186 ) ( SURFACE-AT ?auto_8184 ?auto_8189 ) ( ON ?auto_8184 ?auto_8188 ) ( CLEAR ?auto_8184 ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8188 ) ) ( not ( = ?auto_8184 ?auto_8188 ) ) ( not ( = ?auto_8185 ?auto_8186 ) ) ( IS-CRATE ?auto_8183 ) ( not ( = ?auto_8191 ?auto_8190 ) ) ( HOIST-AT ?auto_8194 ?auto_8191 ) ( AVAILABLE ?auto_8194 ) ( SURFACE-AT ?auto_8183 ?auto_8191 ) ( ON ?auto_8183 ?auto_8193 ) ( CLEAR ?auto_8183 ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8193 ) ) ( not ( = ?auto_8183 ?auto_8193 ) ) ( not ( = ?auto_8185 ?auto_8194 ) ) ( SURFACE-AT ?auto_8181 ?auto_8190 ) ( CLEAR ?auto_8181 ) ( IS-CRATE ?auto_8182 ) ( AVAILABLE ?auto_8185 ) ( not ( = ?auto_8196 ?auto_8190 ) ) ( HOIST-AT ?auto_8195 ?auto_8196 ) ( AVAILABLE ?auto_8195 ) ( SURFACE-AT ?auto_8182 ?auto_8196 ) ( ON ?auto_8182 ?auto_8192 ) ( CLEAR ?auto_8182 ) ( TRUCK-AT ?auto_8187 ?auto_8190 ) ( not ( = ?auto_8181 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8192 ) ) ( not ( = ?auto_8182 ?auto_8192 ) ) ( not ( = ?auto_8185 ?auto_8195 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8181 ?auto_8193 ) ) ( not ( = ?auto_8183 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8196 ) ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8193 ?auto_8192 ) ) ( not ( = ?auto_8181 ?auto_8184 ) ) ( not ( = ?auto_8181 ?auto_8188 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8188 ) ) ( not ( = ?auto_8184 ?auto_8193 ) ) ( not ( = ?auto_8184 ?auto_8192 ) ) ( not ( = ?auto_8189 ?auto_8191 ) ) ( not ( = ?auto_8189 ?auto_8196 ) ) ( not ( = ?auto_8186 ?auto_8194 ) ) ( not ( = ?auto_8186 ?auto_8195 ) ) ( not ( = ?auto_8188 ?auto_8193 ) ) ( not ( = ?auto_8188 ?auto_8192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8181 ?auto_8182 ?auto_8183 )
      ( MAKE-1CRATE ?auto_8183 ?auto_8184 )
      ( MAKE-3CRATE-VERIFY ?auto_8181 ?auto_8182 ?auto_8183 ?auto_8184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8199 - SURFACE
      ?auto_8200 - SURFACE
    )
    :vars
    (
      ?auto_8201 - HOIST
      ?auto_8202 - PLACE
      ?auto_8204 - PLACE
      ?auto_8205 - HOIST
      ?auto_8206 - SURFACE
      ?auto_8203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8201 ?auto_8202 ) ( SURFACE-AT ?auto_8199 ?auto_8202 ) ( CLEAR ?auto_8199 ) ( IS-CRATE ?auto_8200 ) ( AVAILABLE ?auto_8201 ) ( not ( = ?auto_8204 ?auto_8202 ) ) ( HOIST-AT ?auto_8205 ?auto_8204 ) ( AVAILABLE ?auto_8205 ) ( SURFACE-AT ?auto_8200 ?auto_8204 ) ( ON ?auto_8200 ?auto_8206 ) ( CLEAR ?auto_8200 ) ( TRUCK-AT ?auto_8203 ?auto_8202 ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( not ( = ?auto_8199 ?auto_8206 ) ) ( not ( = ?auto_8200 ?auto_8206 ) ) ( not ( = ?auto_8201 ?auto_8205 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8203 ?auto_8202 ?auto_8204 )
      ( !LIFT ?auto_8205 ?auto_8200 ?auto_8206 ?auto_8204 )
      ( !LOAD ?auto_8205 ?auto_8200 ?auto_8203 ?auto_8204 )
      ( !DRIVE ?auto_8203 ?auto_8204 ?auto_8202 )
      ( !UNLOAD ?auto_8201 ?auto_8200 ?auto_8203 ?auto_8202 )
      ( !DROP ?auto_8201 ?auto_8200 ?auto_8199 ?auto_8202 )
      ( MAKE-1CRATE-VERIFY ?auto_8199 ?auto_8200 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8212 - SURFACE
      ?auto_8213 - SURFACE
      ?auto_8214 - SURFACE
      ?auto_8215 - SURFACE
      ?auto_8216 - SURFACE
    )
    :vars
    (
      ?auto_8220 - HOIST
      ?auto_8222 - PLACE
      ?auto_8219 - PLACE
      ?auto_8221 - HOIST
      ?auto_8218 - SURFACE
      ?auto_8223 - PLACE
      ?auto_8224 - HOIST
      ?auto_8229 - SURFACE
      ?auto_8226 - PLACE
      ?auto_8225 - HOIST
      ?auto_8227 - SURFACE
      ?auto_8228 - SURFACE
      ?auto_8217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8220 ?auto_8222 ) ( IS-CRATE ?auto_8216 ) ( not ( = ?auto_8219 ?auto_8222 ) ) ( HOIST-AT ?auto_8221 ?auto_8219 ) ( SURFACE-AT ?auto_8216 ?auto_8219 ) ( ON ?auto_8216 ?auto_8218 ) ( CLEAR ?auto_8216 ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8215 ?auto_8218 ) ) ( not ( = ?auto_8216 ?auto_8218 ) ) ( not ( = ?auto_8220 ?auto_8221 ) ) ( IS-CRATE ?auto_8215 ) ( not ( = ?auto_8223 ?auto_8222 ) ) ( HOIST-AT ?auto_8224 ?auto_8223 ) ( AVAILABLE ?auto_8224 ) ( SURFACE-AT ?auto_8215 ?auto_8223 ) ( ON ?auto_8215 ?auto_8229 ) ( CLEAR ?auto_8215 ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8229 ) ) ( not ( = ?auto_8215 ?auto_8229 ) ) ( not ( = ?auto_8220 ?auto_8224 ) ) ( IS-CRATE ?auto_8214 ) ( not ( = ?auto_8226 ?auto_8222 ) ) ( HOIST-AT ?auto_8225 ?auto_8226 ) ( AVAILABLE ?auto_8225 ) ( SURFACE-AT ?auto_8214 ?auto_8226 ) ( ON ?auto_8214 ?auto_8227 ) ( CLEAR ?auto_8214 ) ( not ( = ?auto_8213 ?auto_8214 ) ) ( not ( = ?auto_8213 ?auto_8227 ) ) ( not ( = ?auto_8214 ?auto_8227 ) ) ( not ( = ?auto_8220 ?auto_8225 ) ) ( SURFACE-AT ?auto_8212 ?auto_8222 ) ( CLEAR ?auto_8212 ) ( IS-CRATE ?auto_8213 ) ( AVAILABLE ?auto_8220 ) ( AVAILABLE ?auto_8221 ) ( SURFACE-AT ?auto_8213 ?auto_8219 ) ( ON ?auto_8213 ?auto_8228 ) ( CLEAR ?auto_8213 ) ( TRUCK-AT ?auto_8217 ?auto_8222 ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8212 ?auto_8228 ) ) ( not ( = ?auto_8213 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8214 ) ) ( not ( = ?auto_8212 ?auto_8227 ) ) ( not ( = ?auto_8214 ?auto_8228 ) ) ( not ( = ?auto_8226 ?auto_8219 ) ) ( not ( = ?auto_8225 ?auto_8221 ) ) ( not ( = ?auto_8227 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8215 ) ) ( not ( = ?auto_8212 ?auto_8229 ) ) ( not ( = ?auto_8213 ?auto_8215 ) ) ( not ( = ?auto_8213 ?auto_8229 ) ) ( not ( = ?auto_8215 ?auto_8227 ) ) ( not ( = ?auto_8215 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8226 ) ) ( not ( = ?auto_8223 ?auto_8219 ) ) ( not ( = ?auto_8224 ?auto_8225 ) ) ( not ( = ?auto_8224 ?auto_8221 ) ) ( not ( = ?auto_8229 ?auto_8227 ) ) ( not ( = ?auto_8229 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8216 ) ) ( not ( = ?auto_8212 ?auto_8218 ) ) ( not ( = ?auto_8213 ?auto_8216 ) ) ( not ( = ?auto_8213 ?auto_8218 ) ) ( not ( = ?auto_8214 ?auto_8216 ) ) ( not ( = ?auto_8214 ?auto_8218 ) ) ( not ( = ?auto_8216 ?auto_8229 ) ) ( not ( = ?auto_8216 ?auto_8227 ) ) ( not ( = ?auto_8216 ?auto_8228 ) ) ( not ( = ?auto_8218 ?auto_8229 ) ) ( not ( = ?auto_8218 ?auto_8227 ) ) ( not ( = ?auto_8218 ?auto_8228 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8212 ?auto_8213 ?auto_8214 ?auto_8215 )
      ( MAKE-1CRATE ?auto_8215 ?auto_8216 )
      ( MAKE-4CRATE-VERIFY ?auto_8212 ?auto_8213 ?auto_8214 ?auto_8215 ?auto_8216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8232 - SURFACE
      ?auto_8233 - SURFACE
    )
    :vars
    (
      ?auto_8234 - HOIST
      ?auto_8235 - PLACE
      ?auto_8237 - PLACE
      ?auto_8238 - HOIST
      ?auto_8239 - SURFACE
      ?auto_8236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8234 ?auto_8235 ) ( SURFACE-AT ?auto_8232 ?auto_8235 ) ( CLEAR ?auto_8232 ) ( IS-CRATE ?auto_8233 ) ( AVAILABLE ?auto_8234 ) ( not ( = ?auto_8237 ?auto_8235 ) ) ( HOIST-AT ?auto_8238 ?auto_8237 ) ( AVAILABLE ?auto_8238 ) ( SURFACE-AT ?auto_8233 ?auto_8237 ) ( ON ?auto_8233 ?auto_8239 ) ( CLEAR ?auto_8233 ) ( TRUCK-AT ?auto_8236 ?auto_8235 ) ( not ( = ?auto_8232 ?auto_8233 ) ) ( not ( = ?auto_8232 ?auto_8239 ) ) ( not ( = ?auto_8233 ?auto_8239 ) ) ( not ( = ?auto_8234 ?auto_8238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8236 ?auto_8235 ?auto_8237 )
      ( !LIFT ?auto_8238 ?auto_8233 ?auto_8239 ?auto_8237 )
      ( !LOAD ?auto_8238 ?auto_8233 ?auto_8236 ?auto_8237 )
      ( !DRIVE ?auto_8236 ?auto_8237 ?auto_8235 )
      ( !UNLOAD ?auto_8234 ?auto_8233 ?auto_8236 ?auto_8235 )
      ( !DROP ?auto_8234 ?auto_8233 ?auto_8232 ?auto_8235 )
      ( MAKE-1CRATE-VERIFY ?auto_8232 ?auto_8233 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8246 - SURFACE
      ?auto_8247 - SURFACE
      ?auto_8248 - SURFACE
      ?auto_8249 - SURFACE
      ?auto_8250 - SURFACE
      ?auto_8251 - SURFACE
    )
    :vars
    (
      ?auto_8256 - HOIST
      ?auto_8257 - PLACE
      ?auto_8255 - PLACE
      ?auto_8254 - HOIST
      ?auto_8253 - SURFACE
      ?auto_8261 - PLACE
      ?auto_8263 - HOIST
      ?auto_8258 - SURFACE
      ?auto_8266 - PLACE
      ?auto_8259 - HOIST
      ?auto_8267 - SURFACE
      ?auto_8260 - PLACE
      ?auto_8262 - HOIST
      ?auto_8264 - SURFACE
      ?auto_8265 - SURFACE
      ?auto_8252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8256 ?auto_8257 ) ( IS-CRATE ?auto_8251 ) ( not ( = ?auto_8255 ?auto_8257 ) ) ( HOIST-AT ?auto_8254 ?auto_8255 ) ( AVAILABLE ?auto_8254 ) ( SURFACE-AT ?auto_8251 ?auto_8255 ) ( ON ?auto_8251 ?auto_8253 ) ( CLEAR ?auto_8251 ) ( not ( = ?auto_8250 ?auto_8251 ) ) ( not ( = ?auto_8250 ?auto_8253 ) ) ( not ( = ?auto_8251 ?auto_8253 ) ) ( not ( = ?auto_8256 ?auto_8254 ) ) ( IS-CRATE ?auto_8250 ) ( not ( = ?auto_8261 ?auto_8257 ) ) ( HOIST-AT ?auto_8263 ?auto_8261 ) ( SURFACE-AT ?auto_8250 ?auto_8261 ) ( ON ?auto_8250 ?auto_8258 ) ( CLEAR ?auto_8250 ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8258 ) ) ( not ( = ?auto_8250 ?auto_8258 ) ) ( not ( = ?auto_8256 ?auto_8263 ) ) ( IS-CRATE ?auto_8249 ) ( not ( = ?auto_8266 ?auto_8257 ) ) ( HOIST-AT ?auto_8259 ?auto_8266 ) ( AVAILABLE ?auto_8259 ) ( SURFACE-AT ?auto_8249 ?auto_8266 ) ( ON ?auto_8249 ?auto_8267 ) ( CLEAR ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8248 ?auto_8267 ) ) ( not ( = ?auto_8249 ?auto_8267 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) ( IS-CRATE ?auto_8248 ) ( not ( = ?auto_8260 ?auto_8257 ) ) ( HOIST-AT ?auto_8262 ?auto_8260 ) ( AVAILABLE ?auto_8262 ) ( SURFACE-AT ?auto_8248 ?auto_8260 ) ( ON ?auto_8248 ?auto_8264 ) ( CLEAR ?auto_8248 ) ( not ( = ?auto_8247 ?auto_8248 ) ) ( not ( = ?auto_8247 ?auto_8264 ) ) ( not ( = ?auto_8248 ?auto_8264 ) ) ( not ( = ?auto_8256 ?auto_8262 ) ) ( SURFACE-AT ?auto_8246 ?auto_8257 ) ( CLEAR ?auto_8246 ) ( IS-CRATE ?auto_8247 ) ( AVAILABLE ?auto_8256 ) ( AVAILABLE ?auto_8263 ) ( SURFACE-AT ?auto_8247 ?auto_8261 ) ( ON ?auto_8247 ?auto_8265 ) ( CLEAR ?auto_8247 ) ( TRUCK-AT ?auto_8252 ?auto_8257 ) ( not ( = ?auto_8246 ?auto_8247 ) ) ( not ( = ?auto_8246 ?auto_8265 ) ) ( not ( = ?auto_8247 ?auto_8265 ) ) ( not ( = ?auto_8246 ?auto_8248 ) ) ( not ( = ?auto_8246 ?auto_8264 ) ) ( not ( = ?auto_8248 ?auto_8265 ) ) ( not ( = ?auto_8260 ?auto_8261 ) ) ( not ( = ?auto_8262 ?auto_8263 ) ) ( not ( = ?auto_8264 ?auto_8265 ) ) ( not ( = ?auto_8246 ?auto_8249 ) ) ( not ( = ?auto_8246 ?auto_8267 ) ) ( not ( = ?auto_8247 ?auto_8249 ) ) ( not ( = ?auto_8247 ?auto_8267 ) ) ( not ( = ?auto_8249 ?auto_8264 ) ) ( not ( = ?auto_8249 ?auto_8265 ) ) ( not ( = ?auto_8266 ?auto_8260 ) ) ( not ( = ?auto_8266 ?auto_8261 ) ) ( not ( = ?auto_8259 ?auto_8262 ) ) ( not ( = ?auto_8259 ?auto_8263 ) ) ( not ( = ?auto_8267 ?auto_8264 ) ) ( not ( = ?auto_8267 ?auto_8265 ) ) ( not ( = ?auto_8246 ?auto_8250 ) ) ( not ( = ?auto_8246 ?auto_8258 ) ) ( not ( = ?auto_8247 ?auto_8250 ) ) ( not ( = ?auto_8247 ?auto_8258 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8248 ?auto_8258 ) ) ( not ( = ?auto_8250 ?auto_8267 ) ) ( not ( = ?auto_8250 ?auto_8264 ) ) ( not ( = ?auto_8250 ?auto_8265 ) ) ( not ( = ?auto_8258 ?auto_8267 ) ) ( not ( = ?auto_8258 ?auto_8264 ) ) ( not ( = ?auto_8258 ?auto_8265 ) ) ( not ( = ?auto_8246 ?auto_8251 ) ) ( not ( = ?auto_8246 ?auto_8253 ) ) ( not ( = ?auto_8247 ?auto_8251 ) ) ( not ( = ?auto_8247 ?auto_8253 ) ) ( not ( = ?auto_8248 ?auto_8251 ) ) ( not ( = ?auto_8248 ?auto_8253 ) ) ( not ( = ?auto_8249 ?auto_8251 ) ) ( not ( = ?auto_8249 ?auto_8253 ) ) ( not ( = ?auto_8251 ?auto_8258 ) ) ( not ( = ?auto_8251 ?auto_8267 ) ) ( not ( = ?auto_8251 ?auto_8264 ) ) ( not ( = ?auto_8251 ?auto_8265 ) ) ( not ( = ?auto_8255 ?auto_8261 ) ) ( not ( = ?auto_8255 ?auto_8266 ) ) ( not ( = ?auto_8255 ?auto_8260 ) ) ( not ( = ?auto_8254 ?auto_8263 ) ) ( not ( = ?auto_8254 ?auto_8259 ) ) ( not ( = ?auto_8254 ?auto_8262 ) ) ( not ( = ?auto_8253 ?auto_8258 ) ) ( not ( = ?auto_8253 ?auto_8267 ) ) ( not ( = ?auto_8253 ?auto_8264 ) ) ( not ( = ?auto_8253 ?auto_8265 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8246 ?auto_8247 ?auto_8248 ?auto_8249 ?auto_8250 )
      ( MAKE-1CRATE ?auto_8250 ?auto_8251 )
      ( MAKE-5CRATE-VERIFY ?auto_8246 ?auto_8247 ?auto_8248 ?auto_8249 ?auto_8250 ?auto_8251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8270 - SURFACE
      ?auto_8271 - SURFACE
    )
    :vars
    (
      ?auto_8272 - HOIST
      ?auto_8273 - PLACE
      ?auto_8275 - PLACE
      ?auto_8276 - HOIST
      ?auto_8277 - SURFACE
      ?auto_8274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8272 ?auto_8273 ) ( SURFACE-AT ?auto_8270 ?auto_8273 ) ( CLEAR ?auto_8270 ) ( IS-CRATE ?auto_8271 ) ( AVAILABLE ?auto_8272 ) ( not ( = ?auto_8275 ?auto_8273 ) ) ( HOIST-AT ?auto_8276 ?auto_8275 ) ( AVAILABLE ?auto_8276 ) ( SURFACE-AT ?auto_8271 ?auto_8275 ) ( ON ?auto_8271 ?auto_8277 ) ( CLEAR ?auto_8271 ) ( TRUCK-AT ?auto_8274 ?auto_8273 ) ( not ( = ?auto_8270 ?auto_8271 ) ) ( not ( = ?auto_8270 ?auto_8277 ) ) ( not ( = ?auto_8271 ?auto_8277 ) ) ( not ( = ?auto_8272 ?auto_8276 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8274 ?auto_8273 ?auto_8275 )
      ( !LIFT ?auto_8276 ?auto_8271 ?auto_8277 ?auto_8275 )
      ( !LOAD ?auto_8276 ?auto_8271 ?auto_8274 ?auto_8275 )
      ( !DRIVE ?auto_8274 ?auto_8275 ?auto_8273 )
      ( !UNLOAD ?auto_8272 ?auto_8271 ?auto_8274 ?auto_8273 )
      ( !DROP ?auto_8272 ?auto_8271 ?auto_8270 ?auto_8273 )
      ( MAKE-1CRATE-VERIFY ?auto_8270 ?auto_8271 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8285 - SURFACE
      ?auto_8286 - SURFACE
      ?auto_8287 - SURFACE
      ?auto_8288 - SURFACE
      ?auto_8289 - SURFACE
      ?auto_8291 - SURFACE
      ?auto_8290 - SURFACE
    )
    :vars
    (
      ?auto_8293 - HOIST
      ?auto_8295 - PLACE
      ?auto_8297 - PLACE
      ?auto_8292 - HOIST
      ?auto_8294 - SURFACE
      ?auto_8301 - PLACE
      ?auto_8309 - HOIST
      ?auto_8306 - SURFACE
      ?auto_8308 - PLACE
      ?auto_8304 - HOIST
      ?auto_8307 - SURFACE
      ?auto_8310 - PLACE
      ?auto_8303 - HOIST
      ?auto_8300 - SURFACE
      ?auto_8302 - PLACE
      ?auto_8305 - HOIST
      ?auto_8299 - SURFACE
      ?auto_8298 - SURFACE
      ?auto_8296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8293 ?auto_8295 ) ( IS-CRATE ?auto_8290 ) ( not ( = ?auto_8297 ?auto_8295 ) ) ( HOIST-AT ?auto_8292 ?auto_8297 ) ( AVAILABLE ?auto_8292 ) ( SURFACE-AT ?auto_8290 ?auto_8297 ) ( ON ?auto_8290 ?auto_8294 ) ( CLEAR ?auto_8290 ) ( not ( = ?auto_8291 ?auto_8290 ) ) ( not ( = ?auto_8291 ?auto_8294 ) ) ( not ( = ?auto_8290 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8292 ) ) ( IS-CRATE ?auto_8291 ) ( not ( = ?auto_8301 ?auto_8295 ) ) ( HOIST-AT ?auto_8309 ?auto_8301 ) ( AVAILABLE ?auto_8309 ) ( SURFACE-AT ?auto_8291 ?auto_8301 ) ( ON ?auto_8291 ?auto_8306 ) ( CLEAR ?auto_8291 ) ( not ( = ?auto_8289 ?auto_8291 ) ) ( not ( = ?auto_8289 ?auto_8306 ) ) ( not ( = ?auto_8291 ?auto_8306 ) ) ( not ( = ?auto_8293 ?auto_8309 ) ) ( IS-CRATE ?auto_8289 ) ( not ( = ?auto_8308 ?auto_8295 ) ) ( HOIST-AT ?auto_8304 ?auto_8308 ) ( SURFACE-AT ?auto_8289 ?auto_8308 ) ( ON ?auto_8289 ?auto_8307 ) ( CLEAR ?auto_8289 ) ( not ( = ?auto_8288 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8307 ) ) ( not ( = ?auto_8289 ?auto_8307 ) ) ( not ( = ?auto_8293 ?auto_8304 ) ) ( IS-CRATE ?auto_8288 ) ( not ( = ?auto_8310 ?auto_8295 ) ) ( HOIST-AT ?auto_8303 ?auto_8310 ) ( AVAILABLE ?auto_8303 ) ( SURFACE-AT ?auto_8288 ?auto_8310 ) ( ON ?auto_8288 ?auto_8300 ) ( CLEAR ?auto_8288 ) ( not ( = ?auto_8287 ?auto_8288 ) ) ( not ( = ?auto_8287 ?auto_8300 ) ) ( not ( = ?auto_8288 ?auto_8300 ) ) ( not ( = ?auto_8293 ?auto_8303 ) ) ( IS-CRATE ?auto_8287 ) ( not ( = ?auto_8302 ?auto_8295 ) ) ( HOIST-AT ?auto_8305 ?auto_8302 ) ( AVAILABLE ?auto_8305 ) ( SURFACE-AT ?auto_8287 ?auto_8302 ) ( ON ?auto_8287 ?auto_8299 ) ( CLEAR ?auto_8287 ) ( not ( = ?auto_8286 ?auto_8287 ) ) ( not ( = ?auto_8286 ?auto_8299 ) ) ( not ( = ?auto_8287 ?auto_8299 ) ) ( not ( = ?auto_8293 ?auto_8305 ) ) ( SURFACE-AT ?auto_8285 ?auto_8295 ) ( CLEAR ?auto_8285 ) ( IS-CRATE ?auto_8286 ) ( AVAILABLE ?auto_8293 ) ( AVAILABLE ?auto_8304 ) ( SURFACE-AT ?auto_8286 ?auto_8308 ) ( ON ?auto_8286 ?auto_8298 ) ( CLEAR ?auto_8286 ) ( TRUCK-AT ?auto_8296 ?auto_8295 ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8298 ) ) ( not ( = ?auto_8286 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8299 ) ) ( not ( = ?auto_8287 ?auto_8298 ) ) ( not ( = ?auto_8302 ?auto_8308 ) ) ( not ( = ?auto_8305 ?auto_8304 ) ) ( not ( = ?auto_8299 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8285 ?auto_8300 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8300 ) ) ( not ( = ?auto_8288 ?auto_8299 ) ) ( not ( = ?auto_8288 ?auto_8298 ) ) ( not ( = ?auto_8310 ?auto_8302 ) ) ( not ( = ?auto_8310 ?auto_8308 ) ) ( not ( = ?auto_8303 ?auto_8305 ) ) ( not ( = ?auto_8303 ?auto_8304 ) ) ( not ( = ?auto_8300 ?auto_8299 ) ) ( not ( = ?auto_8300 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8289 ) ) ( not ( = ?auto_8285 ?auto_8307 ) ) ( not ( = ?auto_8286 ?auto_8289 ) ) ( not ( = ?auto_8286 ?auto_8307 ) ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8287 ?auto_8307 ) ) ( not ( = ?auto_8289 ?auto_8300 ) ) ( not ( = ?auto_8289 ?auto_8299 ) ) ( not ( = ?auto_8289 ?auto_8298 ) ) ( not ( = ?auto_8307 ?auto_8300 ) ) ( not ( = ?auto_8307 ?auto_8299 ) ) ( not ( = ?auto_8307 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8291 ) ) ( not ( = ?auto_8285 ?auto_8306 ) ) ( not ( = ?auto_8286 ?auto_8291 ) ) ( not ( = ?auto_8286 ?auto_8306 ) ) ( not ( = ?auto_8287 ?auto_8291 ) ) ( not ( = ?auto_8287 ?auto_8306 ) ) ( not ( = ?auto_8288 ?auto_8291 ) ) ( not ( = ?auto_8288 ?auto_8306 ) ) ( not ( = ?auto_8291 ?auto_8307 ) ) ( not ( = ?auto_8291 ?auto_8300 ) ) ( not ( = ?auto_8291 ?auto_8299 ) ) ( not ( = ?auto_8291 ?auto_8298 ) ) ( not ( = ?auto_8301 ?auto_8308 ) ) ( not ( = ?auto_8301 ?auto_8310 ) ) ( not ( = ?auto_8301 ?auto_8302 ) ) ( not ( = ?auto_8309 ?auto_8304 ) ) ( not ( = ?auto_8309 ?auto_8303 ) ) ( not ( = ?auto_8309 ?auto_8305 ) ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8306 ?auto_8300 ) ) ( not ( = ?auto_8306 ?auto_8299 ) ) ( not ( = ?auto_8306 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8290 ) ) ( not ( = ?auto_8285 ?auto_8294 ) ) ( not ( = ?auto_8286 ?auto_8290 ) ) ( not ( = ?auto_8286 ?auto_8294 ) ) ( not ( = ?auto_8287 ?auto_8290 ) ) ( not ( = ?auto_8287 ?auto_8294 ) ) ( not ( = ?auto_8288 ?auto_8290 ) ) ( not ( = ?auto_8288 ?auto_8294 ) ) ( not ( = ?auto_8289 ?auto_8290 ) ) ( not ( = ?auto_8289 ?auto_8294 ) ) ( not ( = ?auto_8290 ?auto_8306 ) ) ( not ( = ?auto_8290 ?auto_8307 ) ) ( not ( = ?auto_8290 ?auto_8300 ) ) ( not ( = ?auto_8290 ?auto_8299 ) ) ( not ( = ?auto_8290 ?auto_8298 ) ) ( not ( = ?auto_8297 ?auto_8301 ) ) ( not ( = ?auto_8297 ?auto_8308 ) ) ( not ( = ?auto_8297 ?auto_8310 ) ) ( not ( = ?auto_8297 ?auto_8302 ) ) ( not ( = ?auto_8292 ?auto_8309 ) ) ( not ( = ?auto_8292 ?auto_8304 ) ) ( not ( = ?auto_8292 ?auto_8303 ) ) ( not ( = ?auto_8292 ?auto_8305 ) ) ( not ( = ?auto_8294 ?auto_8306 ) ) ( not ( = ?auto_8294 ?auto_8307 ) ) ( not ( = ?auto_8294 ?auto_8300 ) ) ( not ( = ?auto_8294 ?auto_8299 ) ) ( not ( = ?auto_8294 ?auto_8298 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8285 ?auto_8286 ?auto_8287 ?auto_8288 ?auto_8289 ?auto_8291 )
      ( MAKE-1CRATE ?auto_8291 ?auto_8290 )
      ( MAKE-6CRATE-VERIFY ?auto_8285 ?auto_8286 ?auto_8287 ?auto_8288 ?auto_8289 ?auto_8291 ?auto_8290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8313 - SURFACE
      ?auto_8314 - SURFACE
    )
    :vars
    (
      ?auto_8315 - HOIST
      ?auto_8316 - PLACE
      ?auto_8318 - PLACE
      ?auto_8319 - HOIST
      ?auto_8320 - SURFACE
      ?auto_8317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8315 ?auto_8316 ) ( SURFACE-AT ?auto_8313 ?auto_8316 ) ( CLEAR ?auto_8313 ) ( IS-CRATE ?auto_8314 ) ( AVAILABLE ?auto_8315 ) ( not ( = ?auto_8318 ?auto_8316 ) ) ( HOIST-AT ?auto_8319 ?auto_8318 ) ( AVAILABLE ?auto_8319 ) ( SURFACE-AT ?auto_8314 ?auto_8318 ) ( ON ?auto_8314 ?auto_8320 ) ( CLEAR ?auto_8314 ) ( TRUCK-AT ?auto_8317 ?auto_8316 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8320 ) ) ( not ( = ?auto_8314 ?auto_8320 ) ) ( not ( = ?auto_8315 ?auto_8319 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8317 ?auto_8316 ?auto_8318 )
      ( !LIFT ?auto_8319 ?auto_8314 ?auto_8320 ?auto_8318 )
      ( !LOAD ?auto_8319 ?auto_8314 ?auto_8317 ?auto_8318 )
      ( !DRIVE ?auto_8317 ?auto_8318 ?auto_8316 )
      ( !UNLOAD ?auto_8315 ?auto_8314 ?auto_8317 ?auto_8316 )
      ( !DROP ?auto_8315 ?auto_8314 ?auto_8313 ?auto_8316 )
      ( MAKE-1CRATE-VERIFY ?auto_8313 ?auto_8314 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8329 - SURFACE
      ?auto_8330 - SURFACE
      ?auto_8331 - SURFACE
      ?auto_8332 - SURFACE
      ?auto_8333 - SURFACE
      ?auto_8335 - SURFACE
      ?auto_8334 - SURFACE
      ?auto_8336 - SURFACE
    )
    :vars
    (
      ?auto_8342 - HOIST
      ?auto_8340 - PLACE
      ?auto_8338 - PLACE
      ?auto_8341 - HOIST
      ?auto_8337 - SURFACE
      ?auto_8356 - PLACE
      ?auto_8343 - HOIST
      ?auto_8345 - SURFACE
      ?auto_8344 - PLACE
      ?auto_8350 - HOIST
      ?auto_8347 - SURFACE
      ?auto_8348 - PLACE
      ?auto_8353 - HOIST
      ?auto_8349 - SURFACE
      ?auto_8351 - PLACE
      ?auto_8354 - HOIST
      ?auto_8358 - SURFACE
      ?auto_8355 - PLACE
      ?auto_8352 - HOIST
      ?auto_8357 - SURFACE
      ?auto_8346 - SURFACE
      ?auto_8339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8342 ?auto_8340 ) ( IS-CRATE ?auto_8336 ) ( not ( = ?auto_8338 ?auto_8340 ) ) ( HOIST-AT ?auto_8341 ?auto_8338 ) ( AVAILABLE ?auto_8341 ) ( SURFACE-AT ?auto_8336 ?auto_8338 ) ( ON ?auto_8336 ?auto_8337 ) ( CLEAR ?auto_8336 ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8334 ?auto_8337 ) ) ( not ( = ?auto_8336 ?auto_8337 ) ) ( not ( = ?auto_8342 ?auto_8341 ) ) ( IS-CRATE ?auto_8334 ) ( not ( = ?auto_8356 ?auto_8340 ) ) ( HOIST-AT ?auto_8343 ?auto_8356 ) ( AVAILABLE ?auto_8343 ) ( SURFACE-AT ?auto_8334 ?auto_8356 ) ( ON ?auto_8334 ?auto_8345 ) ( CLEAR ?auto_8334 ) ( not ( = ?auto_8335 ?auto_8334 ) ) ( not ( = ?auto_8335 ?auto_8345 ) ) ( not ( = ?auto_8334 ?auto_8345 ) ) ( not ( = ?auto_8342 ?auto_8343 ) ) ( IS-CRATE ?auto_8335 ) ( not ( = ?auto_8344 ?auto_8340 ) ) ( HOIST-AT ?auto_8350 ?auto_8344 ) ( AVAILABLE ?auto_8350 ) ( SURFACE-AT ?auto_8335 ?auto_8344 ) ( ON ?auto_8335 ?auto_8347 ) ( CLEAR ?auto_8335 ) ( not ( = ?auto_8333 ?auto_8335 ) ) ( not ( = ?auto_8333 ?auto_8347 ) ) ( not ( = ?auto_8335 ?auto_8347 ) ) ( not ( = ?auto_8342 ?auto_8350 ) ) ( IS-CRATE ?auto_8333 ) ( not ( = ?auto_8348 ?auto_8340 ) ) ( HOIST-AT ?auto_8353 ?auto_8348 ) ( SURFACE-AT ?auto_8333 ?auto_8348 ) ( ON ?auto_8333 ?auto_8349 ) ( CLEAR ?auto_8333 ) ( not ( = ?auto_8332 ?auto_8333 ) ) ( not ( = ?auto_8332 ?auto_8349 ) ) ( not ( = ?auto_8333 ?auto_8349 ) ) ( not ( = ?auto_8342 ?auto_8353 ) ) ( IS-CRATE ?auto_8332 ) ( not ( = ?auto_8351 ?auto_8340 ) ) ( HOIST-AT ?auto_8354 ?auto_8351 ) ( AVAILABLE ?auto_8354 ) ( SURFACE-AT ?auto_8332 ?auto_8351 ) ( ON ?auto_8332 ?auto_8358 ) ( CLEAR ?auto_8332 ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8358 ) ) ( not ( = ?auto_8332 ?auto_8358 ) ) ( not ( = ?auto_8342 ?auto_8354 ) ) ( IS-CRATE ?auto_8331 ) ( not ( = ?auto_8355 ?auto_8340 ) ) ( HOIST-AT ?auto_8352 ?auto_8355 ) ( AVAILABLE ?auto_8352 ) ( SURFACE-AT ?auto_8331 ?auto_8355 ) ( ON ?auto_8331 ?auto_8357 ) ( CLEAR ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( not ( = ?auto_8330 ?auto_8357 ) ) ( not ( = ?auto_8331 ?auto_8357 ) ) ( not ( = ?auto_8342 ?auto_8352 ) ) ( SURFACE-AT ?auto_8329 ?auto_8340 ) ( CLEAR ?auto_8329 ) ( IS-CRATE ?auto_8330 ) ( AVAILABLE ?auto_8342 ) ( AVAILABLE ?auto_8353 ) ( SURFACE-AT ?auto_8330 ?auto_8348 ) ( ON ?auto_8330 ?auto_8346 ) ( CLEAR ?auto_8330 ) ( TRUCK-AT ?auto_8339 ?auto_8340 ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8346 ) ) ( not ( = ?auto_8330 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8331 ) ) ( not ( = ?auto_8329 ?auto_8357 ) ) ( not ( = ?auto_8331 ?auto_8346 ) ) ( not ( = ?auto_8355 ?auto_8348 ) ) ( not ( = ?auto_8352 ?auto_8353 ) ) ( not ( = ?auto_8357 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8332 ) ) ( not ( = ?auto_8329 ?auto_8358 ) ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8330 ?auto_8358 ) ) ( not ( = ?auto_8332 ?auto_8357 ) ) ( not ( = ?auto_8332 ?auto_8346 ) ) ( not ( = ?auto_8351 ?auto_8355 ) ) ( not ( = ?auto_8351 ?auto_8348 ) ) ( not ( = ?auto_8354 ?auto_8352 ) ) ( not ( = ?auto_8354 ?auto_8353 ) ) ( not ( = ?auto_8358 ?auto_8357 ) ) ( not ( = ?auto_8358 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8333 ) ) ( not ( = ?auto_8329 ?auto_8349 ) ) ( not ( = ?auto_8330 ?auto_8333 ) ) ( not ( = ?auto_8330 ?auto_8349 ) ) ( not ( = ?auto_8331 ?auto_8333 ) ) ( not ( = ?auto_8331 ?auto_8349 ) ) ( not ( = ?auto_8333 ?auto_8358 ) ) ( not ( = ?auto_8333 ?auto_8357 ) ) ( not ( = ?auto_8333 ?auto_8346 ) ) ( not ( = ?auto_8349 ?auto_8358 ) ) ( not ( = ?auto_8349 ?auto_8357 ) ) ( not ( = ?auto_8349 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8335 ) ) ( not ( = ?auto_8329 ?auto_8347 ) ) ( not ( = ?auto_8330 ?auto_8335 ) ) ( not ( = ?auto_8330 ?auto_8347 ) ) ( not ( = ?auto_8331 ?auto_8335 ) ) ( not ( = ?auto_8331 ?auto_8347 ) ) ( not ( = ?auto_8332 ?auto_8335 ) ) ( not ( = ?auto_8332 ?auto_8347 ) ) ( not ( = ?auto_8335 ?auto_8349 ) ) ( not ( = ?auto_8335 ?auto_8358 ) ) ( not ( = ?auto_8335 ?auto_8357 ) ) ( not ( = ?auto_8335 ?auto_8346 ) ) ( not ( = ?auto_8344 ?auto_8348 ) ) ( not ( = ?auto_8344 ?auto_8351 ) ) ( not ( = ?auto_8344 ?auto_8355 ) ) ( not ( = ?auto_8350 ?auto_8353 ) ) ( not ( = ?auto_8350 ?auto_8354 ) ) ( not ( = ?auto_8350 ?auto_8352 ) ) ( not ( = ?auto_8347 ?auto_8349 ) ) ( not ( = ?auto_8347 ?auto_8358 ) ) ( not ( = ?auto_8347 ?auto_8357 ) ) ( not ( = ?auto_8347 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8334 ) ) ( not ( = ?auto_8329 ?auto_8345 ) ) ( not ( = ?auto_8330 ?auto_8334 ) ) ( not ( = ?auto_8330 ?auto_8345 ) ) ( not ( = ?auto_8331 ?auto_8334 ) ) ( not ( = ?auto_8331 ?auto_8345 ) ) ( not ( = ?auto_8332 ?auto_8334 ) ) ( not ( = ?auto_8332 ?auto_8345 ) ) ( not ( = ?auto_8333 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8345 ) ) ( not ( = ?auto_8334 ?auto_8347 ) ) ( not ( = ?auto_8334 ?auto_8349 ) ) ( not ( = ?auto_8334 ?auto_8358 ) ) ( not ( = ?auto_8334 ?auto_8357 ) ) ( not ( = ?auto_8334 ?auto_8346 ) ) ( not ( = ?auto_8356 ?auto_8344 ) ) ( not ( = ?auto_8356 ?auto_8348 ) ) ( not ( = ?auto_8356 ?auto_8351 ) ) ( not ( = ?auto_8356 ?auto_8355 ) ) ( not ( = ?auto_8343 ?auto_8350 ) ) ( not ( = ?auto_8343 ?auto_8353 ) ) ( not ( = ?auto_8343 ?auto_8354 ) ) ( not ( = ?auto_8343 ?auto_8352 ) ) ( not ( = ?auto_8345 ?auto_8347 ) ) ( not ( = ?auto_8345 ?auto_8349 ) ) ( not ( = ?auto_8345 ?auto_8358 ) ) ( not ( = ?auto_8345 ?auto_8357 ) ) ( not ( = ?auto_8345 ?auto_8346 ) ) ( not ( = ?auto_8329 ?auto_8336 ) ) ( not ( = ?auto_8329 ?auto_8337 ) ) ( not ( = ?auto_8330 ?auto_8336 ) ) ( not ( = ?auto_8330 ?auto_8337 ) ) ( not ( = ?auto_8331 ?auto_8336 ) ) ( not ( = ?auto_8331 ?auto_8337 ) ) ( not ( = ?auto_8332 ?auto_8336 ) ) ( not ( = ?auto_8332 ?auto_8337 ) ) ( not ( = ?auto_8333 ?auto_8336 ) ) ( not ( = ?auto_8333 ?auto_8337 ) ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8337 ) ) ( not ( = ?auto_8336 ?auto_8345 ) ) ( not ( = ?auto_8336 ?auto_8347 ) ) ( not ( = ?auto_8336 ?auto_8349 ) ) ( not ( = ?auto_8336 ?auto_8358 ) ) ( not ( = ?auto_8336 ?auto_8357 ) ) ( not ( = ?auto_8336 ?auto_8346 ) ) ( not ( = ?auto_8338 ?auto_8356 ) ) ( not ( = ?auto_8338 ?auto_8344 ) ) ( not ( = ?auto_8338 ?auto_8348 ) ) ( not ( = ?auto_8338 ?auto_8351 ) ) ( not ( = ?auto_8338 ?auto_8355 ) ) ( not ( = ?auto_8341 ?auto_8343 ) ) ( not ( = ?auto_8341 ?auto_8350 ) ) ( not ( = ?auto_8341 ?auto_8353 ) ) ( not ( = ?auto_8341 ?auto_8354 ) ) ( not ( = ?auto_8341 ?auto_8352 ) ) ( not ( = ?auto_8337 ?auto_8345 ) ) ( not ( = ?auto_8337 ?auto_8347 ) ) ( not ( = ?auto_8337 ?auto_8349 ) ) ( not ( = ?auto_8337 ?auto_8358 ) ) ( not ( = ?auto_8337 ?auto_8357 ) ) ( not ( = ?auto_8337 ?auto_8346 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8329 ?auto_8330 ?auto_8331 ?auto_8332 ?auto_8333 ?auto_8335 ?auto_8334 )
      ( MAKE-1CRATE ?auto_8334 ?auto_8336 )
      ( MAKE-7CRATE-VERIFY ?auto_8329 ?auto_8330 ?auto_8331 ?auto_8332 ?auto_8333 ?auto_8335 ?auto_8334 ?auto_8336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8361 - SURFACE
      ?auto_8362 - SURFACE
    )
    :vars
    (
      ?auto_8363 - HOIST
      ?auto_8364 - PLACE
      ?auto_8366 - PLACE
      ?auto_8367 - HOIST
      ?auto_8368 - SURFACE
      ?auto_8365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8363 ?auto_8364 ) ( SURFACE-AT ?auto_8361 ?auto_8364 ) ( CLEAR ?auto_8361 ) ( IS-CRATE ?auto_8362 ) ( AVAILABLE ?auto_8363 ) ( not ( = ?auto_8366 ?auto_8364 ) ) ( HOIST-AT ?auto_8367 ?auto_8366 ) ( AVAILABLE ?auto_8367 ) ( SURFACE-AT ?auto_8362 ?auto_8366 ) ( ON ?auto_8362 ?auto_8368 ) ( CLEAR ?auto_8362 ) ( TRUCK-AT ?auto_8365 ?auto_8364 ) ( not ( = ?auto_8361 ?auto_8362 ) ) ( not ( = ?auto_8361 ?auto_8368 ) ) ( not ( = ?auto_8362 ?auto_8368 ) ) ( not ( = ?auto_8363 ?auto_8367 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8365 ?auto_8364 ?auto_8366 )
      ( !LIFT ?auto_8367 ?auto_8362 ?auto_8368 ?auto_8366 )
      ( !LOAD ?auto_8367 ?auto_8362 ?auto_8365 ?auto_8366 )
      ( !DRIVE ?auto_8365 ?auto_8366 ?auto_8364 )
      ( !UNLOAD ?auto_8363 ?auto_8362 ?auto_8365 ?auto_8364 )
      ( !DROP ?auto_8363 ?auto_8362 ?auto_8361 ?auto_8364 )
      ( MAKE-1CRATE-VERIFY ?auto_8361 ?auto_8362 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8378 - SURFACE
      ?auto_8379 - SURFACE
      ?auto_8380 - SURFACE
      ?auto_8381 - SURFACE
      ?auto_8382 - SURFACE
      ?auto_8384 - SURFACE
      ?auto_8383 - SURFACE
      ?auto_8386 - SURFACE
      ?auto_8385 - SURFACE
    )
    :vars
    (
      ?auto_8387 - HOIST
      ?auto_8390 - PLACE
      ?auto_8388 - PLACE
      ?auto_8389 - HOIST
      ?auto_8391 - SURFACE
      ?auto_8409 - PLACE
      ?auto_8410 - HOIST
      ?auto_8408 - SURFACE
      ?auto_8403 - PLACE
      ?auto_8397 - HOIST
      ?auto_8395 - SURFACE
      ?auto_8411 - PLACE
      ?auto_8404 - HOIST
      ?auto_8407 - SURFACE
      ?auto_8406 - PLACE
      ?auto_8399 - HOIST
      ?auto_8405 - SURFACE
      ?auto_8398 - PLACE
      ?auto_8401 - HOIST
      ?auto_8393 - SURFACE
      ?auto_8402 - PLACE
      ?auto_8400 - HOIST
      ?auto_8394 - SURFACE
      ?auto_8396 - SURFACE
      ?auto_8392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8387 ?auto_8390 ) ( IS-CRATE ?auto_8385 ) ( not ( = ?auto_8388 ?auto_8390 ) ) ( HOIST-AT ?auto_8389 ?auto_8388 ) ( AVAILABLE ?auto_8389 ) ( SURFACE-AT ?auto_8385 ?auto_8388 ) ( ON ?auto_8385 ?auto_8391 ) ( CLEAR ?auto_8385 ) ( not ( = ?auto_8386 ?auto_8385 ) ) ( not ( = ?auto_8386 ?auto_8391 ) ) ( not ( = ?auto_8385 ?auto_8391 ) ) ( not ( = ?auto_8387 ?auto_8389 ) ) ( IS-CRATE ?auto_8386 ) ( not ( = ?auto_8409 ?auto_8390 ) ) ( HOIST-AT ?auto_8410 ?auto_8409 ) ( AVAILABLE ?auto_8410 ) ( SURFACE-AT ?auto_8386 ?auto_8409 ) ( ON ?auto_8386 ?auto_8408 ) ( CLEAR ?auto_8386 ) ( not ( = ?auto_8383 ?auto_8386 ) ) ( not ( = ?auto_8383 ?auto_8408 ) ) ( not ( = ?auto_8386 ?auto_8408 ) ) ( not ( = ?auto_8387 ?auto_8410 ) ) ( IS-CRATE ?auto_8383 ) ( not ( = ?auto_8403 ?auto_8390 ) ) ( HOIST-AT ?auto_8397 ?auto_8403 ) ( AVAILABLE ?auto_8397 ) ( SURFACE-AT ?auto_8383 ?auto_8403 ) ( ON ?auto_8383 ?auto_8395 ) ( CLEAR ?auto_8383 ) ( not ( = ?auto_8384 ?auto_8383 ) ) ( not ( = ?auto_8384 ?auto_8395 ) ) ( not ( = ?auto_8383 ?auto_8395 ) ) ( not ( = ?auto_8387 ?auto_8397 ) ) ( IS-CRATE ?auto_8384 ) ( not ( = ?auto_8411 ?auto_8390 ) ) ( HOIST-AT ?auto_8404 ?auto_8411 ) ( AVAILABLE ?auto_8404 ) ( SURFACE-AT ?auto_8384 ?auto_8411 ) ( ON ?auto_8384 ?auto_8407 ) ( CLEAR ?auto_8384 ) ( not ( = ?auto_8382 ?auto_8384 ) ) ( not ( = ?auto_8382 ?auto_8407 ) ) ( not ( = ?auto_8384 ?auto_8407 ) ) ( not ( = ?auto_8387 ?auto_8404 ) ) ( IS-CRATE ?auto_8382 ) ( not ( = ?auto_8406 ?auto_8390 ) ) ( HOIST-AT ?auto_8399 ?auto_8406 ) ( SURFACE-AT ?auto_8382 ?auto_8406 ) ( ON ?auto_8382 ?auto_8405 ) ( CLEAR ?auto_8382 ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8405 ) ) ( not ( = ?auto_8382 ?auto_8405 ) ) ( not ( = ?auto_8387 ?auto_8399 ) ) ( IS-CRATE ?auto_8381 ) ( not ( = ?auto_8398 ?auto_8390 ) ) ( HOIST-AT ?auto_8401 ?auto_8398 ) ( AVAILABLE ?auto_8401 ) ( SURFACE-AT ?auto_8381 ?auto_8398 ) ( ON ?auto_8381 ?auto_8393 ) ( CLEAR ?auto_8381 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8393 ) ) ( not ( = ?auto_8381 ?auto_8393 ) ) ( not ( = ?auto_8387 ?auto_8401 ) ) ( IS-CRATE ?auto_8380 ) ( not ( = ?auto_8402 ?auto_8390 ) ) ( HOIST-AT ?auto_8400 ?auto_8402 ) ( AVAILABLE ?auto_8400 ) ( SURFACE-AT ?auto_8380 ?auto_8402 ) ( ON ?auto_8380 ?auto_8394 ) ( CLEAR ?auto_8380 ) ( not ( = ?auto_8379 ?auto_8380 ) ) ( not ( = ?auto_8379 ?auto_8394 ) ) ( not ( = ?auto_8380 ?auto_8394 ) ) ( not ( = ?auto_8387 ?auto_8400 ) ) ( SURFACE-AT ?auto_8378 ?auto_8390 ) ( CLEAR ?auto_8378 ) ( IS-CRATE ?auto_8379 ) ( AVAILABLE ?auto_8387 ) ( AVAILABLE ?auto_8399 ) ( SURFACE-AT ?auto_8379 ?auto_8406 ) ( ON ?auto_8379 ?auto_8396 ) ( CLEAR ?auto_8379 ) ( TRUCK-AT ?auto_8392 ?auto_8390 ) ( not ( = ?auto_8378 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8396 ) ) ( not ( = ?auto_8379 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8380 ) ) ( not ( = ?auto_8378 ?auto_8394 ) ) ( not ( = ?auto_8380 ?auto_8396 ) ) ( not ( = ?auto_8402 ?auto_8406 ) ) ( not ( = ?auto_8400 ?auto_8399 ) ) ( not ( = ?auto_8394 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8381 ) ) ( not ( = ?auto_8378 ?auto_8393 ) ) ( not ( = ?auto_8379 ?auto_8381 ) ) ( not ( = ?auto_8379 ?auto_8393 ) ) ( not ( = ?auto_8381 ?auto_8394 ) ) ( not ( = ?auto_8381 ?auto_8396 ) ) ( not ( = ?auto_8398 ?auto_8402 ) ) ( not ( = ?auto_8398 ?auto_8406 ) ) ( not ( = ?auto_8401 ?auto_8400 ) ) ( not ( = ?auto_8401 ?auto_8399 ) ) ( not ( = ?auto_8393 ?auto_8394 ) ) ( not ( = ?auto_8393 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8382 ) ) ( not ( = ?auto_8378 ?auto_8405 ) ) ( not ( = ?auto_8379 ?auto_8382 ) ) ( not ( = ?auto_8379 ?auto_8405 ) ) ( not ( = ?auto_8380 ?auto_8382 ) ) ( not ( = ?auto_8380 ?auto_8405 ) ) ( not ( = ?auto_8382 ?auto_8393 ) ) ( not ( = ?auto_8382 ?auto_8394 ) ) ( not ( = ?auto_8382 ?auto_8396 ) ) ( not ( = ?auto_8405 ?auto_8393 ) ) ( not ( = ?auto_8405 ?auto_8394 ) ) ( not ( = ?auto_8405 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8384 ) ) ( not ( = ?auto_8378 ?auto_8407 ) ) ( not ( = ?auto_8379 ?auto_8384 ) ) ( not ( = ?auto_8379 ?auto_8407 ) ) ( not ( = ?auto_8380 ?auto_8384 ) ) ( not ( = ?auto_8380 ?auto_8407 ) ) ( not ( = ?auto_8381 ?auto_8384 ) ) ( not ( = ?auto_8381 ?auto_8407 ) ) ( not ( = ?auto_8384 ?auto_8405 ) ) ( not ( = ?auto_8384 ?auto_8393 ) ) ( not ( = ?auto_8384 ?auto_8394 ) ) ( not ( = ?auto_8384 ?auto_8396 ) ) ( not ( = ?auto_8411 ?auto_8406 ) ) ( not ( = ?auto_8411 ?auto_8398 ) ) ( not ( = ?auto_8411 ?auto_8402 ) ) ( not ( = ?auto_8404 ?auto_8399 ) ) ( not ( = ?auto_8404 ?auto_8401 ) ) ( not ( = ?auto_8404 ?auto_8400 ) ) ( not ( = ?auto_8407 ?auto_8405 ) ) ( not ( = ?auto_8407 ?auto_8393 ) ) ( not ( = ?auto_8407 ?auto_8394 ) ) ( not ( = ?auto_8407 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8383 ) ) ( not ( = ?auto_8378 ?auto_8395 ) ) ( not ( = ?auto_8379 ?auto_8383 ) ) ( not ( = ?auto_8379 ?auto_8395 ) ) ( not ( = ?auto_8380 ?auto_8383 ) ) ( not ( = ?auto_8380 ?auto_8395 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8381 ?auto_8395 ) ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8395 ) ) ( not ( = ?auto_8383 ?auto_8407 ) ) ( not ( = ?auto_8383 ?auto_8405 ) ) ( not ( = ?auto_8383 ?auto_8393 ) ) ( not ( = ?auto_8383 ?auto_8394 ) ) ( not ( = ?auto_8383 ?auto_8396 ) ) ( not ( = ?auto_8403 ?auto_8411 ) ) ( not ( = ?auto_8403 ?auto_8406 ) ) ( not ( = ?auto_8403 ?auto_8398 ) ) ( not ( = ?auto_8403 ?auto_8402 ) ) ( not ( = ?auto_8397 ?auto_8404 ) ) ( not ( = ?auto_8397 ?auto_8399 ) ) ( not ( = ?auto_8397 ?auto_8401 ) ) ( not ( = ?auto_8397 ?auto_8400 ) ) ( not ( = ?auto_8395 ?auto_8407 ) ) ( not ( = ?auto_8395 ?auto_8405 ) ) ( not ( = ?auto_8395 ?auto_8393 ) ) ( not ( = ?auto_8395 ?auto_8394 ) ) ( not ( = ?auto_8395 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8386 ) ) ( not ( = ?auto_8378 ?auto_8408 ) ) ( not ( = ?auto_8379 ?auto_8386 ) ) ( not ( = ?auto_8379 ?auto_8408 ) ) ( not ( = ?auto_8380 ?auto_8386 ) ) ( not ( = ?auto_8380 ?auto_8408 ) ) ( not ( = ?auto_8381 ?auto_8386 ) ) ( not ( = ?auto_8381 ?auto_8408 ) ) ( not ( = ?auto_8382 ?auto_8386 ) ) ( not ( = ?auto_8382 ?auto_8408 ) ) ( not ( = ?auto_8384 ?auto_8386 ) ) ( not ( = ?auto_8384 ?auto_8408 ) ) ( not ( = ?auto_8386 ?auto_8395 ) ) ( not ( = ?auto_8386 ?auto_8407 ) ) ( not ( = ?auto_8386 ?auto_8405 ) ) ( not ( = ?auto_8386 ?auto_8393 ) ) ( not ( = ?auto_8386 ?auto_8394 ) ) ( not ( = ?auto_8386 ?auto_8396 ) ) ( not ( = ?auto_8409 ?auto_8403 ) ) ( not ( = ?auto_8409 ?auto_8411 ) ) ( not ( = ?auto_8409 ?auto_8406 ) ) ( not ( = ?auto_8409 ?auto_8398 ) ) ( not ( = ?auto_8409 ?auto_8402 ) ) ( not ( = ?auto_8410 ?auto_8397 ) ) ( not ( = ?auto_8410 ?auto_8404 ) ) ( not ( = ?auto_8410 ?auto_8399 ) ) ( not ( = ?auto_8410 ?auto_8401 ) ) ( not ( = ?auto_8410 ?auto_8400 ) ) ( not ( = ?auto_8408 ?auto_8395 ) ) ( not ( = ?auto_8408 ?auto_8407 ) ) ( not ( = ?auto_8408 ?auto_8405 ) ) ( not ( = ?auto_8408 ?auto_8393 ) ) ( not ( = ?auto_8408 ?auto_8394 ) ) ( not ( = ?auto_8408 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8385 ) ) ( not ( = ?auto_8378 ?auto_8391 ) ) ( not ( = ?auto_8379 ?auto_8385 ) ) ( not ( = ?auto_8379 ?auto_8391 ) ) ( not ( = ?auto_8380 ?auto_8385 ) ) ( not ( = ?auto_8380 ?auto_8391 ) ) ( not ( = ?auto_8381 ?auto_8385 ) ) ( not ( = ?auto_8381 ?auto_8391 ) ) ( not ( = ?auto_8382 ?auto_8385 ) ) ( not ( = ?auto_8382 ?auto_8391 ) ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8391 ) ) ( not ( = ?auto_8383 ?auto_8385 ) ) ( not ( = ?auto_8383 ?auto_8391 ) ) ( not ( = ?auto_8385 ?auto_8408 ) ) ( not ( = ?auto_8385 ?auto_8395 ) ) ( not ( = ?auto_8385 ?auto_8407 ) ) ( not ( = ?auto_8385 ?auto_8405 ) ) ( not ( = ?auto_8385 ?auto_8393 ) ) ( not ( = ?auto_8385 ?auto_8394 ) ) ( not ( = ?auto_8385 ?auto_8396 ) ) ( not ( = ?auto_8388 ?auto_8409 ) ) ( not ( = ?auto_8388 ?auto_8403 ) ) ( not ( = ?auto_8388 ?auto_8411 ) ) ( not ( = ?auto_8388 ?auto_8406 ) ) ( not ( = ?auto_8388 ?auto_8398 ) ) ( not ( = ?auto_8388 ?auto_8402 ) ) ( not ( = ?auto_8389 ?auto_8410 ) ) ( not ( = ?auto_8389 ?auto_8397 ) ) ( not ( = ?auto_8389 ?auto_8404 ) ) ( not ( = ?auto_8389 ?auto_8399 ) ) ( not ( = ?auto_8389 ?auto_8401 ) ) ( not ( = ?auto_8389 ?auto_8400 ) ) ( not ( = ?auto_8391 ?auto_8408 ) ) ( not ( = ?auto_8391 ?auto_8395 ) ) ( not ( = ?auto_8391 ?auto_8407 ) ) ( not ( = ?auto_8391 ?auto_8405 ) ) ( not ( = ?auto_8391 ?auto_8393 ) ) ( not ( = ?auto_8391 ?auto_8394 ) ) ( not ( = ?auto_8391 ?auto_8396 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8384 ?auto_8383 ?auto_8386 )
      ( MAKE-1CRATE ?auto_8386 ?auto_8385 )
      ( MAKE-8CRATE-VERIFY ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8384 ?auto_8383 ?auto_8386 ?auto_8385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8414 - SURFACE
      ?auto_8415 - SURFACE
    )
    :vars
    (
      ?auto_8416 - HOIST
      ?auto_8417 - PLACE
      ?auto_8419 - PLACE
      ?auto_8420 - HOIST
      ?auto_8421 - SURFACE
      ?auto_8418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8416 ?auto_8417 ) ( SURFACE-AT ?auto_8414 ?auto_8417 ) ( CLEAR ?auto_8414 ) ( IS-CRATE ?auto_8415 ) ( AVAILABLE ?auto_8416 ) ( not ( = ?auto_8419 ?auto_8417 ) ) ( HOIST-AT ?auto_8420 ?auto_8419 ) ( AVAILABLE ?auto_8420 ) ( SURFACE-AT ?auto_8415 ?auto_8419 ) ( ON ?auto_8415 ?auto_8421 ) ( CLEAR ?auto_8415 ) ( TRUCK-AT ?auto_8418 ?auto_8417 ) ( not ( = ?auto_8414 ?auto_8415 ) ) ( not ( = ?auto_8414 ?auto_8421 ) ) ( not ( = ?auto_8415 ?auto_8421 ) ) ( not ( = ?auto_8416 ?auto_8420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8418 ?auto_8417 ?auto_8419 )
      ( !LIFT ?auto_8420 ?auto_8415 ?auto_8421 ?auto_8419 )
      ( !LOAD ?auto_8420 ?auto_8415 ?auto_8418 ?auto_8419 )
      ( !DRIVE ?auto_8418 ?auto_8419 ?auto_8417 )
      ( !UNLOAD ?auto_8416 ?auto_8415 ?auto_8418 ?auto_8417 )
      ( !DROP ?auto_8416 ?auto_8415 ?auto_8414 ?auto_8417 )
      ( MAKE-1CRATE-VERIFY ?auto_8414 ?auto_8415 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8432 - SURFACE
      ?auto_8433 - SURFACE
      ?auto_8434 - SURFACE
      ?auto_8435 - SURFACE
      ?auto_8436 - SURFACE
      ?auto_8439 - SURFACE
      ?auto_8437 - SURFACE
      ?auto_8441 - SURFACE
      ?auto_8440 - SURFACE
      ?auto_8438 - SURFACE
    )
    :vars
    (
      ?auto_8445 - HOIST
      ?auto_8447 - PLACE
      ?auto_8446 - PLACE
      ?auto_8443 - HOIST
      ?auto_8444 - SURFACE
      ?auto_8465 - PLACE
      ?auto_8462 - HOIST
      ?auto_8464 - SURFACE
      ?auto_8449 - PLACE
      ?auto_8468 - HOIST
      ?auto_8451 - SURFACE
      ?auto_8453 - PLACE
      ?auto_8461 - HOIST
      ?auto_8463 - SURFACE
      ?auto_8450 - PLACE
      ?auto_8455 - HOIST
      ?auto_8466 - SURFACE
      ?auto_8457 - PLACE
      ?auto_8459 - HOIST
      ?auto_8456 - SURFACE
      ?auto_8460 - PLACE
      ?auto_8452 - HOIST
      ?auto_8469 - SURFACE
      ?auto_8454 - PLACE
      ?auto_8458 - HOIST
      ?auto_8467 - SURFACE
      ?auto_8448 - SURFACE
      ?auto_8442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8445 ?auto_8447 ) ( IS-CRATE ?auto_8438 ) ( not ( = ?auto_8446 ?auto_8447 ) ) ( HOIST-AT ?auto_8443 ?auto_8446 ) ( AVAILABLE ?auto_8443 ) ( SURFACE-AT ?auto_8438 ?auto_8446 ) ( ON ?auto_8438 ?auto_8444 ) ( CLEAR ?auto_8438 ) ( not ( = ?auto_8440 ?auto_8438 ) ) ( not ( = ?auto_8440 ?auto_8444 ) ) ( not ( = ?auto_8438 ?auto_8444 ) ) ( not ( = ?auto_8445 ?auto_8443 ) ) ( IS-CRATE ?auto_8440 ) ( not ( = ?auto_8465 ?auto_8447 ) ) ( HOIST-AT ?auto_8462 ?auto_8465 ) ( AVAILABLE ?auto_8462 ) ( SURFACE-AT ?auto_8440 ?auto_8465 ) ( ON ?auto_8440 ?auto_8464 ) ( CLEAR ?auto_8440 ) ( not ( = ?auto_8441 ?auto_8440 ) ) ( not ( = ?auto_8441 ?auto_8464 ) ) ( not ( = ?auto_8440 ?auto_8464 ) ) ( not ( = ?auto_8445 ?auto_8462 ) ) ( IS-CRATE ?auto_8441 ) ( not ( = ?auto_8449 ?auto_8447 ) ) ( HOIST-AT ?auto_8468 ?auto_8449 ) ( AVAILABLE ?auto_8468 ) ( SURFACE-AT ?auto_8441 ?auto_8449 ) ( ON ?auto_8441 ?auto_8451 ) ( CLEAR ?auto_8441 ) ( not ( = ?auto_8437 ?auto_8441 ) ) ( not ( = ?auto_8437 ?auto_8451 ) ) ( not ( = ?auto_8441 ?auto_8451 ) ) ( not ( = ?auto_8445 ?auto_8468 ) ) ( IS-CRATE ?auto_8437 ) ( not ( = ?auto_8453 ?auto_8447 ) ) ( HOIST-AT ?auto_8461 ?auto_8453 ) ( AVAILABLE ?auto_8461 ) ( SURFACE-AT ?auto_8437 ?auto_8453 ) ( ON ?auto_8437 ?auto_8463 ) ( CLEAR ?auto_8437 ) ( not ( = ?auto_8439 ?auto_8437 ) ) ( not ( = ?auto_8439 ?auto_8463 ) ) ( not ( = ?auto_8437 ?auto_8463 ) ) ( not ( = ?auto_8445 ?auto_8461 ) ) ( IS-CRATE ?auto_8439 ) ( not ( = ?auto_8450 ?auto_8447 ) ) ( HOIST-AT ?auto_8455 ?auto_8450 ) ( AVAILABLE ?auto_8455 ) ( SURFACE-AT ?auto_8439 ?auto_8450 ) ( ON ?auto_8439 ?auto_8466 ) ( CLEAR ?auto_8439 ) ( not ( = ?auto_8436 ?auto_8439 ) ) ( not ( = ?auto_8436 ?auto_8466 ) ) ( not ( = ?auto_8439 ?auto_8466 ) ) ( not ( = ?auto_8445 ?auto_8455 ) ) ( IS-CRATE ?auto_8436 ) ( not ( = ?auto_8457 ?auto_8447 ) ) ( HOIST-AT ?auto_8459 ?auto_8457 ) ( SURFACE-AT ?auto_8436 ?auto_8457 ) ( ON ?auto_8436 ?auto_8456 ) ( CLEAR ?auto_8436 ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8435 ?auto_8456 ) ) ( not ( = ?auto_8436 ?auto_8456 ) ) ( not ( = ?auto_8445 ?auto_8459 ) ) ( IS-CRATE ?auto_8435 ) ( not ( = ?auto_8460 ?auto_8447 ) ) ( HOIST-AT ?auto_8452 ?auto_8460 ) ( AVAILABLE ?auto_8452 ) ( SURFACE-AT ?auto_8435 ?auto_8460 ) ( ON ?auto_8435 ?auto_8469 ) ( CLEAR ?auto_8435 ) ( not ( = ?auto_8434 ?auto_8435 ) ) ( not ( = ?auto_8434 ?auto_8469 ) ) ( not ( = ?auto_8435 ?auto_8469 ) ) ( not ( = ?auto_8445 ?auto_8452 ) ) ( IS-CRATE ?auto_8434 ) ( not ( = ?auto_8454 ?auto_8447 ) ) ( HOIST-AT ?auto_8458 ?auto_8454 ) ( AVAILABLE ?auto_8458 ) ( SURFACE-AT ?auto_8434 ?auto_8454 ) ( ON ?auto_8434 ?auto_8467 ) ( CLEAR ?auto_8434 ) ( not ( = ?auto_8433 ?auto_8434 ) ) ( not ( = ?auto_8433 ?auto_8467 ) ) ( not ( = ?auto_8434 ?auto_8467 ) ) ( not ( = ?auto_8445 ?auto_8458 ) ) ( SURFACE-AT ?auto_8432 ?auto_8447 ) ( CLEAR ?auto_8432 ) ( IS-CRATE ?auto_8433 ) ( AVAILABLE ?auto_8445 ) ( AVAILABLE ?auto_8459 ) ( SURFACE-AT ?auto_8433 ?auto_8457 ) ( ON ?auto_8433 ?auto_8448 ) ( CLEAR ?auto_8433 ) ( TRUCK-AT ?auto_8442 ?auto_8447 ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( not ( = ?auto_8432 ?auto_8448 ) ) ( not ( = ?auto_8433 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8434 ) ) ( not ( = ?auto_8432 ?auto_8467 ) ) ( not ( = ?auto_8434 ?auto_8448 ) ) ( not ( = ?auto_8454 ?auto_8457 ) ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( not ( = ?auto_8467 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8435 ) ) ( not ( = ?auto_8432 ?auto_8469 ) ) ( not ( = ?auto_8433 ?auto_8435 ) ) ( not ( = ?auto_8433 ?auto_8469 ) ) ( not ( = ?auto_8435 ?auto_8467 ) ) ( not ( = ?auto_8435 ?auto_8448 ) ) ( not ( = ?auto_8460 ?auto_8454 ) ) ( not ( = ?auto_8460 ?auto_8457 ) ) ( not ( = ?auto_8452 ?auto_8458 ) ) ( not ( = ?auto_8452 ?auto_8459 ) ) ( not ( = ?auto_8469 ?auto_8467 ) ) ( not ( = ?auto_8469 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8436 ) ) ( not ( = ?auto_8432 ?auto_8456 ) ) ( not ( = ?auto_8433 ?auto_8436 ) ) ( not ( = ?auto_8433 ?auto_8456 ) ) ( not ( = ?auto_8434 ?auto_8436 ) ) ( not ( = ?auto_8434 ?auto_8456 ) ) ( not ( = ?auto_8436 ?auto_8469 ) ) ( not ( = ?auto_8436 ?auto_8467 ) ) ( not ( = ?auto_8436 ?auto_8448 ) ) ( not ( = ?auto_8456 ?auto_8469 ) ) ( not ( = ?auto_8456 ?auto_8467 ) ) ( not ( = ?auto_8456 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8439 ) ) ( not ( = ?auto_8432 ?auto_8466 ) ) ( not ( = ?auto_8433 ?auto_8439 ) ) ( not ( = ?auto_8433 ?auto_8466 ) ) ( not ( = ?auto_8434 ?auto_8439 ) ) ( not ( = ?auto_8434 ?auto_8466 ) ) ( not ( = ?auto_8435 ?auto_8439 ) ) ( not ( = ?auto_8435 ?auto_8466 ) ) ( not ( = ?auto_8439 ?auto_8456 ) ) ( not ( = ?auto_8439 ?auto_8469 ) ) ( not ( = ?auto_8439 ?auto_8467 ) ) ( not ( = ?auto_8439 ?auto_8448 ) ) ( not ( = ?auto_8450 ?auto_8457 ) ) ( not ( = ?auto_8450 ?auto_8460 ) ) ( not ( = ?auto_8450 ?auto_8454 ) ) ( not ( = ?auto_8455 ?auto_8459 ) ) ( not ( = ?auto_8455 ?auto_8452 ) ) ( not ( = ?auto_8455 ?auto_8458 ) ) ( not ( = ?auto_8466 ?auto_8456 ) ) ( not ( = ?auto_8466 ?auto_8469 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8437 ) ) ( not ( = ?auto_8432 ?auto_8463 ) ) ( not ( = ?auto_8433 ?auto_8437 ) ) ( not ( = ?auto_8433 ?auto_8463 ) ) ( not ( = ?auto_8434 ?auto_8437 ) ) ( not ( = ?auto_8434 ?auto_8463 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8463 ) ) ( not ( = ?auto_8436 ?auto_8437 ) ) ( not ( = ?auto_8436 ?auto_8463 ) ) ( not ( = ?auto_8437 ?auto_8466 ) ) ( not ( = ?auto_8437 ?auto_8456 ) ) ( not ( = ?auto_8437 ?auto_8469 ) ) ( not ( = ?auto_8437 ?auto_8467 ) ) ( not ( = ?auto_8437 ?auto_8448 ) ) ( not ( = ?auto_8453 ?auto_8450 ) ) ( not ( = ?auto_8453 ?auto_8457 ) ) ( not ( = ?auto_8453 ?auto_8460 ) ) ( not ( = ?auto_8453 ?auto_8454 ) ) ( not ( = ?auto_8461 ?auto_8455 ) ) ( not ( = ?auto_8461 ?auto_8459 ) ) ( not ( = ?auto_8461 ?auto_8452 ) ) ( not ( = ?auto_8461 ?auto_8458 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8456 ) ) ( not ( = ?auto_8463 ?auto_8469 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8441 ) ) ( not ( = ?auto_8432 ?auto_8451 ) ) ( not ( = ?auto_8433 ?auto_8441 ) ) ( not ( = ?auto_8433 ?auto_8451 ) ) ( not ( = ?auto_8434 ?auto_8441 ) ) ( not ( = ?auto_8434 ?auto_8451 ) ) ( not ( = ?auto_8435 ?auto_8441 ) ) ( not ( = ?auto_8435 ?auto_8451 ) ) ( not ( = ?auto_8436 ?auto_8441 ) ) ( not ( = ?auto_8436 ?auto_8451 ) ) ( not ( = ?auto_8439 ?auto_8441 ) ) ( not ( = ?auto_8439 ?auto_8451 ) ) ( not ( = ?auto_8441 ?auto_8463 ) ) ( not ( = ?auto_8441 ?auto_8466 ) ) ( not ( = ?auto_8441 ?auto_8456 ) ) ( not ( = ?auto_8441 ?auto_8469 ) ) ( not ( = ?auto_8441 ?auto_8467 ) ) ( not ( = ?auto_8441 ?auto_8448 ) ) ( not ( = ?auto_8449 ?auto_8453 ) ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8457 ) ) ( not ( = ?auto_8449 ?auto_8460 ) ) ( not ( = ?auto_8449 ?auto_8454 ) ) ( not ( = ?auto_8468 ?auto_8461 ) ) ( not ( = ?auto_8468 ?auto_8455 ) ) ( not ( = ?auto_8468 ?auto_8459 ) ) ( not ( = ?auto_8468 ?auto_8452 ) ) ( not ( = ?auto_8468 ?auto_8458 ) ) ( not ( = ?auto_8451 ?auto_8463 ) ) ( not ( = ?auto_8451 ?auto_8466 ) ) ( not ( = ?auto_8451 ?auto_8456 ) ) ( not ( = ?auto_8451 ?auto_8469 ) ) ( not ( = ?auto_8451 ?auto_8467 ) ) ( not ( = ?auto_8451 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8440 ) ) ( not ( = ?auto_8432 ?auto_8464 ) ) ( not ( = ?auto_8433 ?auto_8440 ) ) ( not ( = ?auto_8433 ?auto_8464 ) ) ( not ( = ?auto_8434 ?auto_8440 ) ) ( not ( = ?auto_8434 ?auto_8464 ) ) ( not ( = ?auto_8435 ?auto_8440 ) ) ( not ( = ?auto_8435 ?auto_8464 ) ) ( not ( = ?auto_8436 ?auto_8440 ) ) ( not ( = ?auto_8436 ?auto_8464 ) ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8464 ) ) ( not ( = ?auto_8437 ?auto_8440 ) ) ( not ( = ?auto_8437 ?auto_8464 ) ) ( not ( = ?auto_8440 ?auto_8451 ) ) ( not ( = ?auto_8440 ?auto_8463 ) ) ( not ( = ?auto_8440 ?auto_8466 ) ) ( not ( = ?auto_8440 ?auto_8456 ) ) ( not ( = ?auto_8440 ?auto_8469 ) ) ( not ( = ?auto_8440 ?auto_8467 ) ) ( not ( = ?auto_8440 ?auto_8448 ) ) ( not ( = ?auto_8465 ?auto_8449 ) ) ( not ( = ?auto_8465 ?auto_8453 ) ) ( not ( = ?auto_8465 ?auto_8450 ) ) ( not ( = ?auto_8465 ?auto_8457 ) ) ( not ( = ?auto_8465 ?auto_8460 ) ) ( not ( = ?auto_8465 ?auto_8454 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( not ( = ?auto_8462 ?auto_8461 ) ) ( not ( = ?auto_8462 ?auto_8455 ) ) ( not ( = ?auto_8462 ?auto_8459 ) ) ( not ( = ?auto_8462 ?auto_8452 ) ) ( not ( = ?auto_8462 ?auto_8458 ) ) ( not ( = ?auto_8464 ?auto_8451 ) ) ( not ( = ?auto_8464 ?auto_8463 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8456 ) ) ( not ( = ?auto_8464 ?auto_8469 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8448 ) ) ( not ( = ?auto_8432 ?auto_8438 ) ) ( not ( = ?auto_8432 ?auto_8444 ) ) ( not ( = ?auto_8433 ?auto_8438 ) ) ( not ( = ?auto_8433 ?auto_8444 ) ) ( not ( = ?auto_8434 ?auto_8438 ) ) ( not ( = ?auto_8434 ?auto_8444 ) ) ( not ( = ?auto_8435 ?auto_8438 ) ) ( not ( = ?auto_8435 ?auto_8444 ) ) ( not ( = ?auto_8436 ?auto_8438 ) ) ( not ( = ?auto_8436 ?auto_8444 ) ) ( not ( = ?auto_8439 ?auto_8438 ) ) ( not ( = ?auto_8439 ?auto_8444 ) ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8437 ?auto_8444 ) ) ( not ( = ?auto_8441 ?auto_8438 ) ) ( not ( = ?auto_8441 ?auto_8444 ) ) ( not ( = ?auto_8438 ?auto_8464 ) ) ( not ( = ?auto_8438 ?auto_8451 ) ) ( not ( = ?auto_8438 ?auto_8463 ) ) ( not ( = ?auto_8438 ?auto_8466 ) ) ( not ( = ?auto_8438 ?auto_8456 ) ) ( not ( = ?auto_8438 ?auto_8469 ) ) ( not ( = ?auto_8438 ?auto_8467 ) ) ( not ( = ?auto_8438 ?auto_8448 ) ) ( not ( = ?auto_8446 ?auto_8465 ) ) ( not ( = ?auto_8446 ?auto_8449 ) ) ( not ( = ?auto_8446 ?auto_8453 ) ) ( not ( = ?auto_8446 ?auto_8450 ) ) ( not ( = ?auto_8446 ?auto_8457 ) ) ( not ( = ?auto_8446 ?auto_8460 ) ) ( not ( = ?auto_8446 ?auto_8454 ) ) ( not ( = ?auto_8443 ?auto_8462 ) ) ( not ( = ?auto_8443 ?auto_8468 ) ) ( not ( = ?auto_8443 ?auto_8461 ) ) ( not ( = ?auto_8443 ?auto_8455 ) ) ( not ( = ?auto_8443 ?auto_8459 ) ) ( not ( = ?auto_8443 ?auto_8452 ) ) ( not ( = ?auto_8443 ?auto_8458 ) ) ( not ( = ?auto_8444 ?auto_8464 ) ) ( not ( = ?auto_8444 ?auto_8451 ) ) ( not ( = ?auto_8444 ?auto_8463 ) ) ( not ( = ?auto_8444 ?auto_8466 ) ) ( not ( = ?auto_8444 ?auto_8456 ) ) ( not ( = ?auto_8444 ?auto_8469 ) ) ( not ( = ?auto_8444 ?auto_8467 ) ) ( not ( = ?auto_8444 ?auto_8448 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8432 ?auto_8433 ?auto_8434 ?auto_8435 ?auto_8436 ?auto_8439 ?auto_8437 ?auto_8441 ?auto_8440 )
      ( MAKE-1CRATE ?auto_8440 ?auto_8438 )
      ( MAKE-9CRATE-VERIFY ?auto_8432 ?auto_8433 ?auto_8434 ?auto_8435 ?auto_8436 ?auto_8439 ?auto_8437 ?auto_8441 ?auto_8440 ?auto_8438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8472 - SURFACE
      ?auto_8473 - SURFACE
    )
    :vars
    (
      ?auto_8474 - HOIST
      ?auto_8475 - PLACE
      ?auto_8477 - PLACE
      ?auto_8478 - HOIST
      ?auto_8479 - SURFACE
      ?auto_8476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8474 ?auto_8475 ) ( SURFACE-AT ?auto_8472 ?auto_8475 ) ( CLEAR ?auto_8472 ) ( IS-CRATE ?auto_8473 ) ( AVAILABLE ?auto_8474 ) ( not ( = ?auto_8477 ?auto_8475 ) ) ( HOIST-AT ?auto_8478 ?auto_8477 ) ( AVAILABLE ?auto_8478 ) ( SURFACE-AT ?auto_8473 ?auto_8477 ) ( ON ?auto_8473 ?auto_8479 ) ( CLEAR ?auto_8473 ) ( TRUCK-AT ?auto_8476 ?auto_8475 ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( not ( = ?auto_8472 ?auto_8479 ) ) ( not ( = ?auto_8473 ?auto_8479 ) ) ( not ( = ?auto_8474 ?auto_8478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8476 ?auto_8475 ?auto_8477 )
      ( !LIFT ?auto_8478 ?auto_8473 ?auto_8479 ?auto_8477 )
      ( !LOAD ?auto_8478 ?auto_8473 ?auto_8476 ?auto_8477 )
      ( !DRIVE ?auto_8476 ?auto_8477 ?auto_8475 )
      ( !UNLOAD ?auto_8474 ?auto_8473 ?auto_8476 ?auto_8475 )
      ( !DROP ?auto_8474 ?auto_8473 ?auto_8472 ?auto_8475 )
      ( MAKE-1CRATE-VERIFY ?auto_8472 ?auto_8473 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8491 - SURFACE
      ?auto_8492 - SURFACE
      ?auto_8493 - SURFACE
      ?auto_8494 - SURFACE
      ?auto_8495 - SURFACE
      ?auto_8498 - SURFACE
      ?auto_8496 - SURFACE
      ?auto_8500 - SURFACE
      ?auto_8499 - SURFACE
      ?auto_8497 - SURFACE
      ?auto_8501 - SURFACE
    )
    :vars
    (
      ?auto_8507 - HOIST
      ?auto_8505 - PLACE
      ?auto_8504 - PLACE
      ?auto_8502 - HOIST
      ?auto_8503 - SURFACE
      ?auto_8511 - PLACE
      ?auto_8518 - HOIST
      ?auto_8513 - SURFACE
      ?auto_8528 - PLACE
      ?auto_8514 - HOIST
      ?auto_8524 - SURFACE
      ?auto_8516 - PLACE
      ?auto_8519 - HOIST
      ?auto_8512 - SURFACE
      ?auto_8522 - PLACE
      ?auto_8532 - HOIST
      ?auto_8510 - SURFACE
      ?auto_8525 - PLACE
      ?auto_8508 - HOIST
      ?auto_8517 - SURFACE
      ?auto_8531 - PLACE
      ?auto_8509 - HOIST
      ?auto_8530 - SURFACE
      ?auto_8527 - PLACE
      ?auto_8521 - HOIST
      ?auto_8529 - SURFACE
      ?auto_8523 - PLACE
      ?auto_8526 - HOIST
      ?auto_8520 - SURFACE
      ?auto_8515 - SURFACE
      ?auto_8506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8507 ?auto_8505 ) ( IS-CRATE ?auto_8501 ) ( not ( = ?auto_8504 ?auto_8505 ) ) ( HOIST-AT ?auto_8502 ?auto_8504 ) ( AVAILABLE ?auto_8502 ) ( SURFACE-AT ?auto_8501 ?auto_8504 ) ( ON ?auto_8501 ?auto_8503 ) ( CLEAR ?auto_8501 ) ( not ( = ?auto_8497 ?auto_8501 ) ) ( not ( = ?auto_8497 ?auto_8503 ) ) ( not ( = ?auto_8501 ?auto_8503 ) ) ( not ( = ?auto_8507 ?auto_8502 ) ) ( IS-CRATE ?auto_8497 ) ( not ( = ?auto_8511 ?auto_8505 ) ) ( HOIST-AT ?auto_8518 ?auto_8511 ) ( AVAILABLE ?auto_8518 ) ( SURFACE-AT ?auto_8497 ?auto_8511 ) ( ON ?auto_8497 ?auto_8513 ) ( CLEAR ?auto_8497 ) ( not ( = ?auto_8499 ?auto_8497 ) ) ( not ( = ?auto_8499 ?auto_8513 ) ) ( not ( = ?auto_8497 ?auto_8513 ) ) ( not ( = ?auto_8507 ?auto_8518 ) ) ( IS-CRATE ?auto_8499 ) ( not ( = ?auto_8528 ?auto_8505 ) ) ( HOIST-AT ?auto_8514 ?auto_8528 ) ( AVAILABLE ?auto_8514 ) ( SURFACE-AT ?auto_8499 ?auto_8528 ) ( ON ?auto_8499 ?auto_8524 ) ( CLEAR ?auto_8499 ) ( not ( = ?auto_8500 ?auto_8499 ) ) ( not ( = ?auto_8500 ?auto_8524 ) ) ( not ( = ?auto_8499 ?auto_8524 ) ) ( not ( = ?auto_8507 ?auto_8514 ) ) ( IS-CRATE ?auto_8500 ) ( not ( = ?auto_8516 ?auto_8505 ) ) ( HOIST-AT ?auto_8519 ?auto_8516 ) ( AVAILABLE ?auto_8519 ) ( SURFACE-AT ?auto_8500 ?auto_8516 ) ( ON ?auto_8500 ?auto_8512 ) ( CLEAR ?auto_8500 ) ( not ( = ?auto_8496 ?auto_8500 ) ) ( not ( = ?auto_8496 ?auto_8512 ) ) ( not ( = ?auto_8500 ?auto_8512 ) ) ( not ( = ?auto_8507 ?auto_8519 ) ) ( IS-CRATE ?auto_8496 ) ( not ( = ?auto_8522 ?auto_8505 ) ) ( HOIST-AT ?auto_8532 ?auto_8522 ) ( AVAILABLE ?auto_8532 ) ( SURFACE-AT ?auto_8496 ?auto_8522 ) ( ON ?auto_8496 ?auto_8510 ) ( CLEAR ?auto_8496 ) ( not ( = ?auto_8498 ?auto_8496 ) ) ( not ( = ?auto_8498 ?auto_8510 ) ) ( not ( = ?auto_8496 ?auto_8510 ) ) ( not ( = ?auto_8507 ?auto_8532 ) ) ( IS-CRATE ?auto_8498 ) ( not ( = ?auto_8525 ?auto_8505 ) ) ( HOIST-AT ?auto_8508 ?auto_8525 ) ( AVAILABLE ?auto_8508 ) ( SURFACE-AT ?auto_8498 ?auto_8525 ) ( ON ?auto_8498 ?auto_8517 ) ( CLEAR ?auto_8498 ) ( not ( = ?auto_8495 ?auto_8498 ) ) ( not ( = ?auto_8495 ?auto_8517 ) ) ( not ( = ?auto_8498 ?auto_8517 ) ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( IS-CRATE ?auto_8495 ) ( not ( = ?auto_8531 ?auto_8505 ) ) ( HOIST-AT ?auto_8509 ?auto_8531 ) ( SURFACE-AT ?auto_8495 ?auto_8531 ) ( ON ?auto_8495 ?auto_8530 ) ( CLEAR ?auto_8495 ) ( not ( = ?auto_8494 ?auto_8495 ) ) ( not ( = ?auto_8494 ?auto_8530 ) ) ( not ( = ?auto_8495 ?auto_8530 ) ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( IS-CRATE ?auto_8494 ) ( not ( = ?auto_8527 ?auto_8505 ) ) ( HOIST-AT ?auto_8521 ?auto_8527 ) ( AVAILABLE ?auto_8521 ) ( SURFACE-AT ?auto_8494 ?auto_8527 ) ( ON ?auto_8494 ?auto_8529 ) ( CLEAR ?auto_8494 ) ( not ( = ?auto_8493 ?auto_8494 ) ) ( not ( = ?auto_8493 ?auto_8529 ) ) ( not ( = ?auto_8494 ?auto_8529 ) ) ( not ( = ?auto_8507 ?auto_8521 ) ) ( IS-CRATE ?auto_8493 ) ( not ( = ?auto_8523 ?auto_8505 ) ) ( HOIST-AT ?auto_8526 ?auto_8523 ) ( AVAILABLE ?auto_8526 ) ( SURFACE-AT ?auto_8493 ?auto_8523 ) ( ON ?auto_8493 ?auto_8520 ) ( CLEAR ?auto_8493 ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8520 ) ) ( not ( = ?auto_8493 ?auto_8520 ) ) ( not ( = ?auto_8507 ?auto_8526 ) ) ( SURFACE-AT ?auto_8491 ?auto_8505 ) ( CLEAR ?auto_8491 ) ( IS-CRATE ?auto_8492 ) ( AVAILABLE ?auto_8507 ) ( AVAILABLE ?auto_8509 ) ( SURFACE-AT ?auto_8492 ?auto_8531 ) ( ON ?auto_8492 ?auto_8515 ) ( CLEAR ?auto_8492 ) ( TRUCK-AT ?auto_8506 ?auto_8505 ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( not ( = ?auto_8491 ?auto_8515 ) ) ( not ( = ?auto_8492 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8493 ) ) ( not ( = ?auto_8491 ?auto_8520 ) ) ( not ( = ?auto_8493 ?auto_8515 ) ) ( not ( = ?auto_8523 ?auto_8531 ) ) ( not ( = ?auto_8526 ?auto_8509 ) ) ( not ( = ?auto_8520 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8494 ) ) ( not ( = ?auto_8491 ?auto_8529 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) ( not ( = ?auto_8492 ?auto_8529 ) ) ( not ( = ?auto_8494 ?auto_8520 ) ) ( not ( = ?auto_8494 ?auto_8515 ) ) ( not ( = ?auto_8527 ?auto_8523 ) ) ( not ( = ?auto_8527 ?auto_8531 ) ) ( not ( = ?auto_8521 ?auto_8526 ) ) ( not ( = ?auto_8521 ?auto_8509 ) ) ( not ( = ?auto_8529 ?auto_8520 ) ) ( not ( = ?auto_8529 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8495 ) ) ( not ( = ?auto_8491 ?auto_8530 ) ) ( not ( = ?auto_8492 ?auto_8495 ) ) ( not ( = ?auto_8492 ?auto_8530 ) ) ( not ( = ?auto_8493 ?auto_8495 ) ) ( not ( = ?auto_8493 ?auto_8530 ) ) ( not ( = ?auto_8495 ?auto_8529 ) ) ( not ( = ?auto_8495 ?auto_8520 ) ) ( not ( = ?auto_8495 ?auto_8515 ) ) ( not ( = ?auto_8530 ?auto_8529 ) ) ( not ( = ?auto_8530 ?auto_8520 ) ) ( not ( = ?auto_8530 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8498 ) ) ( not ( = ?auto_8491 ?auto_8517 ) ) ( not ( = ?auto_8492 ?auto_8498 ) ) ( not ( = ?auto_8492 ?auto_8517 ) ) ( not ( = ?auto_8493 ?auto_8498 ) ) ( not ( = ?auto_8493 ?auto_8517 ) ) ( not ( = ?auto_8494 ?auto_8498 ) ) ( not ( = ?auto_8494 ?auto_8517 ) ) ( not ( = ?auto_8498 ?auto_8530 ) ) ( not ( = ?auto_8498 ?auto_8529 ) ) ( not ( = ?auto_8498 ?auto_8520 ) ) ( not ( = ?auto_8498 ?auto_8515 ) ) ( not ( = ?auto_8525 ?auto_8531 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8523 ) ) ( not ( = ?auto_8508 ?auto_8509 ) ) ( not ( = ?auto_8508 ?auto_8521 ) ) ( not ( = ?auto_8508 ?auto_8526 ) ) ( not ( = ?auto_8517 ?auto_8530 ) ) ( not ( = ?auto_8517 ?auto_8529 ) ) ( not ( = ?auto_8517 ?auto_8520 ) ) ( not ( = ?auto_8517 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8496 ) ) ( not ( = ?auto_8491 ?auto_8510 ) ) ( not ( = ?auto_8492 ?auto_8496 ) ) ( not ( = ?auto_8492 ?auto_8510 ) ) ( not ( = ?auto_8493 ?auto_8496 ) ) ( not ( = ?auto_8493 ?auto_8510 ) ) ( not ( = ?auto_8494 ?auto_8496 ) ) ( not ( = ?auto_8494 ?auto_8510 ) ) ( not ( = ?auto_8495 ?auto_8496 ) ) ( not ( = ?auto_8495 ?auto_8510 ) ) ( not ( = ?auto_8496 ?auto_8517 ) ) ( not ( = ?auto_8496 ?auto_8530 ) ) ( not ( = ?auto_8496 ?auto_8529 ) ) ( not ( = ?auto_8496 ?auto_8520 ) ) ( not ( = ?auto_8496 ?auto_8515 ) ) ( not ( = ?auto_8522 ?auto_8525 ) ) ( not ( = ?auto_8522 ?auto_8531 ) ) ( not ( = ?auto_8522 ?auto_8527 ) ) ( not ( = ?auto_8522 ?auto_8523 ) ) ( not ( = ?auto_8532 ?auto_8508 ) ) ( not ( = ?auto_8532 ?auto_8509 ) ) ( not ( = ?auto_8532 ?auto_8521 ) ) ( not ( = ?auto_8532 ?auto_8526 ) ) ( not ( = ?auto_8510 ?auto_8517 ) ) ( not ( = ?auto_8510 ?auto_8530 ) ) ( not ( = ?auto_8510 ?auto_8529 ) ) ( not ( = ?auto_8510 ?auto_8520 ) ) ( not ( = ?auto_8510 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8500 ) ) ( not ( = ?auto_8491 ?auto_8512 ) ) ( not ( = ?auto_8492 ?auto_8500 ) ) ( not ( = ?auto_8492 ?auto_8512 ) ) ( not ( = ?auto_8493 ?auto_8500 ) ) ( not ( = ?auto_8493 ?auto_8512 ) ) ( not ( = ?auto_8494 ?auto_8500 ) ) ( not ( = ?auto_8494 ?auto_8512 ) ) ( not ( = ?auto_8495 ?auto_8500 ) ) ( not ( = ?auto_8495 ?auto_8512 ) ) ( not ( = ?auto_8498 ?auto_8500 ) ) ( not ( = ?auto_8498 ?auto_8512 ) ) ( not ( = ?auto_8500 ?auto_8510 ) ) ( not ( = ?auto_8500 ?auto_8517 ) ) ( not ( = ?auto_8500 ?auto_8530 ) ) ( not ( = ?auto_8500 ?auto_8529 ) ) ( not ( = ?auto_8500 ?auto_8520 ) ) ( not ( = ?auto_8500 ?auto_8515 ) ) ( not ( = ?auto_8516 ?auto_8522 ) ) ( not ( = ?auto_8516 ?auto_8525 ) ) ( not ( = ?auto_8516 ?auto_8531 ) ) ( not ( = ?auto_8516 ?auto_8527 ) ) ( not ( = ?auto_8516 ?auto_8523 ) ) ( not ( = ?auto_8519 ?auto_8532 ) ) ( not ( = ?auto_8519 ?auto_8508 ) ) ( not ( = ?auto_8519 ?auto_8509 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8512 ?auto_8510 ) ) ( not ( = ?auto_8512 ?auto_8517 ) ) ( not ( = ?auto_8512 ?auto_8530 ) ) ( not ( = ?auto_8512 ?auto_8529 ) ) ( not ( = ?auto_8512 ?auto_8520 ) ) ( not ( = ?auto_8512 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8499 ) ) ( not ( = ?auto_8491 ?auto_8524 ) ) ( not ( = ?auto_8492 ?auto_8499 ) ) ( not ( = ?auto_8492 ?auto_8524 ) ) ( not ( = ?auto_8493 ?auto_8499 ) ) ( not ( = ?auto_8493 ?auto_8524 ) ) ( not ( = ?auto_8494 ?auto_8499 ) ) ( not ( = ?auto_8494 ?auto_8524 ) ) ( not ( = ?auto_8495 ?auto_8499 ) ) ( not ( = ?auto_8495 ?auto_8524 ) ) ( not ( = ?auto_8498 ?auto_8499 ) ) ( not ( = ?auto_8498 ?auto_8524 ) ) ( not ( = ?auto_8496 ?auto_8499 ) ) ( not ( = ?auto_8496 ?auto_8524 ) ) ( not ( = ?auto_8499 ?auto_8512 ) ) ( not ( = ?auto_8499 ?auto_8510 ) ) ( not ( = ?auto_8499 ?auto_8517 ) ) ( not ( = ?auto_8499 ?auto_8530 ) ) ( not ( = ?auto_8499 ?auto_8529 ) ) ( not ( = ?auto_8499 ?auto_8520 ) ) ( not ( = ?auto_8499 ?auto_8515 ) ) ( not ( = ?auto_8528 ?auto_8516 ) ) ( not ( = ?auto_8528 ?auto_8522 ) ) ( not ( = ?auto_8528 ?auto_8525 ) ) ( not ( = ?auto_8528 ?auto_8531 ) ) ( not ( = ?auto_8528 ?auto_8527 ) ) ( not ( = ?auto_8528 ?auto_8523 ) ) ( not ( = ?auto_8514 ?auto_8519 ) ) ( not ( = ?auto_8514 ?auto_8532 ) ) ( not ( = ?auto_8514 ?auto_8508 ) ) ( not ( = ?auto_8514 ?auto_8509 ) ) ( not ( = ?auto_8514 ?auto_8521 ) ) ( not ( = ?auto_8514 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8512 ) ) ( not ( = ?auto_8524 ?auto_8510 ) ) ( not ( = ?auto_8524 ?auto_8517 ) ) ( not ( = ?auto_8524 ?auto_8530 ) ) ( not ( = ?auto_8524 ?auto_8529 ) ) ( not ( = ?auto_8524 ?auto_8520 ) ) ( not ( = ?auto_8524 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8497 ) ) ( not ( = ?auto_8491 ?auto_8513 ) ) ( not ( = ?auto_8492 ?auto_8497 ) ) ( not ( = ?auto_8492 ?auto_8513 ) ) ( not ( = ?auto_8493 ?auto_8497 ) ) ( not ( = ?auto_8493 ?auto_8513 ) ) ( not ( = ?auto_8494 ?auto_8497 ) ) ( not ( = ?auto_8494 ?auto_8513 ) ) ( not ( = ?auto_8495 ?auto_8497 ) ) ( not ( = ?auto_8495 ?auto_8513 ) ) ( not ( = ?auto_8498 ?auto_8497 ) ) ( not ( = ?auto_8498 ?auto_8513 ) ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( not ( = ?auto_8496 ?auto_8513 ) ) ( not ( = ?auto_8500 ?auto_8497 ) ) ( not ( = ?auto_8500 ?auto_8513 ) ) ( not ( = ?auto_8497 ?auto_8524 ) ) ( not ( = ?auto_8497 ?auto_8512 ) ) ( not ( = ?auto_8497 ?auto_8510 ) ) ( not ( = ?auto_8497 ?auto_8517 ) ) ( not ( = ?auto_8497 ?auto_8530 ) ) ( not ( = ?auto_8497 ?auto_8529 ) ) ( not ( = ?auto_8497 ?auto_8520 ) ) ( not ( = ?auto_8497 ?auto_8515 ) ) ( not ( = ?auto_8511 ?auto_8528 ) ) ( not ( = ?auto_8511 ?auto_8516 ) ) ( not ( = ?auto_8511 ?auto_8522 ) ) ( not ( = ?auto_8511 ?auto_8525 ) ) ( not ( = ?auto_8511 ?auto_8531 ) ) ( not ( = ?auto_8511 ?auto_8527 ) ) ( not ( = ?auto_8511 ?auto_8523 ) ) ( not ( = ?auto_8518 ?auto_8514 ) ) ( not ( = ?auto_8518 ?auto_8519 ) ) ( not ( = ?auto_8518 ?auto_8532 ) ) ( not ( = ?auto_8518 ?auto_8508 ) ) ( not ( = ?auto_8518 ?auto_8509 ) ) ( not ( = ?auto_8518 ?auto_8521 ) ) ( not ( = ?auto_8518 ?auto_8526 ) ) ( not ( = ?auto_8513 ?auto_8524 ) ) ( not ( = ?auto_8513 ?auto_8512 ) ) ( not ( = ?auto_8513 ?auto_8510 ) ) ( not ( = ?auto_8513 ?auto_8517 ) ) ( not ( = ?auto_8513 ?auto_8530 ) ) ( not ( = ?auto_8513 ?auto_8529 ) ) ( not ( = ?auto_8513 ?auto_8520 ) ) ( not ( = ?auto_8513 ?auto_8515 ) ) ( not ( = ?auto_8491 ?auto_8501 ) ) ( not ( = ?auto_8491 ?auto_8503 ) ) ( not ( = ?auto_8492 ?auto_8501 ) ) ( not ( = ?auto_8492 ?auto_8503 ) ) ( not ( = ?auto_8493 ?auto_8501 ) ) ( not ( = ?auto_8493 ?auto_8503 ) ) ( not ( = ?auto_8494 ?auto_8501 ) ) ( not ( = ?auto_8494 ?auto_8503 ) ) ( not ( = ?auto_8495 ?auto_8501 ) ) ( not ( = ?auto_8495 ?auto_8503 ) ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( not ( = ?auto_8498 ?auto_8503 ) ) ( not ( = ?auto_8496 ?auto_8501 ) ) ( not ( = ?auto_8496 ?auto_8503 ) ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8500 ?auto_8503 ) ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( not ( = ?auto_8499 ?auto_8503 ) ) ( not ( = ?auto_8501 ?auto_8513 ) ) ( not ( = ?auto_8501 ?auto_8524 ) ) ( not ( = ?auto_8501 ?auto_8512 ) ) ( not ( = ?auto_8501 ?auto_8510 ) ) ( not ( = ?auto_8501 ?auto_8517 ) ) ( not ( = ?auto_8501 ?auto_8530 ) ) ( not ( = ?auto_8501 ?auto_8529 ) ) ( not ( = ?auto_8501 ?auto_8520 ) ) ( not ( = ?auto_8501 ?auto_8515 ) ) ( not ( = ?auto_8504 ?auto_8511 ) ) ( not ( = ?auto_8504 ?auto_8528 ) ) ( not ( = ?auto_8504 ?auto_8516 ) ) ( not ( = ?auto_8504 ?auto_8522 ) ) ( not ( = ?auto_8504 ?auto_8525 ) ) ( not ( = ?auto_8504 ?auto_8531 ) ) ( not ( = ?auto_8504 ?auto_8527 ) ) ( not ( = ?auto_8504 ?auto_8523 ) ) ( not ( = ?auto_8502 ?auto_8518 ) ) ( not ( = ?auto_8502 ?auto_8514 ) ) ( not ( = ?auto_8502 ?auto_8519 ) ) ( not ( = ?auto_8502 ?auto_8532 ) ) ( not ( = ?auto_8502 ?auto_8508 ) ) ( not ( = ?auto_8502 ?auto_8509 ) ) ( not ( = ?auto_8502 ?auto_8521 ) ) ( not ( = ?auto_8502 ?auto_8526 ) ) ( not ( = ?auto_8503 ?auto_8513 ) ) ( not ( = ?auto_8503 ?auto_8524 ) ) ( not ( = ?auto_8503 ?auto_8512 ) ) ( not ( = ?auto_8503 ?auto_8510 ) ) ( not ( = ?auto_8503 ?auto_8517 ) ) ( not ( = ?auto_8503 ?auto_8530 ) ) ( not ( = ?auto_8503 ?auto_8529 ) ) ( not ( = ?auto_8503 ?auto_8520 ) ) ( not ( = ?auto_8503 ?auto_8515 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8491 ?auto_8492 ?auto_8493 ?auto_8494 ?auto_8495 ?auto_8498 ?auto_8496 ?auto_8500 ?auto_8499 ?auto_8497 )
      ( MAKE-1CRATE ?auto_8497 ?auto_8501 )
      ( MAKE-10CRATE-VERIFY ?auto_8491 ?auto_8492 ?auto_8493 ?auto_8494 ?auto_8495 ?auto_8498 ?auto_8496 ?auto_8500 ?auto_8499 ?auto_8497 ?auto_8501 ) )
  )

)

