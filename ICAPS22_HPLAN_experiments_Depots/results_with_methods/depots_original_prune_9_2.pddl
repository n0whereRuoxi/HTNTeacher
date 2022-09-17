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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18048 - SURFACE
      ?auto_18049 - SURFACE
    )
    :vars
    (
      ?auto_18050 - HOIST
      ?auto_18051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18050 ?auto_18051 ) ( SURFACE-AT ?auto_18049 ?auto_18051 ) ( CLEAR ?auto_18049 ) ( LIFTING ?auto_18050 ?auto_18048 ) ( IS-CRATE ?auto_18048 ) ( not ( = ?auto_18048 ?auto_18049 ) ) )
    :subtasks
    ( ( !DROP ?auto_18050 ?auto_18048 ?auto_18049 ?auto_18051 )
      ( MAKE-ON-VERIFY ?auto_18048 ?auto_18049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18052 - SURFACE
      ?auto_18053 - SURFACE
    )
    :vars
    (
      ?auto_18055 - HOIST
      ?auto_18054 - PLACE
      ?auto_18056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18055 ?auto_18054 ) ( SURFACE-AT ?auto_18053 ?auto_18054 ) ( CLEAR ?auto_18053 ) ( IS-CRATE ?auto_18052 ) ( not ( = ?auto_18052 ?auto_18053 ) ) ( TRUCK-AT ?auto_18056 ?auto_18054 ) ( AVAILABLE ?auto_18055 ) ( IN ?auto_18052 ?auto_18056 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18055 ?auto_18052 ?auto_18056 ?auto_18054 )
      ( MAKE-ON ?auto_18052 ?auto_18053 )
      ( MAKE-ON-VERIFY ?auto_18052 ?auto_18053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18057 - SURFACE
      ?auto_18058 - SURFACE
    )
    :vars
    (
      ?auto_18061 - HOIST
      ?auto_18060 - PLACE
      ?auto_18059 - TRUCK
      ?auto_18062 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18061 ?auto_18060 ) ( SURFACE-AT ?auto_18058 ?auto_18060 ) ( CLEAR ?auto_18058 ) ( IS-CRATE ?auto_18057 ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( AVAILABLE ?auto_18061 ) ( IN ?auto_18057 ?auto_18059 ) ( TRUCK-AT ?auto_18059 ?auto_18062 ) ( not ( = ?auto_18062 ?auto_18060 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18059 ?auto_18062 ?auto_18060 )
      ( MAKE-ON ?auto_18057 ?auto_18058 )
      ( MAKE-ON-VERIFY ?auto_18057 ?auto_18058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18063 - SURFACE
      ?auto_18064 - SURFACE
    )
    :vars
    (
      ?auto_18068 - HOIST
      ?auto_18066 - PLACE
      ?auto_18065 - TRUCK
      ?auto_18067 - PLACE
      ?auto_18069 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18068 ?auto_18066 ) ( SURFACE-AT ?auto_18064 ?auto_18066 ) ( CLEAR ?auto_18064 ) ( IS-CRATE ?auto_18063 ) ( not ( = ?auto_18063 ?auto_18064 ) ) ( AVAILABLE ?auto_18068 ) ( TRUCK-AT ?auto_18065 ?auto_18067 ) ( not ( = ?auto_18067 ?auto_18066 ) ) ( HOIST-AT ?auto_18069 ?auto_18067 ) ( LIFTING ?auto_18069 ?auto_18063 ) ( not ( = ?auto_18068 ?auto_18069 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18069 ?auto_18063 ?auto_18065 ?auto_18067 )
      ( MAKE-ON ?auto_18063 ?auto_18064 )
      ( MAKE-ON-VERIFY ?auto_18063 ?auto_18064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18070 - SURFACE
      ?auto_18071 - SURFACE
    )
    :vars
    (
      ?auto_18075 - HOIST
      ?auto_18074 - PLACE
      ?auto_18073 - TRUCK
      ?auto_18076 - PLACE
      ?auto_18072 - HOIST
      ?auto_18077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18075 ?auto_18074 ) ( SURFACE-AT ?auto_18071 ?auto_18074 ) ( CLEAR ?auto_18071 ) ( IS-CRATE ?auto_18070 ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( AVAILABLE ?auto_18075 ) ( TRUCK-AT ?auto_18073 ?auto_18076 ) ( not ( = ?auto_18076 ?auto_18074 ) ) ( HOIST-AT ?auto_18072 ?auto_18076 ) ( not ( = ?auto_18075 ?auto_18072 ) ) ( AVAILABLE ?auto_18072 ) ( SURFACE-AT ?auto_18070 ?auto_18076 ) ( ON ?auto_18070 ?auto_18077 ) ( CLEAR ?auto_18070 ) ( not ( = ?auto_18070 ?auto_18077 ) ) ( not ( = ?auto_18071 ?auto_18077 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18072 ?auto_18070 ?auto_18077 ?auto_18076 )
      ( MAKE-ON ?auto_18070 ?auto_18071 )
      ( MAKE-ON-VERIFY ?auto_18070 ?auto_18071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18078 - SURFACE
      ?auto_18079 - SURFACE
    )
    :vars
    (
      ?auto_18080 - HOIST
      ?auto_18083 - PLACE
      ?auto_18084 - PLACE
      ?auto_18081 - HOIST
      ?auto_18082 - SURFACE
      ?auto_18085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18080 ?auto_18083 ) ( SURFACE-AT ?auto_18079 ?auto_18083 ) ( CLEAR ?auto_18079 ) ( IS-CRATE ?auto_18078 ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( AVAILABLE ?auto_18080 ) ( not ( = ?auto_18084 ?auto_18083 ) ) ( HOIST-AT ?auto_18081 ?auto_18084 ) ( not ( = ?auto_18080 ?auto_18081 ) ) ( AVAILABLE ?auto_18081 ) ( SURFACE-AT ?auto_18078 ?auto_18084 ) ( ON ?auto_18078 ?auto_18082 ) ( CLEAR ?auto_18078 ) ( not ( = ?auto_18078 ?auto_18082 ) ) ( not ( = ?auto_18079 ?auto_18082 ) ) ( TRUCK-AT ?auto_18085 ?auto_18083 ) )
    :subtasks
    ( ( !DRIVE ?auto_18085 ?auto_18083 ?auto_18084 )
      ( MAKE-ON ?auto_18078 ?auto_18079 )
      ( MAKE-ON-VERIFY ?auto_18078 ?auto_18079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18126 - SURFACE
      ?auto_18127 - SURFACE
    )
    :vars
    (
      ?auto_18130 - HOIST
      ?auto_18131 - PLACE
      ?auto_18133 - PLACE
      ?auto_18128 - HOIST
      ?auto_18132 - SURFACE
      ?auto_18129 - TRUCK
      ?auto_18134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18130 ?auto_18131 ) ( IS-CRATE ?auto_18126 ) ( not ( = ?auto_18126 ?auto_18127 ) ) ( not ( = ?auto_18133 ?auto_18131 ) ) ( HOIST-AT ?auto_18128 ?auto_18133 ) ( not ( = ?auto_18130 ?auto_18128 ) ) ( AVAILABLE ?auto_18128 ) ( SURFACE-AT ?auto_18126 ?auto_18133 ) ( ON ?auto_18126 ?auto_18132 ) ( CLEAR ?auto_18126 ) ( not ( = ?auto_18126 ?auto_18132 ) ) ( not ( = ?auto_18127 ?auto_18132 ) ) ( TRUCK-AT ?auto_18129 ?auto_18131 ) ( SURFACE-AT ?auto_18134 ?auto_18131 ) ( CLEAR ?auto_18134 ) ( LIFTING ?auto_18130 ?auto_18127 ) ( IS-CRATE ?auto_18127 ) ( not ( = ?auto_18126 ?auto_18134 ) ) ( not ( = ?auto_18127 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) )
    :subtasks
    ( ( !DROP ?auto_18130 ?auto_18127 ?auto_18134 ?auto_18131 )
      ( MAKE-ON ?auto_18126 ?auto_18127 )
      ( MAKE-ON-VERIFY ?auto_18126 ?auto_18127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18135 - SURFACE
      ?auto_18136 - SURFACE
    )
    :vars
    (
      ?auto_18137 - HOIST
      ?auto_18138 - PLACE
      ?auto_18141 - PLACE
      ?auto_18143 - HOIST
      ?auto_18140 - SURFACE
      ?auto_18142 - TRUCK
      ?auto_18139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18137 ?auto_18138 ) ( IS-CRATE ?auto_18135 ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( not ( = ?auto_18141 ?auto_18138 ) ) ( HOIST-AT ?auto_18143 ?auto_18141 ) ( not ( = ?auto_18137 ?auto_18143 ) ) ( AVAILABLE ?auto_18143 ) ( SURFACE-AT ?auto_18135 ?auto_18141 ) ( ON ?auto_18135 ?auto_18140 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18135 ?auto_18140 ) ) ( not ( = ?auto_18136 ?auto_18140 ) ) ( TRUCK-AT ?auto_18142 ?auto_18138 ) ( SURFACE-AT ?auto_18139 ?auto_18138 ) ( CLEAR ?auto_18139 ) ( IS-CRATE ?auto_18136 ) ( not ( = ?auto_18135 ?auto_18139 ) ) ( not ( = ?auto_18136 ?auto_18139 ) ) ( not ( = ?auto_18140 ?auto_18139 ) ) ( AVAILABLE ?auto_18137 ) ( IN ?auto_18136 ?auto_18142 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18137 ?auto_18136 ?auto_18142 ?auto_18138 )
      ( MAKE-ON ?auto_18135 ?auto_18136 )
      ( MAKE-ON-VERIFY ?auto_18135 ?auto_18136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18144 - SURFACE
      ?auto_18145 - SURFACE
    )
    :vars
    (
      ?auto_18152 - HOIST
      ?auto_18148 - PLACE
      ?auto_18147 - PLACE
      ?auto_18146 - HOIST
      ?auto_18149 - SURFACE
      ?auto_18151 - SURFACE
      ?auto_18150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18152 ?auto_18148 ) ( IS-CRATE ?auto_18144 ) ( not ( = ?auto_18144 ?auto_18145 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( HOIST-AT ?auto_18146 ?auto_18147 ) ( not ( = ?auto_18152 ?auto_18146 ) ) ( AVAILABLE ?auto_18146 ) ( SURFACE-AT ?auto_18144 ?auto_18147 ) ( ON ?auto_18144 ?auto_18149 ) ( CLEAR ?auto_18144 ) ( not ( = ?auto_18144 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( SURFACE-AT ?auto_18151 ?auto_18148 ) ( CLEAR ?auto_18151 ) ( IS-CRATE ?auto_18145 ) ( not ( = ?auto_18144 ?auto_18151 ) ) ( not ( = ?auto_18145 ?auto_18151 ) ) ( not ( = ?auto_18149 ?auto_18151 ) ) ( AVAILABLE ?auto_18152 ) ( IN ?auto_18145 ?auto_18150 ) ( TRUCK-AT ?auto_18150 ?auto_18147 ) )
    :subtasks
    ( ( !DRIVE ?auto_18150 ?auto_18147 ?auto_18148 )
      ( MAKE-ON ?auto_18144 ?auto_18145 )
      ( MAKE-ON-VERIFY ?auto_18144 ?auto_18145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18153 - SURFACE
      ?auto_18154 - SURFACE
    )
    :vars
    (
      ?auto_18161 - HOIST
      ?auto_18157 - PLACE
      ?auto_18155 - PLACE
      ?auto_18159 - HOIST
      ?auto_18156 - SURFACE
      ?auto_18158 - SURFACE
      ?auto_18160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18161 ?auto_18157 ) ( IS-CRATE ?auto_18153 ) ( not ( = ?auto_18153 ?auto_18154 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) ( HOIST-AT ?auto_18159 ?auto_18155 ) ( not ( = ?auto_18161 ?auto_18159 ) ) ( SURFACE-AT ?auto_18153 ?auto_18155 ) ( ON ?auto_18153 ?auto_18156 ) ( CLEAR ?auto_18153 ) ( not ( = ?auto_18153 ?auto_18156 ) ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( SURFACE-AT ?auto_18158 ?auto_18157 ) ( CLEAR ?auto_18158 ) ( IS-CRATE ?auto_18154 ) ( not ( = ?auto_18153 ?auto_18158 ) ) ( not ( = ?auto_18154 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( AVAILABLE ?auto_18161 ) ( TRUCK-AT ?auto_18160 ?auto_18155 ) ( LIFTING ?auto_18159 ?auto_18154 ) )
    :subtasks
    ( ( !LOAD ?auto_18159 ?auto_18154 ?auto_18160 ?auto_18155 )
      ( MAKE-ON ?auto_18153 ?auto_18154 )
      ( MAKE-ON-VERIFY ?auto_18153 ?auto_18154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18162 - SURFACE
      ?auto_18163 - SURFACE
    )
    :vars
    (
      ?auto_18169 - HOIST
      ?auto_18168 - PLACE
      ?auto_18165 - PLACE
      ?auto_18166 - HOIST
      ?auto_18167 - SURFACE
      ?auto_18164 - SURFACE
      ?auto_18170 - TRUCK
      ?auto_18171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18169 ?auto_18168 ) ( IS-CRATE ?auto_18162 ) ( not ( = ?auto_18162 ?auto_18163 ) ) ( not ( = ?auto_18165 ?auto_18168 ) ) ( HOIST-AT ?auto_18166 ?auto_18165 ) ( not ( = ?auto_18169 ?auto_18166 ) ) ( SURFACE-AT ?auto_18162 ?auto_18165 ) ( ON ?auto_18162 ?auto_18167 ) ( CLEAR ?auto_18162 ) ( not ( = ?auto_18162 ?auto_18167 ) ) ( not ( = ?auto_18163 ?auto_18167 ) ) ( SURFACE-AT ?auto_18164 ?auto_18168 ) ( CLEAR ?auto_18164 ) ( IS-CRATE ?auto_18163 ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( not ( = ?auto_18167 ?auto_18164 ) ) ( AVAILABLE ?auto_18169 ) ( TRUCK-AT ?auto_18170 ?auto_18165 ) ( AVAILABLE ?auto_18166 ) ( SURFACE-AT ?auto_18163 ?auto_18165 ) ( ON ?auto_18163 ?auto_18171 ) ( CLEAR ?auto_18163 ) ( not ( = ?auto_18162 ?auto_18171 ) ) ( not ( = ?auto_18163 ?auto_18171 ) ) ( not ( = ?auto_18167 ?auto_18171 ) ) ( not ( = ?auto_18164 ?auto_18171 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18166 ?auto_18163 ?auto_18171 ?auto_18165 )
      ( MAKE-ON ?auto_18162 ?auto_18163 )
      ( MAKE-ON-VERIFY ?auto_18162 ?auto_18163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18172 - SURFACE
      ?auto_18173 - SURFACE
    )
    :vars
    (
      ?auto_18176 - HOIST
      ?auto_18177 - PLACE
      ?auto_18181 - PLACE
      ?auto_18175 - HOIST
      ?auto_18180 - SURFACE
      ?auto_18178 - SURFACE
      ?auto_18179 - SURFACE
      ?auto_18174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18176 ?auto_18177 ) ( IS-CRATE ?auto_18172 ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( not ( = ?auto_18181 ?auto_18177 ) ) ( HOIST-AT ?auto_18175 ?auto_18181 ) ( not ( = ?auto_18176 ?auto_18175 ) ) ( SURFACE-AT ?auto_18172 ?auto_18181 ) ( ON ?auto_18172 ?auto_18180 ) ( CLEAR ?auto_18172 ) ( not ( = ?auto_18172 ?auto_18180 ) ) ( not ( = ?auto_18173 ?auto_18180 ) ) ( SURFACE-AT ?auto_18178 ?auto_18177 ) ( CLEAR ?auto_18178 ) ( IS-CRATE ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18178 ) ) ( not ( = ?auto_18173 ?auto_18178 ) ) ( not ( = ?auto_18180 ?auto_18178 ) ) ( AVAILABLE ?auto_18176 ) ( AVAILABLE ?auto_18175 ) ( SURFACE-AT ?auto_18173 ?auto_18181 ) ( ON ?auto_18173 ?auto_18179 ) ( CLEAR ?auto_18173 ) ( not ( = ?auto_18172 ?auto_18179 ) ) ( not ( = ?auto_18173 ?auto_18179 ) ) ( not ( = ?auto_18180 ?auto_18179 ) ) ( not ( = ?auto_18178 ?auto_18179 ) ) ( TRUCK-AT ?auto_18174 ?auto_18177 ) )
    :subtasks
    ( ( !DRIVE ?auto_18174 ?auto_18177 ?auto_18181 )
      ( MAKE-ON ?auto_18172 ?auto_18173 )
      ( MAKE-ON-VERIFY ?auto_18172 ?auto_18173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18246 - SURFACE
      ?auto_18247 - SURFACE
    )
    :vars
    (
      ?auto_18251 - HOIST
      ?auto_18253 - PLACE
      ?auto_18250 - PLACE
      ?auto_18248 - HOIST
      ?auto_18249 - SURFACE
      ?auto_18252 - TRUCK
      ?auto_18254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18251 ?auto_18253 ) ( SURFACE-AT ?auto_18247 ?auto_18253 ) ( CLEAR ?auto_18247 ) ( IS-CRATE ?auto_18246 ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( AVAILABLE ?auto_18251 ) ( not ( = ?auto_18250 ?auto_18253 ) ) ( HOIST-AT ?auto_18248 ?auto_18250 ) ( not ( = ?auto_18251 ?auto_18248 ) ) ( AVAILABLE ?auto_18248 ) ( SURFACE-AT ?auto_18246 ?auto_18250 ) ( ON ?auto_18246 ?auto_18249 ) ( CLEAR ?auto_18246 ) ( not ( = ?auto_18246 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) ( TRUCK-AT ?auto_18252 ?auto_18254 ) ( not ( = ?auto_18254 ?auto_18253 ) ) ( not ( = ?auto_18250 ?auto_18254 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18252 ?auto_18254 ?auto_18253 )
      ( MAKE-ON ?auto_18246 ?auto_18247 )
      ( MAKE-ON-VERIFY ?auto_18246 ?auto_18247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18261 - SURFACE
      ?auto_18262 - SURFACE
    )
    :vars
    (
      ?auto_18266 - HOIST
      ?auto_18264 - PLACE
      ?auto_18263 - PLACE
      ?auto_18268 - HOIST
      ?auto_18267 - SURFACE
      ?auto_18265 - TRUCK
      ?auto_18269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18266 ?auto_18264 ) ( SURFACE-AT ?auto_18262 ?auto_18264 ) ( CLEAR ?auto_18262 ) ( IS-CRATE ?auto_18261 ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18263 ?auto_18264 ) ) ( HOIST-AT ?auto_18268 ?auto_18263 ) ( not ( = ?auto_18266 ?auto_18268 ) ) ( AVAILABLE ?auto_18268 ) ( SURFACE-AT ?auto_18261 ?auto_18263 ) ( ON ?auto_18261 ?auto_18267 ) ( CLEAR ?auto_18261 ) ( not ( = ?auto_18261 ?auto_18267 ) ) ( not ( = ?auto_18262 ?auto_18267 ) ) ( TRUCK-AT ?auto_18265 ?auto_18264 ) ( LIFTING ?auto_18266 ?auto_18269 ) ( IS-CRATE ?auto_18269 ) ( not ( = ?auto_18261 ?auto_18269 ) ) ( not ( = ?auto_18262 ?auto_18269 ) ) ( not ( = ?auto_18267 ?auto_18269 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18266 ?auto_18269 ?auto_18265 ?auto_18264 )
      ( MAKE-ON ?auto_18261 ?auto_18262 )
      ( MAKE-ON-VERIFY ?auto_18261 ?auto_18262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_18825 - SURFACE
      ?auto_18826 - SURFACE
    )
    :vars
    (
      ?auto_18831 - HOIST
      ?auto_18832 - PLACE
      ?auto_18828 - TRUCK
      ?auto_18827 - PLACE
      ?auto_18830 - HOIST
      ?auto_18829 - SURFACE
      ?auto_18833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18831 ?auto_18832 ) ( SURFACE-AT ?auto_18826 ?auto_18832 ) ( CLEAR ?auto_18826 ) ( IS-CRATE ?auto_18825 ) ( not ( = ?auto_18825 ?auto_18826 ) ) ( AVAILABLE ?auto_18831 ) ( TRUCK-AT ?auto_18828 ?auto_18827 ) ( not ( = ?auto_18827 ?auto_18832 ) ) ( HOIST-AT ?auto_18830 ?auto_18827 ) ( not ( = ?auto_18831 ?auto_18830 ) ) ( SURFACE-AT ?auto_18825 ?auto_18827 ) ( ON ?auto_18825 ?auto_18829 ) ( CLEAR ?auto_18825 ) ( not ( = ?auto_18825 ?auto_18829 ) ) ( not ( = ?auto_18826 ?auto_18829 ) ) ( LIFTING ?auto_18830 ?auto_18833 ) ( IS-CRATE ?auto_18833 ) ( not ( = ?auto_18825 ?auto_18833 ) ) ( not ( = ?auto_18826 ?auto_18833 ) ) ( not ( = ?auto_18829 ?auto_18833 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18830 ?auto_18833 ?auto_18828 ?auto_18827 )
      ( MAKE-ON ?auto_18825 ?auto_18826 )
      ( MAKE-ON-VERIFY ?auto_18825 ?auto_18826 ) )
  )

)

