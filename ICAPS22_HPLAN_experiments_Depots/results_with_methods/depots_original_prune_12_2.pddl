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
      ?auto_37218 - SURFACE
      ?auto_37219 - SURFACE
    )
    :vars
    (
      ?auto_37220 - HOIST
      ?auto_37221 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37220 ?auto_37221 ) ( SURFACE-AT ?auto_37219 ?auto_37221 ) ( CLEAR ?auto_37219 ) ( LIFTING ?auto_37220 ?auto_37218 ) ( IS-CRATE ?auto_37218 ) ( not ( = ?auto_37218 ?auto_37219 ) ) )
    :subtasks
    ( ( !DROP ?auto_37220 ?auto_37218 ?auto_37219 ?auto_37221 )
      ( MAKE-ON-VERIFY ?auto_37218 ?auto_37219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37222 - SURFACE
      ?auto_37223 - SURFACE
    )
    :vars
    (
      ?auto_37224 - HOIST
      ?auto_37225 - PLACE
      ?auto_37226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37224 ?auto_37225 ) ( SURFACE-AT ?auto_37223 ?auto_37225 ) ( CLEAR ?auto_37223 ) ( IS-CRATE ?auto_37222 ) ( not ( = ?auto_37222 ?auto_37223 ) ) ( TRUCK-AT ?auto_37226 ?auto_37225 ) ( AVAILABLE ?auto_37224 ) ( IN ?auto_37222 ?auto_37226 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37224 ?auto_37222 ?auto_37226 ?auto_37225 )
      ( MAKE-ON ?auto_37222 ?auto_37223 )
      ( MAKE-ON-VERIFY ?auto_37222 ?auto_37223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37227 - SURFACE
      ?auto_37228 - SURFACE
    )
    :vars
    (
      ?auto_37230 - HOIST
      ?auto_37231 - PLACE
      ?auto_37229 - TRUCK
      ?auto_37232 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37230 ?auto_37231 ) ( SURFACE-AT ?auto_37228 ?auto_37231 ) ( CLEAR ?auto_37228 ) ( IS-CRATE ?auto_37227 ) ( not ( = ?auto_37227 ?auto_37228 ) ) ( AVAILABLE ?auto_37230 ) ( IN ?auto_37227 ?auto_37229 ) ( TRUCK-AT ?auto_37229 ?auto_37232 ) ( not ( = ?auto_37232 ?auto_37231 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37229 ?auto_37232 ?auto_37231 )
      ( MAKE-ON ?auto_37227 ?auto_37228 )
      ( MAKE-ON-VERIFY ?auto_37227 ?auto_37228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37233 - SURFACE
      ?auto_37234 - SURFACE
    )
    :vars
    (
      ?auto_37235 - HOIST
      ?auto_37236 - PLACE
      ?auto_37237 - TRUCK
      ?auto_37238 - PLACE
      ?auto_37239 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37235 ?auto_37236 ) ( SURFACE-AT ?auto_37234 ?auto_37236 ) ( CLEAR ?auto_37234 ) ( IS-CRATE ?auto_37233 ) ( not ( = ?auto_37233 ?auto_37234 ) ) ( AVAILABLE ?auto_37235 ) ( TRUCK-AT ?auto_37237 ?auto_37238 ) ( not ( = ?auto_37238 ?auto_37236 ) ) ( HOIST-AT ?auto_37239 ?auto_37238 ) ( LIFTING ?auto_37239 ?auto_37233 ) ( not ( = ?auto_37235 ?auto_37239 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37239 ?auto_37233 ?auto_37237 ?auto_37238 )
      ( MAKE-ON ?auto_37233 ?auto_37234 )
      ( MAKE-ON-VERIFY ?auto_37233 ?auto_37234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37240 - SURFACE
      ?auto_37241 - SURFACE
    )
    :vars
    (
      ?auto_37245 - HOIST
      ?auto_37244 - PLACE
      ?auto_37246 - TRUCK
      ?auto_37242 - PLACE
      ?auto_37243 - HOIST
      ?auto_37247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37245 ?auto_37244 ) ( SURFACE-AT ?auto_37241 ?auto_37244 ) ( CLEAR ?auto_37241 ) ( IS-CRATE ?auto_37240 ) ( not ( = ?auto_37240 ?auto_37241 ) ) ( AVAILABLE ?auto_37245 ) ( TRUCK-AT ?auto_37246 ?auto_37242 ) ( not ( = ?auto_37242 ?auto_37244 ) ) ( HOIST-AT ?auto_37243 ?auto_37242 ) ( not ( = ?auto_37245 ?auto_37243 ) ) ( AVAILABLE ?auto_37243 ) ( SURFACE-AT ?auto_37240 ?auto_37242 ) ( ON ?auto_37240 ?auto_37247 ) ( CLEAR ?auto_37240 ) ( not ( = ?auto_37240 ?auto_37247 ) ) ( not ( = ?auto_37241 ?auto_37247 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37243 ?auto_37240 ?auto_37247 ?auto_37242 )
      ( MAKE-ON ?auto_37240 ?auto_37241 )
      ( MAKE-ON-VERIFY ?auto_37240 ?auto_37241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37248 - SURFACE
      ?auto_37249 - SURFACE
    )
    :vars
    (
      ?auto_37254 - HOIST
      ?auto_37255 - PLACE
      ?auto_37250 - PLACE
      ?auto_37252 - HOIST
      ?auto_37253 - SURFACE
      ?auto_37251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37254 ?auto_37255 ) ( SURFACE-AT ?auto_37249 ?auto_37255 ) ( CLEAR ?auto_37249 ) ( IS-CRATE ?auto_37248 ) ( not ( = ?auto_37248 ?auto_37249 ) ) ( AVAILABLE ?auto_37254 ) ( not ( = ?auto_37250 ?auto_37255 ) ) ( HOIST-AT ?auto_37252 ?auto_37250 ) ( not ( = ?auto_37254 ?auto_37252 ) ) ( AVAILABLE ?auto_37252 ) ( SURFACE-AT ?auto_37248 ?auto_37250 ) ( ON ?auto_37248 ?auto_37253 ) ( CLEAR ?auto_37248 ) ( not ( = ?auto_37248 ?auto_37253 ) ) ( not ( = ?auto_37249 ?auto_37253 ) ) ( TRUCK-AT ?auto_37251 ?auto_37255 ) )
    :subtasks
    ( ( !DRIVE ?auto_37251 ?auto_37255 ?auto_37250 )
      ( MAKE-ON ?auto_37248 ?auto_37249 )
      ( MAKE-ON-VERIFY ?auto_37248 ?auto_37249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37296 - SURFACE
      ?auto_37297 - SURFACE
    )
    :vars
    (
      ?auto_37302 - HOIST
      ?auto_37300 - PLACE
      ?auto_37301 - PLACE
      ?auto_37299 - HOIST
      ?auto_37298 - SURFACE
      ?auto_37303 - TRUCK
      ?auto_37304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37302 ?auto_37300 ) ( IS-CRATE ?auto_37296 ) ( not ( = ?auto_37296 ?auto_37297 ) ) ( not ( = ?auto_37301 ?auto_37300 ) ) ( HOIST-AT ?auto_37299 ?auto_37301 ) ( not ( = ?auto_37302 ?auto_37299 ) ) ( AVAILABLE ?auto_37299 ) ( SURFACE-AT ?auto_37296 ?auto_37301 ) ( ON ?auto_37296 ?auto_37298 ) ( CLEAR ?auto_37296 ) ( not ( = ?auto_37296 ?auto_37298 ) ) ( not ( = ?auto_37297 ?auto_37298 ) ) ( TRUCK-AT ?auto_37303 ?auto_37300 ) ( SURFACE-AT ?auto_37304 ?auto_37300 ) ( CLEAR ?auto_37304 ) ( LIFTING ?auto_37302 ?auto_37297 ) ( IS-CRATE ?auto_37297 ) ( not ( = ?auto_37296 ?auto_37304 ) ) ( not ( = ?auto_37297 ?auto_37304 ) ) ( not ( = ?auto_37298 ?auto_37304 ) ) )
    :subtasks
    ( ( !DROP ?auto_37302 ?auto_37297 ?auto_37304 ?auto_37300 )
      ( MAKE-ON ?auto_37296 ?auto_37297 )
      ( MAKE-ON-VERIFY ?auto_37296 ?auto_37297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37305 - SURFACE
      ?auto_37306 - SURFACE
    )
    :vars
    (
      ?auto_37311 - HOIST
      ?auto_37308 - PLACE
      ?auto_37307 - PLACE
      ?auto_37309 - HOIST
      ?auto_37310 - SURFACE
      ?auto_37313 - TRUCK
      ?auto_37312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37311 ?auto_37308 ) ( IS-CRATE ?auto_37305 ) ( not ( = ?auto_37305 ?auto_37306 ) ) ( not ( = ?auto_37307 ?auto_37308 ) ) ( HOIST-AT ?auto_37309 ?auto_37307 ) ( not ( = ?auto_37311 ?auto_37309 ) ) ( AVAILABLE ?auto_37309 ) ( SURFACE-AT ?auto_37305 ?auto_37307 ) ( ON ?auto_37305 ?auto_37310 ) ( CLEAR ?auto_37305 ) ( not ( = ?auto_37305 ?auto_37310 ) ) ( not ( = ?auto_37306 ?auto_37310 ) ) ( TRUCK-AT ?auto_37313 ?auto_37308 ) ( SURFACE-AT ?auto_37312 ?auto_37308 ) ( CLEAR ?auto_37312 ) ( IS-CRATE ?auto_37306 ) ( not ( = ?auto_37305 ?auto_37312 ) ) ( not ( = ?auto_37306 ?auto_37312 ) ) ( not ( = ?auto_37310 ?auto_37312 ) ) ( AVAILABLE ?auto_37311 ) ( IN ?auto_37306 ?auto_37313 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37311 ?auto_37306 ?auto_37313 ?auto_37308 )
      ( MAKE-ON ?auto_37305 ?auto_37306 )
      ( MAKE-ON-VERIFY ?auto_37305 ?auto_37306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37320 - SURFACE
      ?auto_37321 - SURFACE
    )
    :vars
    (
      ?auto_37323 - HOIST
      ?auto_37324 - PLACE
      ?auto_37326 - PLACE
      ?auto_37327 - HOIST
      ?auto_37322 - SURFACE
      ?auto_37325 - TRUCK
      ?auto_37328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37323 ?auto_37324 ) ( SURFACE-AT ?auto_37321 ?auto_37324 ) ( CLEAR ?auto_37321 ) ( IS-CRATE ?auto_37320 ) ( not ( = ?auto_37320 ?auto_37321 ) ) ( AVAILABLE ?auto_37323 ) ( not ( = ?auto_37326 ?auto_37324 ) ) ( HOIST-AT ?auto_37327 ?auto_37326 ) ( not ( = ?auto_37323 ?auto_37327 ) ) ( AVAILABLE ?auto_37327 ) ( SURFACE-AT ?auto_37320 ?auto_37326 ) ( ON ?auto_37320 ?auto_37322 ) ( CLEAR ?auto_37320 ) ( not ( = ?auto_37320 ?auto_37322 ) ) ( not ( = ?auto_37321 ?auto_37322 ) ) ( TRUCK-AT ?auto_37325 ?auto_37328 ) ( not ( = ?auto_37328 ?auto_37324 ) ) ( not ( = ?auto_37326 ?auto_37328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37325 ?auto_37328 ?auto_37324 )
      ( MAKE-ON ?auto_37320 ?auto_37321 )
      ( MAKE-ON-VERIFY ?auto_37320 ?auto_37321 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37678 - SURFACE
      ?auto_37679 - SURFACE
    )
    :vars
    (
      ?auto_37683 - HOIST
      ?auto_37682 - PLACE
      ?auto_37681 - PLACE
      ?auto_37684 - HOIST
      ?auto_37685 - SURFACE
      ?auto_37686 - SURFACE
      ?auto_37680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37683 ?auto_37682 ) ( IS-CRATE ?auto_37678 ) ( not ( = ?auto_37678 ?auto_37679 ) ) ( not ( = ?auto_37681 ?auto_37682 ) ) ( HOIST-AT ?auto_37684 ?auto_37681 ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( AVAILABLE ?auto_37684 ) ( SURFACE-AT ?auto_37678 ?auto_37681 ) ( ON ?auto_37678 ?auto_37685 ) ( CLEAR ?auto_37678 ) ( not ( = ?auto_37678 ?auto_37685 ) ) ( not ( = ?auto_37679 ?auto_37685 ) ) ( SURFACE-AT ?auto_37686 ?auto_37682 ) ( CLEAR ?auto_37686 ) ( IS-CRATE ?auto_37679 ) ( not ( = ?auto_37678 ?auto_37686 ) ) ( not ( = ?auto_37679 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( AVAILABLE ?auto_37683 ) ( IN ?auto_37679 ?auto_37680 ) ( TRUCK-AT ?auto_37680 ?auto_37681 ) )
    :subtasks
    ( ( !DRIVE ?auto_37680 ?auto_37681 ?auto_37682 )
      ( MAKE-ON ?auto_37678 ?auto_37679 )
      ( MAKE-ON-VERIFY ?auto_37678 ?auto_37679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37687 - SURFACE
      ?auto_37688 - SURFACE
    )
    :vars
    (
      ?auto_37694 - HOIST
      ?auto_37690 - PLACE
      ?auto_37689 - PLACE
      ?auto_37692 - HOIST
      ?auto_37691 - SURFACE
      ?auto_37693 - SURFACE
      ?auto_37695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37694 ?auto_37690 ) ( IS-CRATE ?auto_37687 ) ( not ( = ?auto_37687 ?auto_37688 ) ) ( not ( = ?auto_37689 ?auto_37690 ) ) ( HOIST-AT ?auto_37692 ?auto_37689 ) ( not ( = ?auto_37694 ?auto_37692 ) ) ( SURFACE-AT ?auto_37687 ?auto_37689 ) ( ON ?auto_37687 ?auto_37691 ) ( CLEAR ?auto_37687 ) ( not ( = ?auto_37687 ?auto_37691 ) ) ( not ( = ?auto_37688 ?auto_37691 ) ) ( SURFACE-AT ?auto_37693 ?auto_37690 ) ( CLEAR ?auto_37693 ) ( IS-CRATE ?auto_37688 ) ( not ( = ?auto_37687 ?auto_37693 ) ) ( not ( = ?auto_37688 ?auto_37693 ) ) ( not ( = ?auto_37691 ?auto_37693 ) ) ( AVAILABLE ?auto_37694 ) ( TRUCK-AT ?auto_37695 ?auto_37689 ) ( LIFTING ?auto_37692 ?auto_37688 ) )
    :subtasks
    ( ( !LOAD ?auto_37692 ?auto_37688 ?auto_37695 ?auto_37689 )
      ( MAKE-ON ?auto_37687 ?auto_37688 )
      ( MAKE-ON-VERIFY ?auto_37687 ?auto_37688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37696 - SURFACE
      ?auto_37697 - SURFACE
    )
    :vars
    (
      ?auto_37703 - HOIST
      ?auto_37700 - PLACE
      ?auto_37704 - PLACE
      ?auto_37702 - HOIST
      ?auto_37699 - SURFACE
      ?auto_37701 - SURFACE
      ?auto_37698 - TRUCK
      ?auto_37705 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37703 ?auto_37700 ) ( IS-CRATE ?auto_37696 ) ( not ( = ?auto_37696 ?auto_37697 ) ) ( not ( = ?auto_37704 ?auto_37700 ) ) ( HOIST-AT ?auto_37702 ?auto_37704 ) ( not ( = ?auto_37703 ?auto_37702 ) ) ( SURFACE-AT ?auto_37696 ?auto_37704 ) ( ON ?auto_37696 ?auto_37699 ) ( CLEAR ?auto_37696 ) ( not ( = ?auto_37696 ?auto_37699 ) ) ( not ( = ?auto_37697 ?auto_37699 ) ) ( SURFACE-AT ?auto_37701 ?auto_37700 ) ( CLEAR ?auto_37701 ) ( IS-CRATE ?auto_37697 ) ( not ( = ?auto_37696 ?auto_37701 ) ) ( not ( = ?auto_37697 ?auto_37701 ) ) ( not ( = ?auto_37699 ?auto_37701 ) ) ( AVAILABLE ?auto_37703 ) ( TRUCK-AT ?auto_37698 ?auto_37704 ) ( AVAILABLE ?auto_37702 ) ( SURFACE-AT ?auto_37697 ?auto_37704 ) ( ON ?auto_37697 ?auto_37705 ) ( CLEAR ?auto_37697 ) ( not ( = ?auto_37696 ?auto_37705 ) ) ( not ( = ?auto_37697 ?auto_37705 ) ) ( not ( = ?auto_37699 ?auto_37705 ) ) ( not ( = ?auto_37701 ?auto_37705 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37702 ?auto_37697 ?auto_37705 ?auto_37704 )
      ( MAKE-ON ?auto_37696 ?auto_37697 )
      ( MAKE-ON-VERIFY ?auto_37696 ?auto_37697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37706 - SURFACE
      ?auto_37707 - SURFACE
    )
    :vars
    (
      ?auto_37712 - HOIST
      ?auto_37709 - PLACE
      ?auto_37711 - PLACE
      ?auto_37713 - HOIST
      ?auto_37708 - SURFACE
      ?auto_37710 - SURFACE
      ?auto_37714 - SURFACE
      ?auto_37715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37712 ?auto_37709 ) ( IS-CRATE ?auto_37706 ) ( not ( = ?auto_37706 ?auto_37707 ) ) ( not ( = ?auto_37711 ?auto_37709 ) ) ( HOIST-AT ?auto_37713 ?auto_37711 ) ( not ( = ?auto_37712 ?auto_37713 ) ) ( SURFACE-AT ?auto_37706 ?auto_37711 ) ( ON ?auto_37706 ?auto_37708 ) ( CLEAR ?auto_37706 ) ( not ( = ?auto_37706 ?auto_37708 ) ) ( not ( = ?auto_37707 ?auto_37708 ) ) ( SURFACE-AT ?auto_37710 ?auto_37709 ) ( CLEAR ?auto_37710 ) ( IS-CRATE ?auto_37707 ) ( not ( = ?auto_37706 ?auto_37710 ) ) ( not ( = ?auto_37707 ?auto_37710 ) ) ( not ( = ?auto_37708 ?auto_37710 ) ) ( AVAILABLE ?auto_37712 ) ( AVAILABLE ?auto_37713 ) ( SURFACE-AT ?auto_37707 ?auto_37711 ) ( ON ?auto_37707 ?auto_37714 ) ( CLEAR ?auto_37707 ) ( not ( = ?auto_37706 ?auto_37714 ) ) ( not ( = ?auto_37707 ?auto_37714 ) ) ( not ( = ?auto_37708 ?auto_37714 ) ) ( not ( = ?auto_37710 ?auto_37714 ) ) ( TRUCK-AT ?auto_37715 ?auto_37709 ) )
    :subtasks
    ( ( !DRIVE ?auto_37715 ?auto_37709 ?auto_37711 )
      ( MAKE-ON ?auto_37706 ?auto_37707 )
      ( MAKE-ON-VERIFY ?auto_37706 ?auto_37707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37716 - SURFACE
      ?auto_37717 - SURFACE
    )
    :vars
    (
      ?auto_37718 - HOIST
      ?auto_37721 - PLACE
      ?auto_37723 - PLACE
      ?auto_37719 - HOIST
      ?auto_37722 - SURFACE
      ?auto_37724 - SURFACE
      ?auto_37720 - SURFACE
      ?auto_37725 - TRUCK
      ?auto_37726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37718 ?auto_37721 ) ( IS-CRATE ?auto_37716 ) ( not ( = ?auto_37716 ?auto_37717 ) ) ( not ( = ?auto_37723 ?auto_37721 ) ) ( HOIST-AT ?auto_37719 ?auto_37723 ) ( not ( = ?auto_37718 ?auto_37719 ) ) ( SURFACE-AT ?auto_37716 ?auto_37723 ) ( ON ?auto_37716 ?auto_37722 ) ( CLEAR ?auto_37716 ) ( not ( = ?auto_37716 ?auto_37722 ) ) ( not ( = ?auto_37717 ?auto_37722 ) ) ( IS-CRATE ?auto_37717 ) ( not ( = ?auto_37716 ?auto_37724 ) ) ( not ( = ?auto_37717 ?auto_37724 ) ) ( not ( = ?auto_37722 ?auto_37724 ) ) ( AVAILABLE ?auto_37719 ) ( SURFACE-AT ?auto_37717 ?auto_37723 ) ( ON ?auto_37717 ?auto_37720 ) ( CLEAR ?auto_37717 ) ( not ( = ?auto_37716 ?auto_37720 ) ) ( not ( = ?auto_37717 ?auto_37720 ) ) ( not ( = ?auto_37722 ?auto_37720 ) ) ( not ( = ?auto_37724 ?auto_37720 ) ) ( TRUCK-AT ?auto_37725 ?auto_37721 ) ( SURFACE-AT ?auto_37726 ?auto_37721 ) ( CLEAR ?auto_37726 ) ( LIFTING ?auto_37718 ?auto_37724 ) ( IS-CRATE ?auto_37724 ) ( not ( = ?auto_37716 ?auto_37726 ) ) ( not ( = ?auto_37717 ?auto_37726 ) ) ( not ( = ?auto_37722 ?auto_37726 ) ) ( not ( = ?auto_37724 ?auto_37726 ) ) ( not ( = ?auto_37720 ?auto_37726 ) ) )
    :subtasks
    ( ( !DROP ?auto_37718 ?auto_37724 ?auto_37726 ?auto_37721 )
      ( MAKE-ON ?auto_37716 ?auto_37717 )
      ( MAKE-ON-VERIFY ?auto_37716 ?auto_37717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37852 - SURFACE
      ?auto_37853 - SURFACE
    )
    :vars
    (
      ?auto_37856 - HOIST
      ?auto_37857 - PLACE
      ?auto_37859 - PLACE
      ?auto_37854 - HOIST
      ?auto_37858 - SURFACE
      ?auto_37855 - TRUCK
      ?auto_37860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37856 ?auto_37857 ) ( SURFACE-AT ?auto_37853 ?auto_37857 ) ( CLEAR ?auto_37853 ) ( IS-CRATE ?auto_37852 ) ( not ( = ?auto_37852 ?auto_37853 ) ) ( not ( = ?auto_37859 ?auto_37857 ) ) ( HOIST-AT ?auto_37854 ?auto_37859 ) ( not ( = ?auto_37856 ?auto_37854 ) ) ( AVAILABLE ?auto_37854 ) ( SURFACE-AT ?auto_37852 ?auto_37859 ) ( ON ?auto_37852 ?auto_37858 ) ( CLEAR ?auto_37852 ) ( not ( = ?auto_37852 ?auto_37858 ) ) ( not ( = ?auto_37853 ?auto_37858 ) ) ( TRUCK-AT ?auto_37855 ?auto_37857 ) ( LIFTING ?auto_37856 ?auto_37860 ) ( IS-CRATE ?auto_37860 ) ( not ( = ?auto_37852 ?auto_37860 ) ) ( not ( = ?auto_37853 ?auto_37860 ) ) ( not ( = ?auto_37858 ?auto_37860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37856 ?auto_37860 ?auto_37855 ?auto_37857 )
      ( MAKE-ON ?auto_37852 ?auto_37853 )
      ( MAKE-ON-VERIFY ?auto_37852 ?auto_37853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38342 - SURFACE
      ?auto_38343 - SURFACE
    )
    :vars
    (
      ?auto_38345 - HOIST
      ?auto_38344 - PLACE
      ?auto_38349 - TRUCK
      ?auto_38347 - PLACE
      ?auto_38346 - HOIST
      ?auto_38348 - SURFACE
      ?auto_38350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38345 ?auto_38344 ) ( SURFACE-AT ?auto_38343 ?auto_38344 ) ( CLEAR ?auto_38343 ) ( IS-CRATE ?auto_38342 ) ( not ( = ?auto_38342 ?auto_38343 ) ) ( AVAILABLE ?auto_38345 ) ( TRUCK-AT ?auto_38349 ?auto_38347 ) ( not ( = ?auto_38347 ?auto_38344 ) ) ( HOIST-AT ?auto_38346 ?auto_38347 ) ( not ( = ?auto_38345 ?auto_38346 ) ) ( SURFACE-AT ?auto_38342 ?auto_38347 ) ( ON ?auto_38342 ?auto_38348 ) ( CLEAR ?auto_38342 ) ( not ( = ?auto_38342 ?auto_38348 ) ) ( not ( = ?auto_38343 ?auto_38348 ) ) ( LIFTING ?auto_38346 ?auto_38350 ) ( IS-CRATE ?auto_38350 ) ( not ( = ?auto_38342 ?auto_38350 ) ) ( not ( = ?auto_38343 ?auto_38350 ) ) ( not ( = ?auto_38348 ?auto_38350 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38346 ?auto_38350 ?auto_38349 ?auto_38347 )
      ( MAKE-ON ?auto_38342 ?auto_38343 )
      ( MAKE-ON-VERIFY ?auto_38342 ?auto_38343 ) )
  )

)

