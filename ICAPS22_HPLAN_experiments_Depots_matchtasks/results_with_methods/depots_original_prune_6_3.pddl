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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44075 - SURFACE
      ?auto_44076 - SURFACE
    )
    :vars
    (
      ?auto_44077 - HOIST
      ?auto_44078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44077 ?auto_44078 ) ( SURFACE-AT ?auto_44075 ?auto_44078 ) ( CLEAR ?auto_44075 ) ( LIFTING ?auto_44077 ?auto_44076 ) ( IS-CRATE ?auto_44076 ) ( not ( = ?auto_44075 ?auto_44076 ) ) )
    :subtasks
    ( ( !DROP ?auto_44077 ?auto_44076 ?auto_44075 ?auto_44078 )
      ( MAKE-1CRATE-VERIFY ?auto_44075 ?auto_44076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44079 - SURFACE
      ?auto_44080 - SURFACE
    )
    :vars
    (
      ?auto_44081 - HOIST
      ?auto_44082 - PLACE
      ?auto_44083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44081 ?auto_44082 ) ( SURFACE-AT ?auto_44079 ?auto_44082 ) ( CLEAR ?auto_44079 ) ( IS-CRATE ?auto_44080 ) ( not ( = ?auto_44079 ?auto_44080 ) ) ( TRUCK-AT ?auto_44083 ?auto_44082 ) ( AVAILABLE ?auto_44081 ) ( IN ?auto_44080 ?auto_44083 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44081 ?auto_44080 ?auto_44083 ?auto_44082 )
      ( MAKE-1CRATE ?auto_44079 ?auto_44080 )
      ( MAKE-1CRATE-VERIFY ?auto_44079 ?auto_44080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44084 - SURFACE
      ?auto_44085 - SURFACE
    )
    :vars
    (
      ?auto_44086 - HOIST
      ?auto_44087 - PLACE
      ?auto_44088 - TRUCK
      ?auto_44089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44086 ?auto_44087 ) ( SURFACE-AT ?auto_44084 ?auto_44087 ) ( CLEAR ?auto_44084 ) ( IS-CRATE ?auto_44085 ) ( not ( = ?auto_44084 ?auto_44085 ) ) ( AVAILABLE ?auto_44086 ) ( IN ?auto_44085 ?auto_44088 ) ( TRUCK-AT ?auto_44088 ?auto_44089 ) ( not ( = ?auto_44089 ?auto_44087 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44088 ?auto_44089 ?auto_44087 )
      ( MAKE-1CRATE ?auto_44084 ?auto_44085 )
      ( MAKE-1CRATE-VERIFY ?auto_44084 ?auto_44085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44090 - SURFACE
      ?auto_44091 - SURFACE
    )
    :vars
    (
      ?auto_44095 - HOIST
      ?auto_44094 - PLACE
      ?auto_44092 - TRUCK
      ?auto_44093 - PLACE
      ?auto_44096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44095 ?auto_44094 ) ( SURFACE-AT ?auto_44090 ?auto_44094 ) ( CLEAR ?auto_44090 ) ( IS-CRATE ?auto_44091 ) ( not ( = ?auto_44090 ?auto_44091 ) ) ( AVAILABLE ?auto_44095 ) ( TRUCK-AT ?auto_44092 ?auto_44093 ) ( not ( = ?auto_44093 ?auto_44094 ) ) ( HOIST-AT ?auto_44096 ?auto_44093 ) ( LIFTING ?auto_44096 ?auto_44091 ) ( not ( = ?auto_44095 ?auto_44096 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44096 ?auto_44091 ?auto_44092 ?auto_44093 )
      ( MAKE-1CRATE ?auto_44090 ?auto_44091 )
      ( MAKE-1CRATE-VERIFY ?auto_44090 ?auto_44091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44097 - SURFACE
      ?auto_44098 - SURFACE
    )
    :vars
    (
      ?auto_44103 - HOIST
      ?auto_44100 - PLACE
      ?auto_44102 - TRUCK
      ?auto_44101 - PLACE
      ?auto_44099 - HOIST
      ?auto_44104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44103 ?auto_44100 ) ( SURFACE-AT ?auto_44097 ?auto_44100 ) ( CLEAR ?auto_44097 ) ( IS-CRATE ?auto_44098 ) ( not ( = ?auto_44097 ?auto_44098 ) ) ( AVAILABLE ?auto_44103 ) ( TRUCK-AT ?auto_44102 ?auto_44101 ) ( not ( = ?auto_44101 ?auto_44100 ) ) ( HOIST-AT ?auto_44099 ?auto_44101 ) ( not ( = ?auto_44103 ?auto_44099 ) ) ( AVAILABLE ?auto_44099 ) ( SURFACE-AT ?auto_44098 ?auto_44101 ) ( ON ?auto_44098 ?auto_44104 ) ( CLEAR ?auto_44098 ) ( not ( = ?auto_44097 ?auto_44104 ) ) ( not ( = ?auto_44098 ?auto_44104 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44099 ?auto_44098 ?auto_44104 ?auto_44101 )
      ( MAKE-1CRATE ?auto_44097 ?auto_44098 )
      ( MAKE-1CRATE-VERIFY ?auto_44097 ?auto_44098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44105 - SURFACE
      ?auto_44106 - SURFACE
    )
    :vars
    (
      ?auto_44110 - HOIST
      ?auto_44107 - PLACE
      ?auto_44112 - PLACE
      ?auto_44111 - HOIST
      ?auto_44108 - SURFACE
      ?auto_44109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44110 ?auto_44107 ) ( SURFACE-AT ?auto_44105 ?auto_44107 ) ( CLEAR ?auto_44105 ) ( IS-CRATE ?auto_44106 ) ( not ( = ?auto_44105 ?auto_44106 ) ) ( AVAILABLE ?auto_44110 ) ( not ( = ?auto_44112 ?auto_44107 ) ) ( HOIST-AT ?auto_44111 ?auto_44112 ) ( not ( = ?auto_44110 ?auto_44111 ) ) ( AVAILABLE ?auto_44111 ) ( SURFACE-AT ?auto_44106 ?auto_44112 ) ( ON ?auto_44106 ?auto_44108 ) ( CLEAR ?auto_44106 ) ( not ( = ?auto_44105 ?auto_44108 ) ) ( not ( = ?auto_44106 ?auto_44108 ) ) ( TRUCK-AT ?auto_44109 ?auto_44107 ) )
    :subtasks
    ( ( !DRIVE ?auto_44109 ?auto_44107 ?auto_44112 )
      ( MAKE-1CRATE ?auto_44105 ?auto_44106 )
      ( MAKE-1CRATE-VERIFY ?auto_44105 ?auto_44106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44122 - SURFACE
      ?auto_44123 - SURFACE
      ?auto_44124 - SURFACE
    )
    :vars
    (
      ?auto_44125 - HOIST
      ?auto_44126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44125 ?auto_44126 ) ( SURFACE-AT ?auto_44123 ?auto_44126 ) ( CLEAR ?auto_44123 ) ( LIFTING ?auto_44125 ?auto_44124 ) ( IS-CRATE ?auto_44124 ) ( not ( = ?auto_44123 ?auto_44124 ) ) ( ON ?auto_44123 ?auto_44122 ) ( not ( = ?auto_44122 ?auto_44123 ) ) ( not ( = ?auto_44122 ?auto_44124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44123 ?auto_44124 )
      ( MAKE-2CRATE-VERIFY ?auto_44122 ?auto_44123 ?auto_44124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44132 - SURFACE
      ?auto_44133 - SURFACE
      ?auto_44134 - SURFACE
    )
    :vars
    (
      ?auto_44135 - HOIST
      ?auto_44137 - PLACE
      ?auto_44136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44135 ?auto_44137 ) ( SURFACE-AT ?auto_44133 ?auto_44137 ) ( CLEAR ?auto_44133 ) ( IS-CRATE ?auto_44134 ) ( not ( = ?auto_44133 ?auto_44134 ) ) ( TRUCK-AT ?auto_44136 ?auto_44137 ) ( AVAILABLE ?auto_44135 ) ( IN ?auto_44134 ?auto_44136 ) ( ON ?auto_44133 ?auto_44132 ) ( not ( = ?auto_44132 ?auto_44133 ) ) ( not ( = ?auto_44132 ?auto_44134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44133 ?auto_44134 )
      ( MAKE-2CRATE-VERIFY ?auto_44132 ?auto_44133 ?auto_44134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44138 - SURFACE
      ?auto_44139 - SURFACE
    )
    :vars
    (
      ?auto_44141 - HOIST
      ?auto_44140 - PLACE
      ?auto_44142 - TRUCK
      ?auto_44143 - SURFACE
      ?auto_44144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44141 ?auto_44140 ) ( SURFACE-AT ?auto_44138 ?auto_44140 ) ( CLEAR ?auto_44138 ) ( IS-CRATE ?auto_44139 ) ( not ( = ?auto_44138 ?auto_44139 ) ) ( AVAILABLE ?auto_44141 ) ( IN ?auto_44139 ?auto_44142 ) ( ON ?auto_44138 ?auto_44143 ) ( not ( = ?auto_44143 ?auto_44138 ) ) ( not ( = ?auto_44143 ?auto_44139 ) ) ( TRUCK-AT ?auto_44142 ?auto_44144 ) ( not ( = ?auto_44144 ?auto_44140 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44142 ?auto_44144 ?auto_44140 )
      ( MAKE-2CRATE ?auto_44143 ?auto_44138 ?auto_44139 )
      ( MAKE-1CRATE-VERIFY ?auto_44138 ?auto_44139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44145 - SURFACE
      ?auto_44146 - SURFACE
      ?auto_44147 - SURFACE
    )
    :vars
    (
      ?auto_44150 - HOIST
      ?auto_44151 - PLACE
      ?auto_44149 - TRUCK
      ?auto_44148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44150 ?auto_44151 ) ( SURFACE-AT ?auto_44146 ?auto_44151 ) ( CLEAR ?auto_44146 ) ( IS-CRATE ?auto_44147 ) ( not ( = ?auto_44146 ?auto_44147 ) ) ( AVAILABLE ?auto_44150 ) ( IN ?auto_44147 ?auto_44149 ) ( ON ?auto_44146 ?auto_44145 ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( not ( = ?auto_44145 ?auto_44147 ) ) ( TRUCK-AT ?auto_44149 ?auto_44148 ) ( not ( = ?auto_44148 ?auto_44151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44146 ?auto_44147 )
      ( MAKE-2CRATE-VERIFY ?auto_44145 ?auto_44146 ?auto_44147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44152 - SURFACE
      ?auto_44153 - SURFACE
    )
    :vars
    (
      ?auto_44156 - HOIST
      ?auto_44158 - PLACE
      ?auto_44154 - SURFACE
      ?auto_44155 - TRUCK
      ?auto_44157 - PLACE
      ?auto_44159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44156 ?auto_44158 ) ( SURFACE-AT ?auto_44152 ?auto_44158 ) ( CLEAR ?auto_44152 ) ( IS-CRATE ?auto_44153 ) ( not ( = ?auto_44152 ?auto_44153 ) ) ( AVAILABLE ?auto_44156 ) ( ON ?auto_44152 ?auto_44154 ) ( not ( = ?auto_44154 ?auto_44152 ) ) ( not ( = ?auto_44154 ?auto_44153 ) ) ( TRUCK-AT ?auto_44155 ?auto_44157 ) ( not ( = ?auto_44157 ?auto_44158 ) ) ( HOIST-AT ?auto_44159 ?auto_44157 ) ( LIFTING ?auto_44159 ?auto_44153 ) ( not ( = ?auto_44156 ?auto_44159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44159 ?auto_44153 ?auto_44155 ?auto_44157 )
      ( MAKE-2CRATE ?auto_44154 ?auto_44152 ?auto_44153 )
      ( MAKE-1CRATE-VERIFY ?auto_44152 ?auto_44153 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44160 - SURFACE
      ?auto_44161 - SURFACE
      ?auto_44162 - SURFACE
    )
    :vars
    (
      ?auto_44167 - HOIST
      ?auto_44163 - PLACE
      ?auto_44166 - TRUCK
      ?auto_44164 - PLACE
      ?auto_44165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44167 ?auto_44163 ) ( SURFACE-AT ?auto_44161 ?auto_44163 ) ( CLEAR ?auto_44161 ) ( IS-CRATE ?auto_44162 ) ( not ( = ?auto_44161 ?auto_44162 ) ) ( AVAILABLE ?auto_44167 ) ( ON ?auto_44161 ?auto_44160 ) ( not ( = ?auto_44160 ?auto_44161 ) ) ( not ( = ?auto_44160 ?auto_44162 ) ) ( TRUCK-AT ?auto_44166 ?auto_44164 ) ( not ( = ?auto_44164 ?auto_44163 ) ) ( HOIST-AT ?auto_44165 ?auto_44164 ) ( LIFTING ?auto_44165 ?auto_44162 ) ( not ( = ?auto_44167 ?auto_44165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44161 ?auto_44162 )
      ( MAKE-2CRATE-VERIFY ?auto_44160 ?auto_44161 ?auto_44162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44168 - SURFACE
      ?auto_44169 - SURFACE
    )
    :vars
    (
      ?auto_44172 - HOIST
      ?auto_44175 - PLACE
      ?auto_44171 - SURFACE
      ?auto_44174 - TRUCK
      ?auto_44170 - PLACE
      ?auto_44173 - HOIST
      ?auto_44176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44172 ?auto_44175 ) ( SURFACE-AT ?auto_44168 ?auto_44175 ) ( CLEAR ?auto_44168 ) ( IS-CRATE ?auto_44169 ) ( not ( = ?auto_44168 ?auto_44169 ) ) ( AVAILABLE ?auto_44172 ) ( ON ?auto_44168 ?auto_44171 ) ( not ( = ?auto_44171 ?auto_44168 ) ) ( not ( = ?auto_44171 ?auto_44169 ) ) ( TRUCK-AT ?auto_44174 ?auto_44170 ) ( not ( = ?auto_44170 ?auto_44175 ) ) ( HOIST-AT ?auto_44173 ?auto_44170 ) ( not ( = ?auto_44172 ?auto_44173 ) ) ( AVAILABLE ?auto_44173 ) ( SURFACE-AT ?auto_44169 ?auto_44170 ) ( ON ?auto_44169 ?auto_44176 ) ( CLEAR ?auto_44169 ) ( not ( = ?auto_44168 ?auto_44176 ) ) ( not ( = ?auto_44169 ?auto_44176 ) ) ( not ( = ?auto_44171 ?auto_44176 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44173 ?auto_44169 ?auto_44176 ?auto_44170 )
      ( MAKE-2CRATE ?auto_44171 ?auto_44168 ?auto_44169 )
      ( MAKE-1CRATE-VERIFY ?auto_44168 ?auto_44169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44177 - SURFACE
      ?auto_44178 - SURFACE
      ?auto_44179 - SURFACE
    )
    :vars
    (
      ?auto_44185 - HOIST
      ?auto_44183 - PLACE
      ?auto_44180 - TRUCK
      ?auto_44182 - PLACE
      ?auto_44184 - HOIST
      ?auto_44181 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44185 ?auto_44183 ) ( SURFACE-AT ?auto_44178 ?auto_44183 ) ( CLEAR ?auto_44178 ) ( IS-CRATE ?auto_44179 ) ( not ( = ?auto_44178 ?auto_44179 ) ) ( AVAILABLE ?auto_44185 ) ( ON ?auto_44178 ?auto_44177 ) ( not ( = ?auto_44177 ?auto_44178 ) ) ( not ( = ?auto_44177 ?auto_44179 ) ) ( TRUCK-AT ?auto_44180 ?auto_44182 ) ( not ( = ?auto_44182 ?auto_44183 ) ) ( HOIST-AT ?auto_44184 ?auto_44182 ) ( not ( = ?auto_44185 ?auto_44184 ) ) ( AVAILABLE ?auto_44184 ) ( SURFACE-AT ?auto_44179 ?auto_44182 ) ( ON ?auto_44179 ?auto_44181 ) ( CLEAR ?auto_44179 ) ( not ( = ?auto_44178 ?auto_44181 ) ) ( not ( = ?auto_44179 ?auto_44181 ) ) ( not ( = ?auto_44177 ?auto_44181 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44178 ?auto_44179 )
      ( MAKE-2CRATE-VERIFY ?auto_44177 ?auto_44178 ?auto_44179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44186 - SURFACE
      ?auto_44187 - SURFACE
    )
    :vars
    (
      ?auto_44189 - HOIST
      ?auto_44190 - PLACE
      ?auto_44193 - SURFACE
      ?auto_44194 - PLACE
      ?auto_44191 - HOIST
      ?auto_44192 - SURFACE
      ?auto_44188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44189 ?auto_44190 ) ( SURFACE-AT ?auto_44186 ?auto_44190 ) ( CLEAR ?auto_44186 ) ( IS-CRATE ?auto_44187 ) ( not ( = ?auto_44186 ?auto_44187 ) ) ( AVAILABLE ?auto_44189 ) ( ON ?auto_44186 ?auto_44193 ) ( not ( = ?auto_44193 ?auto_44186 ) ) ( not ( = ?auto_44193 ?auto_44187 ) ) ( not ( = ?auto_44194 ?auto_44190 ) ) ( HOIST-AT ?auto_44191 ?auto_44194 ) ( not ( = ?auto_44189 ?auto_44191 ) ) ( AVAILABLE ?auto_44191 ) ( SURFACE-AT ?auto_44187 ?auto_44194 ) ( ON ?auto_44187 ?auto_44192 ) ( CLEAR ?auto_44187 ) ( not ( = ?auto_44186 ?auto_44192 ) ) ( not ( = ?auto_44187 ?auto_44192 ) ) ( not ( = ?auto_44193 ?auto_44192 ) ) ( TRUCK-AT ?auto_44188 ?auto_44190 ) )
    :subtasks
    ( ( !DRIVE ?auto_44188 ?auto_44190 ?auto_44194 )
      ( MAKE-2CRATE ?auto_44193 ?auto_44186 ?auto_44187 )
      ( MAKE-1CRATE-VERIFY ?auto_44186 ?auto_44187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44195 - SURFACE
      ?auto_44196 - SURFACE
      ?auto_44197 - SURFACE
    )
    :vars
    (
      ?auto_44200 - HOIST
      ?auto_44202 - PLACE
      ?auto_44199 - PLACE
      ?auto_44201 - HOIST
      ?auto_44203 - SURFACE
      ?auto_44198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44200 ?auto_44202 ) ( SURFACE-AT ?auto_44196 ?auto_44202 ) ( CLEAR ?auto_44196 ) ( IS-CRATE ?auto_44197 ) ( not ( = ?auto_44196 ?auto_44197 ) ) ( AVAILABLE ?auto_44200 ) ( ON ?auto_44196 ?auto_44195 ) ( not ( = ?auto_44195 ?auto_44196 ) ) ( not ( = ?auto_44195 ?auto_44197 ) ) ( not ( = ?auto_44199 ?auto_44202 ) ) ( HOIST-AT ?auto_44201 ?auto_44199 ) ( not ( = ?auto_44200 ?auto_44201 ) ) ( AVAILABLE ?auto_44201 ) ( SURFACE-AT ?auto_44197 ?auto_44199 ) ( ON ?auto_44197 ?auto_44203 ) ( CLEAR ?auto_44197 ) ( not ( = ?auto_44196 ?auto_44203 ) ) ( not ( = ?auto_44197 ?auto_44203 ) ) ( not ( = ?auto_44195 ?auto_44203 ) ) ( TRUCK-AT ?auto_44198 ?auto_44202 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44196 ?auto_44197 )
      ( MAKE-2CRATE-VERIFY ?auto_44195 ?auto_44196 ?auto_44197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44204 - SURFACE
      ?auto_44205 - SURFACE
    )
    :vars
    (
      ?auto_44210 - HOIST
      ?auto_44209 - PLACE
      ?auto_44207 - SURFACE
      ?auto_44206 - PLACE
      ?auto_44212 - HOIST
      ?auto_44211 - SURFACE
      ?auto_44208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44210 ?auto_44209 ) ( IS-CRATE ?auto_44205 ) ( not ( = ?auto_44204 ?auto_44205 ) ) ( not ( = ?auto_44207 ?auto_44204 ) ) ( not ( = ?auto_44207 ?auto_44205 ) ) ( not ( = ?auto_44206 ?auto_44209 ) ) ( HOIST-AT ?auto_44212 ?auto_44206 ) ( not ( = ?auto_44210 ?auto_44212 ) ) ( AVAILABLE ?auto_44212 ) ( SURFACE-AT ?auto_44205 ?auto_44206 ) ( ON ?auto_44205 ?auto_44211 ) ( CLEAR ?auto_44205 ) ( not ( = ?auto_44204 ?auto_44211 ) ) ( not ( = ?auto_44205 ?auto_44211 ) ) ( not ( = ?auto_44207 ?auto_44211 ) ) ( TRUCK-AT ?auto_44208 ?auto_44209 ) ( SURFACE-AT ?auto_44207 ?auto_44209 ) ( CLEAR ?auto_44207 ) ( LIFTING ?auto_44210 ?auto_44204 ) ( IS-CRATE ?auto_44204 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44207 ?auto_44204 )
      ( MAKE-2CRATE ?auto_44207 ?auto_44204 ?auto_44205 )
      ( MAKE-1CRATE-VERIFY ?auto_44204 ?auto_44205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44213 - SURFACE
      ?auto_44214 - SURFACE
      ?auto_44215 - SURFACE
    )
    :vars
    (
      ?auto_44216 - HOIST
      ?auto_44218 - PLACE
      ?auto_44221 - PLACE
      ?auto_44217 - HOIST
      ?auto_44220 - SURFACE
      ?auto_44219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44216 ?auto_44218 ) ( IS-CRATE ?auto_44215 ) ( not ( = ?auto_44214 ?auto_44215 ) ) ( not ( = ?auto_44213 ?auto_44214 ) ) ( not ( = ?auto_44213 ?auto_44215 ) ) ( not ( = ?auto_44221 ?auto_44218 ) ) ( HOIST-AT ?auto_44217 ?auto_44221 ) ( not ( = ?auto_44216 ?auto_44217 ) ) ( AVAILABLE ?auto_44217 ) ( SURFACE-AT ?auto_44215 ?auto_44221 ) ( ON ?auto_44215 ?auto_44220 ) ( CLEAR ?auto_44215 ) ( not ( = ?auto_44214 ?auto_44220 ) ) ( not ( = ?auto_44215 ?auto_44220 ) ) ( not ( = ?auto_44213 ?auto_44220 ) ) ( TRUCK-AT ?auto_44219 ?auto_44218 ) ( SURFACE-AT ?auto_44213 ?auto_44218 ) ( CLEAR ?auto_44213 ) ( LIFTING ?auto_44216 ?auto_44214 ) ( IS-CRATE ?auto_44214 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44214 ?auto_44215 )
      ( MAKE-2CRATE-VERIFY ?auto_44213 ?auto_44214 ?auto_44215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44222 - SURFACE
      ?auto_44223 - SURFACE
    )
    :vars
    (
      ?auto_44224 - HOIST
      ?auto_44227 - PLACE
      ?auto_44230 - SURFACE
      ?auto_44228 - PLACE
      ?auto_44225 - HOIST
      ?auto_44226 - SURFACE
      ?auto_44229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44224 ?auto_44227 ) ( IS-CRATE ?auto_44223 ) ( not ( = ?auto_44222 ?auto_44223 ) ) ( not ( = ?auto_44230 ?auto_44222 ) ) ( not ( = ?auto_44230 ?auto_44223 ) ) ( not ( = ?auto_44228 ?auto_44227 ) ) ( HOIST-AT ?auto_44225 ?auto_44228 ) ( not ( = ?auto_44224 ?auto_44225 ) ) ( AVAILABLE ?auto_44225 ) ( SURFACE-AT ?auto_44223 ?auto_44228 ) ( ON ?auto_44223 ?auto_44226 ) ( CLEAR ?auto_44223 ) ( not ( = ?auto_44222 ?auto_44226 ) ) ( not ( = ?auto_44223 ?auto_44226 ) ) ( not ( = ?auto_44230 ?auto_44226 ) ) ( TRUCK-AT ?auto_44229 ?auto_44227 ) ( SURFACE-AT ?auto_44230 ?auto_44227 ) ( CLEAR ?auto_44230 ) ( IS-CRATE ?auto_44222 ) ( AVAILABLE ?auto_44224 ) ( IN ?auto_44222 ?auto_44229 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44224 ?auto_44222 ?auto_44229 ?auto_44227 )
      ( MAKE-2CRATE ?auto_44230 ?auto_44222 ?auto_44223 )
      ( MAKE-1CRATE-VERIFY ?auto_44222 ?auto_44223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44231 - SURFACE
      ?auto_44232 - SURFACE
      ?auto_44233 - SURFACE
    )
    :vars
    (
      ?auto_44234 - HOIST
      ?auto_44238 - PLACE
      ?auto_44239 - PLACE
      ?auto_44235 - HOIST
      ?auto_44237 - SURFACE
      ?auto_44236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44234 ?auto_44238 ) ( IS-CRATE ?auto_44233 ) ( not ( = ?auto_44232 ?auto_44233 ) ) ( not ( = ?auto_44231 ?auto_44232 ) ) ( not ( = ?auto_44231 ?auto_44233 ) ) ( not ( = ?auto_44239 ?auto_44238 ) ) ( HOIST-AT ?auto_44235 ?auto_44239 ) ( not ( = ?auto_44234 ?auto_44235 ) ) ( AVAILABLE ?auto_44235 ) ( SURFACE-AT ?auto_44233 ?auto_44239 ) ( ON ?auto_44233 ?auto_44237 ) ( CLEAR ?auto_44233 ) ( not ( = ?auto_44232 ?auto_44237 ) ) ( not ( = ?auto_44233 ?auto_44237 ) ) ( not ( = ?auto_44231 ?auto_44237 ) ) ( TRUCK-AT ?auto_44236 ?auto_44238 ) ( SURFACE-AT ?auto_44231 ?auto_44238 ) ( CLEAR ?auto_44231 ) ( IS-CRATE ?auto_44232 ) ( AVAILABLE ?auto_44234 ) ( IN ?auto_44232 ?auto_44236 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44232 ?auto_44233 )
      ( MAKE-2CRATE-VERIFY ?auto_44231 ?auto_44232 ?auto_44233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44276 - SURFACE
      ?auto_44277 - SURFACE
    )
    :vars
    (
      ?auto_44281 - HOIST
      ?auto_44280 - PLACE
      ?auto_44278 - SURFACE
      ?auto_44284 - PLACE
      ?auto_44283 - HOIST
      ?auto_44279 - SURFACE
      ?auto_44282 - TRUCK
      ?auto_44285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44281 ?auto_44280 ) ( SURFACE-AT ?auto_44276 ?auto_44280 ) ( CLEAR ?auto_44276 ) ( IS-CRATE ?auto_44277 ) ( not ( = ?auto_44276 ?auto_44277 ) ) ( AVAILABLE ?auto_44281 ) ( ON ?auto_44276 ?auto_44278 ) ( not ( = ?auto_44278 ?auto_44276 ) ) ( not ( = ?auto_44278 ?auto_44277 ) ) ( not ( = ?auto_44284 ?auto_44280 ) ) ( HOIST-AT ?auto_44283 ?auto_44284 ) ( not ( = ?auto_44281 ?auto_44283 ) ) ( AVAILABLE ?auto_44283 ) ( SURFACE-AT ?auto_44277 ?auto_44284 ) ( ON ?auto_44277 ?auto_44279 ) ( CLEAR ?auto_44277 ) ( not ( = ?auto_44276 ?auto_44279 ) ) ( not ( = ?auto_44277 ?auto_44279 ) ) ( not ( = ?auto_44278 ?auto_44279 ) ) ( TRUCK-AT ?auto_44282 ?auto_44285 ) ( not ( = ?auto_44285 ?auto_44280 ) ) ( not ( = ?auto_44284 ?auto_44285 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44282 ?auto_44285 ?auto_44280 )
      ( MAKE-1CRATE ?auto_44276 ?auto_44277 )
      ( MAKE-1CRATE-VERIFY ?auto_44276 ?auto_44277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44316 - SURFACE
      ?auto_44317 - SURFACE
      ?auto_44318 - SURFACE
      ?auto_44315 - SURFACE
    )
    :vars
    (
      ?auto_44319 - HOIST
      ?auto_44320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44319 ?auto_44320 ) ( SURFACE-AT ?auto_44318 ?auto_44320 ) ( CLEAR ?auto_44318 ) ( LIFTING ?auto_44319 ?auto_44315 ) ( IS-CRATE ?auto_44315 ) ( not ( = ?auto_44318 ?auto_44315 ) ) ( ON ?auto_44317 ?auto_44316 ) ( ON ?auto_44318 ?auto_44317 ) ( not ( = ?auto_44316 ?auto_44317 ) ) ( not ( = ?auto_44316 ?auto_44318 ) ) ( not ( = ?auto_44316 ?auto_44315 ) ) ( not ( = ?auto_44317 ?auto_44318 ) ) ( not ( = ?auto_44317 ?auto_44315 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44318 ?auto_44315 )
      ( MAKE-3CRATE-VERIFY ?auto_44316 ?auto_44317 ?auto_44318 ?auto_44315 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44333 - SURFACE
      ?auto_44334 - SURFACE
      ?auto_44335 - SURFACE
      ?auto_44332 - SURFACE
    )
    :vars
    (
      ?auto_44336 - HOIST
      ?auto_44338 - PLACE
      ?auto_44337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44336 ?auto_44338 ) ( SURFACE-AT ?auto_44335 ?auto_44338 ) ( CLEAR ?auto_44335 ) ( IS-CRATE ?auto_44332 ) ( not ( = ?auto_44335 ?auto_44332 ) ) ( TRUCK-AT ?auto_44337 ?auto_44338 ) ( AVAILABLE ?auto_44336 ) ( IN ?auto_44332 ?auto_44337 ) ( ON ?auto_44335 ?auto_44334 ) ( not ( = ?auto_44334 ?auto_44335 ) ) ( not ( = ?auto_44334 ?auto_44332 ) ) ( ON ?auto_44334 ?auto_44333 ) ( not ( = ?auto_44333 ?auto_44334 ) ) ( not ( = ?auto_44333 ?auto_44335 ) ) ( not ( = ?auto_44333 ?auto_44332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44334 ?auto_44335 ?auto_44332 )
      ( MAKE-3CRATE-VERIFY ?auto_44333 ?auto_44334 ?auto_44335 ?auto_44332 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44354 - SURFACE
      ?auto_44355 - SURFACE
      ?auto_44356 - SURFACE
      ?auto_44353 - SURFACE
    )
    :vars
    (
      ?auto_44359 - HOIST
      ?auto_44357 - PLACE
      ?auto_44360 - TRUCK
      ?auto_44358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44359 ?auto_44357 ) ( SURFACE-AT ?auto_44356 ?auto_44357 ) ( CLEAR ?auto_44356 ) ( IS-CRATE ?auto_44353 ) ( not ( = ?auto_44356 ?auto_44353 ) ) ( AVAILABLE ?auto_44359 ) ( IN ?auto_44353 ?auto_44360 ) ( ON ?auto_44356 ?auto_44355 ) ( not ( = ?auto_44355 ?auto_44356 ) ) ( not ( = ?auto_44355 ?auto_44353 ) ) ( TRUCK-AT ?auto_44360 ?auto_44358 ) ( not ( = ?auto_44358 ?auto_44357 ) ) ( ON ?auto_44355 ?auto_44354 ) ( not ( = ?auto_44354 ?auto_44355 ) ) ( not ( = ?auto_44354 ?auto_44356 ) ) ( not ( = ?auto_44354 ?auto_44353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44355 ?auto_44356 ?auto_44353 )
      ( MAKE-3CRATE-VERIFY ?auto_44354 ?auto_44355 ?auto_44356 ?auto_44353 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44378 - SURFACE
      ?auto_44379 - SURFACE
      ?auto_44380 - SURFACE
      ?auto_44377 - SURFACE
    )
    :vars
    (
      ?auto_44382 - HOIST
      ?auto_44385 - PLACE
      ?auto_44384 - TRUCK
      ?auto_44381 - PLACE
      ?auto_44383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44382 ?auto_44385 ) ( SURFACE-AT ?auto_44380 ?auto_44385 ) ( CLEAR ?auto_44380 ) ( IS-CRATE ?auto_44377 ) ( not ( = ?auto_44380 ?auto_44377 ) ) ( AVAILABLE ?auto_44382 ) ( ON ?auto_44380 ?auto_44379 ) ( not ( = ?auto_44379 ?auto_44380 ) ) ( not ( = ?auto_44379 ?auto_44377 ) ) ( TRUCK-AT ?auto_44384 ?auto_44381 ) ( not ( = ?auto_44381 ?auto_44385 ) ) ( HOIST-AT ?auto_44383 ?auto_44381 ) ( LIFTING ?auto_44383 ?auto_44377 ) ( not ( = ?auto_44382 ?auto_44383 ) ) ( ON ?auto_44379 ?auto_44378 ) ( not ( = ?auto_44378 ?auto_44379 ) ) ( not ( = ?auto_44378 ?auto_44380 ) ) ( not ( = ?auto_44378 ?auto_44377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44379 ?auto_44380 ?auto_44377 )
      ( MAKE-3CRATE-VERIFY ?auto_44378 ?auto_44379 ?auto_44380 ?auto_44377 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44405 - SURFACE
      ?auto_44406 - SURFACE
      ?auto_44407 - SURFACE
      ?auto_44404 - SURFACE
    )
    :vars
    (
      ?auto_44411 - HOIST
      ?auto_44410 - PLACE
      ?auto_44409 - TRUCK
      ?auto_44413 - PLACE
      ?auto_44408 - HOIST
      ?auto_44412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44411 ?auto_44410 ) ( SURFACE-AT ?auto_44407 ?auto_44410 ) ( CLEAR ?auto_44407 ) ( IS-CRATE ?auto_44404 ) ( not ( = ?auto_44407 ?auto_44404 ) ) ( AVAILABLE ?auto_44411 ) ( ON ?auto_44407 ?auto_44406 ) ( not ( = ?auto_44406 ?auto_44407 ) ) ( not ( = ?auto_44406 ?auto_44404 ) ) ( TRUCK-AT ?auto_44409 ?auto_44413 ) ( not ( = ?auto_44413 ?auto_44410 ) ) ( HOIST-AT ?auto_44408 ?auto_44413 ) ( not ( = ?auto_44411 ?auto_44408 ) ) ( AVAILABLE ?auto_44408 ) ( SURFACE-AT ?auto_44404 ?auto_44413 ) ( ON ?auto_44404 ?auto_44412 ) ( CLEAR ?auto_44404 ) ( not ( = ?auto_44407 ?auto_44412 ) ) ( not ( = ?auto_44404 ?auto_44412 ) ) ( not ( = ?auto_44406 ?auto_44412 ) ) ( ON ?auto_44406 ?auto_44405 ) ( not ( = ?auto_44405 ?auto_44406 ) ) ( not ( = ?auto_44405 ?auto_44407 ) ) ( not ( = ?auto_44405 ?auto_44404 ) ) ( not ( = ?auto_44405 ?auto_44412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44406 ?auto_44407 ?auto_44404 )
      ( MAKE-3CRATE-VERIFY ?auto_44405 ?auto_44406 ?auto_44407 ?auto_44404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44433 - SURFACE
      ?auto_44434 - SURFACE
      ?auto_44435 - SURFACE
      ?auto_44432 - SURFACE
    )
    :vars
    (
      ?auto_44441 - HOIST
      ?auto_44439 - PLACE
      ?auto_44436 - PLACE
      ?auto_44437 - HOIST
      ?auto_44440 - SURFACE
      ?auto_44438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44441 ?auto_44439 ) ( SURFACE-AT ?auto_44435 ?auto_44439 ) ( CLEAR ?auto_44435 ) ( IS-CRATE ?auto_44432 ) ( not ( = ?auto_44435 ?auto_44432 ) ) ( AVAILABLE ?auto_44441 ) ( ON ?auto_44435 ?auto_44434 ) ( not ( = ?auto_44434 ?auto_44435 ) ) ( not ( = ?auto_44434 ?auto_44432 ) ) ( not ( = ?auto_44436 ?auto_44439 ) ) ( HOIST-AT ?auto_44437 ?auto_44436 ) ( not ( = ?auto_44441 ?auto_44437 ) ) ( AVAILABLE ?auto_44437 ) ( SURFACE-AT ?auto_44432 ?auto_44436 ) ( ON ?auto_44432 ?auto_44440 ) ( CLEAR ?auto_44432 ) ( not ( = ?auto_44435 ?auto_44440 ) ) ( not ( = ?auto_44432 ?auto_44440 ) ) ( not ( = ?auto_44434 ?auto_44440 ) ) ( TRUCK-AT ?auto_44438 ?auto_44439 ) ( ON ?auto_44434 ?auto_44433 ) ( not ( = ?auto_44433 ?auto_44434 ) ) ( not ( = ?auto_44433 ?auto_44435 ) ) ( not ( = ?auto_44433 ?auto_44432 ) ) ( not ( = ?auto_44433 ?auto_44440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44434 ?auto_44435 ?auto_44432 )
      ( MAKE-3CRATE-VERIFY ?auto_44433 ?auto_44434 ?auto_44435 ?auto_44432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44461 - SURFACE
      ?auto_44462 - SURFACE
      ?auto_44463 - SURFACE
      ?auto_44460 - SURFACE
    )
    :vars
    (
      ?auto_44469 - HOIST
      ?auto_44464 - PLACE
      ?auto_44468 - PLACE
      ?auto_44465 - HOIST
      ?auto_44466 - SURFACE
      ?auto_44467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44469 ?auto_44464 ) ( IS-CRATE ?auto_44460 ) ( not ( = ?auto_44463 ?auto_44460 ) ) ( not ( = ?auto_44462 ?auto_44463 ) ) ( not ( = ?auto_44462 ?auto_44460 ) ) ( not ( = ?auto_44468 ?auto_44464 ) ) ( HOIST-AT ?auto_44465 ?auto_44468 ) ( not ( = ?auto_44469 ?auto_44465 ) ) ( AVAILABLE ?auto_44465 ) ( SURFACE-AT ?auto_44460 ?auto_44468 ) ( ON ?auto_44460 ?auto_44466 ) ( CLEAR ?auto_44460 ) ( not ( = ?auto_44463 ?auto_44466 ) ) ( not ( = ?auto_44460 ?auto_44466 ) ) ( not ( = ?auto_44462 ?auto_44466 ) ) ( TRUCK-AT ?auto_44467 ?auto_44464 ) ( SURFACE-AT ?auto_44462 ?auto_44464 ) ( CLEAR ?auto_44462 ) ( LIFTING ?auto_44469 ?auto_44463 ) ( IS-CRATE ?auto_44463 ) ( ON ?auto_44462 ?auto_44461 ) ( not ( = ?auto_44461 ?auto_44462 ) ) ( not ( = ?auto_44461 ?auto_44463 ) ) ( not ( = ?auto_44461 ?auto_44460 ) ) ( not ( = ?auto_44461 ?auto_44466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44462 ?auto_44463 ?auto_44460 )
      ( MAKE-3CRATE-VERIFY ?auto_44461 ?auto_44462 ?auto_44463 ?auto_44460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44489 - SURFACE
      ?auto_44490 - SURFACE
      ?auto_44491 - SURFACE
      ?auto_44488 - SURFACE
    )
    :vars
    (
      ?auto_44495 - HOIST
      ?auto_44494 - PLACE
      ?auto_44496 - PLACE
      ?auto_44493 - HOIST
      ?auto_44492 - SURFACE
      ?auto_44497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44495 ?auto_44494 ) ( IS-CRATE ?auto_44488 ) ( not ( = ?auto_44491 ?auto_44488 ) ) ( not ( = ?auto_44490 ?auto_44491 ) ) ( not ( = ?auto_44490 ?auto_44488 ) ) ( not ( = ?auto_44496 ?auto_44494 ) ) ( HOIST-AT ?auto_44493 ?auto_44496 ) ( not ( = ?auto_44495 ?auto_44493 ) ) ( AVAILABLE ?auto_44493 ) ( SURFACE-AT ?auto_44488 ?auto_44496 ) ( ON ?auto_44488 ?auto_44492 ) ( CLEAR ?auto_44488 ) ( not ( = ?auto_44491 ?auto_44492 ) ) ( not ( = ?auto_44488 ?auto_44492 ) ) ( not ( = ?auto_44490 ?auto_44492 ) ) ( TRUCK-AT ?auto_44497 ?auto_44494 ) ( SURFACE-AT ?auto_44490 ?auto_44494 ) ( CLEAR ?auto_44490 ) ( IS-CRATE ?auto_44491 ) ( AVAILABLE ?auto_44495 ) ( IN ?auto_44491 ?auto_44497 ) ( ON ?auto_44490 ?auto_44489 ) ( not ( = ?auto_44489 ?auto_44490 ) ) ( not ( = ?auto_44489 ?auto_44491 ) ) ( not ( = ?auto_44489 ?auto_44488 ) ) ( not ( = ?auto_44489 ?auto_44492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44490 ?auto_44491 ?auto_44488 )
      ( MAKE-3CRATE-VERIFY ?auto_44489 ?auto_44490 ?auto_44491 ?auto_44488 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44780 - SURFACE
      ?auto_44781 - SURFACE
      ?auto_44782 - SURFACE
      ?auto_44779 - SURFACE
      ?auto_44783 - SURFACE
    )
    :vars
    (
      ?auto_44785 - HOIST
      ?auto_44784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44785 ?auto_44784 ) ( SURFACE-AT ?auto_44779 ?auto_44784 ) ( CLEAR ?auto_44779 ) ( LIFTING ?auto_44785 ?auto_44783 ) ( IS-CRATE ?auto_44783 ) ( not ( = ?auto_44779 ?auto_44783 ) ) ( ON ?auto_44781 ?auto_44780 ) ( ON ?auto_44782 ?auto_44781 ) ( ON ?auto_44779 ?auto_44782 ) ( not ( = ?auto_44780 ?auto_44781 ) ) ( not ( = ?auto_44780 ?auto_44782 ) ) ( not ( = ?auto_44780 ?auto_44779 ) ) ( not ( = ?auto_44780 ?auto_44783 ) ) ( not ( = ?auto_44781 ?auto_44782 ) ) ( not ( = ?auto_44781 ?auto_44779 ) ) ( not ( = ?auto_44781 ?auto_44783 ) ) ( not ( = ?auto_44782 ?auto_44779 ) ) ( not ( = ?auto_44782 ?auto_44783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44779 ?auto_44783 )
      ( MAKE-4CRATE-VERIFY ?auto_44780 ?auto_44781 ?auto_44782 ?auto_44779 ?auto_44783 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44805 - SURFACE
      ?auto_44806 - SURFACE
      ?auto_44807 - SURFACE
      ?auto_44804 - SURFACE
      ?auto_44808 - SURFACE
    )
    :vars
    (
      ?auto_44810 - HOIST
      ?auto_44809 - PLACE
      ?auto_44811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44810 ?auto_44809 ) ( SURFACE-AT ?auto_44804 ?auto_44809 ) ( CLEAR ?auto_44804 ) ( IS-CRATE ?auto_44808 ) ( not ( = ?auto_44804 ?auto_44808 ) ) ( TRUCK-AT ?auto_44811 ?auto_44809 ) ( AVAILABLE ?auto_44810 ) ( IN ?auto_44808 ?auto_44811 ) ( ON ?auto_44804 ?auto_44807 ) ( not ( = ?auto_44807 ?auto_44804 ) ) ( not ( = ?auto_44807 ?auto_44808 ) ) ( ON ?auto_44806 ?auto_44805 ) ( ON ?auto_44807 ?auto_44806 ) ( not ( = ?auto_44805 ?auto_44806 ) ) ( not ( = ?auto_44805 ?auto_44807 ) ) ( not ( = ?auto_44805 ?auto_44804 ) ) ( not ( = ?auto_44805 ?auto_44808 ) ) ( not ( = ?auto_44806 ?auto_44807 ) ) ( not ( = ?auto_44806 ?auto_44804 ) ) ( not ( = ?auto_44806 ?auto_44808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44807 ?auto_44804 ?auto_44808 )
      ( MAKE-4CRATE-VERIFY ?auto_44805 ?auto_44806 ?auto_44807 ?auto_44804 ?auto_44808 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44835 - SURFACE
      ?auto_44836 - SURFACE
      ?auto_44837 - SURFACE
      ?auto_44834 - SURFACE
      ?auto_44838 - SURFACE
    )
    :vars
    (
      ?auto_44842 - HOIST
      ?auto_44840 - PLACE
      ?auto_44839 - TRUCK
      ?auto_44841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44842 ?auto_44840 ) ( SURFACE-AT ?auto_44834 ?auto_44840 ) ( CLEAR ?auto_44834 ) ( IS-CRATE ?auto_44838 ) ( not ( = ?auto_44834 ?auto_44838 ) ) ( AVAILABLE ?auto_44842 ) ( IN ?auto_44838 ?auto_44839 ) ( ON ?auto_44834 ?auto_44837 ) ( not ( = ?auto_44837 ?auto_44834 ) ) ( not ( = ?auto_44837 ?auto_44838 ) ) ( TRUCK-AT ?auto_44839 ?auto_44841 ) ( not ( = ?auto_44841 ?auto_44840 ) ) ( ON ?auto_44836 ?auto_44835 ) ( ON ?auto_44837 ?auto_44836 ) ( not ( = ?auto_44835 ?auto_44836 ) ) ( not ( = ?auto_44835 ?auto_44837 ) ) ( not ( = ?auto_44835 ?auto_44834 ) ) ( not ( = ?auto_44835 ?auto_44838 ) ) ( not ( = ?auto_44836 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44834 ) ) ( not ( = ?auto_44836 ?auto_44838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44837 ?auto_44834 ?auto_44838 )
      ( MAKE-4CRATE-VERIFY ?auto_44835 ?auto_44836 ?auto_44837 ?auto_44834 ?auto_44838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44869 - SURFACE
      ?auto_44870 - SURFACE
      ?auto_44871 - SURFACE
      ?auto_44868 - SURFACE
      ?auto_44872 - SURFACE
    )
    :vars
    (
      ?auto_44877 - HOIST
      ?auto_44875 - PLACE
      ?auto_44874 - TRUCK
      ?auto_44876 - PLACE
      ?auto_44873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44877 ?auto_44875 ) ( SURFACE-AT ?auto_44868 ?auto_44875 ) ( CLEAR ?auto_44868 ) ( IS-CRATE ?auto_44872 ) ( not ( = ?auto_44868 ?auto_44872 ) ) ( AVAILABLE ?auto_44877 ) ( ON ?auto_44868 ?auto_44871 ) ( not ( = ?auto_44871 ?auto_44868 ) ) ( not ( = ?auto_44871 ?auto_44872 ) ) ( TRUCK-AT ?auto_44874 ?auto_44876 ) ( not ( = ?auto_44876 ?auto_44875 ) ) ( HOIST-AT ?auto_44873 ?auto_44876 ) ( LIFTING ?auto_44873 ?auto_44872 ) ( not ( = ?auto_44877 ?auto_44873 ) ) ( ON ?auto_44870 ?auto_44869 ) ( ON ?auto_44871 ?auto_44870 ) ( not ( = ?auto_44869 ?auto_44870 ) ) ( not ( = ?auto_44869 ?auto_44871 ) ) ( not ( = ?auto_44869 ?auto_44868 ) ) ( not ( = ?auto_44869 ?auto_44872 ) ) ( not ( = ?auto_44870 ?auto_44871 ) ) ( not ( = ?auto_44870 ?auto_44868 ) ) ( not ( = ?auto_44870 ?auto_44872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44871 ?auto_44868 ?auto_44872 )
      ( MAKE-4CRATE-VERIFY ?auto_44869 ?auto_44870 ?auto_44871 ?auto_44868 ?auto_44872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44907 - SURFACE
      ?auto_44908 - SURFACE
      ?auto_44909 - SURFACE
      ?auto_44906 - SURFACE
      ?auto_44910 - SURFACE
    )
    :vars
    (
      ?auto_44916 - HOIST
      ?auto_44912 - PLACE
      ?auto_44914 - TRUCK
      ?auto_44911 - PLACE
      ?auto_44913 - HOIST
      ?auto_44915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44916 ?auto_44912 ) ( SURFACE-AT ?auto_44906 ?auto_44912 ) ( CLEAR ?auto_44906 ) ( IS-CRATE ?auto_44910 ) ( not ( = ?auto_44906 ?auto_44910 ) ) ( AVAILABLE ?auto_44916 ) ( ON ?auto_44906 ?auto_44909 ) ( not ( = ?auto_44909 ?auto_44906 ) ) ( not ( = ?auto_44909 ?auto_44910 ) ) ( TRUCK-AT ?auto_44914 ?auto_44911 ) ( not ( = ?auto_44911 ?auto_44912 ) ) ( HOIST-AT ?auto_44913 ?auto_44911 ) ( not ( = ?auto_44916 ?auto_44913 ) ) ( AVAILABLE ?auto_44913 ) ( SURFACE-AT ?auto_44910 ?auto_44911 ) ( ON ?auto_44910 ?auto_44915 ) ( CLEAR ?auto_44910 ) ( not ( = ?auto_44906 ?auto_44915 ) ) ( not ( = ?auto_44910 ?auto_44915 ) ) ( not ( = ?auto_44909 ?auto_44915 ) ) ( ON ?auto_44908 ?auto_44907 ) ( ON ?auto_44909 ?auto_44908 ) ( not ( = ?auto_44907 ?auto_44908 ) ) ( not ( = ?auto_44907 ?auto_44909 ) ) ( not ( = ?auto_44907 ?auto_44906 ) ) ( not ( = ?auto_44907 ?auto_44910 ) ) ( not ( = ?auto_44907 ?auto_44915 ) ) ( not ( = ?auto_44908 ?auto_44909 ) ) ( not ( = ?auto_44908 ?auto_44906 ) ) ( not ( = ?auto_44908 ?auto_44910 ) ) ( not ( = ?auto_44908 ?auto_44915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44909 ?auto_44906 ?auto_44910 )
      ( MAKE-4CRATE-VERIFY ?auto_44907 ?auto_44908 ?auto_44909 ?auto_44906 ?auto_44910 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44946 - SURFACE
      ?auto_44947 - SURFACE
      ?auto_44948 - SURFACE
      ?auto_44945 - SURFACE
      ?auto_44949 - SURFACE
    )
    :vars
    (
      ?auto_44953 - HOIST
      ?auto_44950 - PLACE
      ?auto_44952 - PLACE
      ?auto_44951 - HOIST
      ?auto_44955 - SURFACE
      ?auto_44954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44953 ?auto_44950 ) ( SURFACE-AT ?auto_44945 ?auto_44950 ) ( CLEAR ?auto_44945 ) ( IS-CRATE ?auto_44949 ) ( not ( = ?auto_44945 ?auto_44949 ) ) ( AVAILABLE ?auto_44953 ) ( ON ?auto_44945 ?auto_44948 ) ( not ( = ?auto_44948 ?auto_44945 ) ) ( not ( = ?auto_44948 ?auto_44949 ) ) ( not ( = ?auto_44952 ?auto_44950 ) ) ( HOIST-AT ?auto_44951 ?auto_44952 ) ( not ( = ?auto_44953 ?auto_44951 ) ) ( AVAILABLE ?auto_44951 ) ( SURFACE-AT ?auto_44949 ?auto_44952 ) ( ON ?auto_44949 ?auto_44955 ) ( CLEAR ?auto_44949 ) ( not ( = ?auto_44945 ?auto_44955 ) ) ( not ( = ?auto_44949 ?auto_44955 ) ) ( not ( = ?auto_44948 ?auto_44955 ) ) ( TRUCK-AT ?auto_44954 ?auto_44950 ) ( ON ?auto_44947 ?auto_44946 ) ( ON ?auto_44948 ?auto_44947 ) ( not ( = ?auto_44946 ?auto_44947 ) ) ( not ( = ?auto_44946 ?auto_44948 ) ) ( not ( = ?auto_44946 ?auto_44945 ) ) ( not ( = ?auto_44946 ?auto_44949 ) ) ( not ( = ?auto_44946 ?auto_44955 ) ) ( not ( = ?auto_44947 ?auto_44948 ) ) ( not ( = ?auto_44947 ?auto_44945 ) ) ( not ( = ?auto_44947 ?auto_44949 ) ) ( not ( = ?auto_44947 ?auto_44955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44948 ?auto_44945 ?auto_44949 )
      ( MAKE-4CRATE-VERIFY ?auto_44946 ?auto_44947 ?auto_44948 ?auto_44945 ?auto_44949 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44985 - SURFACE
      ?auto_44986 - SURFACE
      ?auto_44987 - SURFACE
      ?auto_44984 - SURFACE
      ?auto_44988 - SURFACE
    )
    :vars
    (
      ?auto_44991 - HOIST
      ?auto_44990 - PLACE
      ?auto_44993 - PLACE
      ?auto_44989 - HOIST
      ?auto_44994 - SURFACE
      ?auto_44992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44991 ?auto_44990 ) ( IS-CRATE ?auto_44988 ) ( not ( = ?auto_44984 ?auto_44988 ) ) ( not ( = ?auto_44987 ?auto_44984 ) ) ( not ( = ?auto_44987 ?auto_44988 ) ) ( not ( = ?auto_44993 ?auto_44990 ) ) ( HOIST-AT ?auto_44989 ?auto_44993 ) ( not ( = ?auto_44991 ?auto_44989 ) ) ( AVAILABLE ?auto_44989 ) ( SURFACE-AT ?auto_44988 ?auto_44993 ) ( ON ?auto_44988 ?auto_44994 ) ( CLEAR ?auto_44988 ) ( not ( = ?auto_44984 ?auto_44994 ) ) ( not ( = ?auto_44988 ?auto_44994 ) ) ( not ( = ?auto_44987 ?auto_44994 ) ) ( TRUCK-AT ?auto_44992 ?auto_44990 ) ( SURFACE-AT ?auto_44987 ?auto_44990 ) ( CLEAR ?auto_44987 ) ( LIFTING ?auto_44991 ?auto_44984 ) ( IS-CRATE ?auto_44984 ) ( ON ?auto_44986 ?auto_44985 ) ( ON ?auto_44987 ?auto_44986 ) ( not ( = ?auto_44985 ?auto_44986 ) ) ( not ( = ?auto_44985 ?auto_44987 ) ) ( not ( = ?auto_44985 ?auto_44984 ) ) ( not ( = ?auto_44985 ?auto_44988 ) ) ( not ( = ?auto_44985 ?auto_44994 ) ) ( not ( = ?auto_44986 ?auto_44987 ) ) ( not ( = ?auto_44986 ?auto_44984 ) ) ( not ( = ?auto_44986 ?auto_44988 ) ) ( not ( = ?auto_44986 ?auto_44994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44987 ?auto_44984 ?auto_44988 )
      ( MAKE-4CRATE-VERIFY ?auto_44985 ?auto_44986 ?auto_44987 ?auto_44984 ?auto_44988 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_45024 - SURFACE
      ?auto_45025 - SURFACE
      ?auto_45026 - SURFACE
      ?auto_45023 - SURFACE
      ?auto_45027 - SURFACE
    )
    :vars
    (
      ?auto_45032 - HOIST
      ?auto_45029 - PLACE
      ?auto_45028 - PLACE
      ?auto_45030 - HOIST
      ?auto_45031 - SURFACE
      ?auto_45033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45032 ?auto_45029 ) ( IS-CRATE ?auto_45027 ) ( not ( = ?auto_45023 ?auto_45027 ) ) ( not ( = ?auto_45026 ?auto_45023 ) ) ( not ( = ?auto_45026 ?auto_45027 ) ) ( not ( = ?auto_45028 ?auto_45029 ) ) ( HOIST-AT ?auto_45030 ?auto_45028 ) ( not ( = ?auto_45032 ?auto_45030 ) ) ( AVAILABLE ?auto_45030 ) ( SURFACE-AT ?auto_45027 ?auto_45028 ) ( ON ?auto_45027 ?auto_45031 ) ( CLEAR ?auto_45027 ) ( not ( = ?auto_45023 ?auto_45031 ) ) ( not ( = ?auto_45027 ?auto_45031 ) ) ( not ( = ?auto_45026 ?auto_45031 ) ) ( TRUCK-AT ?auto_45033 ?auto_45029 ) ( SURFACE-AT ?auto_45026 ?auto_45029 ) ( CLEAR ?auto_45026 ) ( IS-CRATE ?auto_45023 ) ( AVAILABLE ?auto_45032 ) ( IN ?auto_45023 ?auto_45033 ) ( ON ?auto_45025 ?auto_45024 ) ( ON ?auto_45026 ?auto_45025 ) ( not ( = ?auto_45024 ?auto_45025 ) ) ( not ( = ?auto_45024 ?auto_45026 ) ) ( not ( = ?auto_45024 ?auto_45023 ) ) ( not ( = ?auto_45024 ?auto_45027 ) ) ( not ( = ?auto_45024 ?auto_45031 ) ) ( not ( = ?auto_45025 ?auto_45026 ) ) ( not ( = ?auto_45025 ?auto_45023 ) ) ( not ( = ?auto_45025 ?auto_45027 ) ) ( not ( = ?auto_45025 ?auto_45031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45026 ?auto_45023 ?auto_45027 )
      ( MAKE-4CRATE-VERIFY ?auto_45024 ?auto_45025 ?auto_45026 ?auto_45023 ?auto_45027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_45524 - SURFACE
      ?auto_45525 - SURFACE
    )
    :vars
    (
      ?auto_45530 - HOIST
      ?auto_45532 - PLACE
      ?auto_45529 - SURFACE
      ?auto_45528 - TRUCK
      ?auto_45526 - PLACE
      ?auto_45527 - HOIST
      ?auto_45531 - SURFACE
      ?auto_45533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45530 ?auto_45532 ) ( SURFACE-AT ?auto_45524 ?auto_45532 ) ( CLEAR ?auto_45524 ) ( IS-CRATE ?auto_45525 ) ( not ( = ?auto_45524 ?auto_45525 ) ) ( AVAILABLE ?auto_45530 ) ( ON ?auto_45524 ?auto_45529 ) ( not ( = ?auto_45529 ?auto_45524 ) ) ( not ( = ?auto_45529 ?auto_45525 ) ) ( TRUCK-AT ?auto_45528 ?auto_45526 ) ( not ( = ?auto_45526 ?auto_45532 ) ) ( HOIST-AT ?auto_45527 ?auto_45526 ) ( not ( = ?auto_45530 ?auto_45527 ) ) ( SURFACE-AT ?auto_45525 ?auto_45526 ) ( ON ?auto_45525 ?auto_45531 ) ( CLEAR ?auto_45525 ) ( not ( = ?auto_45524 ?auto_45531 ) ) ( not ( = ?auto_45525 ?auto_45531 ) ) ( not ( = ?auto_45529 ?auto_45531 ) ) ( LIFTING ?auto_45527 ?auto_45533 ) ( IS-CRATE ?auto_45533 ) ( not ( = ?auto_45524 ?auto_45533 ) ) ( not ( = ?auto_45525 ?auto_45533 ) ) ( not ( = ?auto_45529 ?auto_45533 ) ) ( not ( = ?auto_45531 ?auto_45533 ) ) )
    :subtasks
    ( ( !LOAD ?auto_45527 ?auto_45533 ?auto_45528 ?auto_45526 )
      ( MAKE-1CRATE ?auto_45524 ?auto_45525 )
      ( MAKE-1CRATE-VERIFY ?auto_45524 ?auto_45525 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45684 - SURFACE
      ?auto_45685 - SURFACE
      ?auto_45686 - SURFACE
      ?auto_45683 - SURFACE
      ?auto_45687 - SURFACE
      ?auto_45688 - SURFACE
    )
    :vars
    (
      ?auto_45689 - HOIST
      ?auto_45690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45689 ?auto_45690 ) ( SURFACE-AT ?auto_45687 ?auto_45690 ) ( CLEAR ?auto_45687 ) ( LIFTING ?auto_45689 ?auto_45688 ) ( IS-CRATE ?auto_45688 ) ( not ( = ?auto_45687 ?auto_45688 ) ) ( ON ?auto_45685 ?auto_45684 ) ( ON ?auto_45686 ?auto_45685 ) ( ON ?auto_45683 ?auto_45686 ) ( ON ?auto_45687 ?auto_45683 ) ( not ( = ?auto_45684 ?auto_45685 ) ) ( not ( = ?auto_45684 ?auto_45686 ) ) ( not ( = ?auto_45684 ?auto_45683 ) ) ( not ( = ?auto_45684 ?auto_45687 ) ) ( not ( = ?auto_45684 ?auto_45688 ) ) ( not ( = ?auto_45685 ?auto_45686 ) ) ( not ( = ?auto_45685 ?auto_45683 ) ) ( not ( = ?auto_45685 ?auto_45687 ) ) ( not ( = ?auto_45685 ?auto_45688 ) ) ( not ( = ?auto_45686 ?auto_45683 ) ) ( not ( = ?auto_45686 ?auto_45687 ) ) ( not ( = ?auto_45686 ?auto_45688 ) ) ( not ( = ?auto_45683 ?auto_45687 ) ) ( not ( = ?auto_45683 ?auto_45688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_45687 ?auto_45688 )
      ( MAKE-5CRATE-VERIFY ?auto_45684 ?auto_45685 ?auto_45686 ?auto_45683 ?auto_45687 ?auto_45688 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45718 - SURFACE
      ?auto_45719 - SURFACE
      ?auto_45720 - SURFACE
      ?auto_45717 - SURFACE
      ?auto_45721 - SURFACE
      ?auto_45722 - SURFACE
    )
    :vars
    (
      ?auto_45723 - HOIST
      ?auto_45725 - PLACE
      ?auto_45724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45723 ?auto_45725 ) ( SURFACE-AT ?auto_45721 ?auto_45725 ) ( CLEAR ?auto_45721 ) ( IS-CRATE ?auto_45722 ) ( not ( = ?auto_45721 ?auto_45722 ) ) ( TRUCK-AT ?auto_45724 ?auto_45725 ) ( AVAILABLE ?auto_45723 ) ( IN ?auto_45722 ?auto_45724 ) ( ON ?auto_45721 ?auto_45717 ) ( not ( = ?auto_45717 ?auto_45721 ) ) ( not ( = ?auto_45717 ?auto_45722 ) ) ( ON ?auto_45719 ?auto_45718 ) ( ON ?auto_45720 ?auto_45719 ) ( ON ?auto_45717 ?auto_45720 ) ( not ( = ?auto_45718 ?auto_45719 ) ) ( not ( = ?auto_45718 ?auto_45720 ) ) ( not ( = ?auto_45718 ?auto_45717 ) ) ( not ( = ?auto_45718 ?auto_45721 ) ) ( not ( = ?auto_45718 ?auto_45722 ) ) ( not ( = ?auto_45719 ?auto_45720 ) ) ( not ( = ?auto_45719 ?auto_45717 ) ) ( not ( = ?auto_45719 ?auto_45721 ) ) ( not ( = ?auto_45719 ?auto_45722 ) ) ( not ( = ?auto_45720 ?auto_45717 ) ) ( not ( = ?auto_45720 ?auto_45721 ) ) ( not ( = ?auto_45720 ?auto_45722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45717 ?auto_45721 ?auto_45722 )
      ( MAKE-5CRATE-VERIFY ?auto_45718 ?auto_45719 ?auto_45720 ?auto_45717 ?auto_45721 ?auto_45722 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45758 - SURFACE
      ?auto_45759 - SURFACE
      ?auto_45760 - SURFACE
      ?auto_45757 - SURFACE
      ?auto_45761 - SURFACE
      ?auto_45762 - SURFACE
    )
    :vars
    (
      ?auto_45763 - HOIST
      ?auto_45764 - PLACE
      ?auto_45766 - TRUCK
      ?auto_45765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45763 ?auto_45764 ) ( SURFACE-AT ?auto_45761 ?auto_45764 ) ( CLEAR ?auto_45761 ) ( IS-CRATE ?auto_45762 ) ( not ( = ?auto_45761 ?auto_45762 ) ) ( AVAILABLE ?auto_45763 ) ( IN ?auto_45762 ?auto_45766 ) ( ON ?auto_45761 ?auto_45757 ) ( not ( = ?auto_45757 ?auto_45761 ) ) ( not ( = ?auto_45757 ?auto_45762 ) ) ( TRUCK-AT ?auto_45766 ?auto_45765 ) ( not ( = ?auto_45765 ?auto_45764 ) ) ( ON ?auto_45759 ?auto_45758 ) ( ON ?auto_45760 ?auto_45759 ) ( ON ?auto_45757 ?auto_45760 ) ( not ( = ?auto_45758 ?auto_45759 ) ) ( not ( = ?auto_45758 ?auto_45760 ) ) ( not ( = ?auto_45758 ?auto_45757 ) ) ( not ( = ?auto_45758 ?auto_45761 ) ) ( not ( = ?auto_45758 ?auto_45762 ) ) ( not ( = ?auto_45759 ?auto_45760 ) ) ( not ( = ?auto_45759 ?auto_45757 ) ) ( not ( = ?auto_45759 ?auto_45761 ) ) ( not ( = ?auto_45759 ?auto_45762 ) ) ( not ( = ?auto_45760 ?auto_45757 ) ) ( not ( = ?auto_45760 ?auto_45761 ) ) ( not ( = ?auto_45760 ?auto_45762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45757 ?auto_45761 ?auto_45762 )
      ( MAKE-5CRATE-VERIFY ?auto_45758 ?auto_45759 ?auto_45760 ?auto_45757 ?auto_45761 ?auto_45762 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45803 - SURFACE
      ?auto_45804 - SURFACE
      ?auto_45805 - SURFACE
      ?auto_45802 - SURFACE
      ?auto_45806 - SURFACE
      ?auto_45807 - SURFACE
    )
    :vars
    (
      ?auto_45808 - HOIST
      ?auto_45811 - PLACE
      ?auto_45810 - TRUCK
      ?auto_45812 - PLACE
      ?auto_45809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45808 ?auto_45811 ) ( SURFACE-AT ?auto_45806 ?auto_45811 ) ( CLEAR ?auto_45806 ) ( IS-CRATE ?auto_45807 ) ( not ( = ?auto_45806 ?auto_45807 ) ) ( AVAILABLE ?auto_45808 ) ( ON ?auto_45806 ?auto_45802 ) ( not ( = ?auto_45802 ?auto_45806 ) ) ( not ( = ?auto_45802 ?auto_45807 ) ) ( TRUCK-AT ?auto_45810 ?auto_45812 ) ( not ( = ?auto_45812 ?auto_45811 ) ) ( HOIST-AT ?auto_45809 ?auto_45812 ) ( LIFTING ?auto_45809 ?auto_45807 ) ( not ( = ?auto_45808 ?auto_45809 ) ) ( ON ?auto_45804 ?auto_45803 ) ( ON ?auto_45805 ?auto_45804 ) ( ON ?auto_45802 ?auto_45805 ) ( not ( = ?auto_45803 ?auto_45804 ) ) ( not ( = ?auto_45803 ?auto_45805 ) ) ( not ( = ?auto_45803 ?auto_45802 ) ) ( not ( = ?auto_45803 ?auto_45806 ) ) ( not ( = ?auto_45803 ?auto_45807 ) ) ( not ( = ?auto_45804 ?auto_45805 ) ) ( not ( = ?auto_45804 ?auto_45802 ) ) ( not ( = ?auto_45804 ?auto_45806 ) ) ( not ( = ?auto_45804 ?auto_45807 ) ) ( not ( = ?auto_45805 ?auto_45802 ) ) ( not ( = ?auto_45805 ?auto_45806 ) ) ( not ( = ?auto_45805 ?auto_45807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45802 ?auto_45806 ?auto_45807 )
      ( MAKE-5CRATE-VERIFY ?auto_45803 ?auto_45804 ?auto_45805 ?auto_45802 ?auto_45806 ?auto_45807 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45853 - SURFACE
      ?auto_45854 - SURFACE
      ?auto_45855 - SURFACE
      ?auto_45852 - SURFACE
      ?auto_45856 - SURFACE
      ?auto_45857 - SURFACE
    )
    :vars
    (
      ?auto_45863 - HOIST
      ?auto_45862 - PLACE
      ?auto_45861 - TRUCK
      ?auto_45858 - PLACE
      ?auto_45860 - HOIST
      ?auto_45859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45863 ?auto_45862 ) ( SURFACE-AT ?auto_45856 ?auto_45862 ) ( CLEAR ?auto_45856 ) ( IS-CRATE ?auto_45857 ) ( not ( = ?auto_45856 ?auto_45857 ) ) ( AVAILABLE ?auto_45863 ) ( ON ?auto_45856 ?auto_45852 ) ( not ( = ?auto_45852 ?auto_45856 ) ) ( not ( = ?auto_45852 ?auto_45857 ) ) ( TRUCK-AT ?auto_45861 ?auto_45858 ) ( not ( = ?auto_45858 ?auto_45862 ) ) ( HOIST-AT ?auto_45860 ?auto_45858 ) ( not ( = ?auto_45863 ?auto_45860 ) ) ( AVAILABLE ?auto_45860 ) ( SURFACE-AT ?auto_45857 ?auto_45858 ) ( ON ?auto_45857 ?auto_45859 ) ( CLEAR ?auto_45857 ) ( not ( = ?auto_45856 ?auto_45859 ) ) ( not ( = ?auto_45857 ?auto_45859 ) ) ( not ( = ?auto_45852 ?auto_45859 ) ) ( ON ?auto_45854 ?auto_45853 ) ( ON ?auto_45855 ?auto_45854 ) ( ON ?auto_45852 ?auto_45855 ) ( not ( = ?auto_45853 ?auto_45854 ) ) ( not ( = ?auto_45853 ?auto_45855 ) ) ( not ( = ?auto_45853 ?auto_45852 ) ) ( not ( = ?auto_45853 ?auto_45856 ) ) ( not ( = ?auto_45853 ?auto_45857 ) ) ( not ( = ?auto_45853 ?auto_45859 ) ) ( not ( = ?auto_45854 ?auto_45855 ) ) ( not ( = ?auto_45854 ?auto_45852 ) ) ( not ( = ?auto_45854 ?auto_45856 ) ) ( not ( = ?auto_45854 ?auto_45857 ) ) ( not ( = ?auto_45854 ?auto_45859 ) ) ( not ( = ?auto_45855 ?auto_45852 ) ) ( not ( = ?auto_45855 ?auto_45856 ) ) ( not ( = ?auto_45855 ?auto_45857 ) ) ( not ( = ?auto_45855 ?auto_45859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45852 ?auto_45856 ?auto_45857 )
      ( MAKE-5CRATE-VERIFY ?auto_45853 ?auto_45854 ?auto_45855 ?auto_45852 ?auto_45856 ?auto_45857 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45904 - SURFACE
      ?auto_45905 - SURFACE
      ?auto_45906 - SURFACE
      ?auto_45903 - SURFACE
      ?auto_45907 - SURFACE
      ?auto_45908 - SURFACE
    )
    :vars
    (
      ?auto_45913 - HOIST
      ?auto_45911 - PLACE
      ?auto_45912 - PLACE
      ?auto_45909 - HOIST
      ?auto_45914 - SURFACE
      ?auto_45910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45913 ?auto_45911 ) ( SURFACE-AT ?auto_45907 ?auto_45911 ) ( CLEAR ?auto_45907 ) ( IS-CRATE ?auto_45908 ) ( not ( = ?auto_45907 ?auto_45908 ) ) ( AVAILABLE ?auto_45913 ) ( ON ?auto_45907 ?auto_45903 ) ( not ( = ?auto_45903 ?auto_45907 ) ) ( not ( = ?auto_45903 ?auto_45908 ) ) ( not ( = ?auto_45912 ?auto_45911 ) ) ( HOIST-AT ?auto_45909 ?auto_45912 ) ( not ( = ?auto_45913 ?auto_45909 ) ) ( AVAILABLE ?auto_45909 ) ( SURFACE-AT ?auto_45908 ?auto_45912 ) ( ON ?auto_45908 ?auto_45914 ) ( CLEAR ?auto_45908 ) ( not ( = ?auto_45907 ?auto_45914 ) ) ( not ( = ?auto_45908 ?auto_45914 ) ) ( not ( = ?auto_45903 ?auto_45914 ) ) ( TRUCK-AT ?auto_45910 ?auto_45911 ) ( ON ?auto_45905 ?auto_45904 ) ( ON ?auto_45906 ?auto_45905 ) ( ON ?auto_45903 ?auto_45906 ) ( not ( = ?auto_45904 ?auto_45905 ) ) ( not ( = ?auto_45904 ?auto_45906 ) ) ( not ( = ?auto_45904 ?auto_45903 ) ) ( not ( = ?auto_45904 ?auto_45907 ) ) ( not ( = ?auto_45904 ?auto_45908 ) ) ( not ( = ?auto_45904 ?auto_45914 ) ) ( not ( = ?auto_45905 ?auto_45906 ) ) ( not ( = ?auto_45905 ?auto_45903 ) ) ( not ( = ?auto_45905 ?auto_45907 ) ) ( not ( = ?auto_45905 ?auto_45908 ) ) ( not ( = ?auto_45905 ?auto_45914 ) ) ( not ( = ?auto_45906 ?auto_45903 ) ) ( not ( = ?auto_45906 ?auto_45907 ) ) ( not ( = ?auto_45906 ?auto_45908 ) ) ( not ( = ?auto_45906 ?auto_45914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45903 ?auto_45907 ?auto_45908 )
      ( MAKE-5CRATE-VERIFY ?auto_45904 ?auto_45905 ?auto_45906 ?auto_45903 ?auto_45907 ?auto_45908 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45955 - SURFACE
      ?auto_45956 - SURFACE
      ?auto_45957 - SURFACE
      ?auto_45954 - SURFACE
      ?auto_45958 - SURFACE
      ?auto_45959 - SURFACE
    )
    :vars
    (
      ?auto_45965 - HOIST
      ?auto_45962 - PLACE
      ?auto_45963 - PLACE
      ?auto_45960 - HOIST
      ?auto_45961 - SURFACE
      ?auto_45964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45965 ?auto_45962 ) ( IS-CRATE ?auto_45959 ) ( not ( = ?auto_45958 ?auto_45959 ) ) ( not ( = ?auto_45954 ?auto_45958 ) ) ( not ( = ?auto_45954 ?auto_45959 ) ) ( not ( = ?auto_45963 ?auto_45962 ) ) ( HOIST-AT ?auto_45960 ?auto_45963 ) ( not ( = ?auto_45965 ?auto_45960 ) ) ( AVAILABLE ?auto_45960 ) ( SURFACE-AT ?auto_45959 ?auto_45963 ) ( ON ?auto_45959 ?auto_45961 ) ( CLEAR ?auto_45959 ) ( not ( = ?auto_45958 ?auto_45961 ) ) ( not ( = ?auto_45959 ?auto_45961 ) ) ( not ( = ?auto_45954 ?auto_45961 ) ) ( TRUCK-AT ?auto_45964 ?auto_45962 ) ( SURFACE-AT ?auto_45954 ?auto_45962 ) ( CLEAR ?auto_45954 ) ( LIFTING ?auto_45965 ?auto_45958 ) ( IS-CRATE ?auto_45958 ) ( ON ?auto_45956 ?auto_45955 ) ( ON ?auto_45957 ?auto_45956 ) ( ON ?auto_45954 ?auto_45957 ) ( not ( = ?auto_45955 ?auto_45956 ) ) ( not ( = ?auto_45955 ?auto_45957 ) ) ( not ( = ?auto_45955 ?auto_45954 ) ) ( not ( = ?auto_45955 ?auto_45958 ) ) ( not ( = ?auto_45955 ?auto_45959 ) ) ( not ( = ?auto_45955 ?auto_45961 ) ) ( not ( = ?auto_45956 ?auto_45957 ) ) ( not ( = ?auto_45956 ?auto_45954 ) ) ( not ( = ?auto_45956 ?auto_45958 ) ) ( not ( = ?auto_45956 ?auto_45959 ) ) ( not ( = ?auto_45956 ?auto_45961 ) ) ( not ( = ?auto_45957 ?auto_45954 ) ) ( not ( = ?auto_45957 ?auto_45958 ) ) ( not ( = ?auto_45957 ?auto_45959 ) ) ( not ( = ?auto_45957 ?auto_45961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45954 ?auto_45958 ?auto_45959 )
      ( MAKE-5CRATE-VERIFY ?auto_45955 ?auto_45956 ?auto_45957 ?auto_45954 ?auto_45958 ?auto_45959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_46006 - SURFACE
      ?auto_46007 - SURFACE
      ?auto_46008 - SURFACE
      ?auto_46005 - SURFACE
      ?auto_46009 - SURFACE
      ?auto_46010 - SURFACE
    )
    :vars
    (
      ?auto_46015 - HOIST
      ?auto_46012 - PLACE
      ?auto_46011 - PLACE
      ?auto_46016 - HOIST
      ?auto_46013 - SURFACE
      ?auto_46014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46015 ?auto_46012 ) ( IS-CRATE ?auto_46010 ) ( not ( = ?auto_46009 ?auto_46010 ) ) ( not ( = ?auto_46005 ?auto_46009 ) ) ( not ( = ?auto_46005 ?auto_46010 ) ) ( not ( = ?auto_46011 ?auto_46012 ) ) ( HOIST-AT ?auto_46016 ?auto_46011 ) ( not ( = ?auto_46015 ?auto_46016 ) ) ( AVAILABLE ?auto_46016 ) ( SURFACE-AT ?auto_46010 ?auto_46011 ) ( ON ?auto_46010 ?auto_46013 ) ( CLEAR ?auto_46010 ) ( not ( = ?auto_46009 ?auto_46013 ) ) ( not ( = ?auto_46010 ?auto_46013 ) ) ( not ( = ?auto_46005 ?auto_46013 ) ) ( TRUCK-AT ?auto_46014 ?auto_46012 ) ( SURFACE-AT ?auto_46005 ?auto_46012 ) ( CLEAR ?auto_46005 ) ( IS-CRATE ?auto_46009 ) ( AVAILABLE ?auto_46015 ) ( IN ?auto_46009 ?auto_46014 ) ( ON ?auto_46007 ?auto_46006 ) ( ON ?auto_46008 ?auto_46007 ) ( ON ?auto_46005 ?auto_46008 ) ( not ( = ?auto_46006 ?auto_46007 ) ) ( not ( = ?auto_46006 ?auto_46008 ) ) ( not ( = ?auto_46006 ?auto_46005 ) ) ( not ( = ?auto_46006 ?auto_46009 ) ) ( not ( = ?auto_46006 ?auto_46010 ) ) ( not ( = ?auto_46006 ?auto_46013 ) ) ( not ( = ?auto_46007 ?auto_46008 ) ) ( not ( = ?auto_46007 ?auto_46005 ) ) ( not ( = ?auto_46007 ?auto_46009 ) ) ( not ( = ?auto_46007 ?auto_46010 ) ) ( not ( = ?auto_46007 ?auto_46013 ) ) ( not ( = ?auto_46008 ?auto_46005 ) ) ( not ( = ?auto_46008 ?auto_46009 ) ) ( not ( = ?auto_46008 ?auto_46010 ) ) ( not ( = ?auto_46008 ?auto_46013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_46005 ?auto_46009 ?auto_46010 )
      ( MAKE-5CRATE-VERIFY ?auto_46006 ?auto_46007 ?auto_46008 ?auto_46005 ?auto_46009 ?auto_46010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_46994 - SURFACE
      ?auto_46995 - SURFACE
    )
    :vars
    (
      ?auto_47000 - HOIST
      ?auto_46997 - PLACE
      ?auto_46996 - SURFACE
      ?auto_46998 - PLACE
      ?auto_46999 - HOIST
      ?auto_47001 - SURFACE
      ?auto_47002 - TRUCK
      ?auto_47003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47000 ?auto_46997 ) ( SURFACE-AT ?auto_46994 ?auto_46997 ) ( CLEAR ?auto_46994 ) ( IS-CRATE ?auto_46995 ) ( not ( = ?auto_46994 ?auto_46995 ) ) ( ON ?auto_46994 ?auto_46996 ) ( not ( = ?auto_46996 ?auto_46994 ) ) ( not ( = ?auto_46996 ?auto_46995 ) ) ( not ( = ?auto_46998 ?auto_46997 ) ) ( HOIST-AT ?auto_46999 ?auto_46998 ) ( not ( = ?auto_47000 ?auto_46999 ) ) ( AVAILABLE ?auto_46999 ) ( SURFACE-AT ?auto_46995 ?auto_46998 ) ( ON ?auto_46995 ?auto_47001 ) ( CLEAR ?auto_46995 ) ( not ( = ?auto_46994 ?auto_47001 ) ) ( not ( = ?auto_46995 ?auto_47001 ) ) ( not ( = ?auto_46996 ?auto_47001 ) ) ( TRUCK-AT ?auto_47002 ?auto_46997 ) ( LIFTING ?auto_47000 ?auto_47003 ) ( IS-CRATE ?auto_47003 ) ( not ( = ?auto_46994 ?auto_47003 ) ) ( not ( = ?auto_46995 ?auto_47003 ) ) ( not ( = ?auto_46996 ?auto_47003 ) ) ( not ( = ?auto_47001 ?auto_47003 ) ) )
    :subtasks
    ( ( !LOAD ?auto_47000 ?auto_47003 ?auto_47002 ?auto_46997 )
      ( MAKE-1CRATE ?auto_46994 ?auto_46995 )
      ( MAKE-1CRATE-VERIFY ?auto_46994 ?auto_46995 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47210 - SURFACE
      ?auto_47211 - SURFACE
      ?auto_47212 - SURFACE
      ?auto_47209 - SURFACE
      ?auto_47213 - SURFACE
      ?auto_47215 - SURFACE
      ?auto_47214 - SURFACE
    )
    :vars
    (
      ?auto_47217 - HOIST
      ?auto_47216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47217 ?auto_47216 ) ( SURFACE-AT ?auto_47215 ?auto_47216 ) ( CLEAR ?auto_47215 ) ( LIFTING ?auto_47217 ?auto_47214 ) ( IS-CRATE ?auto_47214 ) ( not ( = ?auto_47215 ?auto_47214 ) ) ( ON ?auto_47211 ?auto_47210 ) ( ON ?auto_47212 ?auto_47211 ) ( ON ?auto_47209 ?auto_47212 ) ( ON ?auto_47213 ?auto_47209 ) ( ON ?auto_47215 ?auto_47213 ) ( not ( = ?auto_47210 ?auto_47211 ) ) ( not ( = ?auto_47210 ?auto_47212 ) ) ( not ( = ?auto_47210 ?auto_47209 ) ) ( not ( = ?auto_47210 ?auto_47213 ) ) ( not ( = ?auto_47210 ?auto_47215 ) ) ( not ( = ?auto_47210 ?auto_47214 ) ) ( not ( = ?auto_47211 ?auto_47212 ) ) ( not ( = ?auto_47211 ?auto_47209 ) ) ( not ( = ?auto_47211 ?auto_47213 ) ) ( not ( = ?auto_47211 ?auto_47215 ) ) ( not ( = ?auto_47211 ?auto_47214 ) ) ( not ( = ?auto_47212 ?auto_47209 ) ) ( not ( = ?auto_47212 ?auto_47213 ) ) ( not ( = ?auto_47212 ?auto_47215 ) ) ( not ( = ?auto_47212 ?auto_47214 ) ) ( not ( = ?auto_47209 ?auto_47213 ) ) ( not ( = ?auto_47209 ?auto_47215 ) ) ( not ( = ?auto_47209 ?auto_47214 ) ) ( not ( = ?auto_47213 ?auto_47215 ) ) ( not ( = ?auto_47213 ?auto_47214 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_47215 ?auto_47214 )
      ( MAKE-6CRATE-VERIFY ?auto_47210 ?auto_47211 ?auto_47212 ?auto_47209 ?auto_47213 ?auto_47215 ?auto_47214 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47254 - SURFACE
      ?auto_47255 - SURFACE
      ?auto_47256 - SURFACE
      ?auto_47253 - SURFACE
      ?auto_47257 - SURFACE
      ?auto_47259 - SURFACE
      ?auto_47258 - SURFACE
    )
    :vars
    (
      ?auto_47261 - HOIST
      ?auto_47260 - PLACE
      ?auto_47262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47261 ?auto_47260 ) ( SURFACE-AT ?auto_47259 ?auto_47260 ) ( CLEAR ?auto_47259 ) ( IS-CRATE ?auto_47258 ) ( not ( = ?auto_47259 ?auto_47258 ) ) ( TRUCK-AT ?auto_47262 ?auto_47260 ) ( AVAILABLE ?auto_47261 ) ( IN ?auto_47258 ?auto_47262 ) ( ON ?auto_47259 ?auto_47257 ) ( not ( = ?auto_47257 ?auto_47259 ) ) ( not ( = ?auto_47257 ?auto_47258 ) ) ( ON ?auto_47255 ?auto_47254 ) ( ON ?auto_47256 ?auto_47255 ) ( ON ?auto_47253 ?auto_47256 ) ( ON ?auto_47257 ?auto_47253 ) ( not ( = ?auto_47254 ?auto_47255 ) ) ( not ( = ?auto_47254 ?auto_47256 ) ) ( not ( = ?auto_47254 ?auto_47253 ) ) ( not ( = ?auto_47254 ?auto_47257 ) ) ( not ( = ?auto_47254 ?auto_47259 ) ) ( not ( = ?auto_47254 ?auto_47258 ) ) ( not ( = ?auto_47255 ?auto_47256 ) ) ( not ( = ?auto_47255 ?auto_47253 ) ) ( not ( = ?auto_47255 ?auto_47257 ) ) ( not ( = ?auto_47255 ?auto_47259 ) ) ( not ( = ?auto_47255 ?auto_47258 ) ) ( not ( = ?auto_47256 ?auto_47253 ) ) ( not ( = ?auto_47256 ?auto_47257 ) ) ( not ( = ?auto_47256 ?auto_47259 ) ) ( not ( = ?auto_47256 ?auto_47258 ) ) ( not ( = ?auto_47253 ?auto_47257 ) ) ( not ( = ?auto_47253 ?auto_47259 ) ) ( not ( = ?auto_47253 ?auto_47258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47257 ?auto_47259 ?auto_47258 )
      ( MAKE-6CRATE-VERIFY ?auto_47254 ?auto_47255 ?auto_47256 ?auto_47253 ?auto_47257 ?auto_47259 ?auto_47258 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47305 - SURFACE
      ?auto_47306 - SURFACE
      ?auto_47307 - SURFACE
      ?auto_47304 - SURFACE
      ?auto_47308 - SURFACE
      ?auto_47310 - SURFACE
      ?auto_47309 - SURFACE
    )
    :vars
    (
      ?auto_47312 - HOIST
      ?auto_47314 - PLACE
      ?auto_47313 - TRUCK
      ?auto_47311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47312 ?auto_47314 ) ( SURFACE-AT ?auto_47310 ?auto_47314 ) ( CLEAR ?auto_47310 ) ( IS-CRATE ?auto_47309 ) ( not ( = ?auto_47310 ?auto_47309 ) ) ( AVAILABLE ?auto_47312 ) ( IN ?auto_47309 ?auto_47313 ) ( ON ?auto_47310 ?auto_47308 ) ( not ( = ?auto_47308 ?auto_47310 ) ) ( not ( = ?auto_47308 ?auto_47309 ) ) ( TRUCK-AT ?auto_47313 ?auto_47311 ) ( not ( = ?auto_47311 ?auto_47314 ) ) ( ON ?auto_47306 ?auto_47305 ) ( ON ?auto_47307 ?auto_47306 ) ( ON ?auto_47304 ?auto_47307 ) ( ON ?auto_47308 ?auto_47304 ) ( not ( = ?auto_47305 ?auto_47306 ) ) ( not ( = ?auto_47305 ?auto_47307 ) ) ( not ( = ?auto_47305 ?auto_47304 ) ) ( not ( = ?auto_47305 ?auto_47308 ) ) ( not ( = ?auto_47305 ?auto_47310 ) ) ( not ( = ?auto_47305 ?auto_47309 ) ) ( not ( = ?auto_47306 ?auto_47307 ) ) ( not ( = ?auto_47306 ?auto_47304 ) ) ( not ( = ?auto_47306 ?auto_47308 ) ) ( not ( = ?auto_47306 ?auto_47310 ) ) ( not ( = ?auto_47306 ?auto_47309 ) ) ( not ( = ?auto_47307 ?auto_47304 ) ) ( not ( = ?auto_47307 ?auto_47308 ) ) ( not ( = ?auto_47307 ?auto_47310 ) ) ( not ( = ?auto_47307 ?auto_47309 ) ) ( not ( = ?auto_47304 ?auto_47308 ) ) ( not ( = ?auto_47304 ?auto_47310 ) ) ( not ( = ?auto_47304 ?auto_47309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47308 ?auto_47310 ?auto_47309 )
      ( MAKE-6CRATE-VERIFY ?auto_47305 ?auto_47306 ?auto_47307 ?auto_47304 ?auto_47308 ?auto_47310 ?auto_47309 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47362 - SURFACE
      ?auto_47363 - SURFACE
      ?auto_47364 - SURFACE
      ?auto_47361 - SURFACE
      ?auto_47365 - SURFACE
      ?auto_47367 - SURFACE
      ?auto_47366 - SURFACE
    )
    :vars
    (
      ?auto_47369 - HOIST
      ?auto_47372 - PLACE
      ?auto_47370 - TRUCK
      ?auto_47368 - PLACE
      ?auto_47371 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47369 ?auto_47372 ) ( SURFACE-AT ?auto_47367 ?auto_47372 ) ( CLEAR ?auto_47367 ) ( IS-CRATE ?auto_47366 ) ( not ( = ?auto_47367 ?auto_47366 ) ) ( AVAILABLE ?auto_47369 ) ( ON ?auto_47367 ?auto_47365 ) ( not ( = ?auto_47365 ?auto_47367 ) ) ( not ( = ?auto_47365 ?auto_47366 ) ) ( TRUCK-AT ?auto_47370 ?auto_47368 ) ( not ( = ?auto_47368 ?auto_47372 ) ) ( HOIST-AT ?auto_47371 ?auto_47368 ) ( LIFTING ?auto_47371 ?auto_47366 ) ( not ( = ?auto_47369 ?auto_47371 ) ) ( ON ?auto_47363 ?auto_47362 ) ( ON ?auto_47364 ?auto_47363 ) ( ON ?auto_47361 ?auto_47364 ) ( ON ?auto_47365 ?auto_47361 ) ( not ( = ?auto_47362 ?auto_47363 ) ) ( not ( = ?auto_47362 ?auto_47364 ) ) ( not ( = ?auto_47362 ?auto_47361 ) ) ( not ( = ?auto_47362 ?auto_47365 ) ) ( not ( = ?auto_47362 ?auto_47367 ) ) ( not ( = ?auto_47362 ?auto_47366 ) ) ( not ( = ?auto_47363 ?auto_47364 ) ) ( not ( = ?auto_47363 ?auto_47361 ) ) ( not ( = ?auto_47363 ?auto_47365 ) ) ( not ( = ?auto_47363 ?auto_47367 ) ) ( not ( = ?auto_47363 ?auto_47366 ) ) ( not ( = ?auto_47364 ?auto_47361 ) ) ( not ( = ?auto_47364 ?auto_47365 ) ) ( not ( = ?auto_47364 ?auto_47367 ) ) ( not ( = ?auto_47364 ?auto_47366 ) ) ( not ( = ?auto_47361 ?auto_47365 ) ) ( not ( = ?auto_47361 ?auto_47367 ) ) ( not ( = ?auto_47361 ?auto_47366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47365 ?auto_47367 ?auto_47366 )
      ( MAKE-6CRATE-VERIFY ?auto_47362 ?auto_47363 ?auto_47364 ?auto_47361 ?auto_47365 ?auto_47367 ?auto_47366 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47425 - SURFACE
      ?auto_47426 - SURFACE
      ?auto_47427 - SURFACE
      ?auto_47424 - SURFACE
      ?auto_47428 - SURFACE
      ?auto_47430 - SURFACE
      ?auto_47429 - SURFACE
    )
    :vars
    (
      ?auto_47434 - HOIST
      ?auto_47432 - PLACE
      ?auto_47431 - TRUCK
      ?auto_47433 - PLACE
      ?auto_47435 - HOIST
      ?auto_47436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47434 ?auto_47432 ) ( SURFACE-AT ?auto_47430 ?auto_47432 ) ( CLEAR ?auto_47430 ) ( IS-CRATE ?auto_47429 ) ( not ( = ?auto_47430 ?auto_47429 ) ) ( AVAILABLE ?auto_47434 ) ( ON ?auto_47430 ?auto_47428 ) ( not ( = ?auto_47428 ?auto_47430 ) ) ( not ( = ?auto_47428 ?auto_47429 ) ) ( TRUCK-AT ?auto_47431 ?auto_47433 ) ( not ( = ?auto_47433 ?auto_47432 ) ) ( HOIST-AT ?auto_47435 ?auto_47433 ) ( not ( = ?auto_47434 ?auto_47435 ) ) ( AVAILABLE ?auto_47435 ) ( SURFACE-AT ?auto_47429 ?auto_47433 ) ( ON ?auto_47429 ?auto_47436 ) ( CLEAR ?auto_47429 ) ( not ( = ?auto_47430 ?auto_47436 ) ) ( not ( = ?auto_47429 ?auto_47436 ) ) ( not ( = ?auto_47428 ?auto_47436 ) ) ( ON ?auto_47426 ?auto_47425 ) ( ON ?auto_47427 ?auto_47426 ) ( ON ?auto_47424 ?auto_47427 ) ( ON ?auto_47428 ?auto_47424 ) ( not ( = ?auto_47425 ?auto_47426 ) ) ( not ( = ?auto_47425 ?auto_47427 ) ) ( not ( = ?auto_47425 ?auto_47424 ) ) ( not ( = ?auto_47425 ?auto_47428 ) ) ( not ( = ?auto_47425 ?auto_47430 ) ) ( not ( = ?auto_47425 ?auto_47429 ) ) ( not ( = ?auto_47425 ?auto_47436 ) ) ( not ( = ?auto_47426 ?auto_47427 ) ) ( not ( = ?auto_47426 ?auto_47424 ) ) ( not ( = ?auto_47426 ?auto_47428 ) ) ( not ( = ?auto_47426 ?auto_47430 ) ) ( not ( = ?auto_47426 ?auto_47429 ) ) ( not ( = ?auto_47426 ?auto_47436 ) ) ( not ( = ?auto_47427 ?auto_47424 ) ) ( not ( = ?auto_47427 ?auto_47428 ) ) ( not ( = ?auto_47427 ?auto_47430 ) ) ( not ( = ?auto_47427 ?auto_47429 ) ) ( not ( = ?auto_47427 ?auto_47436 ) ) ( not ( = ?auto_47424 ?auto_47428 ) ) ( not ( = ?auto_47424 ?auto_47430 ) ) ( not ( = ?auto_47424 ?auto_47429 ) ) ( not ( = ?auto_47424 ?auto_47436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47428 ?auto_47430 ?auto_47429 )
      ( MAKE-6CRATE-VERIFY ?auto_47425 ?auto_47426 ?auto_47427 ?auto_47424 ?auto_47428 ?auto_47430 ?auto_47429 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47489 - SURFACE
      ?auto_47490 - SURFACE
      ?auto_47491 - SURFACE
      ?auto_47488 - SURFACE
      ?auto_47492 - SURFACE
      ?auto_47494 - SURFACE
      ?auto_47493 - SURFACE
    )
    :vars
    (
      ?auto_47496 - HOIST
      ?auto_47500 - PLACE
      ?auto_47495 - PLACE
      ?auto_47498 - HOIST
      ?auto_47499 - SURFACE
      ?auto_47497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47496 ?auto_47500 ) ( SURFACE-AT ?auto_47494 ?auto_47500 ) ( CLEAR ?auto_47494 ) ( IS-CRATE ?auto_47493 ) ( not ( = ?auto_47494 ?auto_47493 ) ) ( AVAILABLE ?auto_47496 ) ( ON ?auto_47494 ?auto_47492 ) ( not ( = ?auto_47492 ?auto_47494 ) ) ( not ( = ?auto_47492 ?auto_47493 ) ) ( not ( = ?auto_47495 ?auto_47500 ) ) ( HOIST-AT ?auto_47498 ?auto_47495 ) ( not ( = ?auto_47496 ?auto_47498 ) ) ( AVAILABLE ?auto_47498 ) ( SURFACE-AT ?auto_47493 ?auto_47495 ) ( ON ?auto_47493 ?auto_47499 ) ( CLEAR ?auto_47493 ) ( not ( = ?auto_47494 ?auto_47499 ) ) ( not ( = ?auto_47493 ?auto_47499 ) ) ( not ( = ?auto_47492 ?auto_47499 ) ) ( TRUCK-AT ?auto_47497 ?auto_47500 ) ( ON ?auto_47490 ?auto_47489 ) ( ON ?auto_47491 ?auto_47490 ) ( ON ?auto_47488 ?auto_47491 ) ( ON ?auto_47492 ?auto_47488 ) ( not ( = ?auto_47489 ?auto_47490 ) ) ( not ( = ?auto_47489 ?auto_47491 ) ) ( not ( = ?auto_47489 ?auto_47488 ) ) ( not ( = ?auto_47489 ?auto_47492 ) ) ( not ( = ?auto_47489 ?auto_47494 ) ) ( not ( = ?auto_47489 ?auto_47493 ) ) ( not ( = ?auto_47489 ?auto_47499 ) ) ( not ( = ?auto_47490 ?auto_47491 ) ) ( not ( = ?auto_47490 ?auto_47488 ) ) ( not ( = ?auto_47490 ?auto_47492 ) ) ( not ( = ?auto_47490 ?auto_47494 ) ) ( not ( = ?auto_47490 ?auto_47493 ) ) ( not ( = ?auto_47490 ?auto_47499 ) ) ( not ( = ?auto_47491 ?auto_47488 ) ) ( not ( = ?auto_47491 ?auto_47492 ) ) ( not ( = ?auto_47491 ?auto_47494 ) ) ( not ( = ?auto_47491 ?auto_47493 ) ) ( not ( = ?auto_47491 ?auto_47499 ) ) ( not ( = ?auto_47488 ?auto_47492 ) ) ( not ( = ?auto_47488 ?auto_47494 ) ) ( not ( = ?auto_47488 ?auto_47493 ) ) ( not ( = ?auto_47488 ?auto_47499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47492 ?auto_47494 ?auto_47493 )
      ( MAKE-6CRATE-VERIFY ?auto_47489 ?auto_47490 ?auto_47491 ?auto_47488 ?auto_47492 ?auto_47494 ?auto_47493 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47553 - SURFACE
      ?auto_47554 - SURFACE
      ?auto_47555 - SURFACE
      ?auto_47552 - SURFACE
      ?auto_47556 - SURFACE
      ?auto_47558 - SURFACE
      ?auto_47557 - SURFACE
    )
    :vars
    (
      ?auto_47562 - HOIST
      ?auto_47560 - PLACE
      ?auto_47563 - PLACE
      ?auto_47559 - HOIST
      ?auto_47561 - SURFACE
      ?auto_47564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47562 ?auto_47560 ) ( IS-CRATE ?auto_47557 ) ( not ( = ?auto_47558 ?auto_47557 ) ) ( not ( = ?auto_47556 ?auto_47558 ) ) ( not ( = ?auto_47556 ?auto_47557 ) ) ( not ( = ?auto_47563 ?auto_47560 ) ) ( HOIST-AT ?auto_47559 ?auto_47563 ) ( not ( = ?auto_47562 ?auto_47559 ) ) ( AVAILABLE ?auto_47559 ) ( SURFACE-AT ?auto_47557 ?auto_47563 ) ( ON ?auto_47557 ?auto_47561 ) ( CLEAR ?auto_47557 ) ( not ( = ?auto_47558 ?auto_47561 ) ) ( not ( = ?auto_47557 ?auto_47561 ) ) ( not ( = ?auto_47556 ?auto_47561 ) ) ( TRUCK-AT ?auto_47564 ?auto_47560 ) ( SURFACE-AT ?auto_47556 ?auto_47560 ) ( CLEAR ?auto_47556 ) ( LIFTING ?auto_47562 ?auto_47558 ) ( IS-CRATE ?auto_47558 ) ( ON ?auto_47554 ?auto_47553 ) ( ON ?auto_47555 ?auto_47554 ) ( ON ?auto_47552 ?auto_47555 ) ( ON ?auto_47556 ?auto_47552 ) ( not ( = ?auto_47553 ?auto_47554 ) ) ( not ( = ?auto_47553 ?auto_47555 ) ) ( not ( = ?auto_47553 ?auto_47552 ) ) ( not ( = ?auto_47553 ?auto_47556 ) ) ( not ( = ?auto_47553 ?auto_47558 ) ) ( not ( = ?auto_47553 ?auto_47557 ) ) ( not ( = ?auto_47553 ?auto_47561 ) ) ( not ( = ?auto_47554 ?auto_47555 ) ) ( not ( = ?auto_47554 ?auto_47552 ) ) ( not ( = ?auto_47554 ?auto_47556 ) ) ( not ( = ?auto_47554 ?auto_47558 ) ) ( not ( = ?auto_47554 ?auto_47557 ) ) ( not ( = ?auto_47554 ?auto_47561 ) ) ( not ( = ?auto_47555 ?auto_47552 ) ) ( not ( = ?auto_47555 ?auto_47556 ) ) ( not ( = ?auto_47555 ?auto_47558 ) ) ( not ( = ?auto_47555 ?auto_47557 ) ) ( not ( = ?auto_47555 ?auto_47561 ) ) ( not ( = ?auto_47552 ?auto_47556 ) ) ( not ( = ?auto_47552 ?auto_47558 ) ) ( not ( = ?auto_47552 ?auto_47557 ) ) ( not ( = ?auto_47552 ?auto_47561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47556 ?auto_47558 ?auto_47557 )
      ( MAKE-6CRATE-VERIFY ?auto_47553 ?auto_47554 ?auto_47555 ?auto_47552 ?auto_47556 ?auto_47558 ?auto_47557 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47617 - SURFACE
      ?auto_47618 - SURFACE
      ?auto_47619 - SURFACE
      ?auto_47616 - SURFACE
      ?auto_47620 - SURFACE
      ?auto_47622 - SURFACE
      ?auto_47621 - SURFACE
    )
    :vars
    (
      ?auto_47627 - HOIST
      ?auto_47625 - PLACE
      ?auto_47626 - PLACE
      ?auto_47624 - HOIST
      ?auto_47628 - SURFACE
      ?auto_47623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47627 ?auto_47625 ) ( IS-CRATE ?auto_47621 ) ( not ( = ?auto_47622 ?auto_47621 ) ) ( not ( = ?auto_47620 ?auto_47622 ) ) ( not ( = ?auto_47620 ?auto_47621 ) ) ( not ( = ?auto_47626 ?auto_47625 ) ) ( HOIST-AT ?auto_47624 ?auto_47626 ) ( not ( = ?auto_47627 ?auto_47624 ) ) ( AVAILABLE ?auto_47624 ) ( SURFACE-AT ?auto_47621 ?auto_47626 ) ( ON ?auto_47621 ?auto_47628 ) ( CLEAR ?auto_47621 ) ( not ( = ?auto_47622 ?auto_47628 ) ) ( not ( = ?auto_47621 ?auto_47628 ) ) ( not ( = ?auto_47620 ?auto_47628 ) ) ( TRUCK-AT ?auto_47623 ?auto_47625 ) ( SURFACE-AT ?auto_47620 ?auto_47625 ) ( CLEAR ?auto_47620 ) ( IS-CRATE ?auto_47622 ) ( AVAILABLE ?auto_47627 ) ( IN ?auto_47622 ?auto_47623 ) ( ON ?auto_47618 ?auto_47617 ) ( ON ?auto_47619 ?auto_47618 ) ( ON ?auto_47616 ?auto_47619 ) ( ON ?auto_47620 ?auto_47616 ) ( not ( = ?auto_47617 ?auto_47618 ) ) ( not ( = ?auto_47617 ?auto_47619 ) ) ( not ( = ?auto_47617 ?auto_47616 ) ) ( not ( = ?auto_47617 ?auto_47620 ) ) ( not ( = ?auto_47617 ?auto_47622 ) ) ( not ( = ?auto_47617 ?auto_47621 ) ) ( not ( = ?auto_47617 ?auto_47628 ) ) ( not ( = ?auto_47618 ?auto_47619 ) ) ( not ( = ?auto_47618 ?auto_47616 ) ) ( not ( = ?auto_47618 ?auto_47620 ) ) ( not ( = ?auto_47618 ?auto_47622 ) ) ( not ( = ?auto_47618 ?auto_47621 ) ) ( not ( = ?auto_47618 ?auto_47628 ) ) ( not ( = ?auto_47619 ?auto_47616 ) ) ( not ( = ?auto_47619 ?auto_47620 ) ) ( not ( = ?auto_47619 ?auto_47622 ) ) ( not ( = ?auto_47619 ?auto_47621 ) ) ( not ( = ?auto_47619 ?auto_47628 ) ) ( not ( = ?auto_47616 ?auto_47620 ) ) ( not ( = ?auto_47616 ?auto_47622 ) ) ( not ( = ?auto_47616 ?auto_47621 ) ) ( not ( = ?auto_47616 ?auto_47628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47620 ?auto_47622 ?auto_47621 )
      ( MAKE-6CRATE-VERIFY ?auto_47617 ?auto_47618 ?auto_47619 ?auto_47616 ?auto_47620 ?auto_47622 ?auto_47621 ) )
  )

)

