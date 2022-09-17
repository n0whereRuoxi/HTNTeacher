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
      ?auto_7745 - SURFACE
      ?auto_7746 - SURFACE
    )
    :vars
    (
      ?auto_7747 - HOIST
      ?auto_7748 - PLACE
      ?auto_7750 - PLACE
      ?auto_7751 - HOIST
      ?auto_7752 - SURFACE
      ?auto_7749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7747 ?auto_7748 ) ( SURFACE-AT ?auto_7745 ?auto_7748 ) ( CLEAR ?auto_7745 ) ( IS-CRATE ?auto_7746 ) ( AVAILABLE ?auto_7747 ) ( not ( = ?auto_7750 ?auto_7748 ) ) ( HOIST-AT ?auto_7751 ?auto_7750 ) ( AVAILABLE ?auto_7751 ) ( SURFACE-AT ?auto_7746 ?auto_7750 ) ( ON ?auto_7746 ?auto_7752 ) ( CLEAR ?auto_7746 ) ( TRUCK-AT ?auto_7749 ?auto_7748 ) ( not ( = ?auto_7745 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7752 ) ) ( not ( = ?auto_7746 ?auto_7752 ) ) ( not ( = ?auto_7747 ?auto_7751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7749 ?auto_7748 ?auto_7750 )
      ( !LIFT ?auto_7751 ?auto_7746 ?auto_7752 ?auto_7750 )
      ( !LOAD ?auto_7751 ?auto_7746 ?auto_7749 ?auto_7750 )
      ( !DRIVE ?auto_7749 ?auto_7750 ?auto_7748 )
      ( !UNLOAD ?auto_7747 ?auto_7746 ?auto_7749 ?auto_7748 )
      ( !DROP ?auto_7747 ?auto_7746 ?auto_7745 ?auto_7748 )
      ( MAKE-1CRATE-VERIFY ?auto_7745 ?auto_7746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7766 - SURFACE
      ?auto_7767 - SURFACE
      ?auto_7768 - SURFACE
    )
    :vars
    (
      ?auto_7770 - HOIST
      ?auto_7773 - PLACE
      ?auto_7772 - PLACE
      ?auto_7771 - HOIST
      ?auto_7769 - SURFACE
      ?auto_7776 - PLACE
      ?auto_7777 - HOIST
      ?auto_7775 - SURFACE
      ?auto_7774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7770 ?auto_7773 ) ( IS-CRATE ?auto_7768 ) ( not ( = ?auto_7772 ?auto_7773 ) ) ( HOIST-AT ?auto_7771 ?auto_7772 ) ( AVAILABLE ?auto_7771 ) ( SURFACE-AT ?auto_7768 ?auto_7772 ) ( ON ?auto_7768 ?auto_7769 ) ( CLEAR ?auto_7768 ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( not ( = ?auto_7770 ?auto_7771 ) ) ( SURFACE-AT ?auto_7766 ?auto_7773 ) ( CLEAR ?auto_7766 ) ( IS-CRATE ?auto_7767 ) ( AVAILABLE ?auto_7770 ) ( not ( = ?auto_7776 ?auto_7773 ) ) ( HOIST-AT ?auto_7777 ?auto_7776 ) ( AVAILABLE ?auto_7777 ) ( SURFACE-AT ?auto_7767 ?auto_7776 ) ( ON ?auto_7767 ?auto_7775 ) ( CLEAR ?auto_7767 ) ( TRUCK-AT ?auto_7774 ?auto_7773 ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( not ( = ?auto_7766 ?auto_7775 ) ) ( not ( = ?auto_7767 ?auto_7775 ) ) ( not ( = ?auto_7770 ?auto_7777 ) ) ( not ( = ?auto_7766 ?auto_7768 ) ) ( not ( = ?auto_7766 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7775 ) ) ( not ( = ?auto_7772 ?auto_7776 ) ) ( not ( = ?auto_7771 ?auto_7777 ) ) ( not ( = ?auto_7769 ?auto_7775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7766 ?auto_7767 )
      ( MAKE-1CRATE ?auto_7767 ?auto_7768 )
      ( MAKE-2CRATE-VERIFY ?auto_7766 ?auto_7767 ?auto_7768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7792 - SURFACE
      ?auto_7793 - SURFACE
      ?auto_7794 - SURFACE
      ?auto_7795 - SURFACE
    )
    :vars
    (
      ?auto_7798 - HOIST
      ?auto_7801 - PLACE
      ?auto_7800 - PLACE
      ?auto_7799 - HOIST
      ?auto_7796 - SURFACE
      ?auto_7803 - PLACE
      ?auto_7805 - HOIST
      ?auto_7807 - SURFACE
      ?auto_7804 - PLACE
      ?auto_7802 - HOIST
      ?auto_7806 - SURFACE
      ?auto_7797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7798 ?auto_7801 ) ( IS-CRATE ?auto_7795 ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( HOIST-AT ?auto_7799 ?auto_7800 ) ( AVAILABLE ?auto_7799 ) ( SURFACE-AT ?auto_7795 ?auto_7800 ) ( ON ?auto_7795 ?auto_7796 ) ( CLEAR ?auto_7795 ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( IS-CRATE ?auto_7794 ) ( not ( = ?auto_7803 ?auto_7801 ) ) ( HOIST-AT ?auto_7805 ?auto_7803 ) ( AVAILABLE ?auto_7805 ) ( SURFACE-AT ?auto_7794 ?auto_7803 ) ( ON ?auto_7794 ?auto_7807 ) ( CLEAR ?auto_7794 ) ( not ( = ?auto_7793 ?auto_7794 ) ) ( not ( = ?auto_7793 ?auto_7807 ) ) ( not ( = ?auto_7794 ?auto_7807 ) ) ( not ( = ?auto_7798 ?auto_7805 ) ) ( SURFACE-AT ?auto_7792 ?auto_7801 ) ( CLEAR ?auto_7792 ) ( IS-CRATE ?auto_7793 ) ( AVAILABLE ?auto_7798 ) ( not ( = ?auto_7804 ?auto_7801 ) ) ( HOIST-AT ?auto_7802 ?auto_7804 ) ( AVAILABLE ?auto_7802 ) ( SURFACE-AT ?auto_7793 ?auto_7804 ) ( ON ?auto_7793 ?auto_7806 ) ( CLEAR ?auto_7793 ) ( TRUCK-AT ?auto_7797 ?auto_7801 ) ( not ( = ?auto_7792 ?auto_7793 ) ) ( not ( = ?auto_7792 ?auto_7806 ) ) ( not ( = ?auto_7793 ?auto_7806 ) ) ( not ( = ?auto_7798 ?auto_7802 ) ) ( not ( = ?auto_7792 ?auto_7794 ) ) ( not ( = ?auto_7792 ?auto_7807 ) ) ( not ( = ?auto_7794 ?auto_7806 ) ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( not ( = ?auto_7805 ?auto_7802 ) ) ( not ( = ?auto_7807 ?auto_7806 ) ) ( not ( = ?auto_7792 ?auto_7795 ) ) ( not ( = ?auto_7792 ?auto_7796 ) ) ( not ( = ?auto_7793 ?auto_7795 ) ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7807 ) ) ( not ( = ?auto_7795 ?auto_7806 ) ) ( not ( = ?auto_7800 ?auto_7803 ) ) ( not ( = ?auto_7800 ?auto_7804 ) ) ( not ( = ?auto_7799 ?auto_7805 ) ) ( not ( = ?auto_7799 ?auto_7802 ) ) ( not ( = ?auto_7796 ?auto_7807 ) ) ( not ( = ?auto_7796 ?auto_7806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7792 ?auto_7793 ?auto_7794 )
      ( MAKE-1CRATE ?auto_7794 ?auto_7795 )
      ( MAKE-3CRATE-VERIFY ?auto_7792 ?auto_7793 ?auto_7794 ?auto_7795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7823 - SURFACE
      ?auto_7824 - SURFACE
      ?auto_7825 - SURFACE
      ?auto_7826 - SURFACE
      ?auto_7827 - SURFACE
    )
    :vars
    (
      ?auto_7829 - HOIST
      ?auto_7828 - PLACE
      ?auto_7833 - PLACE
      ?auto_7832 - HOIST
      ?auto_7830 - SURFACE
      ?auto_7836 - PLACE
      ?auto_7837 - HOIST
      ?auto_7838 - SURFACE
      ?auto_7840 - SURFACE
      ?auto_7834 - PLACE
      ?auto_7839 - HOIST
      ?auto_7835 - SURFACE
      ?auto_7831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7829 ?auto_7828 ) ( IS-CRATE ?auto_7827 ) ( not ( = ?auto_7833 ?auto_7828 ) ) ( HOIST-AT ?auto_7832 ?auto_7833 ) ( SURFACE-AT ?auto_7827 ?auto_7833 ) ( ON ?auto_7827 ?auto_7830 ) ( CLEAR ?auto_7827 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7830 ) ) ( not ( = ?auto_7827 ?auto_7830 ) ) ( not ( = ?auto_7829 ?auto_7832 ) ) ( IS-CRATE ?auto_7826 ) ( not ( = ?auto_7836 ?auto_7828 ) ) ( HOIST-AT ?auto_7837 ?auto_7836 ) ( AVAILABLE ?auto_7837 ) ( SURFACE-AT ?auto_7826 ?auto_7836 ) ( ON ?auto_7826 ?auto_7838 ) ( CLEAR ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( not ( = ?auto_7825 ?auto_7838 ) ) ( not ( = ?auto_7826 ?auto_7838 ) ) ( not ( = ?auto_7829 ?auto_7837 ) ) ( IS-CRATE ?auto_7825 ) ( AVAILABLE ?auto_7832 ) ( SURFACE-AT ?auto_7825 ?auto_7833 ) ( ON ?auto_7825 ?auto_7840 ) ( CLEAR ?auto_7825 ) ( not ( = ?auto_7824 ?auto_7825 ) ) ( not ( = ?auto_7824 ?auto_7840 ) ) ( not ( = ?auto_7825 ?auto_7840 ) ) ( SURFACE-AT ?auto_7823 ?auto_7828 ) ( CLEAR ?auto_7823 ) ( IS-CRATE ?auto_7824 ) ( AVAILABLE ?auto_7829 ) ( not ( = ?auto_7834 ?auto_7828 ) ) ( HOIST-AT ?auto_7839 ?auto_7834 ) ( AVAILABLE ?auto_7839 ) ( SURFACE-AT ?auto_7824 ?auto_7834 ) ( ON ?auto_7824 ?auto_7835 ) ( CLEAR ?auto_7824 ) ( TRUCK-AT ?auto_7831 ?auto_7828 ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7835 ) ) ( not ( = ?auto_7824 ?auto_7835 ) ) ( not ( = ?auto_7829 ?auto_7839 ) ) ( not ( = ?auto_7823 ?auto_7825 ) ) ( not ( = ?auto_7823 ?auto_7840 ) ) ( not ( = ?auto_7825 ?auto_7835 ) ) ( not ( = ?auto_7833 ?auto_7834 ) ) ( not ( = ?auto_7832 ?auto_7839 ) ) ( not ( = ?auto_7840 ?auto_7835 ) ) ( not ( = ?auto_7823 ?auto_7826 ) ) ( not ( = ?auto_7823 ?auto_7838 ) ) ( not ( = ?auto_7824 ?auto_7826 ) ) ( not ( = ?auto_7824 ?auto_7838 ) ) ( not ( = ?auto_7826 ?auto_7840 ) ) ( not ( = ?auto_7826 ?auto_7835 ) ) ( not ( = ?auto_7836 ?auto_7833 ) ) ( not ( = ?auto_7836 ?auto_7834 ) ) ( not ( = ?auto_7837 ?auto_7832 ) ) ( not ( = ?auto_7837 ?auto_7839 ) ) ( not ( = ?auto_7838 ?auto_7840 ) ) ( not ( = ?auto_7838 ?auto_7835 ) ) ( not ( = ?auto_7823 ?auto_7827 ) ) ( not ( = ?auto_7823 ?auto_7830 ) ) ( not ( = ?auto_7824 ?auto_7827 ) ) ( not ( = ?auto_7824 ?auto_7830 ) ) ( not ( = ?auto_7825 ?auto_7827 ) ) ( not ( = ?auto_7825 ?auto_7830 ) ) ( not ( = ?auto_7827 ?auto_7838 ) ) ( not ( = ?auto_7827 ?auto_7840 ) ) ( not ( = ?auto_7827 ?auto_7835 ) ) ( not ( = ?auto_7830 ?auto_7838 ) ) ( not ( = ?auto_7830 ?auto_7840 ) ) ( not ( = ?auto_7830 ?auto_7835 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7823 ?auto_7824 ?auto_7825 ?auto_7826 )
      ( MAKE-1CRATE ?auto_7826 ?auto_7827 )
      ( MAKE-4CRATE-VERIFY ?auto_7823 ?auto_7824 ?auto_7825 ?auto_7826 ?auto_7827 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7857 - SURFACE
      ?auto_7858 - SURFACE
      ?auto_7859 - SURFACE
      ?auto_7860 - SURFACE
      ?auto_7861 - SURFACE
      ?auto_7862 - SURFACE
    )
    :vars
    (
      ?auto_7863 - HOIST
      ?auto_7866 - PLACE
      ?auto_7867 - PLACE
      ?auto_7865 - HOIST
      ?auto_7864 - SURFACE
      ?auto_7874 - PLACE
      ?auto_7872 - HOIST
      ?auto_7873 - SURFACE
      ?auto_7870 - PLACE
      ?auto_7876 - HOIST
      ?auto_7871 - SURFACE
      ?auto_7869 - SURFACE
      ?auto_7875 - SURFACE
      ?auto_7868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7863 ?auto_7866 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7867 ?auto_7866 ) ) ( HOIST-AT ?auto_7865 ?auto_7867 ) ( SURFACE-AT ?auto_7862 ?auto_7867 ) ( ON ?auto_7862 ?auto_7864 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7864 ) ) ( not ( = ?auto_7862 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) ( IS-CRATE ?auto_7861 ) ( not ( = ?auto_7874 ?auto_7866 ) ) ( HOIST-AT ?auto_7872 ?auto_7874 ) ( SURFACE-AT ?auto_7861 ?auto_7874 ) ( ON ?auto_7861 ?auto_7873 ) ( CLEAR ?auto_7861 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7873 ) ) ( not ( = ?auto_7861 ?auto_7873 ) ) ( not ( = ?auto_7863 ?auto_7872 ) ) ( IS-CRATE ?auto_7860 ) ( not ( = ?auto_7870 ?auto_7866 ) ) ( HOIST-AT ?auto_7876 ?auto_7870 ) ( AVAILABLE ?auto_7876 ) ( SURFACE-AT ?auto_7860 ?auto_7870 ) ( ON ?auto_7860 ?auto_7871 ) ( CLEAR ?auto_7860 ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( not ( = ?auto_7859 ?auto_7871 ) ) ( not ( = ?auto_7860 ?auto_7871 ) ) ( not ( = ?auto_7863 ?auto_7876 ) ) ( IS-CRATE ?auto_7859 ) ( AVAILABLE ?auto_7872 ) ( SURFACE-AT ?auto_7859 ?auto_7874 ) ( ON ?auto_7859 ?auto_7869 ) ( CLEAR ?auto_7859 ) ( not ( = ?auto_7858 ?auto_7859 ) ) ( not ( = ?auto_7858 ?auto_7869 ) ) ( not ( = ?auto_7859 ?auto_7869 ) ) ( SURFACE-AT ?auto_7857 ?auto_7866 ) ( CLEAR ?auto_7857 ) ( IS-CRATE ?auto_7858 ) ( AVAILABLE ?auto_7863 ) ( AVAILABLE ?auto_7865 ) ( SURFACE-AT ?auto_7858 ?auto_7867 ) ( ON ?auto_7858 ?auto_7875 ) ( CLEAR ?auto_7858 ) ( TRUCK-AT ?auto_7868 ?auto_7866 ) ( not ( = ?auto_7857 ?auto_7858 ) ) ( not ( = ?auto_7857 ?auto_7875 ) ) ( not ( = ?auto_7858 ?auto_7875 ) ) ( not ( = ?auto_7857 ?auto_7859 ) ) ( not ( = ?auto_7857 ?auto_7869 ) ) ( not ( = ?auto_7859 ?auto_7875 ) ) ( not ( = ?auto_7874 ?auto_7867 ) ) ( not ( = ?auto_7872 ?auto_7865 ) ) ( not ( = ?auto_7869 ?auto_7875 ) ) ( not ( = ?auto_7857 ?auto_7860 ) ) ( not ( = ?auto_7857 ?auto_7871 ) ) ( not ( = ?auto_7858 ?auto_7860 ) ) ( not ( = ?auto_7858 ?auto_7871 ) ) ( not ( = ?auto_7860 ?auto_7869 ) ) ( not ( = ?auto_7860 ?auto_7875 ) ) ( not ( = ?auto_7870 ?auto_7874 ) ) ( not ( = ?auto_7870 ?auto_7867 ) ) ( not ( = ?auto_7876 ?auto_7872 ) ) ( not ( = ?auto_7876 ?auto_7865 ) ) ( not ( = ?auto_7871 ?auto_7869 ) ) ( not ( = ?auto_7871 ?auto_7875 ) ) ( not ( = ?auto_7857 ?auto_7861 ) ) ( not ( = ?auto_7857 ?auto_7873 ) ) ( not ( = ?auto_7858 ?auto_7861 ) ) ( not ( = ?auto_7858 ?auto_7873 ) ) ( not ( = ?auto_7859 ?auto_7861 ) ) ( not ( = ?auto_7859 ?auto_7873 ) ) ( not ( = ?auto_7861 ?auto_7871 ) ) ( not ( = ?auto_7861 ?auto_7869 ) ) ( not ( = ?auto_7861 ?auto_7875 ) ) ( not ( = ?auto_7873 ?auto_7871 ) ) ( not ( = ?auto_7873 ?auto_7869 ) ) ( not ( = ?auto_7873 ?auto_7875 ) ) ( not ( = ?auto_7857 ?auto_7862 ) ) ( not ( = ?auto_7857 ?auto_7864 ) ) ( not ( = ?auto_7858 ?auto_7862 ) ) ( not ( = ?auto_7858 ?auto_7864 ) ) ( not ( = ?auto_7859 ?auto_7862 ) ) ( not ( = ?auto_7859 ?auto_7864 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7864 ) ) ( not ( = ?auto_7862 ?auto_7873 ) ) ( not ( = ?auto_7862 ?auto_7871 ) ) ( not ( = ?auto_7862 ?auto_7869 ) ) ( not ( = ?auto_7862 ?auto_7875 ) ) ( not ( = ?auto_7864 ?auto_7873 ) ) ( not ( = ?auto_7864 ?auto_7871 ) ) ( not ( = ?auto_7864 ?auto_7869 ) ) ( not ( = ?auto_7864 ?auto_7875 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7857 ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7861 )
      ( MAKE-1CRATE ?auto_7861 ?auto_7862 )
      ( MAKE-5CRATE-VERIFY ?auto_7857 ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7894 - SURFACE
      ?auto_7895 - SURFACE
      ?auto_7896 - SURFACE
      ?auto_7897 - SURFACE
      ?auto_7898 - SURFACE
      ?auto_7899 - SURFACE
      ?auto_7900 - SURFACE
    )
    :vars
    (
      ?auto_7905 - HOIST
      ?auto_7903 - PLACE
      ?auto_7902 - PLACE
      ?auto_7906 - HOIST
      ?auto_7901 - SURFACE
      ?auto_7917 - PLACE
      ?auto_7910 - HOIST
      ?auto_7916 - SURFACE
      ?auto_7914 - PLACE
      ?auto_7913 - HOIST
      ?auto_7915 - SURFACE
      ?auto_7907 - PLACE
      ?auto_7912 - HOIST
      ?auto_7908 - SURFACE
      ?auto_7909 - SURFACE
      ?auto_7911 - SURFACE
      ?auto_7904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7905 ?auto_7903 ) ( IS-CRATE ?auto_7900 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( HOIST-AT ?auto_7906 ?auto_7902 ) ( AVAILABLE ?auto_7906 ) ( SURFACE-AT ?auto_7900 ?auto_7902 ) ( ON ?auto_7900 ?auto_7901 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( not ( = ?auto_7905 ?auto_7906 ) ) ( IS-CRATE ?auto_7899 ) ( not ( = ?auto_7917 ?auto_7903 ) ) ( HOIST-AT ?auto_7910 ?auto_7917 ) ( SURFACE-AT ?auto_7899 ?auto_7917 ) ( ON ?auto_7899 ?auto_7916 ) ( CLEAR ?auto_7899 ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( not ( = ?auto_7898 ?auto_7916 ) ) ( not ( = ?auto_7899 ?auto_7916 ) ) ( not ( = ?auto_7905 ?auto_7910 ) ) ( IS-CRATE ?auto_7898 ) ( not ( = ?auto_7914 ?auto_7903 ) ) ( HOIST-AT ?auto_7913 ?auto_7914 ) ( SURFACE-AT ?auto_7898 ?auto_7914 ) ( ON ?auto_7898 ?auto_7915 ) ( CLEAR ?auto_7898 ) ( not ( = ?auto_7897 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7915 ) ) ( not ( = ?auto_7898 ?auto_7915 ) ) ( not ( = ?auto_7905 ?auto_7913 ) ) ( IS-CRATE ?auto_7897 ) ( not ( = ?auto_7907 ?auto_7903 ) ) ( HOIST-AT ?auto_7912 ?auto_7907 ) ( AVAILABLE ?auto_7912 ) ( SURFACE-AT ?auto_7897 ?auto_7907 ) ( ON ?auto_7897 ?auto_7908 ) ( CLEAR ?auto_7897 ) ( not ( = ?auto_7896 ?auto_7897 ) ) ( not ( = ?auto_7896 ?auto_7908 ) ) ( not ( = ?auto_7897 ?auto_7908 ) ) ( not ( = ?auto_7905 ?auto_7912 ) ) ( IS-CRATE ?auto_7896 ) ( AVAILABLE ?auto_7913 ) ( SURFACE-AT ?auto_7896 ?auto_7914 ) ( ON ?auto_7896 ?auto_7909 ) ( CLEAR ?auto_7896 ) ( not ( = ?auto_7895 ?auto_7896 ) ) ( not ( = ?auto_7895 ?auto_7909 ) ) ( not ( = ?auto_7896 ?auto_7909 ) ) ( SURFACE-AT ?auto_7894 ?auto_7903 ) ( CLEAR ?auto_7894 ) ( IS-CRATE ?auto_7895 ) ( AVAILABLE ?auto_7905 ) ( AVAILABLE ?auto_7910 ) ( SURFACE-AT ?auto_7895 ?auto_7917 ) ( ON ?auto_7895 ?auto_7911 ) ( CLEAR ?auto_7895 ) ( TRUCK-AT ?auto_7904 ?auto_7903 ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7911 ) ) ( not ( = ?auto_7895 ?auto_7911 ) ) ( not ( = ?auto_7894 ?auto_7896 ) ) ( not ( = ?auto_7894 ?auto_7909 ) ) ( not ( = ?auto_7896 ?auto_7911 ) ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( not ( = ?auto_7913 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7894 ?auto_7897 ) ) ( not ( = ?auto_7894 ?auto_7908 ) ) ( not ( = ?auto_7895 ?auto_7897 ) ) ( not ( = ?auto_7895 ?auto_7908 ) ) ( not ( = ?auto_7897 ?auto_7909 ) ) ( not ( = ?auto_7897 ?auto_7911 ) ) ( not ( = ?auto_7907 ?auto_7914 ) ) ( not ( = ?auto_7907 ?auto_7917 ) ) ( not ( = ?auto_7912 ?auto_7913 ) ) ( not ( = ?auto_7912 ?auto_7910 ) ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7911 ) ) ( not ( = ?auto_7894 ?auto_7898 ) ) ( not ( = ?auto_7894 ?auto_7915 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) ( not ( = ?auto_7895 ?auto_7915 ) ) ( not ( = ?auto_7896 ?auto_7898 ) ) ( not ( = ?auto_7896 ?auto_7915 ) ) ( not ( = ?auto_7898 ?auto_7908 ) ) ( not ( = ?auto_7898 ?auto_7909 ) ) ( not ( = ?auto_7898 ?auto_7911 ) ) ( not ( = ?auto_7915 ?auto_7908 ) ) ( not ( = ?auto_7915 ?auto_7909 ) ) ( not ( = ?auto_7915 ?auto_7911 ) ) ( not ( = ?auto_7894 ?auto_7899 ) ) ( not ( = ?auto_7894 ?auto_7916 ) ) ( not ( = ?auto_7895 ?auto_7899 ) ) ( not ( = ?auto_7895 ?auto_7916 ) ) ( not ( = ?auto_7896 ?auto_7899 ) ) ( not ( = ?auto_7896 ?auto_7916 ) ) ( not ( = ?auto_7897 ?auto_7899 ) ) ( not ( = ?auto_7897 ?auto_7916 ) ) ( not ( = ?auto_7899 ?auto_7915 ) ) ( not ( = ?auto_7899 ?auto_7908 ) ) ( not ( = ?auto_7899 ?auto_7909 ) ) ( not ( = ?auto_7899 ?auto_7911 ) ) ( not ( = ?auto_7916 ?auto_7915 ) ) ( not ( = ?auto_7916 ?auto_7908 ) ) ( not ( = ?auto_7916 ?auto_7909 ) ) ( not ( = ?auto_7916 ?auto_7911 ) ) ( not ( = ?auto_7894 ?auto_7900 ) ) ( not ( = ?auto_7894 ?auto_7901 ) ) ( not ( = ?auto_7895 ?auto_7900 ) ) ( not ( = ?auto_7895 ?auto_7901 ) ) ( not ( = ?auto_7896 ?auto_7900 ) ) ( not ( = ?auto_7896 ?auto_7901 ) ) ( not ( = ?auto_7897 ?auto_7900 ) ) ( not ( = ?auto_7897 ?auto_7901 ) ) ( not ( = ?auto_7898 ?auto_7900 ) ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( not ( = ?auto_7900 ?auto_7916 ) ) ( not ( = ?auto_7900 ?auto_7915 ) ) ( not ( = ?auto_7900 ?auto_7908 ) ) ( not ( = ?auto_7900 ?auto_7909 ) ) ( not ( = ?auto_7900 ?auto_7911 ) ) ( not ( = ?auto_7902 ?auto_7917 ) ) ( not ( = ?auto_7902 ?auto_7914 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7910 ) ) ( not ( = ?auto_7906 ?auto_7913 ) ) ( not ( = ?auto_7906 ?auto_7912 ) ) ( not ( = ?auto_7901 ?auto_7916 ) ) ( not ( = ?auto_7901 ?auto_7915 ) ) ( not ( = ?auto_7901 ?auto_7908 ) ) ( not ( = ?auto_7901 ?auto_7909 ) ) ( not ( = ?auto_7901 ?auto_7911 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7894 ?auto_7895 ?auto_7896 ?auto_7897 ?auto_7898 ?auto_7899 )
      ( MAKE-1CRATE ?auto_7899 ?auto_7900 )
      ( MAKE-6CRATE-VERIFY ?auto_7894 ?auto_7895 ?auto_7896 ?auto_7897 ?auto_7898 ?auto_7899 ?auto_7900 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7936 - SURFACE
      ?auto_7937 - SURFACE
      ?auto_7938 - SURFACE
      ?auto_7939 - SURFACE
      ?auto_7940 - SURFACE
      ?auto_7941 - SURFACE
      ?auto_7942 - SURFACE
      ?auto_7943 - SURFACE
    )
    :vars
    (
      ?auto_7949 - HOIST
      ?auto_7944 - PLACE
      ?auto_7945 - PLACE
      ?auto_7948 - HOIST
      ?auto_7947 - SURFACE
      ?auto_7963 - PLACE
      ?auto_7956 - HOIST
      ?auto_7950 - SURFACE
      ?auto_7961 - PLACE
      ?auto_7952 - HOIST
      ?auto_7959 - SURFACE
      ?auto_7951 - PLACE
      ?auto_7953 - HOIST
      ?auto_7954 - SURFACE
      ?auto_7962 - PLACE
      ?auto_7958 - HOIST
      ?auto_7955 - SURFACE
      ?auto_7960 - SURFACE
      ?auto_7957 - SURFACE
      ?auto_7946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7949 ?auto_7944 ) ( IS-CRATE ?auto_7943 ) ( not ( = ?auto_7945 ?auto_7944 ) ) ( HOIST-AT ?auto_7948 ?auto_7945 ) ( AVAILABLE ?auto_7948 ) ( SURFACE-AT ?auto_7943 ?auto_7945 ) ( ON ?auto_7943 ?auto_7947 ) ( CLEAR ?auto_7943 ) ( not ( = ?auto_7942 ?auto_7943 ) ) ( not ( = ?auto_7942 ?auto_7947 ) ) ( not ( = ?auto_7943 ?auto_7947 ) ) ( not ( = ?auto_7949 ?auto_7948 ) ) ( IS-CRATE ?auto_7942 ) ( not ( = ?auto_7963 ?auto_7944 ) ) ( HOIST-AT ?auto_7956 ?auto_7963 ) ( AVAILABLE ?auto_7956 ) ( SURFACE-AT ?auto_7942 ?auto_7963 ) ( ON ?auto_7942 ?auto_7950 ) ( CLEAR ?auto_7942 ) ( not ( = ?auto_7941 ?auto_7942 ) ) ( not ( = ?auto_7941 ?auto_7950 ) ) ( not ( = ?auto_7942 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7956 ) ) ( IS-CRATE ?auto_7941 ) ( not ( = ?auto_7961 ?auto_7944 ) ) ( HOIST-AT ?auto_7952 ?auto_7961 ) ( SURFACE-AT ?auto_7941 ?auto_7961 ) ( ON ?auto_7941 ?auto_7959 ) ( CLEAR ?auto_7941 ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7959 ) ) ( not ( = ?auto_7941 ?auto_7959 ) ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( IS-CRATE ?auto_7940 ) ( not ( = ?auto_7951 ?auto_7944 ) ) ( HOIST-AT ?auto_7953 ?auto_7951 ) ( SURFACE-AT ?auto_7940 ?auto_7951 ) ( ON ?auto_7940 ?auto_7954 ) ( CLEAR ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7954 ) ) ( not ( = ?auto_7940 ?auto_7954 ) ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( IS-CRATE ?auto_7939 ) ( not ( = ?auto_7962 ?auto_7944 ) ) ( HOIST-AT ?auto_7958 ?auto_7962 ) ( AVAILABLE ?auto_7958 ) ( SURFACE-AT ?auto_7939 ?auto_7962 ) ( ON ?auto_7939 ?auto_7955 ) ( CLEAR ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7938 ?auto_7955 ) ) ( not ( = ?auto_7939 ?auto_7955 ) ) ( not ( = ?auto_7949 ?auto_7958 ) ) ( IS-CRATE ?auto_7938 ) ( AVAILABLE ?auto_7953 ) ( SURFACE-AT ?auto_7938 ?auto_7951 ) ( ON ?auto_7938 ?auto_7960 ) ( CLEAR ?auto_7938 ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7960 ) ) ( not ( = ?auto_7938 ?auto_7960 ) ) ( SURFACE-AT ?auto_7936 ?auto_7944 ) ( CLEAR ?auto_7936 ) ( IS-CRATE ?auto_7937 ) ( AVAILABLE ?auto_7949 ) ( AVAILABLE ?auto_7952 ) ( SURFACE-AT ?auto_7937 ?auto_7961 ) ( ON ?auto_7937 ?auto_7957 ) ( CLEAR ?auto_7937 ) ( TRUCK-AT ?auto_7946 ?auto_7944 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7957 ) ) ( not ( = ?auto_7937 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7936 ?auto_7960 ) ) ( not ( = ?auto_7938 ?auto_7957 ) ) ( not ( = ?auto_7951 ?auto_7961 ) ) ( not ( = ?auto_7953 ?auto_7952 ) ) ( not ( = ?auto_7960 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7939 ) ) ( not ( = ?auto_7936 ?auto_7955 ) ) ( not ( = ?auto_7937 ?auto_7939 ) ) ( not ( = ?auto_7937 ?auto_7955 ) ) ( not ( = ?auto_7939 ?auto_7960 ) ) ( not ( = ?auto_7939 ?auto_7957 ) ) ( not ( = ?auto_7962 ?auto_7951 ) ) ( not ( = ?auto_7962 ?auto_7961 ) ) ( not ( = ?auto_7958 ?auto_7953 ) ) ( not ( = ?auto_7958 ?auto_7952 ) ) ( not ( = ?auto_7955 ?auto_7960 ) ) ( not ( = ?auto_7955 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7940 ) ) ( not ( = ?auto_7936 ?auto_7954 ) ) ( not ( = ?auto_7937 ?auto_7940 ) ) ( not ( = ?auto_7937 ?auto_7954 ) ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( not ( = ?auto_7938 ?auto_7954 ) ) ( not ( = ?auto_7940 ?auto_7955 ) ) ( not ( = ?auto_7940 ?auto_7960 ) ) ( not ( = ?auto_7940 ?auto_7957 ) ) ( not ( = ?auto_7954 ?auto_7955 ) ) ( not ( = ?auto_7954 ?auto_7960 ) ) ( not ( = ?auto_7954 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7941 ) ) ( not ( = ?auto_7936 ?auto_7959 ) ) ( not ( = ?auto_7937 ?auto_7941 ) ) ( not ( = ?auto_7937 ?auto_7959 ) ) ( not ( = ?auto_7938 ?auto_7941 ) ) ( not ( = ?auto_7938 ?auto_7959 ) ) ( not ( = ?auto_7939 ?auto_7941 ) ) ( not ( = ?auto_7939 ?auto_7959 ) ) ( not ( = ?auto_7941 ?auto_7954 ) ) ( not ( = ?auto_7941 ?auto_7955 ) ) ( not ( = ?auto_7941 ?auto_7960 ) ) ( not ( = ?auto_7941 ?auto_7957 ) ) ( not ( = ?auto_7959 ?auto_7954 ) ) ( not ( = ?auto_7959 ?auto_7955 ) ) ( not ( = ?auto_7959 ?auto_7960 ) ) ( not ( = ?auto_7959 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7942 ) ) ( not ( = ?auto_7936 ?auto_7950 ) ) ( not ( = ?auto_7937 ?auto_7942 ) ) ( not ( = ?auto_7937 ?auto_7950 ) ) ( not ( = ?auto_7938 ?auto_7942 ) ) ( not ( = ?auto_7938 ?auto_7950 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( not ( = ?auto_7939 ?auto_7950 ) ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7950 ) ) ( not ( = ?auto_7942 ?auto_7959 ) ) ( not ( = ?auto_7942 ?auto_7954 ) ) ( not ( = ?auto_7942 ?auto_7955 ) ) ( not ( = ?auto_7942 ?auto_7960 ) ) ( not ( = ?auto_7942 ?auto_7957 ) ) ( not ( = ?auto_7963 ?auto_7961 ) ) ( not ( = ?auto_7963 ?auto_7951 ) ) ( not ( = ?auto_7963 ?auto_7962 ) ) ( not ( = ?auto_7956 ?auto_7952 ) ) ( not ( = ?auto_7956 ?auto_7953 ) ) ( not ( = ?auto_7956 ?auto_7958 ) ) ( not ( = ?auto_7950 ?auto_7959 ) ) ( not ( = ?auto_7950 ?auto_7954 ) ) ( not ( = ?auto_7950 ?auto_7955 ) ) ( not ( = ?auto_7950 ?auto_7960 ) ) ( not ( = ?auto_7950 ?auto_7957 ) ) ( not ( = ?auto_7936 ?auto_7943 ) ) ( not ( = ?auto_7936 ?auto_7947 ) ) ( not ( = ?auto_7937 ?auto_7943 ) ) ( not ( = ?auto_7937 ?auto_7947 ) ) ( not ( = ?auto_7938 ?auto_7943 ) ) ( not ( = ?auto_7938 ?auto_7947 ) ) ( not ( = ?auto_7939 ?auto_7943 ) ) ( not ( = ?auto_7939 ?auto_7947 ) ) ( not ( = ?auto_7940 ?auto_7943 ) ) ( not ( = ?auto_7940 ?auto_7947 ) ) ( not ( = ?auto_7941 ?auto_7943 ) ) ( not ( = ?auto_7941 ?auto_7947 ) ) ( not ( = ?auto_7943 ?auto_7950 ) ) ( not ( = ?auto_7943 ?auto_7959 ) ) ( not ( = ?auto_7943 ?auto_7954 ) ) ( not ( = ?auto_7943 ?auto_7955 ) ) ( not ( = ?auto_7943 ?auto_7960 ) ) ( not ( = ?auto_7943 ?auto_7957 ) ) ( not ( = ?auto_7945 ?auto_7963 ) ) ( not ( = ?auto_7945 ?auto_7961 ) ) ( not ( = ?auto_7945 ?auto_7951 ) ) ( not ( = ?auto_7945 ?auto_7962 ) ) ( not ( = ?auto_7948 ?auto_7956 ) ) ( not ( = ?auto_7948 ?auto_7952 ) ) ( not ( = ?auto_7948 ?auto_7953 ) ) ( not ( = ?auto_7948 ?auto_7958 ) ) ( not ( = ?auto_7947 ?auto_7950 ) ) ( not ( = ?auto_7947 ?auto_7959 ) ) ( not ( = ?auto_7947 ?auto_7954 ) ) ( not ( = ?auto_7947 ?auto_7955 ) ) ( not ( = ?auto_7947 ?auto_7960 ) ) ( not ( = ?auto_7947 ?auto_7957 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ?auto_7941 ?auto_7942 )
      ( MAKE-1CRATE ?auto_7942 ?auto_7943 )
      ( MAKE-7CRATE-VERIFY ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ?auto_7941 ?auto_7942 ?auto_7943 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7983 - SURFACE
      ?auto_7984 - SURFACE
      ?auto_7985 - SURFACE
      ?auto_7986 - SURFACE
      ?auto_7987 - SURFACE
      ?auto_7988 - SURFACE
      ?auto_7989 - SURFACE
      ?auto_7990 - SURFACE
      ?auto_7991 - SURFACE
    )
    :vars
    (
      ?auto_7994 - HOIST
      ?auto_7996 - PLACE
      ?auto_7997 - PLACE
      ?auto_7995 - HOIST
      ?auto_7993 - SURFACE
      ?auto_8003 - PLACE
      ?auto_8008 - HOIST
      ?auto_8011 - SURFACE
      ?auto_8012 - PLACE
      ?auto_8007 - HOIST
      ?auto_7999 - SURFACE
      ?auto_8004 - PLACE
      ?auto_8001 - HOIST
      ?auto_8013 - SURFACE
      ?auto_8014 - PLACE
      ?auto_7998 - HOIST
      ?auto_8005 - SURFACE
      ?auto_8000 - PLACE
      ?auto_8002 - HOIST
      ?auto_8006 - SURFACE
      ?auto_8010 - SURFACE
      ?auto_8009 - SURFACE
      ?auto_7992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7994 ?auto_7996 ) ( IS-CRATE ?auto_7991 ) ( not ( = ?auto_7997 ?auto_7996 ) ) ( HOIST-AT ?auto_7995 ?auto_7997 ) ( AVAILABLE ?auto_7995 ) ( SURFACE-AT ?auto_7991 ?auto_7997 ) ( ON ?auto_7991 ?auto_7993 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_7993 ) ) ( not ( = ?auto_7991 ?auto_7993 ) ) ( not ( = ?auto_7994 ?auto_7995 ) ) ( IS-CRATE ?auto_7990 ) ( not ( = ?auto_8003 ?auto_7996 ) ) ( HOIST-AT ?auto_8008 ?auto_8003 ) ( AVAILABLE ?auto_8008 ) ( SURFACE-AT ?auto_7990 ?auto_8003 ) ( ON ?auto_7990 ?auto_8011 ) ( CLEAR ?auto_7990 ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_8011 ) ) ( not ( = ?auto_7990 ?auto_8011 ) ) ( not ( = ?auto_7994 ?auto_8008 ) ) ( IS-CRATE ?auto_7989 ) ( not ( = ?auto_8012 ?auto_7996 ) ) ( HOIST-AT ?auto_8007 ?auto_8012 ) ( AVAILABLE ?auto_8007 ) ( SURFACE-AT ?auto_7989 ?auto_8012 ) ( ON ?auto_7989 ?auto_7999 ) ( CLEAR ?auto_7989 ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7988 ?auto_7999 ) ) ( not ( = ?auto_7989 ?auto_7999 ) ) ( not ( = ?auto_7994 ?auto_8007 ) ) ( IS-CRATE ?auto_7988 ) ( not ( = ?auto_8004 ?auto_7996 ) ) ( HOIST-AT ?auto_8001 ?auto_8004 ) ( SURFACE-AT ?auto_7988 ?auto_8004 ) ( ON ?auto_7988 ?auto_8013 ) ( CLEAR ?auto_7988 ) ( not ( = ?auto_7987 ?auto_7988 ) ) ( not ( = ?auto_7987 ?auto_8013 ) ) ( not ( = ?auto_7988 ?auto_8013 ) ) ( not ( = ?auto_7994 ?auto_8001 ) ) ( IS-CRATE ?auto_7987 ) ( not ( = ?auto_8014 ?auto_7996 ) ) ( HOIST-AT ?auto_7998 ?auto_8014 ) ( SURFACE-AT ?auto_7987 ?auto_8014 ) ( ON ?auto_7987 ?auto_8005 ) ( CLEAR ?auto_7987 ) ( not ( = ?auto_7986 ?auto_7987 ) ) ( not ( = ?auto_7986 ?auto_8005 ) ) ( not ( = ?auto_7987 ?auto_8005 ) ) ( not ( = ?auto_7994 ?auto_7998 ) ) ( IS-CRATE ?auto_7986 ) ( not ( = ?auto_8000 ?auto_7996 ) ) ( HOIST-AT ?auto_8002 ?auto_8000 ) ( AVAILABLE ?auto_8002 ) ( SURFACE-AT ?auto_7986 ?auto_8000 ) ( ON ?auto_7986 ?auto_8006 ) ( CLEAR ?auto_7986 ) ( not ( = ?auto_7985 ?auto_7986 ) ) ( not ( = ?auto_7985 ?auto_8006 ) ) ( not ( = ?auto_7986 ?auto_8006 ) ) ( not ( = ?auto_7994 ?auto_8002 ) ) ( IS-CRATE ?auto_7985 ) ( AVAILABLE ?auto_7998 ) ( SURFACE-AT ?auto_7985 ?auto_8014 ) ( ON ?auto_7985 ?auto_8010 ) ( CLEAR ?auto_7985 ) ( not ( = ?auto_7984 ?auto_7985 ) ) ( not ( = ?auto_7984 ?auto_8010 ) ) ( not ( = ?auto_7985 ?auto_8010 ) ) ( SURFACE-AT ?auto_7983 ?auto_7996 ) ( CLEAR ?auto_7983 ) ( IS-CRATE ?auto_7984 ) ( AVAILABLE ?auto_7994 ) ( AVAILABLE ?auto_8001 ) ( SURFACE-AT ?auto_7984 ?auto_8004 ) ( ON ?auto_7984 ?auto_8009 ) ( CLEAR ?auto_7984 ) ( TRUCK-AT ?auto_7992 ?auto_7996 ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( not ( = ?auto_7983 ?auto_8009 ) ) ( not ( = ?auto_7984 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7985 ) ) ( not ( = ?auto_7983 ?auto_8010 ) ) ( not ( = ?auto_7985 ?auto_8009 ) ) ( not ( = ?auto_8014 ?auto_8004 ) ) ( not ( = ?auto_7998 ?auto_8001 ) ) ( not ( = ?auto_8010 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7986 ) ) ( not ( = ?auto_7983 ?auto_8006 ) ) ( not ( = ?auto_7984 ?auto_7986 ) ) ( not ( = ?auto_7984 ?auto_8006 ) ) ( not ( = ?auto_7986 ?auto_8010 ) ) ( not ( = ?auto_7986 ?auto_8009 ) ) ( not ( = ?auto_8000 ?auto_8014 ) ) ( not ( = ?auto_8000 ?auto_8004 ) ) ( not ( = ?auto_8002 ?auto_7998 ) ) ( not ( = ?auto_8002 ?auto_8001 ) ) ( not ( = ?auto_8006 ?auto_8010 ) ) ( not ( = ?auto_8006 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7987 ) ) ( not ( = ?auto_7983 ?auto_8005 ) ) ( not ( = ?auto_7984 ?auto_7987 ) ) ( not ( = ?auto_7984 ?auto_8005 ) ) ( not ( = ?auto_7985 ?auto_7987 ) ) ( not ( = ?auto_7985 ?auto_8005 ) ) ( not ( = ?auto_7987 ?auto_8006 ) ) ( not ( = ?auto_7987 ?auto_8010 ) ) ( not ( = ?auto_7987 ?auto_8009 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8010 ) ) ( not ( = ?auto_8005 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7988 ) ) ( not ( = ?auto_7983 ?auto_8013 ) ) ( not ( = ?auto_7984 ?auto_7988 ) ) ( not ( = ?auto_7984 ?auto_8013 ) ) ( not ( = ?auto_7985 ?auto_7988 ) ) ( not ( = ?auto_7985 ?auto_8013 ) ) ( not ( = ?auto_7986 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_8013 ) ) ( not ( = ?auto_7988 ?auto_8005 ) ) ( not ( = ?auto_7988 ?auto_8006 ) ) ( not ( = ?auto_7988 ?auto_8010 ) ) ( not ( = ?auto_7988 ?auto_8009 ) ) ( not ( = ?auto_8013 ?auto_8005 ) ) ( not ( = ?auto_8013 ?auto_8006 ) ) ( not ( = ?auto_8013 ?auto_8010 ) ) ( not ( = ?auto_8013 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7989 ) ) ( not ( = ?auto_7983 ?auto_7999 ) ) ( not ( = ?auto_7984 ?auto_7989 ) ) ( not ( = ?auto_7984 ?auto_7999 ) ) ( not ( = ?auto_7985 ?auto_7989 ) ) ( not ( = ?auto_7985 ?auto_7999 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7986 ?auto_7999 ) ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7999 ) ) ( not ( = ?auto_7989 ?auto_8013 ) ) ( not ( = ?auto_7989 ?auto_8005 ) ) ( not ( = ?auto_7989 ?auto_8006 ) ) ( not ( = ?auto_7989 ?auto_8010 ) ) ( not ( = ?auto_7989 ?auto_8009 ) ) ( not ( = ?auto_8012 ?auto_8004 ) ) ( not ( = ?auto_8012 ?auto_8014 ) ) ( not ( = ?auto_8012 ?auto_8000 ) ) ( not ( = ?auto_8007 ?auto_8001 ) ) ( not ( = ?auto_8007 ?auto_7998 ) ) ( not ( = ?auto_8007 ?auto_8002 ) ) ( not ( = ?auto_7999 ?auto_8013 ) ) ( not ( = ?auto_7999 ?auto_8005 ) ) ( not ( = ?auto_7999 ?auto_8006 ) ) ( not ( = ?auto_7999 ?auto_8010 ) ) ( not ( = ?auto_7999 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7990 ) ) ( not ( = ?auto_7983 ?auto_8011 ) ) ( not ( = ?auto_7984 ?auto_7990 ) ) ( not ( = ?auto_7984 ?auto_8011 ) ) ( not ( = ?auto_7985 ?auto_7990 ) ) ( not ( = ?auto_7985 ?auto_8011 ) ) ( not ( = ?auto_7986 ?auto_7990 ) ) ( not ( = ?auto_7986 ?auto_8011 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_8011 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_8011 ) ) ( not ( = ?auto_7990 ?auto_7999 ) ) ( not ( = ?auto_7990 ?auto_8013 ) ) ( not ( = ?auto_7990 ?auto_8005 ) ) ( not ( = ?auto_7990 ?auto_8006 ) ) ( not ( = ?auto_7990 ?auto_8010 ) ) ( not ( = ?auto_7990 ?auto_8009 ) ) ( not ( = ?auto_8003 ?auto_8012 ) ) ( not ( = ?auto_8003 ?auto_8004 ) ) ( not ( = ?auto_8003 ?auto_8014 ) ) ( not ( = ?auto_8003 ?auto_8000 ) ) ( not ( = ?auto_8008 ?auto_8007 ) ) ( not ( = ?auto_8008 ?auto_8001 ) ) ( not ( = ?auto_8008 ?auto_7998 ) ) ( not ( = ?auto_8008 ?auto_8002 ) ) ( not ( = ?auto_8011 ?auto_7999 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( not ( = ?auto_8011 ?auto_8005 ) ) ( not ( = ?auto_8011 ?auto_8006 ) ) ( not ( = ?auto_8011 ?auto_8010 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( not ( = ?auto_7983 ?auto_7991 ) ) ( not ( = ?auto_7983 ?auto_7993 ) ) ( not ( = ?auto_7984 ?auto_7991 ) ) ( not ( = ?auto_7984 ?auto_7993 ) ) ( not ( = ?auto_7985 ?auto_7991 ) ) ( not ( = ?auto_7985 ?auto_7993 ) ) ( not ( = ?auto_7986 ?auto_7991 ) ) ( not ( = ?auto_7986 ?auto_7993 ) ) ( not ( = ?auto_7987 ?auto_7991 ) ) ( not ( = ?auto_7987 ?auto_7993 ) ) ( not ( = ?auto_7988 ?auto_7991 ) ) ( not ( = ?auto_7988 ?auto_7993 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_7993 ) ) ( not ( = ?auto_7991 ?auto_8011 ) ) ( not ( = ?auto_7991 ?auto_7999 ) ) ( not ( = ?auto_7991 ?auto_8013 ) ) ( not ( = ?auto_7991 ?auto_8005 ) ) ( not ( = ?auto_7991 ?auto_8006 ) ) ( not ( = ?auto_7991 ?auto_8010 ) ) ( not ( = ?auto_7991 ?auto_8009 ) ) ( not ( = ?auto_7997 ?auto_8003 ) ) ( not ( = ?auto_7997 ?auto_8012 ) ) ( not ( = ?auto_7997 ?auto_8004 ) ) ( not ( = ?auto_7997 ?auto_8014 ) ) ( not ( = ?auto_7997 ?auto_8000 ) ) ( not ( = ?auto_7995 ?auto_8008 ) ) ( not ( = ?auto_7995 ?auto_8007 ) ) ( not ( = ?auto_7995 ?auto_8001 ) ) ( not ( = ?auto_7995 ?auto_7998 ) ) ( not ( = ?auto_7995 ?auto_8002 ) ) ( not ( = ?auto_7993 ?auto_8011 ) ) ( not ( = ?auto_7993 ?auto_7999 ) ) ( not ( = ?auto_7993 ?auto_8013 ) ) ( not ( = ?auto_7993 ?auto_8005 ) ) ( not ( = ?auto_7993 ?auto_8006 ) ) ( not ( = ?auto_7993 ?auto_8010 ) ) ( not ( = ?auto_7993 ?auto_8009 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7983 ?auto_7984 ?auto_7985 ?auto_7986 ?auto_7987 ?auto_7988 ?auto_7989 ?auto_7990 )
      ( MAKE-1CRATE ?auto_7990 ?auto_7991 )
      ( MAKE-8CRATE-VERIFY ?auto_7983 ?auto_7984 ?auto_7985 ?auto_7986 ?auto_7987 ?auto_7988 ?auto_7989 ?auto_7990 ?auto_7991 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8035 - SURFACE
      ?auto_8036 - SURFACE
      ?auto_8037 - SURFACE
      ?auto_8038 - SURFACE
      ?auto_8039 - SURFACE
      ?auto_8040 - SURFACE
      ?auto_8041 - SURFACE
      ?auto_8042 - SURFACE
      ?auto_8043 - SURFACE
      ?auto_8044 - SURFACE
    )
    :vars
    (
      ?auto_8048 - HOIST
      ?auto_8050 - PLACE
      ?auto_8049 - PLACE
      ?auto_8045 - HOIST
      ?auto_8047 - SURFACE
      ?auto_8062 - PLACE
      ?auto_8063 - HOIST
      ?auto_8061 - SURFACE
      ?auto_8056 - PLACE
      ?auto_8058 - HOIST
      ?auto_8051 - SURFACE
      ?auto_8069 - PLACE
      ?auto_8052 - HOIST
      ?auto_8064 - SURFACE
      ?auto_8057 - PLACE
      ?auto_8060 - HOIST
      ?auto_8053 - SURFACE
      ?auto_8068 - PLACE
      ?auto_8067 - HOIST
      ?auto_8059 - SURFACE
      ?auto_8070 - PLACE
      ?auto_8066 - HOIST
      ?auto_8054 - SURFACE
      ?auto_8065 - SURFACE
      ?auto_8055 - SURFACE
      ?auto_8046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8048 ?auto_8050 ) ( IS-CRATE ?auto_8044 ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( HOIST-AT ?auto_8045 ?auto_8049 ) ( AVAILABLE ?auto_8045 ) ( SURFACE-AT ?auto_8044 ?auto_8049 ) ( ON ?auto_8044 ?auto_8047 ) ( CLEAR ?auto_8044 ) ( not ( = ?auto_8043 ?auto_8044 ) ) ( not ( = ?auto_8043 ?auto_8047 ) ) ( not ( = ?auto_8044 ?auto_8047 ) ) ( not ( = ?auto_8048 ?auto_8045 ) ) ( IS-CRATE ?auto_8043 ) ( not ( = ?auto_8062 ?auto_8050 ) ) ( HOIST-AT ?auto_8063 ?auto_8062 ) ( AVAILABLE ?auto_8063 ) ( SURFACE-AT ?auto_8043 ?auto_8062 ) ( ON ?auto_8043 ?auto_8061 ) ( CLEAR ?auto_8043 ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8061 ) ) ( not ( = ?auto_8043 ?auto_8061 ) ) ( not ( = ?auto_8048 ?auto_8063 ) ) ( IS-CRATE ?auto_8042 ) ( not ( = ?auto_8056 ?auto_8050 ) ) ( HOIST-AT ?auto_8058 ?auto_8056 ) ( AVAILABLE ?auto_8058 ) ( SURFACE-AT ?auto_8042 ?auto_8056 ) ( ON ?auto_8042 ?auto_8051 ) ( CLEAR ?auto_8042 ) ( not ( = ?auto_8041 ?auto_8042 ) ) ( not ( = ?auto_8041 ?auto_8051 ) ) ( not ( = ?auto_8042 ?auto_8051 ) ) ( not ( = ?auto_8048 ?auto_8058 ) ) ( IS-CRATE ?auto_8041 ) ( not ( = ?auto_8069 ?auto_8050 ) ) ( HOIST-AT ?auto_8052 ?auto_8069 ) ( AVAILABLE ?auto_8052 ) ( SURFACE-AT ?auto_8041 ?auto_8069 ) ( ON ?auto_8041 ?auto_8064 ) ( CLEAR ?auto_8041 ) ( not ( = ?auto_8040 ?auto_8041 ) ) ( not ( = ?auto_8040 ?auto_8064 ) ) ( not ( = ?auto_8041 ?auto_8064 ) ) ( not ( = ?auto_8048 ?auto_8052 ) ) ( IS-CRATE ?auto_8040 ) ( not ( = ?auto_8057 ?auto_8050 ) ) ( HOIST-AT ?auto_8060 ?auto_8057 ) ( SURFACE-AT ?auto_8040 ?auto_8057 ) ( ON ?auto_8040 ?auto_8053 ) ( CLEAR ?auto_8040 ) ( not ( = ?auto_8039 ?auto_8040 ) ) ( not ( = ?auto_8039 ?auto_8053 ) ) ( not ( = ?auto_8040 ?auto_8053 ) ) ( not ( = ?auto_8048 ?auto_8060 ) ) ( IS-CRATE ?auto_8039 ) ( not ( = ?auto_8068 ?auto_8050 ) ) ( HOIST-AT ?auto_8067 ?auto_8068 ) ( SURFACE-AT ?auto_8039 ?auto_8068 ) ( ON ?auto_8039 ?auto_8059 ) ( CLEAR ?auto_8039 ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8059 ) ) ( not ( = ?auto_8039 ?auto_8059 ) ) ( not ( = ?auto_8048 ?auto_8067 ) ) ( IS-CRATE ?auto_8038 ) ( not ( = ?auto_8070 ?auto_8050 ) ) ( HOIST-AT ?auto_8066 ?auto_8070 ) ( AVAILABLE ?auto_8066 ) ( SURFACE-AT ?auto_8038 ?auto_8070 ) ( ON ?auto_8038 ?auto_8054 ) ( CLEAR ?auto_8038 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8054 ) ) ( not ( = ?auto_8038 ?auto_8054 ) ) ( not ( = ?auto_8048 ?auto_8066 ) ) ( IS-CRATE ?auto_8037 ) ( AVAILABLE ?auto_8067 ) ( SURFACE-AT ?auto_8037 ?auto_8068 ) ( ON ?auto_8037 ?auto_8065 ) ( CLEAR ?auto_8037 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8065 ) ) ( not ( = ?auto_8037 ?auto_8065 ) ) ( SURFACE-AT ?auto_8035 ?auto_8050 ) ( CLEAR ?auto_8035 ) ( IS-CRATE ?auto_8036 ) ( AVAILABLE ?auto_8048 ) ( AVAILABLE ?auto_8060 ) ( SURFACE-AT ?auto_8036 ?auto_8057 ) ( ON ?auto_8036 ?auto_8055 ) ( CLEAR ?auto_8036 ) ( TRUCK-AT ?auto_8046 ?auto_8050 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8055 ) ) ( not ( = ?auto_8036 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8065 ) ) ( not ( = ?auto_8037 ?auto_8055 ) ) ( not ( = ?auto_8068 ?auto_8057 ) ) ( not ( = ?auto_8067 ?auto_8060 ) ) ( not ( = ?auto_8065 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8054 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8054 ) ) ( not ( = ?auto_8038 ?auto_8065 ) ) ( not ( = ?auto_8038 ?auto_8055 ) ) ( not ( = ?auto_8070 ?auto_8068 ) ) ( not ( = ?auto_8070 ?auto_8057 ) ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8060 ) ) ( not ( = ?auto_8054 ?auto_8065 ) ) ( not ( = ?auto_8054 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8035 ?auto_8059 ) ) ( not ( = ?auto_8036 ?auto_8039 ) ) ( not ( = ?auto_8036 ?auto_8059 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8059 ) ) ( not ( = ?auto_8039 ?auto_8054 ) ) ( not ( = ?auto_8039 ?auto_8065 ) ) ( not ( = ?auto_8039 ?auto_8055 ) ) ( not ( = ?auto_8059 ?auto_8054 ) ) ( not ( = ?auto_8059 ?auto_8065 ) ) ( not ( = ?auto_8059 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8040 ) ) ( not ( = ?auto_8035 ?auto_8053 ) ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( not ( = ?auto_8036 ?auto_8053 ) ) ( not ( = ?auto_8037 ?auto_8040 ) ) ( not ( = ?auto_8037 ?auto_8053 ) ) ( not ( = ?auto_8038 ?auto_8040 ) ) ( not ( = ?auto_8038 ?auto_8053 ) ) ( not ( = ?auto_8040 ?auto_8059 ) ) ( not ( = ?auto_8040 ?auto_8054 ) ) ( not ( = ?auto_8040 ?auto_8065 ) ) ( not ( = ?auto_8040 ?auto_8055 ) ) ( not ( = ?auto_8053 ?auto_8059 ) ) ( not ( = ?auto_8053 ?auto_8054 ) ) ( not ( = ?auto_8053 ?auto_8065 ) ) ( not ( = ?auto_8053 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8041 ) ) ( not ( = ?auto_8035 ?auto_8064 ) ) ( not ( = ?auto_8036 ?auto_8041 ) ) ( not ( = ?auto_8036 ?auto_8064 ) ) ( not ( = ?auto_8037 ?auto_8041 ) ) ( not ( = ?auto_8037 ?auto_8064 ) ) ( not ( = ?auto_8038 ?auto_8041 ) ) ( not ( = ?auto_8038 ?auto_8064 ) ) ( not ( = ?auto_8039 ?auto_8041 ) ) ( not ( = ?auto_8039 ?auto_8064 ) ) ( not ( = ?auto_8041 ?auto_8053 ) ) ( not ( = ?auto_8041 ?auto_8059 ) ) ( not ( = ?auto_8041 ?auto_8054 ) ) ( not ( = ?auto_8041 ?auto_8065 ) ) ( not ( = ?auto_8041 ?auto_8055 ) ) ( not ( = ?auto_8069 ?auto_8057 ) ) ( not ( = ?auto_8069 ?auto_8068 ) ) ( not ( = ?auto_8069 ?auto_8070 ) ) ( not ( = ?auto_8052 ?auto_8060 ) ) ( not ( = ?auto_8052 ?auto_8067 ) ) ( not ( = ?auto_8052 ?auto_8066 ) ) ( not ( = ?auto_8064 ?auto_8053 ) ) ( not ( = ?auto_8064 ?auto_8059 ) ) ( not ( = ?auto_8064 ?auto_8054 ) ) ( not ( = ?auto_8064 ?auto_8065 ) ) ( not ( = ?auto_8064 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8042 ) ) ( not ( = ?auto_8035 ?auto_8051 ) ) ( not ( = ?auto_8036 ?auto_8042 ) ) ( not ( = ?auto_8036 ?auto_8051 ) ) ( not ( = ?auto_8037 ?auto_8042 ) ) ( not ( = ?auto_8037 ?auto_8051 ) ) ( not ( = ?auto_8038 ?auto_8042 ) ) ( not ( = ?auto_8038 ?auto_8051 ) ) ( not ( = ?auto_8039 ?auto_8042 ) ) ( not ( = ?auto_8039 ?auto_8051 ) ) ( not ( = ?auto_8040 ?auto_8042 ) ) ( not ( = ?auto_8040 ?auto_8051 ) ) ( not ( = ?auto_8042 ?auto_8064 ) ) ( not ( = ?auto_8042 ?auto_8053 ) ) ( not ( = ?auto_8042 ?auto_8059 ) ) ( not ( = ?auto_8042 ?auto_8054 ) ) ( not ( = ?auto_8042 ?auto_8065 ) ) ( not ( = ?auto_8042 ?auto_8055 ) ) ( not ( = ?auto_8056 ?auto_8069 ) ) ( not ( = ?auto_8056 ?auto_8057 ) ) ( not ( = ?auto_8056 ?auto_8068 ) ) ( not ( = ?auto_8056 ?auto_8070 ) ) ( not ( = ?auto_8058 ?auto_8052 ) ) ( not ( = ?auto_8058 ?auto_8060 ) ) ( not ( = ?auto_8058 ?auto_8067 ) ) ( not ( = ?auto_8058 ?auto_8066 ) ) ( not ( = ?auto_8051 ?auto_8064 ) ) ( not ( = ?auto_8051 ?auto_8053 ) ) ( not ( = ?auto_8051 ?auto_8059 ) ) ( not ( = ?auto_8051 ?auto_8054 ) ) ( not ( = ?auto_8051 ?auto_8065 ) ) ( not ( = ?auto_8051 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8043 ) ) ( not ( = ?auto_8035 ?auto_8061 ) ) ( not ( = ?auto_8036 ?auto_8043 ) ) ( not ( = ?auto_8036 ?auto_8061 ) ) ( not ( = ?auto_8037 ?auto_8043 ) ) ( not ( = ?auto_8037 ?auto_8061 ) ) ( not ( = ?auto_8038 ?auto_8043 ) ) ( not ( = ?auto_8038 ?auto_8061 ) ) ( not ( = ?auto_8039 ?auto_8043 ) ) ( not ( = ?auto_8039 ?auto_8061 ) ) ( not ( = ?auto_8040 ?auto_8043 ) ) ( not ( = ?auto_8040 ?auto_8061 ) ) ( not ( = ?auto_8041 ?auto_8043 ) ) ( not ( = ?auto_8041 ?auto_8061 ) ) ( not ( = ?auto_8043 ?auto_8051 ) ) ( not ( = ?auto_8043 ?auto_8064 ) ) ( not ( = ?auto_8043 ?auto_8053 ) ) ( not ( = ?auto_8043 ?auto_8059 ) ) ( not ( = ?auto_8043 ?auto_8054 ) ) ( not ( = ?auto_8043 ?auto_8065 ) ) ( not ( = ?auto_8043 ?auto_8055 ) ) ( not ( = ?auto_8062 ?auto_8056 ) ) ( not ( = ?auto_8062 ?auto_8069 ) ) ( not ( = ?auto_8062 ?auto_8057 ) ) ( not ( = ?auto_8062 ?auto_8068 ) ) ( not ( = ?auto_8062 ?auto_8070 ) ) ( not ( = ?auto_8063 ?auto_8058 ) ) ( not ( = ?auto_8063 ?auto_8052 ) ) ( not ( = ?auto_8063 ?auto_8060 ) ) ( not ( = ?auto_8063 ?auto_8067 ) ) ( not ( = ?auto_8063 ?auto_8066 ) ) ( not ( = ?auto_8061 ?auto_8051 ) ) ( not ( = ?auto_8061 ?auto_8064 ) ) ( not ( = ?auto_8061 ?auto_8053 ) ) ( not ( = ?auto_8061 ?auto_8059 ) ) ( not ( = ?auto_8061 ?auto_8054 ) ) ( not ( = ?auto_8061 ?auto_8065 ) ) ( not ( = ?auto_8061 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8044 ) ) ( not ( = ?auto_8035 ?auto_8047 ) ) ( not ( = ?auto_8036 ?auto_8044 ) ) ( not ( = ?auto_8036 ?auto_8047 ) ) ( not ( = ?auto_8037 ?auto_8044 ) ) ( not ( = ?auto_8037 ?auto_8047 ) ) ( not ( = ?auto_8038 ?auto_8044 ) ) ( not ( = ?auto_8038 ?auto_8047 ) ) ( not ( = ?auto_8039 ?auto_8044 ) ) ( not ( = ?auto_8039 ?auto_8047 ) ) ( not ( = ?auto_8040 ?auto_8044 ) ) ( not ( = ?auto_8040 ?auto_8047 ) ) ( not ( = ?auto_8041 ?auto_8044 ) ) ( not ( = ?auto_8041 ?auto_8047 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8047 ) ) ( not ( = ?auto_8044 ?auto_8061 ) ) ( not ( = ?auto_8044 ?auto_8051 ) ) ( not ( = ?auto_8044 ?auto_8064 ) ) ( not ( = ?auto_8044 ?auto_8053 ) ) ( not ( = ?auto_8044 ?auto_8059 ) ) ( not ( = ?auto_8044 ?auto_8054 ) ) ( not ( = ?auto_8044 ?auto_8065 ) ) ( not ( = ?auto_8044 ?auto_8055 ) ) ( not ( = ?auto_8049 ?auto_8062 ) ) ( not ( = ?auto_8049 ?auto_8056 ) ) ( not ( = ?auto_8049 ?auto_8069 ) ) ( not ( = ?auto_8049 ?auto_8057 ) ) ( not ( = ?auto_8049 ?auto_8068 ) ) ( not ( = ?auto_8049 ?auto_8070 ) ) ( not ( = ?auto_8045 ?auto_8063 ) ) ( not ( = ?auto_8045 ?auto_8058 ) ) ( not ( = ?auto_8045 ?auto_8052 ) ) ( not ( = ?auto_8045 ?auto_8060 ) ) ( not ( = ?auto_8045 ?auto_8067 ) ) ( not ( = ?auto_8045 ?auto_8066 ) ) ( not ( = ?auto_8047 ?auto_8061 ) ) ( not ( = ?auto_8047 ?auto_8051 ) ) ( not ( = ?auto_8047 ?auto_8064 ) ) ( not ( = ?auto_8047 ?auto_8053 ) ) ( not ( = ?auto_8047 ?auto_8059 ) ) ( not ( = ?auto_8047 ?auto_8054 ) ) ( not ( = ?auto_8047 ?auto_8065 ) ) ( not ( = ?auto_8047 ?auto_8055 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ?auto_8040 ?auto_8041 ?auto_8042 ?auto_8043 )
      ( MAKE-1CRATE ?auto_8043 ?auto_8044 )
      ( MAKE-9CRATE-VERIFY ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ?auto_8040 ?auto_8041 ?auto_8042 ?auto_8043 ?auto_8044 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8092 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8094 - SURFACE
      ?auto_8095 - SURFACE
      ?auto_8096 - SURFACE
      ?auto_8097 - SURFACE
      ?auto_8098 - SURFACE
      ?auto_8099 - SURFACE
      ?auto_8100 - SURFACE
      ?auto_8101 - SURFACE
      ?auto_8102 - SURFACE
    )
    :vars
    (
      ?auto_8103 - HOIST
      ?auto_8104 - PLACE
      ?auto_8106 - PLACE
      ?auto_8108 - HOIST
      ?auto_8107 - SURFACE
      ?auto_8113 - PLACE
      ?auto_8131 - HOIST
      ?auto_8109 - SURFACE
      ?auto_8118 - PLACE
      ?auto_8111 - HOIST
      ?auto_8121 - SURFACE
      ?auto_8112 - PLACE
      ?auto_8127 - HOIST
      ?auto_8124 - SURFACE
      ?auto_8128 - PLACE
      ?auto_8125 - HOIST
      ?auto_8110 - SURFACE
      ?auto_8120 - PLACE
      ?auto_8119 - HOIST
      ?auto_8116 - SURFACE
      ?auto_8129 - PLACE
      ?auto_8130 - HOIST
      ?auto_8123 - SURFACE
      ?auto_8114 - PLACE
      ?auto_8117 - HOIST
      ?auto_8115 - SURFACE
      ?auto_8126 - SURFACE
      ?auto_8122 - SURFACE
      ?auto_8105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8103 ?auto_8104 ) ( IS-CRATE ?auto_8102 ) ( not ( = ?auto_8106 ?auto_8104 ) ) ( HOIST-AT ?auto_8108 ?auto_8106 ) ( AVAILABLE ?auto_8108 ) ( SURFACE-AT ?auto_8102 ?auto_8106 ) ( ON ?auto_8102 ?auto_8107 ) ( CLEAR ?auto_8102 ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( not ( = ?auto_8101 ?auto_8107 ) ) ( not ( = ?auto_8102 ?auto_8107 ) ) ( not ( = ?auto_8103 ?auto_8108 ) ) ( IS-CRATE ?auto_8101 ) ( not ( = ?auto_8113 ?auto_8104 ) ) ( HOIST-AT ?auto_8131 ?auto_8113 ) ( AVAILABLE ?auto_8131 ) ( SURFACE-AT ?auto_8101 ?auto_8113 ) ( ON ?auto_8101 ?auto_8109 ) ( CLEAR ?auto_8101 ) ( not ( = ?auto_8100 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8109 ) ) ( not ( = ?auto_8101 ?auto_8109 ) ) ( not ( = ?auto_8103 ?auto_8131 ) ) ( IS-CRATE ?auto_8100 ) ( not ( = ?auto_8118 ?auto_8104 ) ) ( HOIST-AT ?auto_8111 ?auto_8118 ) ( AVAILABLE ?auto_8111 ) ( SURFACE-AT ?auto_8100 ?auto_8118 ) ( ON ?auto_8100 ?auto_8121 ) ( CLEAR ?auto_8100 ) ( not ( = ?auto_8099 ?auto_8100 ) ) ( not ( = ?auto_8099 ?auto_8121 ) ) ( not ( = ?auto_8100 ?auto_8121 ) ) ( not ( = ?auto_8103 ?auto_8111 ) ) ( IS-CRATE ?auto_8099 ) ( not ( = ?auto_8112 ?auto_8104 ) ) ( HOIST-AT ?auto_8127 ?auto_8112 ) ( AVAILABLE ?auto_8127 ) ( SURFACE-AT ?auto_8099 ?auto_8112 ) ( ON ?auto_8099 ?auto_8124 ) ( CLEAR ?auto_8099 ) ( not ( = ?auto_8098 ?auto_8099 ) ) ( not ( = ?auto_8098 ?auto_8124 ) ) ( not ( = ?auto_8099 ?auto_8124 ) ) ( not ( = ?auto_8103 ?auto_8127 ) ) ( IS-CRATE ?auto_8098 ) ( not ( = ?auto_8128 ?auto_8104 ) ) ( HOIST-AT ?auto_8125 ?auto_8128 ) ( AVAILABLE ?auto_8125 ) ( SURFACE-AT ?auto_8098 ?auto_8128 ) ( ON ?auto_8098 ?auto_8110 ) ( CLEAR ?auto_8098 ) ( not ( = ?auto_8097 ?auto_8098 ) ) ( not ( = ?auto_8097 ?auto_8110 ) ) ( not ( = ?auto_8098 ?auto_8110 ) ) ( not ( = ?auto_8103 ?auto_8125 ) ) ( IS-CRATE ?auto_8097 ) ( not ( = ?auto_8120 ?auto_8104 ) ) ( HOIST-AT ?auto_8119 ?auto_8120 ) ( SURFACE-AT ?auto_8097 ?auto_8120 ) ( ON ?auto_8097 ?auto_8116 ) ( CLEAR ?auto_8097 ) ( not ( = ?auto_8096 ?auto_8097 ) ) ( not ( = ?auto_8096 ?auto_8116 ) ) ( not ( = ?auto_8097 ?auto_8116 ) ) ( not ( = ?auto_8103 ?auto_8119 ) ) ( IS-CRATE ?auto_8096 ) ( not ( = ?auto_8129 ?auto_8104 ) ) ( HOIST-AT ?auto_8130 ?auto_8129 ) ( SURFACE-AT ?auto_8096 ?auto_8129 ) ( ON ?auto_8096 ?auto_8123 ) ( CLEAR ?auto_8096 ) ( not ( = ?auto_8095 ?auto_8096 ) ) ( not ( = ?auto_8095 ?auto_8123 ) ) ( not ( = ?auto_8096 ?auto_8123 ) ) ( not ( = ?auto_8103 ?auto_8130 ) ) ( IS-CRATE ?auto_8095 ) ( not ( = ?auto_8114 ?auto_8104 ) ) ( HOIST-AT ?auto_8117 ?auto_8114 ) ( AVAILABLE ?auto_8117 ) ( SURFACE-AT ?auto_8095 ?auto_8114 ) ( ON ?auto_8095 ?auto_8115 ) ( CLEAR ?auto_8095 ) ( not ( = ?auto_8094 ?auto_8095 ) ) ( not ( = ?auto_8094 ?auto_8115 ) ) ( not ( = ?auto_8095 ?auto_8115 ) ) ( not ( = ?auto_8103 ?auto_8117 ) ) ( IS-CRATE ?auto_8094 ) ( AVAILABLE ?auto_8130 ) ( SURFACE-AT ?auto_8094 ?auto_8129 ) ( ON ?auto_8094 ?auto_8126 ) ( CLEAR ?auto_8094 ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8093 ?auto_8126 ) ) ( not ( = ?auto_8094 ?auto_8126 ) ) ( SURFACE-AT ?auto_8092 ?auto_8104 ) ( CLEAR ?auto_8092 ) ( IS-CRATE ?auto_8093 ) ( AVAILABLE ?auto_8103 ) ( AVAILABLE ?auto_8119 ) ( SURFACE-AT ?auto_8093 ?auto_8120 ) ( ON ?auto_8093 ?auto_8122 ) ( CLEAR ?auto_8093 ) ( TRUCK-AT ?auto_8105 ?auto_8104 ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8122 ) ) ( not ( = ?auto_8093 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8092 ?auto_8126 ) ) ( not ( = ?auto_8094 ?auto_8122 ) ) ( not ( = ?auto_8129 ?auto_8120 ) ) ( not ( = ?auto_8130 ?auto_8119 ) ) ( not ( = ?auto_8126 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8095 ) ) ( not ( = ?auto_8092 ?auto_8115 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8115 ) ) ( not ( = ?auto_8095 ?auto_8126 ) ) ( not ( = ?auto_8095 ?auto_8122 ) ) ( not ( = ?auto_8114 ?auto_8129 ) ) ( not ( = ?auto_8114 ?auto_8120 ) ) ( not ( = ?auto_8117 ?auto_8130 ) ) ( not ( = ?auto_8117 ?auto_8119 ) ) ( not ( = ?auto_8115 ?auto_8126 ) ) ( not ( = ?auto_8115 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8096 ) ) ( not ( = ?auto_8092 ?auto_8123 ) ) ( not ( = ?auto_8093 ?auto_8096 ) ) ( not ( = ?auto_8093 ?auto_8123 ) ) ( not ( = ?auto_8094 ?auto_8096 ) ) ( not ( = ?auto_8094 ?auto_8123 ) ) ( not ( = ?auto_8096 ?auto_8115 ) ) ( not ( = ?auto_8096 ?auto_8126 ) ) ( not ( = ?auto_8096 ?auto_8122 ) ) ( not ( = ?auto_8123 ?auto_8115 ) ) ( not ( = ?auto_8123 ?auto_8126 ) ) ( not ( = ?auto_8123 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8097 ) ) ( not ( = ?auto_8092 ?auto_8116 ) ) ( not ( = ?auto_8093 ?auto_8097 ) ) ( not ( = ?auto_8093 ?auto_8116 ) ) ( not ( = ?auto_8094 ?auto_8097 ) ) ( not ( = ?auto_8094 ?auto_8116 ) ) ( not ( = ?auto_8095 ?auto_8097 ) ) ( not ( = ?auto_8095 ?auto_8116 ) ) ( not ( = ?auto_8097 ?auto_8123 ) ) ( not ( = ?auto_8097 ?auto_8115 ) ) ( not ( = ?auto_8097 ?auto_8126 ) ) ( not ( = ?auto_8097 ?auto_8122 ) ) ( not ( = ?auto_8116 ?auto_8123 ) ) ( not ( = ?auto_8116 ?auto_8115 ) ) ( not ( = ?auto_8116 ?auto_8126 ) ) ( not ( = ?auto_8116 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8098 ) ) ( not ( = ?auto_8092 ?auto_8110 ) ) ( not ( = ?auto_8093 ?auto_8098 ) ) ( not ( = ?auto_8093 ?auto_8110 ) ) ( not ( = ?auto_8094 ?auto_8098 ) ) ( not ( = ?auto_8094 ?auto_8110 ) ) ( not ( = ?auto_8095 ?auto_8098 ) ) ( not ( = ?auto_8095 ?auto_8110 ) ) ( not ( = ?auto_8096 ?auto_8098 ) ) ( not ( = ?auto_8096 ?auto_8110 ) ) ( not ( = ?auto_8098 ?auto_8116 ) ) ( not ( = ?auto_8098 ?auto_8123 ) ) ( not ( = ?auto_8098 ?auto_8115 ) ) ( not ( = ?auto_8098 ?auto_8126 ) ) ( not ( = ?auto_8098 ?auto_8122 ) ) ( not ( = ?auto_8128 ?auto_8120 ) ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( not ( = ?auto_8128 ?auto_8114 ) ) ( not ( = ?auto_8125 ?auto_8119 ) ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( not ( = ?auto_8125 ?auto_8117 ) ) ( not ( = ?auto_8110 ?auto_8116 ) ) ( not ( = ?auto_8110 ?auto_8123 ) ) ( not ( = ?auto_8110 ?auto_8115 ) ) ( not ( = ?auto_8110 ?auto_8126 ) ) ( not ( = ?auto_8110 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8099 ) ) ( not ( = ?auto_8092 ?auto_8124 ) ) ( not ( = ?auto_8093 ?auto_8099 ) ) ( not ( = ?auto_8093 ?auto_8124 ) ) ( not ( = ?auto_8094 ?auto_8099 ) ) ( not ( = ?auto_8094 ?auto_8124 ) ) ( not ( = ?auto_8095 ?auto_8099 ) ) ( not ( = ?auto_8095 ?auto_8124 ) ) ( not ( = ?auto_8096 ?auto_8099 ) ) ( not ( = ?auto_8096 ?auto_8124 ) ) ( not ( = ?auto_8097 ?auto_8099 ) ) ( not ( = ?auto_8097 ?auto_8124 ) ) ( not ( = ?auto_8099 ?auto_8110 ) ) ( not ( = ?auto_8099 ?auto_8116 ) ) ( not ( = ?auto_8099 ?auto_8123 ) ) ( not ( = ?auto_8099 ?auto_8115 ) ) ( not ( = ?auto_8099 ?auto_8126 ) ) ( not ( = ?auto_8099 ?auto_8122 ) ) ( not ( = ?auto_8112 ?auto_8128 ) ) ( not ( = ?auto_8112 ?auto_8120 ) ) ( not ( = ?auto_8112 ?auto_8129 ) ) ( not ( = ?auto_8112 ?auto_8114 ) ) ( not ( = ?auto_8127 ?auto_8125 ) ) ( not ( = ?auto_8127 ?auto_8119 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8127 ?auto_8117 ) ) ( not ( = ?auto_8124 ?auto_8110 ) ) ( not ( = ?auto_8124 ?auto_8116 ) ) ( not ( = ?auto_8124 ?auto_8123 ) ) ( not ( = ?auto_8124 ?auto_8115 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8100 ) ) ( not ( = ?auto_8092 ?auto_8121 ) ) ( not ( = ?auto_8093 ?auto_8100 ) ) ( not ( = ?auto_8093 ?auto_8121 ) ) ( not ( = ?auto_8094 ?auto_8100 ) ) ( not ( = ?auto_8094 ?auto_8121 ) ) ( not ( = ?auto_8095 ?auto_8100 ) ) ( not ( = ?auto_8095 ?auto_8121 ) ) ( not ( = ?auto_8096 ?auto_8100 ) ) ( not ( = ?auto_8096 ?auto_8121 ) ) ( not ( = ?auto_8097 ?auto_8100 ) ) ( not ( = ?auto_8097 ?auto_8121 ) ) ( not ( = ?auto_8098 ?auto_8100 ) ) ( not ( = ?auto_8098 ?auto_8121 ) ) ( not ( = ?auto_8100 ?auto_8124 ) ) ( not ( = ?auto_8100 ?auto_8110 ) ) ( not ( = ?auto_8100 ?auto_8116 ) ) ( not ( = ?auto_8100 ?auto_8123 ) ) ( not ( = ?auto_8100 ?auto_8115 ) ) ( not ( = ?auto_8100 ?auto_8126 ) ) ( not ( = ?auto_8100 ?auto_8122 ) ) ( not ( = ?auto_8118 ?auto_8112 ) ) ( not ( = ?auto_8118 ?auto_8128 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8129 ) ) ( not ( = ?auto_8118 ?auto_8114 ) ) ( not ( = ?auto_8111 ?auto_8127 ) ) ( not ( = ?auto_8111 ?auto_8125 ) ) ( not ( = ?auto_8111 ?auto_8119 ) ) ( not ( = ?auto_8111 ?auto_8130 ) ) ( not ( = ?auto_8111 ?auto_8117 ) ) ( not ( = ?auto_8121 ?auto_8124 ) ) ( not ( = ?auto_8121 ?auto_8110 ) ) ( not ( = ?auto_8121 ?auto_8116 ) ) ( not ( = ?auto_8121 ?auto_8123 ) ) ( not ( = ?auto_8121 ?auto_8115 ) ) ( not ( = ?auto_8121 ?auto_8126 ) ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8101 ) ) ( not ( = ?auto_8092 ?auto_8109 ) ) ( not ( = ?auto_8093 ?auto_8101 ) ) ( not ( = ?auto_8093 ?auto_8109 ) ) ( not ( = ?auto_8094 ?auto_8101 ) ) ( not ( = ?auto_8094 ?auto_8109 ) ) ( not ( = ?auto_8095 ?auto_8101 ) ) ( not ( = ?auto_8095 ?auto_8109 ) ) ( not ( = ?auto_8096 ?auto_8101 ) ) ( not ( = ?auto_8096 ?auto_8109 ) ) ( not ( = ?auto_8097 ?auto_8101 ) ) ( not ( = ?auto_8097 ?auto_8109 ) ) ( not ( = ?auto_8098 ?auto_8101 ) ) ( not ( = ?auto_8098 ?auto_8109 ) ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8099 ?auto_8109 ) ) ( not ( = ?auto_8101 ?auto_8121 ) ) ( not ( = ?auto_8101 ?auto_8124 ) ) ( not ( = ?auto_8101 ?auto_8110 ) ) ( not ( = ?auto_8101 ?auto_8116 ) ) ( not ( = ?auto_8101 ?auto_8123 ) ) ( not ( = ?auto_8101 ?auto_8115 ) ) ( not ( = ?auto_8101 ?auto_8126 ) ) ( not ( = ?auto_8101 ?auto_8122 ) ) ( not ( = ?auto_8113 ?auto_8118 ) ) ( not ( = ?auto_8113 ?auto_8112 ) ) ( not ( = ?auto_8113 ?auto_8128 ) ) ( not ( = ?auto_8113 ?auto_8120 ) ) ( not ( = ?auto_8113 ?auto_8129 ) ) ( not ( = ?auto_8113 ?auto_8114 ) ) ( not ( = ?auto_8131 ?auto_8111 ) ) ( not ( = ?auto_8131 ?auto_8127 ) ) ( not ( = ?auto_8131 ?auto_8125 ) ) ( not ( = ?auto_8131 ?auto_8119 ) ) ( not ( = ?auto_8131 ?auto_8130 ) ) ( not ( = ?auto_8131 ?auto_8117 ) ) ( not ( = ?auto_8109 ?auto_8121 ) ) ( not ( = ?auto_8109 ?auto_8124 ) ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8109 ?auto_8116 ) ) ( not ( = ?auto_8109 ?auto_8123 ) ) ( not ( = ?auto_8109 ?auto_8115 ) ) ( not ( = ?auto_8109 ?auto_8126 ) ) ( not ( = ?auto_8109 ?auto_8122 ) ) ( not ( = ?auto_8092 ?auto_8102 ) ) ( not ( = ?auto_8092 ?auto_8107 ) ) ( not ( = ?auto_8093 ?auto_8102 ) ) ( not ( = ?auto_8093 ?auto_8107 ) ) ( not ( = ?auto_8094 ?auto_8102 ) ) ( not ( = ?auto_8094 ?auto_8107 ) ) ( not ( = ?auto_8095 ?auto_8102 ) ) ( not ( = ?auto_8095 ?auto_8107 ) ) ( not ( = ?auto_8096 ?auto_8102 ) ) ( not ( = ?auto_8096 ?auto_8107 ) ) ( not ( = ?auto_8097 ?auto_8102 ) ) ( not ( = ?auto_8097 ?auto_8107 ) ) ( not ( = ?auto_8098 ?auto_8102 ) ) ( not ( = ?auto_8098 ?auto_8107 ) ) ( not ( = ?auto_8099 ?auto_8102 ) ) ( not ( = ?auto_8099 ?auto_8107 ) ) ( not ( = ?auto_8100 ?auto_8102 ) ) ( not ( = ?auto_8100 ?auto_8107 ) ) ( not ( = ?auto_8102 ?auto_8109 ) ) ( not ( = ?auto_8102 ?auto_8121 ) ) ( not ( = ?auto_8102 ?auto_8124 ) ) ( not ( = ?auto_8102 ?auto_8110 ) ) ( not ( = ?auto_8102 ?auto_8116 ) ) ( not ( = ?auto_8102 ?auto_8123 ) ) ( not ( = ?auto_8102 ?auto_8115 ) ) ( not ( = ?auto_8102 ?auto_8126 ) ) ( not ( = ?auto_8102 ?auto_8122 ) ) ( not ( = ?auto_8106 ?auto_8113 ) ) ( not ( = ?auto_8106 ?auto_8118 ) ) ( not ( = ?auto_8106 ?auto_8112 ) ) ( not ( = ?auto_8106 ?auto_8128 ) ) ( not ( = ?auto_8106 ?auto_8120 ) ) ( not ( = ?auto_8106 ?auto_8129 ) ) ( not ( = ?auto_8106 ?auto_8114 ) ) ( not ( = ?auto_8108 ?auto_8131 ) ) ( not ( = ?auto_8108 ?auto_8111 ) ) ( not ( = ?auto_8108 ?auto_8127 ) ) ( not ( = ?auto_8108 ?auto_8125 ) ) ( not ( = ?auto_8108 ?auto_8119 ) ) ( not ( = ?auto_8108 ?auto_8130 ) ) ( not ( = ?auto_8108 ?auto_8117 ) ) ( not ( = ?auto_8107 ?auto_8109 ) ) ( not ( = ?auto_8107 ?auto_8121 ) ) ( not ( = ?auto_8107 ?auto_8124 ) ) ( not ( = ?auto_8107 ?auto_8110 ) ) ( not ( = ?auto_8107 ?auto_8116 ) ) ( not ( = ?auto_8107 ?auto_8123 ) ) ( not ( = ?auto_8107 ?auto_8115 ) ) ( not ( = ?auto_8107 ?auto_8126 ) ) ( not ( = ?auto_8107 ?auto_8122 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8092 ?auto_8093 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8097 ?auto_8098 ?auto_8099 ?auto_8100 ?auto_8101 )
      ( MAKE-1CRATE ?auto_8101 ?auto_8102 )
      ( MAKE-10CRATE-VERIFY ?auto_8092 ?auto_8093 ?auto_8094 ?auto_8095 ?auto_8096 ?auto_8097 ?auto_8098 ?auto_8099 ?auto_8100 ?auto_8101 ?auto_8102 ) )
  )

)

