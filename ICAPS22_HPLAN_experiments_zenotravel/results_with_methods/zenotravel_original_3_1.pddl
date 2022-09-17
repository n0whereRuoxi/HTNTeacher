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

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7600 - PERSON
      ?auto_7599 - CITY
    )
    :vars
    (
      ?auto_7601 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7600 ?auto_7601 ) ( AIRCRAFT-AT ?auto_7601 ?auto_7599 ) )
    :subtasks
    ( ( !DEBARK ?auto_7600 ?auto_7601 ?auto_7599 )
      ( FLY-1PPL-VERIFY ?auto_7600 ?auto_7599 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7612 - PERSON
      ?auto_7611 - CITY
    )
    :vars
    (
      ?auto_7613 - AIRCRAFT
      ?auto_7616 - CITY
      ?auto_7614 - FLEVEL
      ?auto_7615 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7612 ?auto_7613 ) ( AIRCRAFT-AT ?auto_7613 ?auto_7616 ) ( FUEL-LEVEL ?auto_7613 ?auto_7614 ) ( NEXT ?auto_7615 ?auto_7614 ) ( not ( = ?auto_7611 ?auto_7616 ) ) ( not ( = ?auto_7614 ?auto_7615 ) ) )
    :subtasks
    ( ( !FLY ?auto_7613 ?auto_7616 ?auto_7611 ?auto_7614 ?auto_7615 )
      ( FLY-1PPL ?auto_7612 ?auto_7611 )
      ( FLY-1PPL-VERIFY ?auto_7612 ?auto_7611 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7633 - PERSON
      ?auto_7632 - CITY
    )
    :vars
    (
      ?auto_7637 - AIRCRAFT
      ?auto_7634 - CITY
      ?auto_7636 - FLEVEL
      ?auto_7635 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7637 ?auto_7634 ) ( FUEL-LEVEL ?auto_7637 ?auto_7636 ) ( NEXT ?auto_7635 ?auto_7636 ) ( not ( = ?auto_7632 ?auto_7634 ) ) ( not ( = ?auto_7636 ?auto_7635 ) ) ( PERSON-AT ?auto_7633 ?auto_7634 ) )
    :subtasks
    ( ( !BOARD ?auto_7633 ?auto_7637 ?auto_7634 )
      ( FLY-1PPL ?auto_7633 ?auto_7632 )
      ( FLY-1PPL-VERIFY ?auto_7633 ?auto_7632 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7654 - PERSON
      ?auto_7653 - CITY
    )
    :vars
    (
      ?auto_7656 - AIRCRAFT
      ?auto_7658 - CITY
      ?auto_7657 - FLEVEL
      ?auto_7655 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7656 ?auto_7658 ) ( NEXT ?auto_7657 ?auto_7655 ) ( not ( = ?auto_7653 ?auto_7658 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( PERSON-AT ?auto_7654 ?auto_7658 ) ( FUEL-LEVEL ?auto_7656 ?auto_7657 ) )
    :subtasks
    ( ( !REFUEL ?auto_7656 ?auto_7658 ?auto_7657 ?auto_7655 )
      ( FLY-1PPL ?auto_7654 ?auto_7653 )
      ( FLY-1PPL-VERIFY ?auto_7654 ?auto_7653 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7675 - PERSON
      ?auto_7674 - CITY
    )
    :vars
    (
      ?auto_7679 - FLEVEL
      ?auto_7677 - FLEVEL
      ?auto_7676 - CITY
      ?auto_7678 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7679 ?auto_7677 ) ( not ( = ?auto_7674 ?auto_7676 ) ) ( not ( = ?auto_7677 ?auto_7679 ) ) ( PERSON-AT ?auto_7675 ?auto_7676 ) ( AIRCRAFT-AT ?auto_7678 ?auto_7674 ) ( FUEL-LEVEL ?auto_7678 ?auto_7677 ) )
    :subtasks
    ( ( !FLY ?auto_7678 ?auto_7674 ?auto_7676 ?auto_7677 ?auto_7679 )
      ( FLY-1PPL ?auto_7675 ?auto_7674 )
      ( FLY-1PPL-VERIFY ?auto_7675 ?auto_7674 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7696 - PERSON
      ?auto_7695 - CITY
    )
    :vars
    (
      ?auto_7697 - FLEVEL
      ?auto_7699 - FLEVEL
      ?auto_7698 - CITY
      ?auto_7700 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7697 ?auto_7699 ) ( not ( = ?auto_7695 ?auto_7698 ) ) ( not ( = ?auto_7699 ?auto_7697 ) ) ( PERSON-AT ?auto_7696 ?auto_7698 ) ( AIRCRAFT-AT ?auto_7700 ?auto_7695 ) ( FUEL-LEVEL ?auto_7700 ?auto_7697 ) )
    :subtasks
    ( ( !REFUEL ?auto_7700 ?auto_7695 ?auto_7697 ?auto_7699 )
      ( FLY-1PPL ?auto_7696 ?auto_7695 )
      ( FLY-1PPL-VERIFY ?auto_7696 ?auto_7695 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7756 - PERSON
      ?auto_7755 - CITY
    )
    :vars
    (
      ?auto_7757 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7756 ?auto_7757 ) ( AIRCRAFT-AT ?auto_7757 ?auto_7755 ) )
    :subtasks
    ( ( !DEBARK ?auto_7756 ?auto_7757 ?auto_7755 )
      ( FLY-1PPL-VERIFY ?auto_7756 ?auto_7755 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7759 - PERSON
      ?auto_7760 - PERSON
      ?auto_7758 - CITY
    )
    :vars
    (
      ?auto_7761 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7760 ?auto_7761 ) ( AIRCRAFT-AT ?auto_7761 ?auto_7758 ) ( PERSON-AT ?auto_7759 ?auto_7758 ) ( not ( = ?auto_7759 ?auto_7760 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7760 ?auto_7758 )
      ( FLY-2PPL-VERIFY ?auto_7759 ?auto_7760 ?auto_7758 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7763 - PERSON
      ?auto_7764 - PERSON
      ?auto_7762 - CITY
    )
    :vars
    (
      ?auto_7765 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7763 ?auto_7765 ) ( AIRCRAFT-AT ?auto_7765 ?auto_7762 ) ( PERSON-AT ?auto_7764 ?auto_7762 ) ( not ( = ?auto_7763 ?auto_7764 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7763 ?auto_7762 )
      ( FLY-2PPL-VERIFY ?auto_7763 ?auto_7764 ?auto_7762 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7771 - PERSON
      ?auto_7772 - PERSON
      ?auto_7773 - PERSON
      ?auto_7770 - CITY
    )
    :vars
    (
      ?auto_7774 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7773 ?auto_7774 ) ( AIRCRAFT-AT ?auto_7774 ?auto_7770 ) ( PERSON-AT ?auto_7771 ?auto_7770 ) ( PERSON-AT ?auto_7772 ?auto_7770 ) ( not ( = ?auto_7771 ?auto_7772 ) ) ( not ( = ?auto_7771 ?auto_7773 ) ) ( not ( = ?auto_7772 ?auto_7773 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7773 ?auto_7770 )
      ( FLY-3PPL-VERIFY ?auto_7771 ?auto_7772 ?auto_7773 ?auto_7770 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7776 - PERSON
      ?auto_7777 - PERSON
      ?auto_7778 - PERSON
      ?auto_7775 - CITY
    )
    :vars
    (
      ?auto_7779 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7777 ?auto_7779 ) ( AIRCRAFT-AT ?auto_7779 ?auto_7775 ) ( PERSON-AT ?auto_7776 ?auto_7775 ) ( PERSON-AT ?auto_7778 ?auto_7775 ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7776 ?auto_7778 ) ) ( not ( = ?auto_7777 ?auto_7778 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7777 ?auto_7775 )
      ( FLY-3PPL-VERIFY ?auto_7776 ?auto_7777 ?auto_7778 ?auto_7775 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7786 - PERSON
      ?auto_7787 - PERSON
      ?auto_7788 - PERSON
      ?auto_7785 - CITY
    )
    :vars
    (
      ?auto_7789 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_7786 ?auto_7789 ) ( AIRCRAFT-AT ?auto_7789 ?auto_7785 ) ( PERSON-AT ?auto_7787 ?auto_7785 ) ( PERSON-AT ?auto_7788 ?auto_7785 ) ( not ( = ?auto_7786 ?auto_7787 ) ) ( not ( = ?auto_7786 ?auto_7788 ) ) ( not ( = ?auto_7787 ?auto_7788 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7786 ?auto_7785 )
      ( FLY-3PPL-VERIFY ?auto_7786 ?auto_7787 ?auto_7788 ?auto_7785 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7806 - PERSON
      ?auto_7805 - CITY
    )
    :vars
    (
      ?auto_7807 - AIRCRAFT
      ?auto_7810 - CITY
      ?auto_7808 - FLEVEL
      ?auto_7809 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7806 ?auto_7807 ) ( AIRCRAFT-AT ?auto_7807 ?auto_7810 ) ( FUEL-LEVEL ?auto_7807 ?auto_7808 ) ( NEXT ?auto_7809 ?auto_7808 ) ( not ( = ?auto_7805 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7809 ) ) )
    :subtasks
    ( ( !FLY ?auto_7807 ?auto_7810 ?auto_7805 ?auto_7808 ?auto_7809 )
      ( FLY-1PPL ?auto_7806 ?auto_7805 )
      ( FLY-1PPL-VERIFY ?auto_7806 ?auto_7805 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7812 - PERSON
      ?auto_7813 - PERSON
      ?auto_7811 - CITY
    )
    :vars
    (
      ?auto_7817 - AIRCRAFT
      ?auto_7816 - CITY
      ?auto_7815 - FLEVEL
      ?auto_7814 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7813 ?auto_7817 ) ( AIRCRAFT-AT ?auto_7817 ?auto_7816 ) ( FUEL-LEVEL ?auto_7817 ?auto_7815 ) ( NEXT ?auto_7814 ?auto_7815 ) ( not ( = ?auto_7811 ?auto_7816 ) ) ( not ( = ?auto_7815 ?auto_7814 ) ) ( PERSON-AT ?auto_7812 ?auto_7811 ) ( not ( = ?auto_7812 ?auto_7813 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7813 ?auto_7811 )
      ( FLY-2PPL-VERIFY ?auto_7812 ?auto_7813 ?auto_7811 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7819 - PERSON
      ?auto_7820 - PERSON
      ?auto_7818 - CITY
    )
    :vars
    (
      ?auto_7824 - AIRCRAFT
      ?auto_7823 - CITY
      ?auto_7821 - FLEVEL
      ?auto_7822 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7819 ?auto_7824 ) ( AIRCRAFT-AT ?auto_7824 ?auto_7823 ) ( FUEL-LEVEL ?auto_7824 ?auto_7821 ) ( NEXT ?auto_7822 ?auto_7821 ) ( not ( = ?auto_7818 ?auto_7823 ) ) ( not ( = ?auto_7821 ?auto_7822 ) ) ( PERSON-AT ?auto_7820 ?auto_7818 ) ( not ( = ?auto_7820 ?auto_7819 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7820 ?auto_7819 ?auto_7818 )
      ( FLY-2PPL-VERIFY ?auto_7819 ?auto_7820 ?auto_7818 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7834 - PERSON
      ?auto_7835 - PERSON
      ?auto_7836 - PERSON
      ?auto_7833 - CITY
    )
    :vars
    (
      ?auto_7840 - AIRCRAFT
      ?auto_7839 - CITY
      ?auto_7837 - FLEVEL
      ?auto_7838 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7836 ?auto_7840 ) ( AIRCRAFT-AT ?auto_7840 ?auto_7839 ) ( FUEL-LEVEL ?auto_7840 ?auto_7837 ) ( NEXT ?auto_7838 ?auto_7837 ) ( not ( = ?auto_7833 ?auto_7839 ) ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( PERSON-AT ?auto_7834 ?auto_7833 ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( PERSON-AT ?auto_7835 ?auto_7833 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7835 ?auto_7836 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7834 ?auto_7836 ?auto_7833 )
      ( FLY-3PPL-VERIFY ?auto_7834 ?auto_7835 ?auto_7836 ?auto_7833 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7842 - PERSON
      ?auto_7843 - PERSON
      ?auto_7844 - PERSON
      ?auto_7841 - CITY
    )
    :vars
    (
      ?auto_7848 - AIRCRAFT
      ?auto_7847 - CITY
      ?auto_7845 - FLEVEL
      ?auto_7846 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7843 ?auto_7848 ) ( AIRCRAFT-AT ?auto_7848 ?auto_7847 ) ( FUEL-LEVEL ?auto_7848 ?auto_7845 ) ( NEXT ?auto_7846 ?auto_7845 ) ( not ( = ?auto_7841 ?auto_7847 ) ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( PERSON-AT ?auto_7844 ?auto_7841 ) ( not ( = ?auto_7844 ?auto_7843 ) ) ( PERSON-AT ?auto_7842 ?auto_7841 ) ( not ( = ?auto_7842 ?auto_7843 ) ) ( not ( = ?auto_7842 ?auto_7844 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7844 ?auto_7843 ?auto_7841 )
      ( FLY-3PPL-VERIFY ?auto_7842 ?auto_7843 ?auto_7844 ?auto_7841 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7858 - PERSON
      ?auto_7859 - PERSON
      ?auto_7860 - PERSON
      ?auto_7857 - CITY
    )
    :vars
    (
      ?auto_7864 - AIRCRAFT
      ?auto_7863 - CITY
      ?auto_7861 - FLEVEL
      ?auto_7862 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7858 ?auto_7864 ) ( AIRCRAFT-AT ?auto_7864 ?auto_7863 ) ( FUEL-LEVEL ?auto_7864 ?auto_7861 ) ( NEXT ?auto_7862 ?auto_7861 ) ( not ( = ?auto_7857 ?auto_7863 ) ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( PERSON-AT ?auto_7860 ?auto_7857 ) ( not ( = ?auto_7860 ?auto_7858 ) ) ( PERSON-AT ?auto_7859 ?auto_7857 ) ( not ( = ?auto_7858 ?auto_7859 ) ) ( not ( = ?auto_7859 ?auto_7860 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7860 ?auto_7858 ?auto_7857 )
      ( FLY-3PPL-VERIFY ?auto_7858 ?auto_7859 ?auto_7860 ?auto_7857 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7891 - PERSON
      ?auto_7890 - CITY
    )
    :vars
    (
      ?auto_7895 - AIRCRAFT
      ?auto_7894 - CITY
      ?auto_7892 - FLEVEL
      ?auto_7893 - FLEVEL
      ?auto_7896 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7895 ?auto_7894 ) ( FUEL-LEVEL ?auto_7895 ?auto_7892 ) ( NEXT ?auto_7893 ?auto_7892 ) ( not ( = ?auto_7890 ?auto_7894 ) ) ( not ( = ?auto_7892 ?auto_7893 ) ) ( PERSON-AT ?auto_7896 ?auto_7890 ) ( not ( = ?auto_7896 ?auto_7891 ) ) ( PERSON-AT ?auto_7891 ?auto_7894 ) )
    :subtasks
    ( ( !BOARD ?auto_7891 ?auto_7895 ?auto_7894 )
      ( FLY-2PPL ?auto_7896 ?auto_7891 ?auto_7890 )
      ( FLY-1PPL-VERIFY ?auto_7891 ?auto_7890 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7898 - PERSON
      ?auto_7899 - PERSON
      ?auto_7897 - CITY
    )
    :vars
    (
      ?auto_7900 - AIRCRAFT
      ?auto_7901 - CITY
      ?auto_7902 - FLEVEL
      ?auto_7903 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7900 ?auto_7901 ) ( FUEL-LEVEL ?auto_7900 ?auto_7902 ) ( NEXT ?auto_7903 ?auto_7902 ) ( not ( = ?auto_7897 ?auto_7901 ) ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( PERSON-AT ?auto_7898 ?auto_7897 ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( PERSON-AT ?auto_7899 ?auto_7901 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7899 ?auto_7897 )
      ( FLY-2PPL-VERIFY ?auto_7898 ?auto_7899 ?auto_7897 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7905 - PERSON
      ?auto_7906 - PERSON
      ?auto_7904 - CITY
    )
    :vars
    (
      ?auto_7909 - AIRCRAFT
      ?auto_7908 - CITY
      ?auto_7910 - FLEVEL
      ?auto_7907 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7909 ?auto_7908 ) ( FUEL-LEVEL ?auto_7909 ?auto_7910 ) ( NEXT ?auto_7907 ?auto_7910 ) ( not ( = ?auto_7904 ?auto_7908 ) ) ( not ( = ?auto_7910 ?auto_7907 ) ) ( PERSON-AT ?auto_7906 ?auto_7904 ) ( not ( = ?auto_7906 ?auto_7905 ) ) ( PERSON-AT ?auto_7905 ?auto_7908 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7906 ?auto_7905 ?auto_7904 )
      ( FLY-2PPL-VERIFY ?auto_7905 ?auto_7906 ?auto_7904 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7920 - PERSON
      ?auto_7921 - PERSON
      ?auto_7922 - PERSON
      ?auto_7919 - CITY
    )
    :vars
    (
      ?auto_7925 - AIRCRAFT
      ?auto_7924 - CITY
      ?auto_7926 - FLEVEL
      ?auto_7923 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7925 ?auto_7924 ) ( FUEL-LEVEL ?auto_7925 ?auto_7926 ) ( NEXT ?auto_7923 ?auto_7926 ) ( not ( = ?auto_7919 ?auto_7924 ) ) ( not ( = ?auto_7926 ?auto_7923 ) ) ( PERSON-AT ?auto_7921 ?auto_7919 ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( PERSON-AT ?auto_7922 ?auto_7924 ) ( PERSON-AT ?auto_7920 ?auto_7919 ) ( not ( = ?auto_7920 ?auto_7921 ) ) ( not ( = ?auto_7920 ?auto_7922 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7921 ?auto_7922 ?auto_7919 )
      ( FLY-3PPL-VERIFY ?auto_7920 ?auto_7921 ?auto_7922 ?auto_7919 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7928 - PERSON
      ?auto_7929 - PERSON
      ?auto_7930 - PERSON
      ?auto_7927 - CITY
    )
    :vars
    (
      ?auto_7933 - AIRCRAFT
      ?auto_7932 - CITY
      ?auto_7934 - FLEVEL
      ?auto_7931 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7933 ?auto_7932 ) ( FUEL-LEVEL ?auto_7933 ?auto_7934 ) ( NEXT ?auto_7931 ?auto_7934 ) ( not ( = ?auto_7927 ?auto_7932 ) ) ( not ( = ?auto_7934 ?auto_7931 ) ) ( PERSON-AT ?auto_7928 ?auto_7927 ) ( not ( = ?auto_7928 ?auto_7929 ) ) ( PERSON-AT ?auto_7929 ?auto_7932 ) ( PERSON-AT ?auto_7930 ?auto_7927 ) ( not ( = ?auto_7928 ?auto_7930 ) ) ( not ( = ?auto_7929 ?auto_7930 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7928 ?auto_7929 ?auto_7927 )
      ( FLY-3PPL-VERIFY ?auto_7928 ?auto_7929 ?auto_7930 ?auto_7927 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7944 - PERSON
      ?auto_7945 - PERSON
      ?auto_7946 - PERSON
      ?auto_7943 - CITY
    )
    :vars
    (
      ?auto_7949 - AIRCRAFT
      ?auto_7948 - CITY
      ?auto_7950 - FLEVEL
      ?auto_7947 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7949 ?auto_7948 ) ( FUEL-LEVEL ?auto_7949 ?auto_7950 ) ( NEXT ?auto_7947 ?auto_7950 ) ( not ( = ?auto_7943 ?auto_7948 ) ) ( not ( = ?auto_7950 ?auto_7947 ) ) ( PERSON-AT ?auto_7946 ?auto_7943 ) ( not ( = ?auto_7946 ?auto_7944 ) ) ( PERSON-AT ?auto_7944 ?auto_7948 ) ( PERSON-AT ?auto_7945 ?auto_7943 ) ( not ( = ?auto_7944 ?auto_7945 ) ) ( not ( = ?auto_7945 ?auto_7946 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7946 ?auto_7944 ?auto_7943 )
      ( FLY-3PPL-VERIFY ?auto_7944 ?auto_7945 ?auto_7946 ?auto_7943 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7977 - PERSON
      ?auto_7976 - CITY
    )
    :vars
    (
      ?auto_7980 - AIRCRAFT
      ?auto_7979 - CITY
      ?auto_7978 - FLEVEL
      ?auto_7981 - FLEVEL
      ?auto_7982 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7980 ?auto_7979 ) ( NEXT ?auto_7978 ?auto_7981 ) ( not ( = ?auto_7976 ?auto_7979 ) ) ( not ( = ?auto_7981 ?auto_7978 ) ) ( PERSON-AT ?auto_7982 ?auto_7976 ) ( not ( = ?auto_7982 ?auto_7977 ) ) ( PERSON-AT ?auto_7977 ?auto_7979 ) ( FUEL-LEVEL ?auto_7980 ?auto_7978 ) )
    :subtasks
    ( ( !REFUEL ?auto_7980 ?auto_7979 ?auto_7978 ?auto_7981 )
      ( FLY-2PPL ?auto_7982 ?auto_7977 ?auto_7976 )
      ( FLY-1PPL-VERIFY ?auto_7977 ?auto_7976 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7984 - PERSON
      ?auto_7985 - PERSON
      ?auto_7983 - CITY
    )
    :vars
    (
      ?auto_7989 - AIRCRAFT
      ?auto_7988 - CITY
      ?auto_7987 - FLEVEL
      ?auto_7986 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7989 ?auto_7988 ) ( NEXT ?auto_7987 ?auto_7986 ) ( not ( = ?auto_7983 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_7987 ) ) ( PERSON-AT ?auto_7984 ?auto_7983 ) ( not ( = ?auto_7984 ?auto_7985 ) ) ( PERSON-AT ?auto_7985 ?auto_7988 ) ( FUEL-LEVEL ?auto_7989 ?auto_7987 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7985 ?auto_7983 )
      ( FLY-2PPL-VERIFY ?auto_7984 ?auto_7985 ?auto_7983 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7991 - PERSON
      ?auto_7992 - PERSON
      ?auto_7990 - CITY
    )
    :vars
    (
      ?auto_7993 - AIRCRAFT
      ?auto_7994 - CITY
      ?auto_7996 - FLEVEL
      ?auto_7995 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7993 ?auto_7994 ) ( NEXT ?auto_7996 ?auto_7995 ) ( not ( = ?auto_7990 ?auto_7994 ) ) ( not ( = ?auto_7995 ?auto_7996 ) ) ( PERSON-AT ?auto_7992 ?auto_7990 ) ( not ( = ?auto_7992 ?auto_7991 ) ) ( PERSON-AT ?auto_7991 ?auto_7994 ) ( FUEL-LEVEL ?auto_7993 ?auto_7996 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7992 ?auto_7991 ?auto_7990 )
      ( FLY-2PPL-VERIFY ?auto_7991 ?auto_7992 ?auto_7990 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8006 - PERSON
      ?auto_8007 - PERSON
      ?auto_8008 - PERSON
      ?auto_8005 - CITY
    )
    :vars
    (
      ?auto_8009 - AIRCRAFT
      ?auto_8010 - CITY
      ?auto_8012 - FLEVEL
      ?auto_8011 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8009 ?auto_8010 ) ( NEXT ?auto_8012 ?auto_8011 ) ( not ( = ?auto_8005 ?auto_8010 ) ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( PERSON-AT ?auto_8006 ?auto_8005 ) ( not ( = ?auto_8006 ?auto_8008 ) ) ( PERSON-AT ?auto_8008 ?auto_8010 ) ( FUEL-LEVEL ?auto_8009 ?auto_8012 ) ( PERSON-AT ?auto_8007 ?auto_8005 ) ( not ( = ?auto_8006 ?auto_8007 ) ) ( not ( = ?auto_8007 ?auto_8008 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8006 ?auto_8008 ?auto_8005 )
      ( FLY-3PPL-VERIFY ?auto_8006 ?auto_8007 ?auto_8008 ?auto_8005 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8014 - PERSON
      ?auto_8015 - PERSON
      ?auto_8016 - PERSON
      ?auto_8013 - CITY
    )
    :vars
    (
      ?auto_8017 - AIRCRAFT
      ?auto_8018 - CITY
      ?auto_8020 - FLEVEL
      ?auto_8019 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8017 ?auto_8018 ) ( NEXT ?auto_8020 ?auto_8019 ) ( not ( = ?auto_8013 ?auto_8018 ) ) ( not ( = ?auto_8019 ?auto_8020 ) ) ( PERSON-AT ?auto_8016 ?auto_8013 ) ( not ( = ?auto_8016 ?auto_8015 ) ) ( PERSON-AT ?auto_8015 ?auto_8018 ) ( FUEL-LEVEL ?auto_8017 ?auto_8020 ) ( PERSON-AT ?auto_8014 ?auto_8013 ) ( not ( = ?auto_8014 ?auto_8015 ) ) ( not ( = ?auto_8014 ?auto_8016 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8016 ?auto_8015 ?auto_8013 )
      ( FLY-3PPL-VERIFY ?auto_8014 ?auto_8015 ?auto_8016 ?auto_8013 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8030 - PERSON
      ?auto_8031 - PERSON
      ?auto_8032 - PERSON
      ?auto_8029 - CITY
    )
    :vars
    (
      ?auto_8033 - AIRCRAFT
      ?auto_8034 - CITY
      ?auto_8036 - FLEVEL
      ?auto_8035 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8033 ?auto_8034 ) ( NEXT ?auto_8036 ?auto_8035 ) ( not ( = ?auto_8029 ?auto_8034 ) ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( PERSON-AT ?auto_8031 ?auto_8029 ) ( not ( = ?auto_8031 ?auto_8030 ) ) ( PERSON-AT ?auto_8030 ?auto_8034 ) ( FUEL-LEVEL ?auto_8033 ?auto_8036 ) ( PERSON-AT ?auto_8032 ?auto_8029 ) ( not ( = ?auto_8030 ?auto_8032 ) ) ( not ( = ?auto_8031 ?auto_8032 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8031 ?auto_8030 ?auto_8029 )
      ( FLY-3PPL-VERIFY ?auto_8030 ?auto_8031 ?auto_8032 ?auto_8029 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8063 - PERSON
      ?auto_8062 - CITY
    )
    :vars
    (
      ?auto_8068 - FLEVEL
      ?auto_8067 - FLEVEL
      ?auto_8066 - CITY
      ?auto_8065 - PERSON
      ?auto_8064 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8068 ?auto_8067 ) ( not ( = ?auto_8062 ?auto_8066 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( PERSON-AT ?auto_8065 ?auto_8062 ) ( not ( = ?auto_8065 ?auto_8063 ) ) ( PERSON-AT ?auto_8063 ?auto_8066 ) ( AIRCRAFT-AT ?auto_8064 ?auto_8062 ) ( FUEL-LEVEL ?auto_8064 ?auto_8067 ) )
    :subtasks
    ( ( !FLY ?auto_8064 ?auto_8062 ?auto_8066 ?auto_8067 ?auto_8068 )
      ( FLY-2PPL ?auto_8065 ?auto_8063 ?auto_8062 )
      ( FLY-1PPL-VERIFY ?auto_8063 ?auto_8062 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8070 - PERSON
      ?auto_8071 - PERSON
      ?auto_8069 - CITY
    )
    :vars
    (
      ?auto_8074 - FLEVEL
      ?auto_8073 - FLEVEL
      ?auto_8072 - CITY
      ?auto_8075 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8074 ?auto_8073 ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( PERSON-AT ?auto_8070 ?auto_8069 ) ( not ( = ?auto_8070 ?auto_8071 ) ) ( PERSON-AT ?auto_8071 ?auto_8072 ) ( AIRCRAFT-AT ?auto_8075 ?auto_8069 ) ( FUEL-LEVEL ?auto_8075 ?auto_8073 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8071 ?auto_8069 )
      ( FLY-2PPL-VERIFY ?auto_8070 ?auto_8071 ?auto_8069 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8077 - PERSON
      ?auto_8078 - PERSON
      ?auto_8076 - CITY
    )
    :vars
    (
      ?auto_8079 - FLEVEL
      ?auto_8081 - FLEVEL
      ?auto_8080 - CITY
      ?auto_8082 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8079 ?auto_8081 ) ( not ( = ?auto_8076 ?auto_8080 ) ) ( not ( = ?auto_8081 ?auto_8079 ) ) ( PERSON-AT ?auto_8078 ?auto_8076 ) ( not ( = ?auto_8078 ?auto_8077 ) ) ( PERSON-AT ?auto_8077 ?auto_8080 ) ( AIRCRAFT-AT ?auto_8082 ?auto_8076 ) ( FUEL-LEVEL ?auto_8082 ?auto_8081 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8078 ?auto_8077 ?auto_8076 )
      ( FLY-2PPL-VERIFY ?auto_8077 ?auto_8078 ?auto_8076 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8092 - PERSON
      ?auto_8093 - PERSON
      ?auto_8094 - PERSON
      ?auto_8091 - CITY
    )
    :vars
    (
      ?auto_8095 - FLEVEL
      ?auto_8097 - FLEVEL
      ?auto_8096 - CITY
      ?auto_8098 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8095 ?auto_8097 ) ( not ( = ?auto_8091 ?auto_8096 ) ) ( not ( = ?auto_8097 ?auto_8095 ) ) ( PERSON-AT ?auto_8092 ?auto_8091 ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( PERSON-AT ?auto_8094 ?auto_8096 ) ( AIRCRAFT-AT ?auto_8098 ?auto_8091 ) ( FUEL-LEVEL ?auto_8098 ?auto_8097 ) ( PERSON-AT ?auto_8093 ?auto_8091 ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8093 ?auto_8094 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8092 ?auto_8094 ?auto_8091 )
      ( FLY-3PPL-VERIFY ?auto_8092 ?auto_8093 ?auto_8094 ?auto_8091 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8100 - PERSON
      ?auto_8101 - PERSON
      ?auto_8102 - PERSON
      ?auto_8099 - CITY
    )
    :vars
    (
      ?auto_8103 - FLEVEL
      ?auto_8105 - FLEVEL
      ?auto_8104 - CITY
      ?auto_8106 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8103 ?auto_8105 ) ( not ( = ?auto_8099 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8103 ) ) ( PERSON-AT ?auto_8102 ?auto_8099 ) ( not ( = ?auto_8102 ?auto_8101 ) ) ( PERSON-AT ?auto_8101 ?auto_8104 ) ( AIRCRAFT-AT ?auto_8106 ?auto_8099 ) ( FUEL-LEVEL ?auto_8106 ?auto_8105 ) ( PERSON-AT ?auto_8100 ?auto_8099 ) ( not ( = ?auto_8100 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8102 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8102 ?auto_8101 ?auto_8099 )
      ( FLY-3PPL-VERIFY ?auto_8100 ?auto_8101 ?auto_8102 ?auto_8099 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8116 - PERSON
      ?auto_8117 - PERSON
      ?auto_8118 - PERSON
      ?auto_8115 - CITY
    )
    :vars
    (
      ?auto_8119 - FLEVEL
      ?auto_8121 - FLEVEL
      ?auto_8120 - CITY
      ?auto_8122 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8119 ?auto_8121 ) ( not ( = ?auto_8115 ?auto_8120 ) ) ( not ( = ?auto_8121 ?auto_8119 ) ) ( PERSON-AT ?auto_8118 ?auto_8115 ) ( not ( = ?auto_8118 ?auto_8116 ) ) ( PERSON-AT ?auto_8116 ?auto_8120 ) ( AIRCRAFT-AT ?auto_8122 ?auto_8115 ) ( FUEL-LEVEL ?auto_8122 ?auto_8121 ) ( PERSON-AT ?auto_8117 ?auto_8115 ) ( not ( = ?auto_8116 ?auto_8117 ) ) ( not ( = ?auto_8117 ?auto_8118 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8118 ?auto_8116 ?auto_8115 )
      ( FLY-3PPL-VERIFY ?auto_8116 ?auto_8117 ?auto_8118 ?auto_8115 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8149 - PERSON
      ?auto_8148 - CITY
    )
    :vars
    (
      ?auto_8150 - FLEVEL
      ?auto_8152 - FLEVEL
      ?auto_8151 - CITY
      ?auto_8153 - PERSON
      ?auto_8154 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8150 ?auto_8152 ) ( not ( = ?auto_8148 ?auto_8151 ) ) ( not ( = ?auto_8152 ?auto_8150 ) ) ( PERSON-AT ?auto_8153 ?auto_8148 ) ( not ( = ?auto_8153 ?auto_8149 ) ) ( PERSON-AT ?auto_8149 ?auto_8151 ) ( AIRCRAFT-AT ?auto_8154 ?auto_8148 ) ( FUEL-LEVEL ?auto_8154 ?auto_8150 ) )
    :subtasks
    ( ( !REFUEL ?auto_8154 ?auto_8148 ?auto_8150 ?auto_8152 )
      ( FLY-2PPL ?auto_8153 ?auto_8149 ?auto_8148 )
      ( FLY-1PPL-VERIFY ?auto_8149 ?auto_8148 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8156 - PERSON
      ?auto_8157 - PERSON
      ?auto_8155 - CITY
    )
    :vars
    (
      ?auto_8160 - FLEVEL
      ?auto_8161 - FLEVEL
      ?auto_8158 - CITY
      ?auto_8159 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8160 ?auto_8161 ) ( not ( = ?auto_8155 ?auto_8158 ) ) ( not ( = ?auto_8161 ?auto_8160 ) ) ( PERSON-AT ?auto_8156 ?auto_8155 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( PERSON-AT ?auto_8157 ?auto_8158 ) ( AIRCRAFT-AT ?auto_8159 ?auto_8155 ) ( FUEL-LEVEL ?auto_8159 ?auto_8160 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8157 ?auto_8155 )
      ( FLY-2PPL-VERIFY ?auto_8156 ?auto_8157 ?auto_8155 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8163 - PERSON
      ?auto_8164 - PERSON
      ?auto_8162 - CITY
    )
    :vars
    (
      ?auto_8165 - FLEVEL
      ?auto_8166 - FLEVEL
      ?auto_8168 - CITY
      ?auto_8167 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8165 ?auto_8166 ) ( not ( = ?auto_8162 ?auto_8168 ) ) ( not ( = ?auto_8166 ?auto_8165 ) ) ( PERSON-AT ?auto_8164 ?auto_8162 ) ( not ( = ?auto_8164 ?auto_8163 ) ) ( PERSON-AT ?auto_8163 ?auto_8168 ) ( AIRCRAFT-AT ?auto_8167 ?auto_8162 ) ( FUEL-LEVEL ?auto_8167 ?auto_8165 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8164 ?auto_8163 ?auto_8162 )
      ( FLY-2PPL-VERIFY ?auto_8163 ?auto_8164 ?auto_8162 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8178 - PERSON
      ?auto_8179 - PERSON
      ?auto_8180 - PERSON
      ?auto_8177 - CITY
    )
    :vars
    (
      ?auto_8181 - FLEVEL
      ?auto_8182 - FLEVEL
      ?auto_8184 - CITY
      ?auto_8183 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8181 ?auto_8182 ) ( not ( = ?auto_8177 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8181 ) ) ( PERSON-AT ?auto_8178 ?auto_8177 ) ( not ( = ?auto_8178 ?auto_8180 ) ) ( PERSON-AT ?auto_8180 ?auto_8184 ) ( AIRCRAFT-AT ?auto_8183 ?auto_8177 ) ( FUEL-LEVEL ?auto_8183 ?auto_8181 ) ( PERSON-AT ?auto_8179 ?auto_8177 ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( not ( = ?auto_8179 ?auto_8180 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8178 ?auto_8180 ?auto_8177 )
      ( FLY-3PPL-VERIFY ?auto_8178 ?auto_8179 ?auto_8180 ?auto_8177 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8186 - PERSON
      ?auto_8187 - PERSON
      ?auto_8188 - PERSON
      ?auto_8185 - CITY
    )
    :vars
    (
      ?auto_8189 - FLEVEL
      ?auto_8190 - FLEVEL
      ?auto_8192 - CITY
      ?auto_8191 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8189 ?auto_8190 ) ( not ( = ?auto_8185 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8189 ) ) ( PERSON-AT ?auto_8188 ?auto_8185 ) ( not ( = ?auto_8188 ?auto_8187 ) ) ( PERSON-AT ?auto_8187 ?auto_8192 ) ( AIRCRAFT-AT ?auto_8191 ?auto_8185 ) ( FUEL-LEVEL ?auto_8191 ?auto_8189 ) ( PERSON-AT ?auto_8186 ?auto_8185 ) ( not ( = ?auto_8186 ?auto_8187 ) ) ( not ( = ?auto_8186 ?auto_8188 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8188 ?auto_8187 ?auto_8185 )
      ( FLY-3PPL-VERIFY ?auto_8186 ?auto_8187 ?auto_8188 ?auto_8185 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8202 - PERSON
      ?auto_8203 - PERSON
      ?auto_8204 - PERSON
      ?auto_8201 - CITY
    )
    :vars
    (
      ?auto_8205 - FLEVEL
      ?auto_8206 - FLEVEL
      ?auto_8208 - CITY
      ?auto_8207 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8205 ?auto_8206 ) ( not ( = ?auto_8201 ?auto_8208 ) ) ( not ( = ?auto_8206 ?auto_8205 ) ) ( PERSON-AT ?auto_8203 ?auto_8201 ) ( not ( = ?auto_8203 ?auto_8202 ) ) ( PERSON-AT ?auto_8202 ?auto_8208 ) ( AIRCRAFT-AT ?auto_8207 ?auto_8201 ) ( FUEL-LEVEL ?auto_8207 ?auto_8205 ) ( PERSON-AT ?auto_8204 ?auto_8201 ) ( not ( = ?auto_8202 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8204 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8203 ?auto_8202 ?auto_8201 )
      ( FLY-3PPL-VERIFY ?auto_8202 ?auto_8203 ?auto_8204 ?auto_8201 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8235 - PERSON
      ?auto_8234 - CITY
    )
    :vars
    (
      ?auto_8236 - FLEVEL
      ?auto_8237 - FLEVEL
      ?auto_8240 - CITY
      ?auto_8238 - PERSON
      ?auto_8239 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8236 ?auto_8237 ) ( not ( = ?auto_8234 ?auto_8240 ) ) ( not ( = ?auto_8237 ?auto_8236 ) ) ( not ( = ?auto_8238 ?auto_8235 ) ) ( PERSON-AT ?auto_8235 ?auto_8240 ) ( AIRCRAFT-AT ?auto_8239 ?auto_8234 ) ( FUEL-LEVEL ?auto_8239 ?auto_8236 ) ( IN ?auto_8238 ?auto_8239 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8238 ?auto_8234 )
      ( FLY-2PPL ?auto_8238 ?auto_8235 ?auto_8234 )
      ( FLY-1PPL-VERIFY ?auto_8235 ?auto_8234 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8242 - PERSON
      ?auto_8243 - PERSON
      ?auto_8241 - CITY
    )
    :vars
    (
      ?auto_8244 - FLEVEL
      ?auto_8246 - FLEVEL
      ?auto_8245 - CITY
      ?auto_8247 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8244 ?auto_8246 ) ( not ( = ?auto_8241 ?auto_8245 ) ) ( not ( = ?auto_8246 ?auto_8244 ) ) ( not ( = ?auto_8242 ?auto_8243 ) ) ( PERSON-AT ?auto_8243 ?auto_8245 ) ( AIRCRAFT-AT ?auto_8247 ?auto_8241 ) ( FUEL-LEVEL ?auto_8247 ?auto_8244 ) ( IN ?auto_8242 ?auto_8247 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8243 ?auto_8241 )
      ( FLY-2PPL-VERIFY ?auto_8242 ?auto_8243 ?auto_8241 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8249 - PERSON
      ?auto_8250 - PERSON
      ?auto_8248 - CITY
    )
    :vars
    (
      ?auto_8251 - FLEVEL
      ?auto_8254 - FLEVEL
      ?auto_8253 - CITY
      ?auto_8252 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8251 ?auto_8254 ) ( not ( = ?auto_8248 ?auto_8253 ) ) ( not ( = ?auto_8254 ?auto_8251 ) ) ( not ( = ?auto_8250 ?auto_8249 ) ) ( PERSON-AT ?auto_8249 ?auto_8253 ) ( AIRCRAFT-AT ?auto_8252 ?auto_8248 ) ( FUEL-LEVEL ?auto_8252 ?auto_8251 ) ( IN ?auto_8250 ?auto_8252 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8250 ?auto_8249 ?auto_8248 )
      ( FLY-2PPL-VERIFY ?auto_8249 ?auto_8250 ?auto_8248 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8321 - PERSON
      ?auto_8320 - CITY
    )
    :vars
    (
      ?auto_8323 - FLEVEL
      ?auto_8326 - FLEVEL
      ?auto_8325 - CITY
      ?auto_8322 - PERSON
      ?auto_8324 - AIRCRAFT
      ?auto_8327 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8323 ?auto_8326 ) ( not ( = ?auto_8320 ?auto_8325 ) ) ( not ( = ?auto_8326 ?auto_8323 ) ) ( not ( = ?auto_8322 ?auto_8321 ) ) ( PERSON-AT ?auto_8321 ?auto_8325 ) ( IN ?auto_8322 ?auto_8324 ) ( AIRCRAFT-AT ?auto_8324 ?auto_8327 ) ( FUEL-LEVEL ?auto_8324 ?auto_8326 ) ( not ( = ?auto_8320 ?auto_8327 ) ) ( not ( = ?auto_8325 ?auto_8327 ) ) )
    :subtasks
    ( ( !FLY ?auto_8324 ?auto_8327 ?auto_8320 ?auto_8326 ?auto_8323 )
      ( FLY-2PPL ?auto_8322 ?auto_8321 ?auto_8320 )
      ( FLY-1PPL-VERIFY ?auto_8321 ?auto_8320 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8329 - PERSON
      ?auto_8330 - PERSON
      ?auto_8328 - CITY
    )
    :vars
    (
      ?auto_8331 - FLEVEL
      ?auto_8335 - FLEVEL
      ?auto_8334 - CITY
      ?auto_8332 - AIRCRAFT
      ?auto_8333 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8331 ?auto_8335 ) ( not ( = ?auto_8328 ?auto_8334 ) ) ( not ( = ?auto_8335 ?auto_8331 ) ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( PERSON-AT ?auto_8330 ?auto_8334 ) ( IN ?auto_8329 ?auto_8332 ) ( AIRCRAFT-AT ?auto_8332 ?auto_8333 ) ( FUEL-LEVEL ?auto_8332 ?auto_8335 ) ( not ( = ?auto_8328 ?auto_8333 ) ) ( not ( = ?auto_8334 ?auto_8333 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8330 ?auto_8328 )
      ( FLY-2PPL-VERIFY ?auto_8329 ?auto_8330 ?auto_8328 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8337 - PERSON
      ?auto_8338 - PERSON
      ?auto_8336 - CITY
    )
    :vars
    (
      ?auto_8339 - FLEVEL
      ?auto_8340 - FLEVEL
      ?auto_8341 - CITY
      ?auto_8343 - AIRCRAFT
      ?auto_8342 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8339 ?auto_8340 ) ( not ( = ?auto_8336 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8339 ) ) ( not ( = ?auto_8338 ?auto_8337 ) ) ( PERSON-AT ?auto_8337 ?auto_8341 ) ( IN ?auto_8338 ?auto_8343 ) ( AIRCRAFT-AT ?auto_8343 ?auto_8342 ) ( FUEL-LEVEL ?auto_8343 ?auto_8340 ) ( not ( = ?auto_8336 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8342 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8338 ?auto_8337 ?auto_8336 )
      ( FLY-2PPL-VERIFY ?auto_8337 ?auto_8338 ?auto_8336 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8418 - PERSON
      ?auto_8417 - CITY
    )
    :vars
    (
      ?auto_8419 - FLEVEL
      ?auto_8420 - FLEVEL
      ?auto_8421 - CITY
      ?auto_8423 - PERSON
      ?auto_8424 - AIRCRAFT
      ?auto_8422 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8419 ?auto_8420 ) ( not ( = ?auto_8417 ?auto_8421 ) ) ( not ( = ?auto_8420 ?auto_8419 ) ) ( not ( = ?auto_8423 ?auto_8418 ) ) ( PERSON-AT ?auto_8418 ?auto_8421 ) ( AIRCRAFT-AT ?auto_8424 ?auto_8422 ) ( FUEL-LEVEL ?auto_8424 ?auto_8420 ) ( not ( = ?auto_8417 ?auto_8422 ) ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( PERSON-AT ?auto_8423 ?auto_8422 ) )
    :subtasks
    ( ( !BOARD ?auto_8423 ?auto_8424 ?auto_8422 )
      ( FLY-2PPL ?auto_8423 ?auto_8418 ?auto_8417 )
      ( FLY-1PPL-VERIFY ?auto_8418 ?auto_8417 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8426 - PERSON
      ?auto_8427 - PERSON
      ?auto_8425 - CITY
    )
    :vars
    (
      ?auto_8431 - FLEVEL
      ?auto_8428 - FLEVEL
      ?auto_8429 - CITY
      ?auto_8432 - AIRCRAFT
      ?auto_8430 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8431 ?auto_8428 ) ( not ( = ?auto_8425 ?auto_8429 ) ) ( not ( = ?auto_8428 ?auto_8431 ) ) ( not ( = ?auto_8426 ?auto_8427 ) ) ( PERSON-AT ?auto_8427 ?auto_8429 ) ( AIRCRAFT-AT ?auto_8432 ?auto_8430 ) ( FUEL-LEVEL ?auto_8432 ?auto_8428 ) ( not ( = ?auto_8425 ?auto_8430 ) ) ( not ( = ?auto_8429 ?auto_8430 ) ) ( PERSON-AT ?auto_8426 ?auto_8430 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8427 ?auto_8425 )
      ( FLY-2PPL-VERIFY ?auto_8426 ?auto_8427 ?auto_8425 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8434 - PERSON
      ?auto_8435 - PERSON
      ?auto_8433 - CITY
    )
    :vars
    (
      ?auto_8439 - FLEVEL
      ?auto_8437 - FLEVEL
      ?auto_8438 - CITY
      ?auto_8436 - AIRCRAFT
      ?auto_8440 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8439 ?auto_8437 ) ( not ( = ?auto_8433 ?auto_8438 ) ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( not ( = ?auto_8435 ?auto_8434 ) ) ( PERSON-AT ?auto_8434 ?auto_8438 ) ( AIRCRAFT-AT ?auto_8436 ?auto_8440 ) ( FUEL-LEVEL ?auto_8436 ?auto_8437 ) ( not ( = ?auto_8433 ?auto_8440 ) ) ( not ( = ?auto_8438 ?auto_8440 ) ) ( PERSON-AT ?auto_8435 ?auto_8440 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8435 ?auto_8434 ?auto_8433 )
      ( FLY-2PPL-VERIFY ?auto_8434 ?auto_8435 ?auto_8433 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8515 - PERSON
      ?auto_8514 - CITY
    )
    :vars
    (
      ?auto_8520 - FLEVEL
      ?auto_8518 - FLEVEL
      ?auto_8519 - CITY
      ?auto_8516 - PERSON
      ?auto_8517 - AIRCRAFT
      ?auto_8521 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8520 ?auto_8518 ) ( not ( = ?auto_8514 ?auto_8519 ) ) ( not ( = ?auto_8518 ?auto_8520 ) ) ( not ( = ?auto_8516 ?auto_8515 ) ) ( PERSON-AT ?auto_8515 ?auto_8519 ) ( AIRCRAFT-AT ?auto_8517 ?auto_8521 ) ( not ( = ?auto_8514 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( PERSON-AT ?auto_8516 ?auto_8521 ) ( FUEL-LEVEL ?auto_8517 ?auto_8520 ) )
    :subtasks
    ( ( !REFUEL ?auto_8517 ?auto_8521 ?auto_8520 ?auto_8518 )
      ( FLY-2PPL ?auto_8516 ?auto_8515 ?auto_8514 )
      ( FLY-1PPL-VERIFY ?auto_8515 ?auto_8514 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8523 - PERSON
      ?auto_8524 - PERSON
      ?auto_8522 - CITY
    )
    :vars
    (
      ?auto_8526 - FLEVEL
      ?auto_8527 - FLEVEL
      ?auto_8529 - CITY
      ?auto_8528 - AIRCRAFT
      ?auto_8525 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8526 ?auto_8527 ) ( not ( = ?auto_8522 ?auto_8529 ) ) ( not ( = ?auto_8527 ?auto_8526 ) ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( PERSON-AT ?auto_8524 ?auto_8529 ) ( AIRCRAFT-AT ?auto_8528 ?auto_8525 ) ( not ( = ?auto_8522 ?auto_8525 ) ) ( not ( = ?auto_8529 ?auto_8525 ) ) ( PERSON-AT ?auto_8523 ?auto_8525 ) ( FUEL-LEVEL ?auto_8528 ?auto_8526 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8524 ?auto_8522 )
      ( FLY-2PPL-VERIFY ?auto_8523 ?auto_8524 ?auto_8522 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8531 - PERSON
      ?auto_8532 - PERSON
      ?auto_8530 - CITY
    )
    :vars
    (
      ?auto_8534 - FLEVEL
      ?auto_8536 - FLEVEL
      ?auto_8535 - CITY
      ?auto_8537 - AIRCRAFT
      ?auto_8533 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_8534 ?auto_8536 ) ( not ( = ?auto_8530 ?auto_8535 ) ) ( not ( = ?auto_8536 ?auto_8534 ) ) ( not ( = ?auto_8532 ?auto_8531 ) ) ( PERSON-AT ?auto_8531 ?auto_8535 ) ( AIRCRAFT-AT ?auto_8537 ?auto_8533 ) ( not ( = ?auto_8530 ?auto_8533 ) ) ( not ( = ?auto_8535 ?auto_8533 ) ) ( PERSON-AT ?auto_8532 ?auto_8533 ) ( FUEL-LEVEL ?auto_8537 ?auto_8534 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8532 ?auto_8531 ?auto_8530 )
      ( FLY-2PPL-VERIFY ?auto_8531 ?auto_8532 ?auto_8530 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8612 - PERSON
      ?auto_8611 - CITY
    )
    :vars
    (
      ?auto_8614 - FLEVEL
      ?auto_8617 - FLEVEL
      ?auto_8616 - CITY
      ?auto_8615 - PERSON
      ?auto_8613 - CITY
      ?auto_8618 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8614 ?auto_8617 ) ( not ( = ?auto_8611 ?auto_8616 ) ) ( not ( = ?auto_8617 ?auto_8614 ) ) ( not ( = ?auto_8615 ?auto_8612 ) ) ( PERSON-AT ?auto_8612 ?auto_8616 ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8616 ?auto_8613 ) ) ( PERSON-AT ?auto_8615 ?auto_8613 ) ( AIRCRAFT-AT ?auto_8618 ?auto_8611 ) ( FUEL-LEVEL ?auto_8618 ?auto_8617 ) )
    :subtasks
    ( ( !FLY ?auto_8618 ?auto_8611 ?auto_8613 ?auto_8617 ?auto_8614 )
      ( FLY-2PPL ?auto_8615 ?auto_8612 ?auto_8611 )
      ( FLY-1PPL-VERIFY ?auto_8612 ?auto_8611 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8620 - PERSON
      ?auto_8621 - PERSON
      ?auto_8619 - CITY
    )
    :vars
    (
      ?auto_8623 - FLEVEL
      ?auto_8624 - FLEVEL
      ?auto_8626 - CITY
      ?auto_8625 - CITY
      ?auto_8622 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8623 ?auto_8624 ) ( not ( = ?auto_8619 ?auto_8626 ) ) ( not ( = ?auto_8624 ?auto_8623 ) ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( PERSON-AT ?auto_8621 ?auto_8626 ) ( not ( = ?auto_8619 ?auto_8625 ) ) ( not ( = ?auto_8626 ?auto_8625 ) ) ( PERSON-AT ?auto_8620 ?auto_8625 ) ( AIRCRAFT-AT ?auto_8622 ?auto_8619 ) ( FUEL-LEVEL ?auto_8622 ?auto_8624 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8621 ?auto_8619 )
      ( FLY-2PPL-VERIFY ?auto_8620 ?auto_8621 ?auto_8619 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8628 - PERSON
      ?auto_8629 - PERSON
      ?auto_8627 - CITY
    )
    :vars
    (
      ?auto_8630 - FLEVEL
      ?auto_8633 - FLEVEL
      ?auto_8634 - CITY
      ?auto_8631 - CITY
      ?auto_8632 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8630 ?auto_8633 ) ( not ( = ?auto_8627 ?auto_8634 ) ) ( not ( = ?auto_8633 ?auto_8630 ) ) ( not ( = ?auto_8629 ?auto_8628 ) ) ( PERSON-AT ?auto_8628 ?auto_8634 ) ( not ( = ?auto_8627 ?auto_8631 ) ) ( not ( = ?auto_8634 ?auto_8631 ) ) ( PERSON-AT ?auto_8629 ?auto_8631 ) ( AIRCRAFT-AT ?auto_8632 ?auto_8627 ) ( FUEL-LEVEL ?auto_8632 ?auto_8633 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8629 ?auto_8628 ?auto_8627 )
      ( FLY-2PPL-VERIFY ?auto_8628 ?auto_8629 ?auto_8627 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8709 - PERSON
      ?auto_8708 - CITY
    )
    :vars
    (
      ?auto_8710 - FLEVEL
      ?auto_8713 - FLEVEL
      ?auto_8715 - CITY
      ?auto_8714 - PERSON
      ?auto_8711 - CITY
      ?auto_8712 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8710 ?auto_8713 ) ( not ( = ?auto_8708 ?auto_8715 ) ) ( not ( = ?auto_8713 ?auto_8710 ) ) ( not ( = ?auto_8714 ?auto_8709 ) ) ( PERSON-AT ?auto_8709 ?auto_8715 ) ( not ( = ?auto_8708 ?auto_8711 ) ) ( not ( = ?auto_8715 ?auto_8711 ) ) ( PERSON-AT ?auto_8714 ?auto_8711 ) ( AIRCRAFT-AT ?auto_8712 ?auto_8708 ) ( FUEL-LEVEL ?auto_8712 ?auto_8710 ) )
    :subtasks
    ( ( !REFUEL ?auto_8712 ?auto_8708 ?auto_8710 ?auto_8713 )
      ( FLY-2PPL ?auto_8714 ?auto_8709 ?auto_8708 )
      ( FLY-1PPL-VERIFY ?auto_8709 ?auto_8708 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8717 - PERSON
      ?auto_8718 - PERSON
      ?auto_8716 - CITY
    )
    :vars
    (
      ?auto_8719 - FLEVEL
      ?auto_8722 - FLEVEL
      ?auto_8720 - CITY
      ?auto_8721 - CITY
      ?auto_8723 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8719 ?auto_8722 ) ( not ( = ?auto_8716 ?auto_8720 ) ) ( not ( = ?auto_8722 ?auto_8719 ) ) ( not ( = ?auto_8717 ?auto_8718 ) ) ( PERSON-AT ?auto_8718 ?auto_8720 ) ( not ( = ?auto_8716 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( PERSON-AT ?auto_8717 ?auto_8721 ) ( AIRCRAFT-AT ?auto_8723 ?auto_8716 ) ( FUEL-LEVEL ?auto_8723 ?auto_8719 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8718 ?auto_8716 )
      ( FLY-2PPL-VERIFY ?auto_8717 ?auto_8718 ?auto_8716 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8725 - PERSON
      ?auto_8726 - PERSON
      ?auto_8724 - CITY
    )
    :vars
    (
      ?auto_8728 - FLEVEL
      ?auto_8729 - FLEVEL
      ?auto_8731 - CITY
      ?auto_8727 - CITY
      ?auto_8730 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8728 ?auto_8729 ) ( not ( = ?auto_8724 ?auto_8731 ) ) ( not ( = ?auto_8729 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8725 ) ) ( PERSON-AT ?auto_8725 ?auto_8731 ) ( not ( = ?auto_8724 ?auto_8727 ) ) ( not ( = ?auto_8731 ?auto_8727 ) ) ( PERSON-AT ?auto_8726 ?auto_8727 ) ( AIRCRAFT-AT ?auto_8730 ?auto_8724 ) ( FUEL-LEVEL ?auto_8730 ?auto_8728 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8726 ?auto_8725 ?auto_8724 )
      ( FLY-2PPL-VERIFY ?auto_8725 ?auto_8726 ?auto_8724 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_8899 - PERSON
      ?auto_8898 - CITY
    )
    :vars
    (
      ?auto_8900 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8899 ?auto_8900 ) ( AIRCRAFT-AT ?auto_8900 ?auto_8898 ) )
    :subtasks
    ( ( !DEBARK ?auto_8899 ?auto_8900 ?auto_8898 )
      ( FLY-1PPL-VERIFY ?auto_8899 ?auto_8898 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8902 - PERSON
      ?auto_8903 - PERSON
      ?auto_8901 - CITY
    )
    :vars
    (
      ?auto_8904 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8903 ?auto_8904 ) ( AIRCRAFT-AT ?auto_8904 ?auto_8901 ) ( PERSON-AT ?auto_8902 ?auto_8901 ) ( not ( = ?auto_8902 ?auto_8903 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8903 ?auto_8901 )
      ( FLY-2PPL-VERIFY ?auto_8902 ?auto_8903 ?auto_8901 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8906 - PERSON
      ?auto_8907 - PERSON
      ?auto_8905 - CITY
    )
    :vars
    (
      ?auto_8908 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8907 ?auto_8908 ) ( AIRCRAFT-AT ?auto_8908 ?auto_8905 ) ( PERSON-AT ?auto_8906 ?auto_8905 ) ( not ( = ?auto_8906 ?auto_8907 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8907 ?auto_8905 )
      ( FLY-2PPL-VERIFY ?auto_8906 ?auto_8907 ?auto_8905 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8910 - PERSON
      ?auto_8911 - PERSON
      ?auto_8909 - CITY
    )
    :vars
    (
      ?auto_8912 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8910 ?auto_8912 ) ( AIRCRAFT-AT ?auto_8912 ?auto_8909 ) ( PERSON-AT ?auto_8911 ?auto_8909 ) ( not ( = ?auto_8910 ?auto_8911 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8910 ?auto_8909 )
      ( FLY-2PPL-VERIFY ?auto_8910 ?auto_8911 ?auto_8909 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_8914 - PERSON
      ?auto_8915 - PERSON
      ?auto_8913 - CITY
    )
    :vars
    (
      ?auto_8916 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8914 ?auto_8916 ) ( AIRCRAFT-AT ?auto_8916 ?auto_8913 ) ( PERSON-AT ?auto_8915 ?auto_8913 ) ( not ( = ?auto_8914 ?auto_8915 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8914 ?auto_8913 )
      ( FLY-2PPL-VERIFY ?auto_8914 ?auto_8915 ?auto_8913 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8922 - PERSON
      ?auto_8923 - PERSON
      ?auto_8924 - PERSON
      ?auto_8921 - CITY
    )
    :vars
    (
      ?auto_8925 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8924 ?auto_8925 ) ( AIRCRAFT-AT ?auto_8925 ?auto_8921 ) ( PERSON-AT ?auto_8922 ?auto_8921 ) ( PERSON-AT ?auto_8923 ?auto_8921 ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8922 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8924 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8924 ?auto_8921 )
      ( FLY-3PPL-VERIFY ?auto_8922 ?auto_8923 ?auto_8924 ?auto_8921 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8927 - PERSON
      ?auto_8928 - PERSON
      ?auto_8929 - PERSON
      ?auto_8926 - CITY
    )
    :vars
    (
      ?auto_8930 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8929 ?auto_8930 ) ( AIRCRAFT-AT ?auto_8930 ?auto_8926 ) ( PERSON-AT ?auto_8927 ?auto_8926 ) ( PERSON-AT ?auto_8928 ?auto_8926 ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8929 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8929 ?auto_8926 )
      ( FLY-3PPL-VERIFY ?auto_8927 ?auto_8928 ?auto_8929 ?auto_8926 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8932 - PERSON
      ?auto_8933 - PERSON
      ?auto_8934 - PERSON
      ?auto_8931 - CITY
    )
    :vars
    (
      ?auto_8935 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8933 ?auto_8935 ) ( AIRCRAFT-AT ?auto_8935 ?auto_8931 ) ( PERSON-AT ?auto_8932 ?auto_8931 ) ( PERSON-AT ?auto_8934 ?auto_8931 ) ( not ( = ?auto_8932 ?auto_8933 ) ) ( not ( = ?auto_8932 ?auto_8934 ) ) ( not ( = ?auto_8933 ?auto_8934 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8933 ?auto_8931 )
      ( FLY-3PPL-VERIFY ?auto_8932 ?auto_8933 ?auto_8934 ?auto_8931 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8937 - PERSON
      ?auto_8938 - PERSON
      ?auto_8939 - PERSON
      ?auto_8936 - CITY
    )
    :vars
    (
      ?auto_8940 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8938 ?auto_8940 ) ( AIRCRAFT-AT ?auto_8940 ?auto_8936 ) ( PERSON-AT ?auto_8937 ?auto_8936 ) ( PERSON-AT ?auto_8939 ?auto_8936 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8938 ?auto_8936 )
      ( FLY-3PPL-VERIFY ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8936 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8947 - PERSON
      ?auto_8948 - PERSON
      ?auto_8949 - PERSON
      ?auto_8946 - CITY
    )
    :vars
    (
      ?auto_8950 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8949 ?auto_8950 ) ( AIRCRAFT-AT ?auto_8950 ?auto_8946 ) ( PERSON-AT ?auto_8947 ?auto_8946 ) ( PERSON-AT ?auto_8948 ?auto_8946 ) ( not ( = ?auto_8947 ?auto_8948 ) ) ( not ( = ?auto_8947 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8949 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8949 ?auto_8946 )
      ( FLY-3PPL-VERIFY ?auto_8947 ?auto_8948 ?auto_8949 ?auto_8946 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8952 - PERSON
      ?auto_8953 - PERSON
      ?auto_8954 - PERSON
      ?auto_8951 - CITY
    )
    :vars
    (
      ?auto_8955 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8954 ?auto_8955 ) ( AIRCRAFT-AT ?auto_8955 ?auto_8951 ) ( PERSON-AT ?auto_8952 ?auto_8951 ) ( PERSON-AT ?auto_8953 ?auto_8951 ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( not ( = ?auto_8952 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8954 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8954 ?auto_8951 )
      ( FLY-3PPL-VERIFY ?auto_8952 ?auto_8953 ?auto_8954 ?auto_8951 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8957 - PERSON
      ?auto_8958 - PERSON
      ?auto_8959 - PERSON
      ?auto_8956 - CITY
    )
    :vars
    (
      ?auto_8960 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8958 ?auto_8960 ) ( AIRCRAFT-AT ?auto_8960 ?auto_8956 ) ( PERSON-AT ?auto_8957 ?auto_8956 ) ( PERSON-AT ?auto_8959 ?auto_8956 ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( not ( = ?auto_8957 ?auto_8959 ) ) ( not ( = ?auto_8958 ?auto_8959 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8958 ?auto_8956 )
      ( FLY-3PPL-VERIFY ?auto_8957 ?auto_8958 ?auto_8959 ?auto_8956 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8962 - PERSON
      ?auto_8963 - PERSON
      ?auto_8964 - PERSON
      ?auto_8961 - CITY
    )
    :vars
    (
      ?auto_8965 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8963 ?auto_8965 ) ( AIRCRAFT-AT ?auto_8965 ?auto_8961 ) ( PERSON-AT ?auto_8962 ?auto_8961 ) ( PERSON-AT ?auto_8964 ?auto_8961 ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8964 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8963 ?auto_8961 )
      ( FLY-3PPL-VERIFY ?auto_8962 ?auto_8963 ?auto_8964 ?auto_8961 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8972 - PERSON
      ?auto_8973 - PERSON
      ?auto_8974 - PERSON
      ?auto_8971 - CITY
    )
    :vars
    (
      ?auto_8975 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8972 ?auto_8975 ) ( AIRCRAFT-AT ?auto_8975 ?auto_8971 ) ( PERSON-AT ?auto_8973 ?auto_8971 ) ( PERSON-AT ?auto_8974 ?auto_8971 ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8974 ) ) ( not ( = ?auto_8973 ?auto_8974 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8972 ?auto_8971 )
      ( FLY-3PPL-VERIFY ?auto_8972 ?auto_8973 ?auto_8974 ?auto_8971 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8977 - PERSON
      ?auto_8978 - PERSON
      ?auto_8979 - PERSON
      ?auto_8976 - CITY
    )
    :vars
    (
      ?auto_8980 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8977 ?auto_8980 ) ( AIRCRAFT-AT ?auto_8980 ?auto_8976 ) ( PERSON-AT ?auto_8978 ?auto_8976 ) ( PERSON-AT ?auto_8979 ?auto_8976 ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8977 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8979 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8977 ?auto_8976 )
      ( FLY-3PPL-VERIFY ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8976 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8987 - PERSON
      ?auto_8988 - PERSON
      ?auto_8989 - PERSON
      ?auto_8986 - CITY
    )
    :vars
    (
      ?auto_8990 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8987 ?auto_8990 ) ( AIRCRAFT-AT ?auto_8990 ?auto_8986 ) ( PERSON-AT ?auto_8988 ?auto_8986 ) ( PERSON-AT ?auto_8989 ?auto_8986 ) ( not ( = ?auto_8987 ?auto_8988 ) ) ( not ( = ?auto_8987 ?auto_8989 ) ) ( not ( = ?auto_8988 ?auto_8989 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8987 ?auto_8986 )
      ( FLY-3PPL-VERIFY ?auto_8987 ?auto_8988 ?auto_8989 ?auto_8986 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8992 - PERSON
      ?auto_8993 - PERSON
      ?auto_8994 - PERSON
      ?auto_8991 - CITY
    )
    :vars
    (
      ?auto_8995 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_8992 ?auto_8995 ) ( AIRCRAFT-AT ?auto_8995 ?auto_8991 ) ( PERSON-AT ?auto_8993 ?auto_8991 ) ( PERSON-AT ?auto_8994 ?auto_8991 ) ( not ( = ?auto_8992 ?auto_8993 ) ) ( not ( = ?auto_8992 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_8992 ?auto_8991 )
      ( FLY-3PPL-VERIFY ?auto_8992 ?auto_8993 ?auto_8994 ?auto_8991 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_9017 - PERSON
      ?auto_9016 - CITY
    )
    :vars
    (
      ?auto_9018 - AIRCRAFT
      ?auto_9021 - CITY
      ?auto_9019 - FLEVEL
      ?auto_9020 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9017 ?auto_9018 ) ( AIRCRAFT-AT ?auto_9018 ?auto_9021 ) ( FUEL-LEVEL ?auto_9018 ?auto_9019 ) ( NEXT ?auto_9020 ?auto_9019 ) ( not ( = ?auto_9016 ?auto_9021 ) ) ( not ( = ?auto_9019 ?auto_9020 ) ) )
    :subtasks
    ( ( !FLY ?auto_9018 ?auto_9021 ?auto_9016 ?auto_9019 ?auto_9020 )
      ( FLY-1PPL ?auto_9017 ?auto_9016 )
      ( FLY-1PPL-VERIFY ?auto_9017 ?auto_9016 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9023 - PERSON
      ?auto_9024 - PERSON
      ?auto_9022 - CITY
    )
    :vars
    (
      ?auto_9025 - AIRCRAFT
      ?auto_9027 - CITY
      ?auto_9026 - FLEVEL
      ?auto_9028 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9024 ?auto_9025 ) ( AIRCRAFT-AT ?auto_9025 ?auto_9027 ) ( FUEL-LEVEL ?auto_9025 ?auto_9026 ) ( NEXT ?auto_9028 ?auto_9026 ) ( not ( = ?auto_9022 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9028 ) ) ( PERSON-AT ?auto_9023 ?auto_9022 ) ( not ( = ?auto_9023 ?auto_9024 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_9024 ?auto_9022 )
      ( FLY-2PPL-VERIFY ?auto_9023 ?auto_9024 ?auto_9022 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9030 - PERSON
      ?auto_9031 - PERSON
      ?auto_9029 - CITY
    )
    :vars
    (
      ?auto_9033 - AIRCRAFT
      ?auto_9035 - CITY
      ?auto_9034 - FLEVEL
      ?auto_9032 - FLEVEL
      ?auto_9036 - PERSON
    )
    :precondition
    ( and ( IN ?auto_9031 ?auto_9033 ) ( AIRCRAFT-AT ?auto_9033 ?auto_9035 ) ( FUEL-LEVEL ?auto_9033 ?auto_9034 ) ( NEXT ?auto_9032 ?auto_9034 ) ( not ( = ?auto_9029 ?auto_9035 ) ) ( not ( = ?auto_9034 ?auto_9032 ) ) ( PERSON-AT ?auto_9036 ?auto_9029 ) ( not ( = ?auto_9036 ?auto_9031 ) ) ( PERSON-AT ?auto_9030 ?auto_9029 ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9036 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9036 ?auto_9031 ?auto_9029 )
      ( FLY-2PPL-VERIFY ?auto_9030 ?auto_9031 ?auto_9029 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9038 - PERSON
      ?auto_9039 - PERSON
      ?auto_9037 - CITY
    )
    :vars
    (
      ?auto_9041 - AIRCRAFT
      ?auto_9043 - CITY
      ?auto_9042 - FLEVEL
      ?auto_9040 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9038 ?auto_9041 ) ( AIRCRAFT-AT ?auto_9041 ?auto_9043 ) ( FUEL-LEVEL ?auto_9041 ?auto_9042 ) ( NEXT ?auto_9040 ?auto_9042 ) ( not ( = ?auto_9037 ?auto_9043 ) ) ( not ( = ?auto_9042 ?auto_9040 ) ) ( PERSON-AT ?auto_9039 ?auto_9037 ) ( not ( = ?auto_9039 ?auto_9038 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9039 ?auto_9038 ?auto_9037 )
      ( FLY-2PPL-VERIFY ?auto_9038 ?auto_9039 ?auto_9037 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9045 - PERSON
      ?auto_9046 - PERSON
      ?auto_9044 - CITY
    )
    :vars
    (
      ?auto_9048 - AIRCRAFT
      ?auto_9050 - CITY
      ?auto_9049 - FLEVEL
      ?auto_9047 - FLEVEL
      ?auto_9051 - PERSON
    )
    :precondition
    ( and ( IN ?auto_9045 ?auto_9048 ) ( AIRCRAFT-AT ?auto_9048 ?auto_9050 ) ( FUEL-LEVEL ?auto_9048 ?auto_9049 ) ( NEXT ?auto_9047 ?auto_9049 ) ( not ( = ?auto_9044 ?auto_9050 ) ) ( not ( = ?auto_9049 ?auto_9047 ) ) ( PERSON-AT ?auto_9051 ?auto_9044 ) ( not ( = ?auto_9051 ?auto_9045 ) ) ( PERSON-AT ?auto_9046 ?auto_9044 ) ( not ( = ?auto_9045 ?auto_9046 ) ) ( not ( = ?auto_9046 ?auto_9051 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9051 ?auto_9045 ?auto_9044 )
      ( FLY-2PPL-VERIFY ?auto_9045 ?auto_9046 ?auto_9044 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9061 - PERSON
      ?auto_9062 - PERSON
      ?auto_9063 - PERSON
      ?auto_9060 - CITY
    )
    :vars
    (
      ?auto_9065 - AIRCRAFT
      ?auto_9067 - CITY
      ?auto_9066 - FLEVEL
      ?auto_9064 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9063 ?auto_9065 ) ( AIRCRAFT-AT ?auto_9065 ?auto_9067 ) ( FUEL-LEVEL ?auto_9065 ?auto_9066 ) ( NEXT ?auto_9064 ?auto_9066 ) ( not ( = ?auto_9060 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9064 ) ) ( PERSON-AT ?auto_9062 ?auto_9060 ) ( not ( = ?auto_9062 ?auto_9063 ) ) ( PERSON-AT ?auto_9061 ?auto_9060 ) ( not ( = ?auto_9061 ?auto_9062 ) ) ( not ( = ?auto_9061 ?auto_9063 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9062 ?auto_9063 ?auto_9060 )
      ( FLY-3PPL-VERIFY ?auto_9061 ?auto_9062 ?auto_9063 ?auto_9060 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9069 - PERSON
      ?auto_9070 - PERSON
      ?auto_9071 - PERSON
      ?auto_9068 - CITY
    )
    :vars
    (
      ?auto_9073 - AIRCRAFT
      ?auto_9075 - CITY
      ?auto_9074 - FLEVEL
      ?auto_9072 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9071 ?auto_9073 ) ( AIRCRAFT-AT ?auto_9073 ?auto_9075 ) ( FUEL-LEVEL ?auto_9073 ?auto_9074 ) ( NEXT ?auto_9072 ?auto_9074 ) ( not ( = ?auto_9068 ?auto_9075 ) ) ( not ( = ?auto_9074 ?auto_9072 ) ) ( PERSON-AT ?auto_9069 ?auto_9068 ) ( not ( = ?auto_9069 ?auto_9071 ) ) ( PERSON-AT ?auto_9070 ?auto_9068 ) ( not ( = ?auto_9069 ?auto_9070 ) ) ( not ( = ?auto_9070 ?auto_9071 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9069 ?auto_9071 ?auto_9068 )
      ( FLY-3PPL-VERIFY ?auto_9069 ?auto_9070 ?auto_9071 ?auto_9068 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9077 - PERSON
      ?auto_9078 - PERSON
      ?auto_9079 - PERSON
      ?auto_9076 - CITY
    )
    :vars
    (
      ?auto_9081 - AIRCRAFT
      ?auto_9083 - CITY
      ?auto_9082 - FLEVEL
      ?auto_9080 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9078 ?auto_9081 ) ( AIRCRAFT-AT ?auto_9081 ?auto_9083 ) ( FUEL-LEVEL ?auto_9081 ?auto_9082 ) ( NEXT ?auto_9080 ?auto_9082 ) ( not ( = ?auto_9076 ?auto_9083 ) ) ( not ( = ?auto_9082 ?auto_9080 ) ) ( PERSON-AT ?auto_9079 ?auto_9076 ) ( not ( = ?auto_9079 ?auto_9078 ) ) ( PERSON-AT ?auto_9077 ?auto_9076 ) ( not ( = ?auto_9077 ?auto_9078 ) ) ( not ( = ?auto_9077 ?auto_9079 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9079 ?auto_9078 ?auto_9076 )
      ( FLY-3PPL-VERIFY ?auto_9077 ?auto_9078 ?auto_9079 ?auto_9076 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9085 - PERSON
      ?auto_9086 - PERSON
      ?auto_9087 - PERSON
      ?auto_9084 - CITY
    )
    :vars
    (
      ?auto_9089 - AIRCRAFT
      ?auto_9091 - CITY
      ?auto_9090 - FLEVEL
      ?auto_9088 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9086 ?auto_9089 ) ( AIRCRAFT-AT ?auto_9089 ?auto_9091 ) ( FUEL-LEVEL ?auto_9089 ?auto_9090 ) ( NEXT ?auto_9088 ?auto_9090 ) ( not ( = ?auto_9084 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9088 ) ) ( PERSON-AT ?auto_9085 ?auto_9084 ) ( not ( = ?auto_9085 ?auto_9086 ) ) ( PERSON-AT ?auto_9087 ?auto_9084 ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9086 ?auto_9087 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9085 ?auto_9086 ?auto_9084 )
      ( FLY-3PPL-VERIFY ?auto_9085 ?auto_9086 ?auto_9087 ?auto_9084 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9101 - PERSON
      ?auto_9102 - PERSON
      ?auto_9103 - PERSON
      ?auto_9100 - CITY
    )
    :vars
    (
      ?auto_9105 - AIRCRAFT
      ?auto_9107 - CITY
      ?auto_9106 - FLEVEL
      ?auto_9104 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9103 ?auto_9105 ) ( AIRCRAFT-AT ?auto_9105 ?auto_9107 ) ( FUEL-LEVEL ?auto_9105 ?auto_9106 ) ( NEXT ?auto_9104 ?auto_9106 ) ( not ( = ?auto_9100 ?auto_9107 ) ) ( not ( = ?auto_9106 ?auto_9104 ) ) ( PERSON-AT ?auto_9102 ?auto_9100 ) ( not ( = ?auto_9102 ?auto_9103 ) ) ( PERSON-AT ?auto_9101 ?auto_9100 ) ( not ( = ?auto_9101 ?auto_9102 ) ) ( not ( = ?auto_9101 ?auto_9103 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9102 ?auto_9103 ?auto_9100 )
      ( FLY-3PPL-VERIFY ?auto_9101 ?auto_9102 ?auto_9103 ?auto_9100 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9109 - PERSON
      ?auto_9110 - PERSON
      ?auto_9111 - PERSON
      ?auto_9108 - CITY
    )
    :vars
    (
      ?auto_9113 - AIRCRAFT
      ?auto_9115 - CITY
      ?auto_9114 - FLEVEL
      ?auto_9112 - FLEVEL
      ?auto_9116 - PERSON
    )
    :precondition
    ( and ( IN ?auto_9111 ?auto_9113 ) ( AIRCRAFT-AT ?auto_9113 ?auto_9115 ) ( FUEL-LEVEL ?auto_9113 ?auto_9114 ) ( NEXT ?auto_9112 ?auto_9114 ) ( not ( = ?auto_9108 ?auto_9115 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( PERSON-AT ?auto_9116 ?auto_9108 ) ( not ( = ?auto_9116 ?auto_9111 ) ) ( PERSON-AT ?auto_9109 ?auto_9108 ) ( PERSON-AT ?auto_9110 ?auto_9108 ) ( not ( = ?auto_9109 ?auto_9110 ) ) ( not ( = ?auto_9109 ?auto_9111 ) ) ( not ( = ?auto_9109 ?auto_9116 ) ) ( not ( = ?auto_9110 ?auto_9111 ) ) ( not ( = ?auto_9110 ?auto_9116 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9116 ?auto_9111 ?auto_9108 )
      ( FLY-3PPL-VERIFY ?auto_9109 ?auto_9110 ?auto_9111 ?auto_9108 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9118 - PERSON
      ?auto_9119 - PERSON
      ?auto_9120 - PERSON
      ?auto_9117 - CITY
    )
    :vars
    (
      ?auto_9122 - AIRCRAFT
      ?auto_9124 - CITY
      ?auto_9123 - FLEVEL
      ?auto_9121 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9119 ?auto_9122 ) ( AIRCRAFT-AT ?auto_9122 ?auto_9124 ) ( FUEL-LEVEL ?auto_9122 ?auto_9123 ) ( NEXT ?auto_9121 ?auto_9123 ) ( not ( = ?auto_9117 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9121 ) ) ( PERSON-AT ?auto_9120 ?auto_9117 ) ( not ( = ?auto_9120 ?auto_9119 ) ) ( PERSON-AT ?auto_9118 ?auto_9117 ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9120 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9120 ?auto_9119 ?auto_9117 )
      ( FLY-3PPL-VERIFY ?auto_9118 ?auto_9119 ?auto_9120 ?auto_9117 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9126 - PERSON
      ?auto_9127 - PERSON
      ?auto_9128 - PERSON
      ?auto_9125 - CITY
    )
    :vars
    (
      ?auto_9130 - AIRCRAFT
      ?auto_9132 - CITY
      ?auto_9131 - FLEVEL
      ?auto_9129 - FLEVEL
      ?auto_9133 - PERSON
    )
    :precondition
    ( and ( IN ?auto_9127 ?auto_9130 ) ( AIRCRAFT-AT ?auto_9130 ?auto_9132 ) ( FUEL-LEVEL ?auto_9130 ?auto_9131 ) ( NEXT ?auto_9129 ?auto_9131 ) ( not ( = ?auto_9125 ?auto_9132 ) ) ( not ( = ?auto_9131 ?auto_9129 ) ) ( PERSON-AT ?auto_9133 ?auto_9125 ) ( not ( = ?auto_9133 ?auto_9127 ) ) ( PERSON-AT ?auto_9126 ?auto_9125 ) ( PERSON-AT ?auto_9128 ?auto_9125 ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9133 ) ) ( not ( = ?auto_9127 ?auto_9128 ) ) ( not ( = ?auto_9128 ?auto_9133 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9133 ?auto_9127 ?auto_9125 )
      ( FLY-3PPL-VERIFY ?auto_9126 ?auto_9127 ?auto_9128 ?auto_9125 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9144 - PERSON
      ?auto_9145 - PERSON
      ?auto_9146 - PERSON
      ?auto_9143 - CITY
    )
    :vars
    (
      ?auto_9148 - AIRCRAFT
      ?auto_9150 - CITY
      ?auto_9149 - FLEVEL
      ?auto_9147 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9144 ?auto_9148 ) ( AIRCRAFT-AT ?auto_9148 ?auto_9150 ) ( FUEL-LEVEL ?auto_9148 ?auto_9149 ) ( NEXT ?auto_9147 ?auto_9149 ) ( not ( = ?auto_9143 ?auto_9150 ) ) ( not ( = ?auto_9149 ?auto_9147 ) ) ( PERSON-AT ?auto_9145 ?auto_9143 ) ( not ( = ?auto_9145 ?auto_9144 ) ) ( PERSON-AT ?auto_9146 ?auto_9143 ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( not ( = ?auto_9145 ?auto_9146 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9145 ?auto_9144 ?auto_9143 )
      ( FLY-3PPL-VERIFY ?auto_9144 ?auto_9145 ?auto_9146 ?auto_9143 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9152 - PERSON
      ?auto_9153 - PERSON
      ?auto_9154 - PERSON
      ?auto_9151 - CITY
    )
    :vars
    (
      ?auto_9156 - AIRCRAFT
      ?auto_9158 - CITY
      ?auto_9157 - FLEVEL
      ?auto_9155 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9152 ?auto_9156 ) ( AIRCRAFT-AT ?auto_9156 ?auto_9158 ) ( FUEL-LEVEL ?auto_9156 ?auto_9157 ) ( NEXT ?auto_9155 ?auto_9157 ) ( not ( = ?auto_9151 ?auto_9158 ) ) ( not ( = ?auto_9157 ?auto_9155 ) ) ( PERSON-AT ?auto_9153 ?auto_9151 ) ( not ( = ?auto_9153 ?auto_9152 ) ) ( PERSON-AT ?auto_9154 ?auto_9151 ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9153 ?auto_9152 ?auto_9151 )
      ( FLY-3PPL-VERIFY ?auto_9152 ?auto_9153 ?auto_9154 ?auto_9151 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9168 - PERSON
      ?auto_9169 - PERSON
      ?auto_9170 - PERSON
      ?auto_9167 - CITY
    )
    :vars
    (
      ?auto_9172 - AIRCRAFT
      ?auto_9174 - CITY
      ?auto_9173 - FLEVEL
      ?auto_9171 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_9168 ?auto_9172 ) ( AIRCRAFT-AT ?auto_9172 ?auto_9174 ) ( FUEL-LEVEL ?auto_9172 ?auto_9173 ) ( NEXT ?auto_9171 ?auto_9173 ) ( not ( = ?auto_9167 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9171 ) ) ( PERSON-AT ?auto_9170 ?auto_9167 ) ( not ( = ?auto_9170 ?auto_9168 ) ) ( PERSON-AT ?auto_9169 ?auto_9167 ) ( not ( = ?auto_9168 ?auto_9169 ) ) ( not ( = ?auto_9169 ?auto_9170 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9170 ?auto_9168 ?auto_9167 )
      ( FLY-3PPL-VERIFY ?auto_9168 ?auto_9169 ?auto_9170 ?auto_9167 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9176 - PERSON
      ?auto_9177 - PERSON
      ?auto_9178 - PERSON
      ?auto_9175 - CITY
    )
    :vars
    (
      ?auto_9180 - AIRCRAFT
      ?auto_9182 - CITY
      ?auto_9181 - FLEVEL
      ?auto_9179 - FLEVEL
      ?auto_9183 - PERSON
    )
    :precondition
    ( and ( IN ?auto_9176 ?auto_9180 ) ( AIRCRAFT-AT ?auto_9180 ?auto_9182 ) ( FUEL-LEVEL ?auto_9180 ?auto_9181 ) ( NEXT ?auto_9179 ?auto_9181 ) ( not ( = ?auto_9175 ?auto_9182 ) ) ( not ( = ?auto_9181 ?auto_9179 ) ) ( PERSON-AT ?auto_9183 ?auto_9175 ) ( not ( = ?auto_9183 ?auto_9176 ) ) ( PERSON-AT ?auto_9177 ?auto_9175 ) ( PERSON-AT ?auto_9178 ?auto_9175 ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9183 ) ) ( not ( = ?auto_9178 ?auto_9183 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9183 ?auto_9176 ?auto_9175 )
      ( FLY-3PPL-VERIFY ?auto_9176 ?auto_9177 ?auto_9178 ?auto_9175 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_9220 - PERSON
      ?auto_9219 - CITY
    )
    :vars
    (
      ?auto_9222 - AIRCRAFT
      ?auto_9224 - CITY
      ?auto_9223 - FLEVEL
      ?auto_9221 - FLEVEL
      ?auto_9225 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9222 ?auto_9224 ) ( FUEL-LEVEL ?auto_9222 ?auto_9223 ) ( NEXT ?auto_9221 ?auto_9223 ) ( not ( = ?auto_9219 ?auto_9224 ) ) ( not ( = ?auto_9223 ?auto_9221 ) ) ( PERSON-AT ?auto_9225 ?auto_9219 ) ( not ( = ?auto_9225 ?auto_9220 ) ) ( PERSON-AT ?auto_9220 ?auto_9224 ) )
    :subtasks
    ( ( !BOARD ?auto_9220 ?auto_9222 ?auto_9224 )
      ( FLY-2PPL ?auto_9225 ?auto_9220 ?auto_9219 )
      ( FLY-1PPL-VERIFY ?auto_9220 ?auto_9219 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9227 - PERSON
      ?auto_9228 - PERSON
      ?auto_9226 - CITY
    )
    :vars
    (
      ?auto_9229 - AIRCRAFT
      ?auto_9231 - CITY
      ?auto_9232 - FLEVEL
      ?auto_9230 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9229 ?auto_9231 ) ( FUEL-LEVEL ?auto_9229 ?auto_9232 ) ( NEXT ?auto_9230 ?auto_9232 ) ( not ( = ?auto_9226 ?auto_9231 ) ) ( not ( = ?auto_9232 ?auto_9230 ) ) ( PERSON-AT ?auto_9227 ?auto_9226 ) ( not ( = ?auto_9227 ?auto_9228 ) ) ( PERSON-AT ?auto_9228 ?auto_9231 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_9228 ?auto_9226 )
      ( FLY-2PPL-VERIFY ?auto_9227 ?auto_9228 ?auto_9226 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9234 - PERSON
      ?auto_9235 - PERSON
      ?auto_9233 - CITY
    )
    :vars
    (
      ?auto_9238 - AIRCRAFT
      ?auto_9239 - CITY
      ?auto_9237 - FLEVEL
      ?auto_9236 - FLEVEL
      ?auto_9240 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9238 ?auto_9239 ) ( FUEL-LEVEL ?auto_9238 ?auto_9237 ) ( NEXT ?auto_9236 ?auto_9237 ) ( not ( = ?auto_9233 ?auto_9239 ) ) ( not ( = ?auto_9237 ?auto_9236 ) ) ( PERSON-AT ?auto_9240 ?auto_9233 ) ( not ( = ?auto_9240 ?auto_9235 ) ) ( PERSON-AT ?auto_9235 ?auto_9239 ) ( PERSON-AT ?auto_9234 ?auto_9233 ) ( not ( = ?auto_9234 ?auto_9235 ) ) ( not ( = ?auto_9234 ?auto_9240 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9240 ?auto_9235 ?auto_9233 )
      ( FLY-2PPL-VERIFY ?auto_9234 ?auto_9235 ?auto_9233 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9242 - PERSON
      ?auto_9243 - PERSON
      ?auto_9241 - CITY
    )
    :vars
    (
      ?auto_9246 - AIRCRAFT
      ?auto_9247 - CITY
      ?auto_9245 - FLEVEL
      ?auto_9244 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9246 ?auto_9247 ) ( FUEL-LEVEL ?auto_9246 ?auto_9245 ) ( NEXT ?auto_9244 ?auto_9245 ) ( not ( = ?auto_9241 ?auto_9247 ) ) ( not ( = ?auto_9245 ?auto_9244 ) ) ( PERSON-AT ?auto_9243 ?auto_9241 ) ( not ( = ?auto_9243 ?auto_9242 ) ) ( PERSON-AT ?auto_9242 ?auto_9247 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9243 ?auto_9242 ?auto_9241 )
      ( FLY-2PPL-VERIFY ?auto_9242 ?auto_9243 ?auto_9241 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9249 - PERSON
      ?auto_9250 - PERSON
      ?auto_9248 - CITY
    )
    :vars
    (
      ?auto_9253 - AIRCRAFT
      ?auto_9254 - CITY
      ?auto_9252 - FLEVEL
      ?auto_9251 - FLEVEL
      ?auto_9255 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9253 ?auto_9254 ) ( FUEL-LEVEL ?auto_9253 ?auto_9252 ) ( NEXT ?auto_9251 ?auto_9252 ) ( not ( = ?auto_9248 ?auto_9254 ) ) ( not ( = ?auto_9252 ?auto_9251 ) ) ( PERSON-AT ?auto_9255 ?auto_9248 ) ( not ( = ?auto_9255 ?auto_9249 ) ) ( PERSON-AT ?auto_9249 ?auto_9254 ) ( PERSON-AT ?auto_9250 ?auto_9248 ) ( not ( = ?auto_9249 ?auto_9250 ) ) ( not ( = ?auto_9250 ?auto_9255 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9255 ?auto_9249 ?auto_9248 )
      ( FLY-2PPL-VERIFY ?auto_9249 ?auto_9250 ?auto_9248 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9265 - PERSON
      ?auto_9266 - PERSON
      ?auto_9267 - PERSON
      ?auto_9264 - CITY
    )
    :vars
    (
      ?auto_9270 - AIRCRAFT
      ?auto_9271 - CITY
      ?auto_9269 - FLEVEL
      ?auto_9268 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9270 ?auto_9271 ) ( FUEL-LEVEL ?auto_9270 ?auto_9269 ) ( NEXT ?auto_9268 ?auto_9269 ) ( not ( = ?auto_9264 ?auto_9271 ) ) ( not ( = ?auto_9269 ?auto_9268 ) ) ( PERSON-AT ?auto_9266 ?auto_9264 ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( PERSON-AT ?auto_9267 ?auto_9271 ) ( PERSON-AT ?auto_9265 ?auto_9264 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9267 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9266 ?auto_9267 ?auto_9264 )
      ( FLY-3PPL-VERIFY ?auto_9265 ?auto_9266 ?auto_9267 ?auto_9264 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9273 - PERSON
      ?auto_9274 - PERSON
      ?auto_9275 - PERSON
      ?auto_9272 - CITY
    )
    :vars
    (
      ?auto_9278 - AIRCRAFT
      ?auto_9279 - CITY
      ?auto_9277 - FLEVEL
      ?auto_9276 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9278 ?auto_9279 ) ( FUEL-LEVEL ?auto_9278 ?auto_9277 ) ( NEXT ?auto_9276 ?auto_9277 ) ( not ( = ?auto_9272 ?auto_9279 ) ) ( not ( = ?auto_9277 ?auto_9276 ) ) ( PERSON-AT ?auto_9273 ?auto_9272 ) ( not ( = ?auto_9273 ?auto_9275 ) ) ( PERSON-AT ?auto_9275 ?auto_9279 ) ( PERSON-AT ?auto_9274 ?auto_9272 ) ( not ( = ?auto_9273 ?auto_9274 ) ) ( not ( = ?auto_9274 ?auto_9275 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9273 ?auto_9275 ?auto_9272 )
      ( FLY-3PPL-VERIFY ?auto_9273 ?auto_9274 ?auto_9275 ?auto_9272 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9281 - PERSON
      ?auto_9282 - PERSON
      ?auto_9283 - PERSON
      ?auto_9280 - CITY
    )
    :vars
    (
      ?auto_9286 - AIRCRAFT
      ?auto_9287 - CITY
      ?auto_9285 - FLEVEL
      ?auto_9284 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9286 ?auto_9287 ) ( FUEL-LEVEL ?auto_9286 ?auto_9285 ) ( NEXT ?auto_9284 ?auto_9285 ) ( not ( = ?auto_9280 ?auto_9287 ) ) ( not ( = ?auto_9285 ?auto_9284 ) ) ( PERSON-AT ?auto_9283 ?auto_9280 ) ( not ( = ?auto_9283 ?auto_9282 ) ) ( PERSON-AT ?auto_9282 ?auto_9287 ) ( PERSON-AT ?auto_9281 ?auto_9280 ) ( not ( = ?auto_9281 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9283 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9283 ?auto_9282 ?auto_9280 )
      ( FLY-3PPL-VERIFY ?auto_9281 ?auto_9282 ?auto_9283 ?auto_9280 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9289 - PERSON
      ?auto_9290 - PERSON
      ?auto_9291 - PERSON
      ?auto_9288 - CITY
    )
    :vars
    (
      ?auto_9294 - AIRCRAFT
      ?auto_9295 - CITY
      ?auto_9293 - FLEVEL
      ?auto_9292 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9294 ?auto_9295 ) ( FUEL-LEVEL ?auto_9294 ?auto_9293 ) ( NEXT ?auto_9292 ?auto_9293 ) ( not ( = ?auto_9288 ?auto_9295 ) ) ( not ( = ?auto_9293 ?auto_9292 ) ) ( PERSON-AT ?auto_9289 ?auto_9288 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( PERSON-AT ?auto_9290 ?auto_9295 ) ( PERSON-AT ?auto_9291 ?auto_9288 ) ( not ( = ?auto_9289 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9291 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9289 ?auto_9290 ?auto_9288 )
      ( FLY-3PPL-VERIFY ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9288 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9305 - PERSON
      ?auto_9306 - PERSON
      ?auto_9307 - PERSON
      ?auto_9304 - CITY
    )
    :vars
    (
      ?auto_9310 - AIRCRAFT
      ?auto_9311 - CITY
      ?auto_9309 - FLEVEL
      ?auto_9308 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9310 ?auto_9311 ) ( FUEL-LEVEL ?auto_9310 ?auto_9309 ) ( NEXT ?auto_9308 ?auto_9309 ) ( not ( = ?auto_9304 ?auto_9311 ) ) ( not ( = ?auto_9309 ?auto_9308 ) ) ( PERSON-AT ?auto_9306 ?auto_9304 ) ( not ( = ?auto_9306 ?auto_9307 ) ) ( PERSON-AT ?auto_9307 ?auto_9311 ) ( PERSON-AT ?auto_9305 ?auto_9304 ) ( not ( = ?auto_9305 ?auto_9306 ) ) ( not ( = ?auto_9305 ?auto_9307 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9306 ?auto_9307 ?auto_9304 )
      ( FLY-3PPL-VERIFY ?auto_9305 ?auto_9306 ?auto_9307 ?auto_9304 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9313 - PERSON
      ?auto_9314 - PERSON
      ?auto_9315 - PERSON
      ?auto_9312 - CITY
    )
    :vars
    (
      ?auto_9318 - AIRCRAFT
      ?auto_9319 - CITY
      ?auto_9317 - FLEVEL
      ?auto_9316 - FLEVEL
      ?auto_9320 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9318 ?auto_9319 ) ( FUEL-LEVEL ?auto_9318 ?auto_9317 ) ( NEXT ?auto_9316 ?auto_9317 ) ( not ( = ?auto_9312 ?auto_9319 ) ) ( not ( = ?auto_9317 ?auto_9316 ) ) ( PERSON-AT ?auto_9320 ?auto_9312 ) ( not ( = ?auto_9320 ?auto_9315 ) ) ( PERSON-AT ?auto_9315 ?auto_9319 ) ( PERSON-AT ?auto_9313 ?auto_9312 ) ( PERSON-AT ?auto_9314 ?auto_9312 ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9315 ) ) ( not ( = ?auto_9313 ?auto_9320 ) ) ( not ( = ?auto_9314 ?auto_9315 ) ) ( not ( = ?auto_9314 ?auto_9320 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9320 ?auto_9315 ?auto_9312 )
      ( FLY-3PPL-VERIFY ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9312 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9322 - PERSON
      ?auto_9323 - PERSON
      ?auto_9324 - PERSON
      ?auto_9321 - CITY
    )
    :vars
    (
      ?auto_9327 - AIRCRAFT
      ?auto_9328 - CITY
      ?auto_9326 - FLEVEL
      ?auto_9325 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9327 ?auto_9328 ) ( FUEL-LEVEL ?auto_9327 ?auto_9326 ) ( NEXT ?auto_9325 ?auto_9326 ) ( not ( = ?auto_9321 ?auto_9328 ) ) ( not ( = ?auto_9326 ?auto_9325 ) ) ( PERSON-AT ?auto_9324 ?auto_9321 ) ( not ( = ?auto_9324 ?auto_9323 ) ) ( PERSON-AT ?auto_9323 ?auto_9328 ) ( PERSON-AT ?auto_9322 ?auto_9321 ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9324 ?auto_9323 ?auto_9321 )
      ( FLY-3PPL-VERIFY ?auto_9322 ?auto_9323 ?auto_9324 ?auto_9321 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9330 - PERSON
      ?auto_9331 - PERSON
      ?auto_9332 - PERSON
      ?auto_9329 - CITY
    )
    :vars
    (
      ?auto_9335 - AIRCRAFT
      ?auto_9336 - CITY
      ?auto_9334 - FLEVEL
      ?auto_9333 - FLEVEL
      ?auto_9337 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9335 ?auto_9336 ) ( FUEL-LEVEL ?auto_9335 ?auto_9334 ) ( NEXT ?auto_9333 ?auto_9334 ) ( not ( = ?auto_9329 ?auto_9336 ) ) ( not ( = ?auto_9334 ?auto_9333 ) ) ( PERSON-AT ?auto_9337 ?auto_9329 ) ( not ( = ?auto_9337 ?auto_9331 ) ) ( PERSON-AT ?auto_9331 ?auto_9336 ) ( PERSON-AT ?auto_9330 ?auto_9329 ) ( PERSON-AT ?auto_9332 ?auto_9329 ) ( not ( = ?auto_9330 ?auto_9331 ) ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( not ( = ?auto_9330 ?auto_9337 ) ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( not ( = ?auto_9332 ?auto_9337 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9337 ?auto_9331 ?auto_9329 )
      ( FLY-3PPL-VERIFY ?auto_9330 ?auto_9331 ?auto_9332 ?auto_9329 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9348 - PERSON
      ?auto_9349 - PERSON
      ?auto_9350 - PERSON
      ?auto_9347 - CITY
    )
    :vars
    (
      ?auto_9353 - AIRCRAFT
      ?auto_9354 - CITY
      ?auto_9352 - FLEVEL
      ?auto_9351 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9353 ?auto_9354 ) ( FUEL-LEVEL ?auto_9353 ?auto_9352 ) ( NEXT ?auto_9351 ?auto_9352 ) ( not ( = ?auto_9347 ?auto_9354 ) ) ( not ( = ?auto_9352 ?auto_9351 ) ) ( PERSON-AT ?auto_9349 ?auto_9347 ) ( not ( = ?auto_9349 ?auto_9348 ) ) ( PERSON-AT ?auto_9348 ?auto_9354 ) ( PERSON-AT ?auto_9350 ?auto_9347 ) ( not ( = ?auto_9348 ?auto_9350 ) ) ( not ( = ?auto_9349 ?auto_9350 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9349 ?auto_9348 ?auto_9347 )
      ( FLY-3PPL-VERIFY ?auto_9348 ?auto_9349 ?auto_9350 ?auto_9347 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9356 - PERSON
      ?auto_9357 - PERSON
      ?auto_9358 - PERSON
      ?auto_9355 - CITY
    )
    :vars
    (
      ?auto_9361 - AIRCRAFT
      ?auto_9362 - CITY
      ?auto_9360 - FLEVEL
      ?auto_9359 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9361 ?auto_9362 ) ( FUEL-LEVEL ?auto_9361 ?auto_9360 ) ( NEXT ?auto_9359 ?auto_9360 ) ( not ( = ?auto_9355 ?auto_9362 ) ) ( not ( = ?auto_9360 ?auto_9359 ) ) ( PERSON-AT ?auto_9357 ?auto_9355 ) ( not ( = ?auto_9357 ?auto_9356 ) ) ( PERSON-AT ?auto_9356 ?auto_9362 ) ( PERSON-AT ?auto_9358 ?auto_9355 ) ( not ( = ?auto_9356 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9358 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9357 ?auto_9356 ?auto_9355 )
      ( FLY-3PPL-VERIFY ?auto_9356 ?auto_9357 ?auto_9358 ?auto_9355 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9372 - PERSON
      ?auto_9373 - PERSON
      ?auto_9374 - PERSON
      ?auto_9371 - CITY
    )
    :vars
    (
      ?auto_9377 - AIRCRAFT
      ?auto_9378 - CITY
      ?auto_9376 - FLEVEL
      ?auto_9375 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9377 ?auto_9378 ) ( FUEL-LEVEL ?auto_9377 ?auto_9376 ) ( NEXT ?auto_9375 ?auto_9376 ) ( not ( = ?auto_9371 ?auto_9378 ) ) ( not ( = ?auto_9376 ?auto_9375 ) ) ( PERSON-AT ?auto_9374 ?auto_9371 ) ( not ( = ?auto_9374 ?auto_9372 ) ) ( PERSON-AT ?auto_9372 ?auto_9378 ) ( PERSON-AT ?auto_9373 ?auto_9371 ) ( not ( = ?auto_9372 ?auto_9373 ) ) ( not ( = ?auto_9373 ?auto_9374 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9374 ?auto_9372 ?auto_9371 )
      ( FLY-3PPL-VERIFY ?auto_9372 ?auto_9373 ?auto_9374 ?auto_9371 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9380 - PERSON
      ?auto_9381 - PERSON
      ?auto_9382 - PERSON
      ?auto_9379 - CITY
    )
    :vars
    (
      ?auto_9385 - AIRCRAFT
      ?auto_9386 - CITY
      ?auto_9384 - FLEVEL
      ?auto_9383 - FLEVEL
      ?auto_9387 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9385 ?auto_9386 ) ( FUEL-LEVEL ?auto_9385 ?auto_9384 ) ( NEXT ?auto_9383 ?auto_9384 ) ( not ( = ?auto_9379 ?auto_9386 ) ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( PERSON-AT ?auto_9387 ?auto_9379 ) ( not ( = ?auto_9387 ?auto_9380 ) ) ( PERSON-AT ?auto_9380 ?auto_9386 ) ( PERSON-AT ?auto_9381 ?auto_9379 ) ( PERSON-AT ?auto_9382 ?auto_9379 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9387 ) ) ( not ( = ?auto_9382 ?auto_9387 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9387 ?auto_9380 ?auto_9379 )
      ( FLY-3PPL-VERIFY ?auto_9380 ?auto_9381 ?auto_9382 ?auto_9379 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_9424 - PERSON
      ?auto_9423 - CITY
    )
    :vars
    (
      ?auto_9427 - AIRCRAFT
      ?auto_9428 - CITY
      ?auto_9425 - FLEVEL
      ?auto_9426 - FLEVEL
      ?auto_9429 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9427 ?auto_9428 ) ( NEXT ?auto_9425 ?auto_9426 ) ( not ( = ?auto_9423 ?auto_9428 ) ) ( not ( = ?auto_9426 ?auto_9425 ) ) ( PERSON-AT ?auto_9429 ?auto_9423 ) ( not ( = ?auto_9429 ?auto_9424 ) ) ( PERSON-AT ?auto_9424 ?auto_9428 ) ( FUEL-LEVEL ?auto_9427 ?auto_9425 ) )
    :subtasks
    ( ( !REFUEL ?auto_9427 ?auto_9428 ?auto_9425 ?auto_9426 )
      ( FLY-2PPL ?auto_9429 ?auto_9424 ?auto_9423 )
      ( FLY-1PPL-VERIFY ?auto_9424 ?auto_9423 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9431 - PERSON
      ?auto_9432 - PERSON
      ?auto_9430 - CITY
    )
    :vars
    (
      ?auto_9434 - AIRCRAFT
      ?auto_9435 - CITY
      ?auto_9436 - FLEVEL
      ?auto_9433 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9434 ?auto_9435 ) ( NEXT ?auto_9436 ?auto_9433 ) ( not ( = ?auto_9430 ?auto_9435 ) ) ( not ( = ?auto_9433 ?auto_9436 ) ) ( PERSON-AT ?auto_9431 ?auto_9430 ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( PERSON-AT ?auto_9432 ?auto_9435 ) ( FUEL-LEVEL ?auto_9434 ?auto_9436 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_9432 ?auto_9430 )
      ( FLY-2PPL-VERIFY ?auto_9431 ?auto_9432 ?auto_9430 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9438 - PERSON
      ?auto_9439 - PERSON
      ?auto_9437 - CITY
    )
    :vars
    (
      ?auto_9441 - AIRCRAFT
      ?auto_9443 - CITY
      ?auto_9442 - FLEVEL
      ?auto_9440 - FLEVEL
      ?auto_9444 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9441 ?auto_9443 ) ( NEXT ?auto_9442 ?auto_9440 ) ( not ( = ?auto_9437 ?auto_9443 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( PERSON-AT ?auto_9444 ?auto_9437 ) ( not ( = ?auto_9444 ?auto_9439 ) ) ( PERSON-AT ?auto_9439 ?auto_9443 ) ( FUEL-LEVEL ?auto_9441 ?auto_9442 ) ( PERSON-AT ?auto_9438 ?auto_9437 ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9444 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9444 ?auto_9439 ?auto_9437 )
      ( FLY-2PPL-VERIFY ?auto_9438 ?auto_9439 ?auto_9437 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9446 - PERSON
      ?auto_9447 - PERSON
      ?auto_9445 - CITY
    )
    :vars
    (
      ?auto_9449 - AIRCRAFT
      ?auto_9451 - CITY
      ?auto_9450 - FLEVEL
      ?auto_9448 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9449 ?auto_9451 ) ( NEXT ?auto_9450 ?auto_9448 ) ( not ( = ?auto_9445 ?auto_9451 ) ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( PERSON-AT ?auto_9447 ?auto_9445 ) ( not ( = ?auto_9447 ?auto_9446 ) ) ( PERSON-AT ?auto_9446 ?auto_9451 ) ( FUEL-LEVEL ?auto_9449 ?auto_9450 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9447 ?auto_9446 ?auto_9445 )
      ( FLY-2PPL-VERIFY ?auto_9446 ?auto_9447 ?auto_9445 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9453 - PERSON
      ?auto_9454 - PERSON
      ?auto_9452 - CITY
    )
    :vars
    (
      ?auto_9456 - AIRCRAFT
      ?auto_9458 - CITY
      ?auto_9457 - FLEVEL
      ?auto_9455 - FLEVEL
      ?auto_9459 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9456 ?auto_9458 ) ( NEXT ?auto_9457 ?auto_9455 ) ( not ( = ?auto_9452 ?auto_9458 ) ) ( not ( = ?auto_9455 ?auto_9457 ) ) ( PERSON-AT ?auto_9459 ?auto_9452 ) ( not ( = ?auto_9459 ?auto_9453 ) ) ( PERSON-AT ?auto_9453 ?auto_9458 ) ( FUEL-LEVEL ?auto_9456 ?auto_9457 ) ( PERSON-AT ?auto_9454 ?auto_9452 ) ( not ( = ?auto_9453 ?auto_9454 ) ) ( not ( = ?auto_9454 ?auto_9459 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9459 ?auto_9453 ?auto_9452 )
      ( FLY-2PPL-VERIFY ?auto_9453 ?auto_9454 ?auto_9452 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9469 - PERSON
      ?auto_9470 - PERSON
      ?auto_9471 - PERSON
      ?auto_9468 - CITY
    )
    :vars
    (
      ?auto_9473 - AIRCRAFT
      ?auto_9475 - CITY
      ?auto_9474 - FLEVEL
      ?auto_9472 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9473 ?auto_9475 ) ( NEXT ?auto_9474 ?auto_9472 ) ( not ( = ?auto_9468 ?auto_9475 ) ) ( not ( = ?auto_9472 ?auto_9474 ) ) ( PERSON-AT ?auto_9470 ?auto_9468 ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( PERSON-AT ?auto_9471 ?auto_9475 ) ( FUEL-LEVEL ?auto_9473 ?auto_9474 ) ( PERSON-AT ?auto_9469 ?auto_9468 ) ( not ( = ?auto_9469 ?auto_9470 ) ) ( not ( = ?auto_9469 ?auto_9471 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9470 ?auto_9471 ?auto_9468 )
      ( FLY-3PPL-VERIFY ?auto_9469 ?auto_9470 ?auto_9471 ?auto_9468 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9477 - PERSON
      ?auto_9478 - PERSON
      ?auto_9479 - PERSON
      ?auto_9476 - CITY
    )
    :vars
    (
      ?auto_9481 - AIRCRAFT
      ?auto_9483 - CITY
      ?auto_9482 - FLEVEL
      ?auto_9480 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9481 ?auto_9483 ) ( NEXT ?auto_9482 ?auto_9480 ) ( not ( = ?auto_9476 ?auto_9483 ) ) ( not ( = ?auto_9480 ?auto_9482 ) ) ( PERSON-AT ?auto_9477 ?auto_9476 ) ( not ( = ?auto_9477 ?auto_9479 ) ) ( PERSON-AT ?auto_9479 ?auto_9483 ) ( FUEL-LEVEL ?auto_9481 ?auto_9482 ) ( PERSON-AT ?auto_9478 ?auto_9476 ) ( not ( = ?auto_9477 ?auto_9478 ) ) ( not ( = ?auto_9478 ?auto_9479 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9477 ?auto_9479 ?auto_9476 )
      ( FLY-3PPL-VERIFY ?auto_9477 ?auto_9478 ?auto_9479 ?auto_9476 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9485 - PERSON
      ?auto_9486 - PERSON
      ?auto_9487 - PERSON
      ?auto_9484 - CITY
    )
    :vars
    (
      ?auto_9489 - AIRCRAFT
      ?auto_9491 - CITY
      ?auto_9490 - FLEVEL
      ?auto_9488 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9489 ?auto_9491 ) ( NEXT ?auto_9490 ?auto_9488 ) ( not ( = ?auto_9484 ?auto_9491 ) ) ( not ( = ?auto_9488 ?auto_9490 ) ) ( PERSON-AT ?auto_9487 ?auto_9484 ) ( not ( = ?auto_9487 ?auto_9486 ) ) ( PERSON-AT ?auto_9486 ?auto_9491 ) ( FUEL-LEVEL ?auto_9489 ?auto_9490 ) ( PERSON-AT ?auto_9485 ?auto_9484 ) ( not ( = ?auto_9485 ?auto_9486 ) ) ( not ( = ?auto_9485 ?auto_9487 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9487 ?auto_9486 ?auto_9484 )
      ( FLY-3PPL-VERIFY ?auto_9485 ?auto_9486 ?auto_9487 ?auto_9484 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9493 - PERSON
      ?auto_9494 - PERSON
      ?auto_9495 - PERSON
      ?auto_9492 - CITY
    )
    :vars
    (
      ?auto_9497 - AIRCRAFT
      ?auto_9499 - CITY
      ?auto_9498 - FLEVEL
      ?auto_9496 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9497 ?auto_9499 ) ( NEXT ?auto_9498 ?auto_9496 ) ( not ( = ?auto_9492 ?auto_9499 ) ) ( not ( = ?auto_9496 ?auto_9498 ) ) ( PERSON-AT ?auto_9493 ?auto_9492 ) ( not ( = ?auto_9493 ?auto_9494 ) ) ( PERSON-AT ?auto_9494 ?auto_9499 ) ( FUEL-LEVEL ?auto_9497 ?auto_9498 ) ( PERSON-AT ?auto_9495 ?auto_9492 ) ( not ( = ?auto_9493 ?auto_9495 ) ) ( not ( = ?auto_9494 ?auto_9495 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9493 ?auto_9494 ?auto_9492 )
      ( FLY-3PPL-VERIFY ?auto_9493 ?auto_9494 ?auto_9495 ?auto_9492 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9509 - PERSON
      ?auto_9510 - PERSON
      ?auto_9511 - PERSON
      ?auto_9508 - CITY
    )
    :vars
    (
      ?auto_9513 - AIRCRAFT
      ?auto_9515 - CITY
      ?auto_9514 - FLEVEL
      ?auto_9512 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9513 ?auto_9515 ) ( NEXT ?auto_9514 ?auto_9512 ) ( not ( = ?auto_9508 ?auto_9515 ) ) ( not ( = ?auto_9512 ?auto_9514 ) ) ( PERSON-AT ?auto_9510 ?auto_9508 ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( PERSON-AT ?auto_9511 ?auto_9515 ) ( FUEL-LEVEL ?auto_9513 ?auto_9514 ) ( PERSON-AT ?auto_9509 ?auto_9508 ) ( not ( = ?auto_9509 ?auto_9510 ) ) ( not ( = ?auto_9509 ?auto_9511 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9510 ?auto_9511 ?auto_9508 )
      ( FLY-3PPL-VERIFY ?auto_9509 ?auto_9510 ?auto_9511 ?auto_9508 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9517 - PERSON
      ?auto_9518 - PERSON
      ?auto_9519 - PERSON
      ?auto_9516 - CITY
    )
    :vars
    (
      ?auto_9521 - AIRCRAFT
      ?auto_9523 - CITY
      ?auto_9522 - FLEVEL
      ?auto_9520 - FLEVEL
      ?auto_9524 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9521 ?auto_9523 ) ( NEXT ?auto_9522 ?auto_9520 ) ( not ( = ?auto_9516 ?auto_9523 ) ) ( not ( = ?auto_9520 ?auto_9522 ) ) ( PERSON-AT ?auto_9524 ?auto_9516 ) ( not ( = ?auto_9524 ?auto_9519 ) ) ( PERSON-AT ?auto_9519 ?auto_9523 ) ( FUEL-LEVEL ?auto_9521 ?auto_9522 ) ( PERSON-AT ?auto_9517 ?auto_9516 ) ( PERSON-AT ?auto_9518 ?auto_9516 ) ( not ( = ?auto_9517 ?auto_9518 ) ) ( not ( = ?auto_9517 ?auto_9519 ) ) ( not ( = ?auto_9517 ?auto_9524 ) ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( not ( = ?auto_9518 ?auto_9524 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9524 ?auto_9519 ?auto_9516 )
      ( FLY-3PPL-VERIFY ?auto_9517 ?auto_9518 ?auto_9519 ?auto_9516 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9526 - PERSON
      ?auto_9527 - PERSON
      ?auto_9528 - PERSON
      ?auto_9525 - CITY
    )
    :vars
    (
      ?auto_9530 - AIRCRAFT
      ?auto_9532 - CITY
      ?auto_9531 - FLEVEL
      ?auto_9529 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9530 ?auto_9532 ) ( NEXT ?auto_9531 ?auto_9529 ) ( not ( = ?auto_9525 ?auto_9532 ) ) ( not ( = ?auto_9529 ?auto_9531 ) ) ( PERSON-AT ?auto_9528 ?auto_9525 ) ( not ( = ?auto_9528 ?auto_9527 ) ) ( PERSON-AT ?auto_9527 ?auto_9532 ) ( FUEL-LEVEL ?auto_9530 ?auto_9531 ) ( PERSON-AT ?auto_9526 ?auto_9525 ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( not ( = ?auto_9526 ?auto_9528 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9528 ?auto_9527 ?auto_9525 )
      ( FLY-3PPL-VERIFY ?auto_9526 ?auto_9527 ?auto_9528 ?auto_9525 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9534 - PERSON
      ?auto_9535 - PERSON
      ?auto_9536 - PERSON
      ?auto_9533 - CITY
    )
    :vars
    (
      ?auto_9538 - AIRCRAFT
      ?auto_9540 - CITY
      ?auto_9539 - FLEVEL
      ?auto_9537 - FLEVEL
      ?auto_9541 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9538 ?auto_9540 ) ( NEXT ?auto_9539 ?auto_9537 ) ( not ( = ?auto_9533 ?auto_9540 ) ) ( not ( = ?auto_9537 ?auto_9539 ) ) ( PERSON-AT ?auto_9541 ?auto_9533 ) ( not ( = ?auto_9541 ?auto_9535 ) ) ( PERSON-AT ?auto_9535 ?auto_9540 ) ( FUEL-LEVEL ?auto_9538 ?auto_9539 ) ( PERSON-AT ?auto_9534 ?auto_9533 ) ( PERSON-AT ?auto_9536 ?auto_9533 ) ( not ( = ?auto_9534 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9536 ) ) ( not ( = ?auto_9534 ?auto_9541 ) ) ( not ( = ?auto_9535 ?auto_9536 ) ) ( not ( = ?auto_9536 ?auto_9541 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9541 ?auto_9535 ?auto_9533 )
      ( FLY-3PPL-VERIFY ?auto_9534 ?auto_9535 ?auto_9536 ?auto_9533 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9552 - PERSON
      ?auto_9553 - PERSON
      ?auto_9554 - PERSON
      ?auto_9551 - CITY
    )
    :vars
    (
      ?auto_9556 - AIRCRAFT
      ?auto_9558 - CITY
      ?auto_9557 - FLEVEL
      ?auto_9555 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9556 ?auto_9558 ) ( NEXT ?auto_9557 ?auto_9555 ) ( not ( = ?auto_9551 ?auto_9558 ) ) ( not ( = ?auto_9555 ?auto_9557 ) ) ( PERSON-AT ?auto_9553 ?auto_9551 ) ( not ( = ?auto_9553 ?auto_9552 ) ) ( PERSON-AT ?auto_9552 ?auto_9558 ) ( FUEL-LEVEL ?auto_9556 ?auto_9557 ) ( PERSON-AT ?auto_9554 ?auto_9551 ) ( not ( = ?auto_9552 ?auto_9554 ) ) ( not ( = ?auto_9553 ?auto_9554 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9553 ?auto_9552 ?auto_9551 )
      ( FLY-3PPL-VERIFY ?auto_9552 ?auto_9553 ?auto_9554 ?auto_9551 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9560 - PERSON
      ?auto_9561 - PERSON
      ?auto_9562 - PERSON
      ?auto_9559 - CITY
    )
    :vars
    (
      ?auto_9564 - AIRCRAFT
      ?auto_9566 - CITY
      ?auto_9565 - FLEVEL
      ?auto_9563 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9564 ?auto_9566 ) ( NEXT ?auto_9565 ?auto_9563 ) ( not ( = ?auto_9559 ?auto_9566 ) ) ( not ( = ?auto_9563 ?auto_9565 ) ) ( PERSON-AT ?auto_9561 ?auto_9559 ) ( not ( = ?auto_9561 ?auto_9560 ) ) ( PERSON-AT ?auto_9560 ?auto_9566 ) ( FUEL-LEVEL ?auto_9564 ?auto_9565 ) ( PERSON-AT ?auto_9562 ?auto_9559 ) ( not ( = ?auto_9560 ?auto_9562 ) ) ( not ( = ?auto_9561 ?auto_9562 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9561 ?auto_9560 ?auto_9559 )
      ( FLY-3PPL-VERIFY ?auto_9560 ?auto_9561 ?auto_9562 ?auto_9559 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9576 - PERSON
      ?auto_9577 - PERSON
      ?auto_9578 - PERSON
      ?auto_9575 - CITY
    )
    :vars
    (
      ?auto_9580 - AIRCRAFT
      ?auto_9582 - CITY
      ?auto_9581 - FLEVEL
      ?auto_9579 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9580 ?auto_9582 ) ( NEXT ?auto_9581 ?auto_9579 ) ( not ( = ?auto_9575 ?auto_9582 ) ) ( not ( = ?auto_9579 ?auto_9581 ) ) ( PERSON-AT ?auto_9578 ?auto_9575 ) ( not ( = ?auto_9578 ?auto_9576 ) ) ( PERSON-AT ?auto_9576 ?auto_9582 ) ( FUEL-LEVEL ?auto_9580 ?auto_9581 ) ( PERSON-AT ?auto_9577 ?auto_9575 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9577 ?auto_9578 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9578 ?auto_9576 ?auto_9575 )
      ( FLY-3PPL-VERIFY ?auto_9576 ?auto_9577 ?auto_9578 ?auto_9575 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9584 - PERSON
      ?auto_9585 - PERSON
      ?auto_9586 - PERSON
      ?auto_9583 - CITY
    )
    :vars
    (
      ?auto_9588 - AIRCRAFT
      ?auto_9590 - CITY
      ?auto_9589 - FLEVEL
      ?auto_9587 - FLEVEL
      ?auto_9591 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9588 ?auto_9590 ) ( NEXT ?auto_9589 ?auto_9587 ) ( not ( = ?auto_9583 ?auto_9590 ) ) ( not ( = ?auto_9587 ?auto_9589 ) ) ( PERSON-AT ?auto_9591 ?auto_9583 ) ( not ( = ?auto_9591 ?auto_9584 ) ) ( PERSON-AT ?auto_9584 ?auto_9590 ) ( FUEL-LEVEL ?auto_9588 ?auto_9589 ) ( PERSON-AT ?auto_9585 ?auto_9583 ) ( PERSON-AT ?auto_9586 ?auto_9583 ) ( not ( = ?auto_9584 ?auto_9585 ) ) ( not ( = ?auto_9584 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9591 ) ) ( not ( = ?auto_9586 ?auto_9591 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9591 ?auto_9584 ?auto_9583 )
      ( FLY-3PPL-VERIFY ?auto_9584 ?auto_9585 ?auto_9586 ?auto_9583 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_9628 - PERSON
      ?auto_9627 - CITY
    )
    :vars
    (
      ?auto_9631 - FLEVEL
      ?auto_9629 - FLEVEL
      ?auto_9632 - CITY
      ?auto_9633 - PERSON
      ?auto_9630 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9631 ?auto_9629 ) ( not ( = ?auto_9627 ?auto_9632 ) ) ( not ( = ?auto_9629 ?auto_9631 ) ) ( PERSON-AT ?auto_9633 ?auto_9627 ) ( not ( = ?auto_9633 ?auto_9628 ) ) ( PERSON-AT ?auto_9628 ?auto_9632 ) ( AIRCRAFT-AT ?auto_9630 ?auto_9627 ) ( FUEL-LEVEL ?auto_9630 ?auto_9629 ) )
    :subtasks
    ( ( !FLY ?auto_9630 ?auto_9627 ?auto_9632 ?auto_9629 ?auto_9631 )
      ( FLY-2PPL ?auto_9633 ?auto_9628 ?auto_9627 )
      ( FLY-1PPL-VERIFY ?auto_9628 ?auto_9627 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9635 - PERSON
      ?auto_9636 - PERSON
      ?auto_9634 - CITY
    )
    :vars
    (
      ?auto_9637 - FLEVEL
      ?auto_9638 - FLEVEL
      ?auto_9640 - CITY
      ?auto_9639 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9637 ?auto_9638 ) ( not ( = ?auto_9634 ?auto_9640 ) ) ( not ( = ?auto_9638 ?auto_9637 ) ) ( PERSON-AT ?auto_9635 ?auto_9634 ) ( not ( = ?auto_9635 ?auto_9636 ) ) ( PERSON-AT ?auto_9636 ?auto_9640 ) ( AIRCRAFT-AT ?auto_9639 ?auto_9634 ) ( FUEL-LEVEL ?auto_9639 ?auto_9638 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_9636 ?auto_9634 )
      ( FLY-2PPL-VERIFY ?auto_9635 ?auto_9636 ?auto_9634 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9642 - PERSON
      ?auto_9643 - PERSON
      ?auto_9641 - CITY
    )
    :vars
    (
      ?auto_9648 - FLEVEL
      ?auto_9647 - FLEVEL
      ?auto_9646 - CITY
      ?auto_9645 - PERSON
      ?auto_9644 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9648 ?auto_9647 ) ( not ( = ?auto_9641 ?auto_9646 ) ) ( not ( = ?auto_9647 ?auto_9648 ) ) ( PERSON-AT ?auto_9645 ?auto_9641 ) ( not ( = ?auto_9645 ?auto_9643 ) ) ( PERSON-AT ?auto_9643 ?auto_9646 ) ( AIRCRAFT-AT ?auto_9644 ?auto_9641 ) ( FUEL-LEVEL ?auto_9644 ?auto_9647 ) ( PERSON-AT ?auto_9642 ?auto_9641 ) ( not ( = ?auto_9642 ?auto_9643 ) ) ( not ( = ?auto_9642 ?auto_9645 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9645 ?auto_9643 ?auto_9641 )
      ( FLY-2PPL-VERIFY ?auto_9642 ?auto_9643 ?auto_9641 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9650 - PERSON
      ?auto_9651 - PERSON
      ?auto_9649 - CITY
    )
    :vars
    (
      ?auto_9655 - FLEVEL
      ?auto_9654 - FLEVEL
      ?auto_9653 - CITY
      ?auto_9652 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9655 ?auto_9654 ) ( not ( = ?auto_9649 ?auto_9653 ) ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( PERSON-AT ?auto_9651 ?auto_9649 ) ( not ( = ?auto_9651 ?auto_9650 ) ) ( PERSON-AT ?auto_9650 ?auto_9653 ) ( AIRCRAFT-AT ?auto_9652 ?auto_9649 ) ( FUEL-LEVEL ?auto_9652 ?auto_9654 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9651 ?auto_9650 ?auto_9649 )
      ( FLY-2PPL-VERIFY ?auto_9650 ?auto_9651 ?auto_9649 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9657 - PERSON
      ?auto_9658 - PERSON
      ?auto_9656 - CITY
    )
    :vars
    (
      ?auto_9663 - FLEVEL
      ?auto_9662 - FLEVEL
      ?auto_9661 - CITY
      ?auto_9660 - PERSON
      ?auto_9659 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9663 ?auto_9662 ) ( not ( = ?auto_9656 ?auto_9661 ) ) ( not ( = ?auto_9662 ?auto_9663 ) ) ( PERSON-AT ?auto_9660 ?auto_9656 ) ( not ( = ?auto_9660 ?auto_9657 ) ) ( PERSON-AT ?auto_9657 ?auto_9661 ) ( AIRCRAFT-AT ?auto_9659 ?auto_9656 ) ( FUEL-LEVEL ?auto_9659 ?auto_9662 ) ( PERSON-AT ?auto_9658 ?auto_9656 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9660 ?auto_9657 ?auto_9656 )
      ( FLY-2PPL-VERIFY ?auto_9657 ?auto_9658 ?auto_9656 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9673 - PERSON
      ?auto_9674 - PERSON
      ?auto_9675 - PERSON
      ?auto_9672 - CITY
    )
    :vars
    (
      ?auto_9679 - FLEVEL
      ?auto_9678 - FLEVEL
      ?auto_9677 - CITY
      ?auto_9676 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9679 ?auto_9678 ) ( not ( = ?auto_9672 ?auto_9677 ) ) ( not ( = ?auto_9678 ?auto_9679 ) ) ( PERSON-AT ?auto_9674 ?auto_9672 ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( PERSON-AT ?auto_9675 ?auto_9677 ) ( AIRCRAFT-AT ?auto_9676 ?auto_9672 ) ( FUEL-LEVEL ?auto_9676 ?auto_9678 ) ( PERSON-AT ?auto_9673 ?auto_9672 ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9674 ?auto_9675 ?auto_9672 )
      ( FLY-3PPL-VERIFY ?auto_9673 ?auto_9674 ?auto_9675 ?auto_9672 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9681 - PERSON
      ?auto_9682 - PERSON
      ?auto_9683 - PERSON
      ?auto_9680 - CITY
    )
    :vars
    (
      ?auto_9687 - FLEVEL
      ?auto_9686 - FLEVEL
      ?auto_9685 - CITY
      ?auto_9684 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9687 ?auto_9686 ) ( not ( = ?auto_9680 ?auto_9685 ) ) ( not ( = ?auto_9686 ?auto_9687 ) ) ( PERSON-AT ?auto_9681 ?auto_9680 ) ( not ( = ?auto_9681 ?auto_9683 ) ) ( PERSON-AT ?auto_9683 ?auto_9685 ) ( AIRCRAFT-AT ?auto_9684 ?auto_9680 ) ( FUEL-LEVEL ?auto_9684 ?auto_9686 ) ( PERSON-AT ?auto_9682 ?auto_9680 ) ( not ( = ?auto_9681 ?auto_9682 ) ) ( not ( = ?auto_9682 ?auto_9683 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9681 ?auto_9683 ?auto_9680 )
      ( FLY-3PPL-VERIFY ?auto_9681 ?auto_9682 ?auto_9683 ?auto_9680 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9689 - PERSON
      ?auto_9690 - PERSON
      ?auto_9691 - PERSON
      ?auto_9688 - CITY
    )
    :vars
    (
      ?auto_9695 - FLEVEL
      ?auto_9694 - FLEVEL
      ?auto_9693 - CITY
      ?auto_9692 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9695 ?auto_9694 ) ( not ( = ?auto_9688 ?auto_9693 ) ) ( not ( = ?auto_9694 ?auto_9695 ) ) ( PERSON-AT ?auto_9691 ?auto_9688 ) ( not ( = ?auto_9691 ?auto_9690 ) ) ( PERSON-AT ?auto_9690 ?auto_9693 ) ( AIRCRAFT-AT ?auto_9692 ?auto_9688 ) ( FUEL-LEVEL ?auto_9692 ?auto_9694 ) ( PERSON-AT ?auto_9689 ?auto_9688 ) ( not ( = ?auto_9689 ?auto_9690 ) ) ( not ( = ?auto_9689 ?auto_9691 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9691 ?auto_9690 ?auto_9688 )
      ( FLY-3PPL-VERIFY ?auto_9689 ?auto_9690 ?auto_9691 ?auto_9688 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9697 - PERSON
      ?auto_9698 - PERSON
      ?auto_9699 - PERSON
      ?auto_9696 - CITY
    )
    :vars
    (
      ?auto_9703 - FLEVEL
      ?auto_9702 - FLEVEL
      ?auto_9701 - CITY
      ?auto_9700 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9703 ?auto_9702 ) ( not ( = ?auto_9696 ?auto_9701 ) ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( PERSON-AT ?auto_9697 ?auto_9696 ) ( not ( = ?auto_9697 ?auto_9698 ) ) ( PERSON-AT ?auto_9698 ?auto_9701 ) ( AIRCRAFT-AT ?auto_9700 ?auto_9696 ) ( FUEL-LEVEL ?auto_9700 ?auto_9702 ) ( PERSON-AT ?auto_9699 ?auto_9696 ) ( not ( = ?auto_9697 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9699 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9697 ?auto_9698 ?auto_9696 )
      ( FLY-3PPL-VERIFY ?auto_9697 ?auto_9698 ?auto_9699 ?auto_9696 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9713 - PERSON
      ?auto_9714 - PERSON
      ?auto_9715 - PERSON
      ?auto_9712 - CITY
    )
    :vars
    (
      ?auto_9719 - FLEVEL
      ?auto_9718 - FLEVEL
      ?auto_9717 - CITY
      ?auto_9716 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9719 ?auto_9718 ) ( not ( = ?auto_9712 ?auto_9717 ) ) ( not ( = ?auto_9718 ?auto_9719 ) ) ( PERSON-AT ?auto_9714 ?auto_9712 ) ( not ( = ?auto_9714 ?auto_9715 ) ) ( PERSON-AT ?auto_9715 ?auto_9717 ) ( AIRCRAFT-AT ?auto_9716 ?auto_9712 ) ( FUEL-LEVEL ?auto_9716 ?auto_9718 ) ( PERSON-AT ?auto_9713 ?auto_9712 ) ( not ( = ?auto_9713 ?auto_9714 ) ) ( not ( = ?auto_9713 ?auto_9715 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9714 ?auto_9715 ?auto_9712 )
      ( FLY-3PPL-VERIFY ?auto_9713 ?auto_9714 ?auto_9715 ?auto_9712 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9721 - PERSON
      ?auto_9722 - PERSON
      ?auto_9723 - PERSON
      ?auto_9720 - CITY
    )
    :vars
    (
      ?auto_9728 - FLEVEL
      ?auto_9727 - FLEVEL
      ?auto_9726 - CITY
      ?auto_9725 - PERSON
      ?auto_9724 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9728 ?auto_9727 ) ( not ( = ?auto_9720 ?auto_9726 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( PERSON-AT ?auto_9725 ?auto_9720 ) ( not ( = ?auto_9725 ?auto_9723 ) ) ( PERSON-AT ?auto_9723 ?auto_9726 ) ( AIRCRAFT-AT ?auto_9724 ?auto_9720 ) ( FUEL-LEVEL ?auto_9724 ?auto_9727 ) ( PERSON-AT ?auto_9721 ?auto_9720 ) ( PERSON-AT ?auto_9722 ?auto_9720 ) ( not ( = ?auto_9721 ?auto_9722 ) ) ( not ( = ?auto_9721 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9725 ) ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9722 ?auto_9725 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9725 ?auto_9723 ?auto_9720 )
      ( FLY-3PPL-VERIFY ?auto_9721 ?auto_9722 ?auto_9723 ?auto_9720 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9730 - PERSON
      ?auto_9731 - PERSON
      ?auto_9732 - PERSON
      ?auto_9729 - CITY
    )
    :vars
    (
      ?auto_9736 - FLEVEL
      ?auto_9735 - FLEVEL
      ?auto_9734 - CITY
      ?auto_9733 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9736 ?auto_9735 ) ( not ( = ?auto_9729 ?auto_9734 ) ) ( not ( = ?auto_9735 ?auto_9736 ) ) ( PERSON-AT ?auto_9732 ?auto_9729 ) ( not ( = ?auto_9732 ?auto_9731 ) ) ( PERSON-AT ?auto_9731 ?auto_9734 ) ( AIRCRAFT-AT ?auto_9733 ?auto_9729 ) ( FUEL-LEVEL ?auto_9733 ?auto_9735 ) ( PERSON-AT ?auto_9730 ?auto_9729 ) ( not ( = ?auto_9730 ?auto_9731 ) ) ( not ( = ?auto_9730 ?auto_9732 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9732 ?auto_9731 ?auto_9729 )
      ( FLY-3PPL-VERIFY ?auto_9730 ?auto_9731 ?auto_9732 ?auto_9729 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9738 - PERSON
      ?auto_9739 - PERSON
      ?auto_9740 - PERSON
      ?auto_9737 - CITY
    )
    :vars
    (
      ?auto_9745 - FLEVEL
      ?auto_9744 - FLEVEL
      ?auto_9743 - CITY
      ?auto_9742 - PERSON
      ?auto_9741 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9745 ?auto_9744 ) ( not ( = ?auto_9737 ?auto_9743 ) ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( PERSON-AT ?auto_9742 ?auto_9737 ) ( not ( = ?auto_9742 ?auto_9739 ) ) ( PERSON-AT ?auto_9739 ?auto_9743 ) ( AIRCRAFT-AT ?auto_9741 ?auto_9737 ) ( FUEL-LEVEL ?auto_9741 ?auto_9744 ) ( PERSON-AT ?auto_9738 ?auto_9737 ) ( PERSON-AT ?auto_9740 ?auto_9737 ) ( not ( = ?auto_9738 ?auto_9739 ) ) ( not ( = ?auto_9738 ?auto_9740 ) ) ( not ( = ?auto_9738 ?auto_9742 ) ) ( not ( = ?auto_9739 ?auto_9740 ) ) ( not ( = ?auto_9740 ?auto_9742 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9742 ?auto_9739 ?auto_9737 )
      ( FLY-3PPL-VERIFY ?auto_9738 ?auto_9739 ?auto_9740 ?auto_9737 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9756 - PERSON
      ?auto_9757 - PERSON
      ?auto_9758 - PERSON
      ?auto_9755 - CITY
    )
    :vars
    (
      ?auto_9762 - FLEVEL
      ?auto_9761 - FLEVEL
      ?auto_9760 - CITY
      ?auto_9759 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9762 ?auto_9761 ) ( not ( = ?auto_9755 ?auto_9760 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( PERSON-AT ?auto_9757 ?auto_9755 ) ( not ( = ?auto_9757 ?auto_9756 ) ) ( PERSON-AT ?auto_9756 ?auto_9760 ) ( AIRCRAFT-AT ?auto_9759 ?auto_9755 ) ( FUEL-LEVEL ?auto_9759 ?auto_9761 ) ( PERSON-AT ?auto_9758 ?auto_9755 ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9758 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9757 ?auto_9756 ?auto_9755 )
      ( FLY-3PPL-VERIFY ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9755 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9764 - PERSON
      ?auto_9765 - PERSON
      ?auto_9766 - PERSON
      ?auto_9763 - CITY
    )
    :vars
    (
      ?auto_9770 - FLEVEL
      ?auto_9769 - FLEVEL
      ?auto_9768 - CITY
      ?auto_9767 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9770 ?auto_9769 ) ( not ( = ?auto_9763 ?auto_9768 ) ) ( not ( = ?auto_9769 ?auto_9770 ) ) ( PERSON-AT ?auto_9765 ?auto_9763 ) ( not ( = ?auto_9765 ?auto_9764 ) ) ( PERSON-AT ?auto_9764 ?auto_9768 ) ( AIRCRAFT-AT ?auto_9767 ?auto_9763 ) ( FUEL-LEVEL ?auto_9767 ?auto_9769 ) ( PERSON-AT ?auto_9766 ?auto_9763 ) ( not ( = ?auto_9764 ?auto_9766 ) ) ( not ( = ?auto_9765 ?auto_9766 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9765 ?auto_9764 ?auto_9763 )
      ( FLY-3PPL-VERIFY ?auto_9764 ?auto_9765 ?auto_9766 ?auto_9763 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9780 - PERSON
      ?auto_9781 - PERSON
      ?auto_9782 - PERSON
      ?auto_9779 - CITY
    )
    :vars
    (
      ?auto_9786 - FLEVEL
      ?auto_9785 - FLEVEL
      ?auto_9784 - CITY
      ?auto_9783 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9786 ?auto_9785 ) ( not ( = ?auto_9779 ?auto_9784 ) ) ( not ( = ?auto_9785 ?auto_9786 ) ) ( PERSON-AT ?auto_9782 ?auto_9779 ) ( not ( = ?auto_9782 ?auto_9780 ) ) ( PERSON-AT ?auto_9780 ?auto_9784 ) ( AIRCRAFT-AT ?auto_9783 ?auto_9779 ) ( FUEL-LEVEL ?auto_9783 ?auto_9785 ) ( PERSON-AT ?auto_9781 ?auto_9779 ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( not ( = ?auto_9781 ?auto_9782 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9782 ?auto_9780 ?auto_9779 )
      ( FLY-3PPL-VERIFY ?auto_9780 ?auto_9781 ?auto_9782 ?auto_9779 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9788 - PERSON
      ?auto_9789 - PERSON
      ?auto_9790 - PERSON
      ?auto_9787 - CITY
    )
    :vars
    (
      ?auto_9795 - FLEVEL
      ?auto_9794 - FLEVEL
      ?auto_9793 - CITY
      ?auto_9792 - PERSON
      ?auto_9791 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9795 ?auto_9794 ) ( not ( = ?auto_9787 ?auto_9793 ) ) ( not ( = ?auto_9794 ?auto_9795 ) ) ( PERSON-AT ?auto_9792 ?auto_9787 ) ( not ( = ?auto_9792 ?auto_9788 ) ) ( PERSON-AT ?auto_9788 ?auto_9793 ) ( AIRCRAFT-AT ?auto_9791 ?auto_9787 ) ( FUEL-LEVEL ?auto_9791 ?auto_9794 ) ( PERSON-AT ?auto_9789 ?auto_9787 ) ( PERSON-AT ?auto_9790 ?auto_9787 ) ( not ( = ?auto_9788 ?auto_9789 ) ) ( not ( = ?auto_9788 ?auto_9790 ) ) ( not ( = ?auto_9789 ?auto_9790 ) ) ( not ( = ?auto_9789 ?auto_9792 ) ) ( not ( = ?auto_9790 ?auto_9792 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9792 ?auto_9788 ?auto_9787 )
      ( FLY-3PPL-VERIFY ?auto_9788 ?auto_9789 ?auto_9790 ?auto_9787 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_9832 - PERSON
      ?auto_9831 - CITY
    )
    :vars
    (
      ?auto_9837 - FLEVEL
      ?auto_9836 - FLEVEL
      ?auto_9835 - CITY
      ?auto_9834 - PERSON
      ?auto_9833 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9837 ?auto_9836 ) ( not ( = ?auto_9831 ?auto_9835 ) ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( PERSON-AT ?auto_9834 ?auto_9831 ) ( not ( = ?auto_9834 ?auto_9832 ) ) ( PERSON-AT ?auto_9832 ?auto_9835 ) ( AIRCRAFT-AT ?auto_9833 ?auto_9831 ) ( FUEL-LEVEL ?auto_9833 ?auto_9837 ) )
    :subtasks
    ( ( !REFUEL ?auto_9833 ?auto_9831 ?auto_9837 ?auto_9836 )
      ( FLY-2PPL ?auto_9834 ?auto_9832 ?auto_9831 )
      ( FLY-1PPL-VERIFY ?auto_9832 ?auto_9831 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9839 - PERSON
      ?auto_9840 - PERSON
      ?auto_9838 - CITY
    )
    :vars
    (
      ?auto_9843 - FLEVEL
      ?auto_9844 - FLEVEL
      ?auto_9841 - CITY
      ?auto_9842 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9843 ?auto_9844 ) ( not ( = ?auto_9838 ?auto_9841 ) ) ( not ( = ?auto_9844 ?auto_9843 ) ) ( PERSON-AT ?auto_9839 ?auto_9838 ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( PERSON-AT ?auto_9840 ?auto_9841 ) ( AIRCRAFT-AT ?auto_9842 ?auto_9838 ) ( FUEL-LEVEL ?auto_9842 ?auto_9843 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_9840 ?auto_9838 )
      ( FLY-2PPL-VERIFY ?auto_9839 ?auto_9840 ?auto_9838 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9846 - PERSON
      ?auto_9847 - PERSON
      ?auto_9845 - CITY
    )
    :vars
    (
      ?auto_9849 - FLEVEL
      ?auto_9851 - FLEVEL
      ?auto_9850 - CITY
      ?auto_9848 - PERSON
      ?auto_9852 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9849 ?auto_9851 ) ( not ( = ?auto_9845 ?auto_9850 ) ) ( not ( = ?auto_9851 ?auto_9849 ) ) ( PERSON-AT ?auto_9848 ?auto_9845 ) ( not ( = ?auto_9848 ?auto_9847 ) ) ( PERSON-AT ?auto_9847 ?auto_9850 ) ( AIRCRAFT-AT ?auto_9852 ?auto_9845 ) ( FUEL-LEVEL ?auto_9852 ?auto_9849 ) ( PERSON-AT ?auto_9846 ?auto_9845 ) ( not ( = ?auto_9846 ?auto_9847 ) ) ( not ( = ?auto_9846 ?auto_9848 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9848 ?auto_9847 ?auto_9845 )
      ( FLY-2PPL-VERIFY ?auto_9846 ?auto_9847 ?auto_9845 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9854 - PERSON
      ?auto_9855 - PERSON
      ?auto_9853 - CITY
    )
    :vars
    (
      ?auto_9856 - FLEVEL
      ?auto_9858 - FLEVEL
      ?auto_9857 - CITY
      ?auto_9859 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9856 ?auto_9858 ) ( not ( = ?auto_9853 ?auto_9857 ) ) ( not ( = ?auto_9858 ?auto_9856 ) ) ( PERSON-AT ?auto_9855 ?auto_9853 ) ( not ( = ?auto_9855 ?auto_9854 ) ) ( PERSON-AT ?auto_9854 ?auto_9857 ) ( AIRCRAFT-AT ?auto_9859 ?auto_9853 ) ( FUEL-LEVEL ?auto_9859 ?auto_9856 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9855 ?auto_9854 ?auto_9853 )
      ( FLY-2PPL-VERIFY ?auto_9854 ?auto_9855 ?auto_9853 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_9861 - PERSON
      ?auto_9862 - PERSON
      ?auto_9860 - CITY
    )
    :vars
    (
      ?auto_9864 - FLEVEL
      ?auto_9866 - FLEVEL
      ?auto_9865 - CITY
      ?auto_9863 - PERSON
      ?auto_9867 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9864 ?auto_9866 ) ( not ( = ?auto_9860 ?auto_9865 ) ) ( not ( = ?auto_9866 ?auto_9864 ) ) ( PERSON-AT ?auto_9863 ?auto_9860 ) ( not ( = ?auto_9863 ?auto_9861 ) ) ( PERSON-AT ?auto_9861 ?auto_9865 ) ( AIRCRAFT-AT ?auto_9867 ?auto_9860 ) ( FUEL-LEVEL ?auto_9867 ?auto_9864 ) ( PERSON-AT ?auto_9862 ?auto_9860 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9863 ?auto_9861 ?auto_9860 )
      ( FLY-2PPL-VERIFY ?auto_9861 ?auto_9862 ?auto_9860 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9877 - PERSON
      ?auto_9878 - PERSON
      ?auto_9879 - PERSON
      ?auto_9876 - CITY
    )
    :vars
    (
      ?auto_9880 - FLEVEL
      ?auto_9882 - FLEVEL
      ?auto_9881 - CITY
      ?auto_9883 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9880 ?auto_9882 ) ( not ( = ?auto_9876 ?auto_9881 ) ) ( not ( = ?auto_9882 ?auto_9880 ) ) ( PERSON-AT ?auto_9878 ?auto_9876 ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( PERSON-AT ?auto_9879 ?auto_9881 ) ( AIRCRAFT-AT ?auto_9883 ?auto_9876 ) ( FUEL-LEVEL ?auto_9883 ?auto_9880 ) ( PERSON-AT ?auto_9877 ?auto_9876 ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9878 ?auto_9879 ?auto_9876 )
      ( FLY-3PPL-VERIFY ?auto_9877 ?auto_9878 ?auto_9879 ?auto_9876 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9885 - PERSON
      ?auto_9886 - PERSON
      ?auto_9887 - PERSON
      ?auto_9884 - CITY
    )
    :vars
    (
      ?auto_9888 - FLEVEL
      ?auto_9890 - FLEVEL
      ?auto_9889 - CITY
      ?auto_9891 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9888 ?auto_9890 ) ( not ( = ?auto_9884 ?auto_9889 ) ) ( not ( = ?auto_9890 ?auto_9888 ) ) ( PERSON-AT ?auto_9885 ?auto_9884 ) ( not ( = ?auto_9885 ?auto_9887 ) ) ( PERSON-AT ?auto_9887 ?auto_9889 ) ( AIRCRAFT-AT ?auto_9891 ?auto_9884 ) ( FUEL-LEVEL ?auto_9891 ?auto_9888 ) ( PERSON-AT ?auto_9886 ?auto_9884 ) ( not ( = ?auto_9885 ?auto_9886 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9885 ?auto_9887 ?auto_9884 )
      ( FLY-3PPL-VERIFY ?auto_9885 ?auto_9886 ?auto_9887 ?auto_9884 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9893 - PERSON
      ?auto_9894 - PERSON
      ?auto_9895 - PERSON
      ?auto_9892 - CITY
    )
    :vars
    (
      ?auto_9896 - FLEVEL
      ?auto_9898 - FLEVEL
      ?auto_9897 - CITY
      ?auto_9899 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9896 ?auto_9898 ) ( not ( = ?auto_9892 ?auto_9897 ) ) ( not ( = ?auto_9898 ?auto_9896 ) ) ( PERSON-AT ?auto_9895 ?auto_9892 ) ( not ( = ?auto_9895 ?auto_9894 ) ) ( PERSON-AT ?auto_9894 ?auto_9897 ) ( AIRCRAFT-AT ?auto_9899 ?auto_9892 ) ( FUEL-LEVEL ?auto_9899 ?auto_9896 ) ( PERSON-AT ?auto_9893 ?auto_9892 ) ( not ( = ?auto_9893 ?auto_9894 ) ) ( not ( = ?auto_9893 ?auto_9895 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9895 ?auto_9894 ?auto_9892 )
      ( FLY-3PPL-VERIFY ?auto_9893 ?auto_9894 ?auto_9895 ?auto_9892 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9901 - PERSON
      ?auto_9902 - PERSON
      ?auto_9903 - PERSON
      ?auto_9900 - CITY
    )
    :vars
    (
      ?auto_9904 - FLEVEL
      ?auto_9906 - FLEVEL
      ?auto_9905 - CITY
      ?auto_9907 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9904 ?auto_9906 ) ( not ( = ?auto_9900 ?auto_9905 ) ) ( not ( = ?auto_9906 ?auto_9904 ) ) ( PERSON-AT ?auto_9901 ?auto_9900 ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( PERSON-AT ?auto_9902 ?auto_9905 ) ( AIRCRAFT-AT ?auto_9907 ?auto_9900 ) ( FUEL-LEVEL ?auto_9907 ?auto_9904 ) ( PERSON-AT ?auto_9903 ?auto_9900 ) ( not ( = ?auto_9901 ?auto_9903 ) ) ( not ( = ?auto_9902 ?auto_9903 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9901 ?auto_9902 ?auto_9900 )
      ( FLY-3PPL-VERIFY ?auto_9901 ?auto_9902 ?auto_9903 ?auto_9900 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9917 - PERSON
      ?auto_9918 - PERSON
      ?auto_9919 - PERSON
      ?auto_9916 - CITY
    )
    :vars
    (
      ?auto_9920 - FLEVEL
      ?auto_9922 - FLEVEL
      ?auto_9921 - CITY
      ?auto_9923 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9920 ?auto_9922 ) ( not ( = ?auto_9916 ?auto_9921 ) ) ( not ( = ?auto_9922 ?auto_9920 ) ) ( PERSON-AT ?auto_9918 ?auto_9916 ) ( not ( = ?auto_9918 ?auto_9919 ) ) ( PERSON-AT ?auto_9919 ?auto_9921 ) ( AIRCRAFT-AT ?auto_9923 ?auto_9916 ) ( FUEL-LEVEL ?auto_9923 ?auto_9920 ) ( PERSON-AT ?auto_9917 ?auto_9916 ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9918 ?auto_9919 ?auto_9916 )
      ( FLY-3PPL-VERIFY ?auto_9917 ?auto_9918 ?auto_9919 ?auto_9916 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9925 - PERSON
      ?auto_9926 - PERSON
      ?auto_9927 - PERSON
      ?auto_9924 - CITY
    )
    :vars
    (
      ?auto_9929 - FLEVEL
      ?auto_9931 - FLEVEL
      ?auto_9930 - CITY
      ?auto_9928 - PERSON
      ?auto_9932 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9929 ?auto_9931 ) ( not ( = ?auto_9924 ?auto_9930 ) ) ( not ( = ?auto_9931 ?auto_9929 ) ) ( PERSON-AT ?auto_9928 ?auto_9924 ) ( not ( = ?auto_9928 ?auto_9927 ) ) ( PERSON-AT ?auto_9927 ?auto_9930 ) ( AIRCRAFT-AT ?auto_9932 ?auto_9924 ) ( FUEL-LEVEL ?auto_9932 ?auto_9929 ) ( PERSON-AT ?auto_9925 ?auto_9924 ) ( PERSON-AT ?auto_9926 ?auto_9924 ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9925 ?auto_9927 ) ) ( not ( = ?auto_9925 ?auto_9928 ) ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9928 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9928 ?auto_9927 ?auto_9924 )
      ( FLY-3PPL-VERIFY ?auto_9925 ?auto_9926 ?auto_9927 ?auto_9924 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9934 - PERSON
      ?auto_9935 - PERSON
      ?auto_9936 - PERSON
      ?auto_9933 - CITY
    )
    :vars
    (
      ?auto_9937 - FLEVEL
      ?auto_9939 - FLEVEL
      ?auto_9938 - CITY
      ?auto_9940 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9937 ?auto_9939 ) ( not ( = ?auto_9933 ?auto_9938 ) ) ( not ( = ?auto_9939 ?auto_9937 ) ) ( PERSON-AT ?auto_9936 ?auto_9933 ) ( not ( = ?auto_9936 ?auto_9935 ) ) ( PERSON-AT ?auto_9935 ?auto_9938 ) ( AIRCRAFT-AT ?auto_9940 ?auto_9933 ) ( FUEL-LEVEL ?auto_9940 ?auto_9937 ) ( PERSON-AT ?auto_9934 ?auto_9933 ) ( not ( = ?auto_9934 ?auto_9935 ) ) ( not ( = ?auto_9934 ?auto_9936 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9936 ?auto_9935 ?auto_9933 )
      ( FLY-3PPL-VERIFY ?auto_9934 ?auto_9935 ?auto_9936 ?auto_9933 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9942 - PERSON
      ?auto_9943 - PERSON
      ?auto_9944 - PERSON
      ?auto_9941 - CITY
    )
    :vars
    (
      ?auto_9946 - FLEVEL
      ?auto_9948 - FLEVEL
      ?auto_9947 - CITY
      ?auto_9945 - PERSON
      ?auto_9949 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9946 ?auto_9948 ) ( not ( = ?auto_9941 ?auto_9947 ) ) ( not ( = ?auto_9948 ?auto_9946 ) ) ( PERSON-AT ?auto_9945 ?auto_9941 ) ( not ( = ?auto_9945 ?auto_9943 ) ) ( PERSON-AT ?auto_9943 ?auto_9947 ) ( AIRCRAFT-AT ?auto_9949 ?auto_9941 ) ( FUEL-LEVEL ?auto_9949 ?auto_9946 ) ( PERSON-AT ?auto_9942 ?auto_9941 ) ( PERSON-AT ?auto_9944 ?auto_9941 ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9944 ) ) ( not ( = ?auto_9942 ?auto_9945 ) ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9945 ?auto_9943 ?auto_9941 )
      ( FLY-3PPL-VERIFY ?auto_9942 ?auto_9943 ?auto_9944 ?auto_9941 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9960 - PERSON
      ?auto_9961 - PERSON
      ?auto_9962 - PERSON
      ?auto_9959 - CITY
    )
    :vars
    (
      ?auto_9963 - FLEVEL
      ?auto_9965 - FLEVEL
      ?auto_9964 - CITY
      ?auto_9966 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9963 ?auto_9965 ) ( not ( = ?auto_9959 ?auto_9964 ) ) ( not ( = ?auto_9965 ?auto_9963 ) ) ( PERSON-AT ?auto_9962 ?auto_9959 ) ( not ( = ?auto_9962 ?auto_9960 ) ) ( PERSON-AT ?auto_9960 ?auto_9964 ) ( AIRCRAFT-AT ?auto_9966 ?auto_9959 ) ( FUEL-LEVEL ?auto_9966 ?auto_9963 ) ( PERSON-AT ?auto_9961 ?auto_9959 ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( not ( = ?auto_9961 ?auto_9962 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9962 ?auto_9960 ?auto_9959 )
      ( FLY-3PPL-VERIFY ?auto_9960 ?auto_9961 ?auto_9962 ?auto_9959 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9968 - PERSON
      ?auto_9969 - PERSON
      ?auto_9970 - PERSON
      ?auto_9967 - CITY
    )
    :vars
    (
      ?auto_9971 - FLEVEL
      ?auto_9973 - FLEVEL
      ?auto_9972 - CITY
      ?auto_9974 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9971 ?auto_9973 ) ( not ( = ?auto_9967 ?auto_9972 ) ) ( not ( = ?auto_9973 ?auto_9971 ) ) ( PERSON-AT ?auto_9969 ?auto_9967 ) ( not ( = ?auto_9969 ?auto_9968 ) ) ( PERSON-AT ?auto_9968 ?auto_9972 ) ( AIRCRAFT-AT ?auto_9974 ?auto_9967 ) ( FUEL-LEVEL ?auto_9974 ?auto_9971 ) ( PERSON-AT ?auto_9970 ?auto_9967 ) ( not ( = ?auto_9968 ?auto_9970 ) ) ( not ( = ?auto_9969 ?auto_9970 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9969 ?auto_9968 ?auto_9967 )
      ( FLY-3PPL-VERIFY ?auto_9968 ?auto_9969 ?auto_9970 ?auto_9967 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9984 - PERSON
      ?auto_9985 - PERSON
      ?auto_9986 - PERSON
      ?auto_9983 - CITY
    )
    :vars
    (
      ?auto_9987 - FLEVEL
      ?auto_9989 - FLEVEL
      ?auto_9988 - CITY
      ?auto_9990 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9987 ?auto_9989 ) ( not ( = ?auto_9983 ?auto_9988 ) ) ( not ( = ?auto_9989 ?auto_9987 ) ) ( PERSON-AT ?auto_9986 ?auto_9983 ) ( not ( = ?auto_9986 ?auto_9984 ) ) ( PERSON-AT ?auto_9984 ?auto_9988 ) ( AIRCRAFT-AT ?auto_9990 ?auto_9983 ) ( FUEL-LEVEL ?auto_9990 ?auto_9987 ) ( PERSON-AT ?auto_9985 ?auto_9983 ) ( not ( = ?auto_9984 ?auto_9985 ) ) ( not ( = ?auto_9985 ?auto_9986 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9986 ?auto_9984 ?auto_9983 )
      ( FLY-3PPL-VERIFY ?auto_9984 ?auto_9985 ?auto_9986 ?auto_9983 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9992 - PERSON
      ?auto_9993 - PERSON
      ?auto_9994 - PERSON
      ?auto_9991 - CITY
    )
    :vars
    (
      ?auto_9996 - FLEVEL
      ?auto_9998 - FLEVEL
      ?auto_9997 - CITY
      ?auto_9995 - PERSON
      ?auto_9999 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9996 ?auto_9998 ) ( not ( = ?auto_9991 ?auto_9997 ) ) ( not ( = ?auto_9998 ?auto_9996 ) ) ( PERSON-AT ?auto_9995 ?auto_9991 ) ( not ( = ?auto_9995 ?auto_9992 ) ) ( PERSON-AT ?auto_9992 ?auto_9997 ) ( AIRCRAFT-AT ?auto_9999 ?auto_9991 ) ( FUEL-LEVEL ?auto_9999 ?auto_9996 ) ( PERSON-AT ?auto_9993 ?auto_9991 ) ( PERSON-AT ?auto_9994 ?auto_9991 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9995 ) ) ( not ( = ?auto_9994 ?auto_9995 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9995 ?auto_9992 ?auto_9991 )
      ( FLY-3PPL-VERIFY ?auto_9992 ?auto_9993 ?auto_9994 ?auto_9991 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_10036 - PERSON
      ?auto_10035 - CITY
    )
    :vars
    (
      ?auto_10038 - FLEVEL
      ?auto_10040 - FLEVEL
      ?auto_10039 - CITY
      ?auto_10037 - PERSON
      ?auto_10041 - AIRCRAFT
      ?auto_10042 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10038 ?auto_10040 ) ( not ( = ?auto_10035 ?auto_10039 ) ) ( not ( = ?auto_10040 ?auto_10038 ) ) ( PERSON-AT ?auto_10037 ?auto_10035 ) ( not ( = ?auto_10037 ?auto_10036 ) ) ( PERSON-AT ?auto_10036 ?auto_10039 ) ( AIRCRAFT-AT ?auto_10041 ?auto_10035 ) ( FUEL-LEVEL ?auto_10041 ?auto_10038 ) ( IN ?auto_10042 ?auto_10041 ) ( not ( = ?auto_10037 ?auto_10042 ) ) ( not ( = ?auto_10036 ?auto_10042 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10037 ?auto_10042 ?auto_10035 )
      ( FLY-2PPL ?auto_10037 ?auto_10036 ?auto_10035 )
      ( FLY-1PPL-VERIFY ?auto_10036 ?auto_10035 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10044 - PERSON
      ?auto_10045 - PERSON
      ?auto_10043 - CITY
    )
    :vars
    (
      ?auto_10047 - FLEVEL
      ?auto_10049 - FLEVEL
      ?auto_10050 - CITY
      ?auto_10046 - AIRCRAFT
      ?auto_10048 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10047 ?auto_10049 ) ( not ( = ?auto_10043 ?auto_10050 ) ) ( not ( = ?auto_10049 ?auto_10047 ) ) ( PERSON-AT ?auto_10044 ?auto_10043 ) ( not ( = ?auto_10044 ?auto_10045 ) ) ( PERSON-AT ?auto_10045 ?auto_10050 ) ( AIRCRAFT-AT ?auto_10046 ?auto_10043 ) ( FUEL-LEVEL ?auto_10046 ?auto_10047 ) ( IN ?auto_10048 ?auto_10046 ) ( not ( = ?auto_10044 ?auto_10048 ) ) ( not ( = ?auto_10045 ?auto_10048 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_10045 ?auto_10043 )
      ( FLY-2PPL-VERIFY ?auto_10044 ?auto_10045 ?auto_10043 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10052 - PERSON
      ?auto_10053 - PERSON
      ?auto_10051 - CITY
    )
    :vars
    (
      ?auto_10056 - FLEVEL
      ?auto_10057 - FLEVEL
      ?auto_10054 - CITY
      ?auto_10055 - PERSON
      ?auto_10058 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10056 ?auto_10057 ) ( not ( = ?auto_10051 ?auto_10054 ) ) ( not ( = ?auto_10057 ?auto_10056 ) ) ( PERSON-AT ?auto_10055 ?auto_10051 ) ( not ( = ?auto_10055 ?auto_10053 ) ) ( PERSON-AT ?auto_10053 ?auto_10054 ) ( AIRCRAFT-AT ?auto_10058 ?auto_10051 ) ( FUEL-LEVEL ?auto_10058 ?auto_10056 ) ( IN ?auto_10052 ?auto_10058 ) ( not ( = ?auto_10055 ?auto_10052 ) ) ( not ( = ?auto_10053 ?auto_10052 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10055 ?auto_10053 ?auto_10051 )
      ( FLY-2PPL-VERIFY ?auto_10052 ?auto_10053 ?auto_10051 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10060 - PERSON
      ?auto_10061 - PERSON
      ?auto_10059 - CITY
    )
    :vars
    (
      ?auto_10063 - FLEVEL
      ?auto_10064 - FLEVEL
      ?auto_10062 - CITY
      ?auto_10066 - AIRCRAFT
      ?auto_10065 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10063 ?auto_10064 ) ( not ( = ?auto_10059 ?auto_10062 ) ) ( not ( = ?auto_10064 ?auto_10063 ) ) ( PERSON-AT ?auto_10061 ?auto_10059 ) ( not ( = ?auto_10061 ?auto_10060 ) ) ( PERSON-AT ?auto_10060 ?auto_10062 ) ( AIRCRAFT-AT ?auto_10066 ?auto_10059 ) ( FUEL-LEVEL ?auto_10066 ?auto_10063 ) ( IN ?auto_10065 ?auto_10066 ) ( not ( = ?auto_10061 ?auto_10065 ) ) ( not ( = ?auto_10060 ?auto_10065 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10061 ?auto_10060 ?auto_10059 )
      ( FLY-2PPL-VERIFY ?auto_10060 ?auto_10061 ?auto_10059 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10068 - PERSON
      ?auto_10069 - PERSON
      ?auto_10067 - CITY
    )
    :vars
    (
      ?auto_10072 - FLEVEL
      ?auto_10073 - FLEVEL
      ?auto_10070 - CITY
      ?auto_10071 - PERSON
      ?auto_10074 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10072 ?auto_10073 ) ( not ( = ?auto_10067 ?auto_10070 ) ) ( not ( = ?auto_10073 ?auto_10072 ) ) ( PERSON-AT ?auto_10071 ?auto_10067 ) ( not ( = ?auto_10071 ?auto_10068 ) ) ( PERSON-AT ?auto_10068 ?auto_10070 ) ( AIRCRAFT-AT ?auto_10074 ?auto_10067 ) ( FUEL-LEVEL ?auto_10074 ?auto_10072 ) ( IN ?auto_10069 ?auto_10074 ) ( not ( = ?auto_10071 ?auto_10069 ) ) ( not ( = ?auto_10068 ?auto_10069 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10071 ?auto_10068 ?auto_10067 )
      ( FLY-2PPL-VERIFY ?auto_10068 ?auto_10069 ?auto_10067 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10085 - PERSON
      ?auto_10086 - PERSON
      ?auto_10087 - PERSON
      ?auto_10084 - CITY
    )
    :vars
    (
      ?auto_10089 - FLEVEL
      ?auto_10090 - FLEVEL
      ?auto_10088 - CITY
      ?auto_10092 - AIRCRAFT
      ?auto_10091 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10089 ?auto_10090 ) ( not ( = ?auto_10084 ?auto_10088 ) ) ( not ( = ?auto_10090 ?auto_10089 ) ) ( PERSON-AT ?auto_10085 ?auto_10084 ) ( not ( = ?auto_10085 ?auto_10087 ) ) ( PERSON-AT ?auto_10087 ?auto_10088 ) ( AIRCRAFT-AT ?auto_10092 ?auto_10084 ) ( FUEL-LEVEL ?auto_10092 ?auto_10089 ) ( IN ?auto_10091 ?auto_10092 ) ( not ( = ?auto_10085 ?auto_10091 ) ) ( not ( = ?auto_10087 ?auto_10091 ) ) ( PERSON-AT ?auto_10086 ?auto_10084 ) ( not ( = ?auto_10085 ?auto_10086 ) ) ( not ( = ?auto_10086 ?auto_10087 ) ) ( not ( = ?auto_10086 ?auto_10091 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10085 ?auto_10087 ?auto_10084 )
      ( FLY-3PPL-VERIFY ?auto_10085 ?auto_10086 ?auto_10087 ?auto_10084 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10094 - PERSON
      ?auto_10095 - PERSON
      ?auto_10096 - PERSON
      ?auto_10093 - CITY
    )
    :vars
    (
      ?auto_10098 - FLEVEL
      ?auto_10099 - FLEVEL
      ?auto_10097 - CITY
      ?auto_10100 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10098 ?auto_10099 ) ( not ( = ?auto_10093 ?auto_10097 ) ) ( not ( = ?auto_10099 ?auto_10098 ) ) ( PERSON-AT ?auto_10094 ?auto_10093 ) ( not ( = ?auto_10094 ?auto_10096 ) ) ( PERSON-AT ?auto_10096 ?auto_10097 ) ( AIRCRAFT-AT ?auto_10100 ?auto_10093 ) ( FUEL-LEVEL ?auto_10100 ?auto_10098 ) ( IN ?auto_10095 ?auto_10100 ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10096 ?auto_10095 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10094 ?auto_10096 ?auto_10093 )
      ( FLY-3PPL-VERIFY ?auto_10094 ?auto_10095 ?auto_10096 ?auto_10093 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10102 - PERSON
      ?auto_10103 - PERSON
      ?auto_10104 - PERSON
      ?auto_10101 - CITY
    )
    :vars
    (
      ?auto_10106 - FLEVEL
      ?auto_10107 - FLEVEL
      ?auto_10105 - CITY
      ?auto_10109 - AIRCRAFT
      ?auto_10108 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10106 ?auto_10107 ) ( not ( = ?auto_10101 ?auto_10105 ) ) ( not ( = ?auto_10107 ?auto_10106 ) ) ( PERSON-AT ?auto_10104 ?auto_10101 ) ( not ( = ?auto_10104 ?auto_10103 ) ) ( PERSON-AT ?auto_10103 ?auto_10105 ) ( AIRCRAFT-AT ?auto_10109 ?auto_10101 ) ( FUEL-LEVEL ?auto_10109 ?auto_10106 ) ( IN ?auto_10108 ?auto_10109 ) ( not ( = ?auto_10104 ?auto_10108 ) ) ( not ( = ?auto_10103 ?auto_10108 ) ) ( PERSON-AT ?auto_10102 ?auto_10101 ) ( not ( = ?auto_10102 ?auto_10103 ) ) ( not ( = ?auto_10102 ?auto_10104 ) ) ( not ( = ?auto_10102 ?auto_10108 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10104 ?auto_10103 ?auto_10101 )
      ( FLY-3PPL-VERIFY ?auto_10102 ?auto_10103 ?auto_10104 ?auto_10101 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10111 - PERSON
      ?auto_10112 - PERSON
      ?auto_10113 - PERSON
      ?auto_10110 - CITY
    )
    :vars
    (
      ?auto_10115 - FLEVEL
      ?auto_10116 - FLEVEL
      ?auto_10114 - CITY
      ?auto_10117 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10115 ?auto_10116 ) ( not ( = ?auto_10110 ?auto_10114 ) ) ( not ( = ?auto_10116 ?auto_10115 ) ) ( PERSON-AT ?auto_10111 ?auto_10110 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( PERSON-AT ?auto_10112 ?auto_10114 ) ( AIRCRAFT-AT ?auto_10117 ?auto_10110 ) ( FUEL-LEVEL ?auto_10117 ?auto_10115 ) ( IN ?auto_10113 ?auto_10117 ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10113 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10111 ?auto_10112 ?auto_10110 )
      ( FLY-3PPL-VERIFY ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10110 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10128 - PERSON
      ?auto_10129 - PERSON
      ?auto_10130 - PERSON
      ?auto_10127 - CITY
    )
    :vars
    (
      ?auto_10132 - FLEVEL
      ?auto_10133 - FLEVEL
      ?auto_10131 - CITY
      ?auto_10134 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10132 ?auto_10133 ) ( not ( = ?auto_10127 ?auto_10131 ) ) ( not ( = ?auto_10133 ?auto_10132 ) ) ( PERSON-AT ?auto_10129 ?auto_10127 ) ( not ( = ?auto_10129 ?auto_10130 ) ) ( PERSON-AT ?auto_10130 ?auto_10131 ) ( AIRCRAFT-AT ?auto_10134 ?auto_10127 ) ( FUEL-LEVEL ?auto_10134 ?auto_10132 ) ( IN ?auto_10128 ?auto_10134 ) ( not ( = ?auto_10129 ?auto_10128 ) ) ( not ( = ?auto_10130 ?auto_10128 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10129 ?auto_10130 ?auto_10127 )
      ( FLY-3PPL-VERIFY ?auto_10128 ?auto_10129 ?auto_10130 ?auto_10127 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10145 - PERSON
      ?auto_10146 - PERSON
      ?auto_10147 - PERSON
      ?auto_10144 - CITY
    )
    :vars
    (
      ?auto_10149 - FLEVEL
      ?auto_10150 - FLEVEL
      ?auto_10148 - CITY
      ?auto_10151 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10149 ?auto_10150 ) ( not ( = ?auto_10144 ?auto_10148 ) ) ( not ( = ?auto_10150 ?auto_10149 ) ) ( PERSON-AT ?auto_10147 ?auto_10144 ) ( not ( = ?auto_10147 ?auto_10146 ) ) ( PERSON-AT ?auto_10146 ?auto_10148 ) ( AIRCRAFT-AT ?auto_10151 ?auto_10144 ) ( FUEL-LEVEL ?auto_10151 ?auto_10149 ) ( IN ?auto_10145 ?auto_10151 ) ( not ( = ?auto_10147 ?auto_10145 ) ) ( not ( = ?auto_10146 ?auto_10145 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10147 ?auto_10146 ?auto_10144 )
      ( FLY-3PPL-VERIFY ?auto_10145 ?auto_10146 ?auto_10147 ?auto_10144 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10171 - PERSON
      ?auto_10172 - PERSON
      ?auto_10173 - PERSON
      ?auto_10170 - CITY
    )
    :vars
    (
      ?auto_10175 - FLEVEL
      ?auto_10176 - FLEVEL
      ?auto_10174 - CITY
      ?auto_10178 - AIRCRAFT
      ?auto_10177 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_10175 ?auto_10176 ) ( not ( = ?auto_10170 ?auto_10174 ) ) ( not ( = ?auto_10176 ?auto_10175 ) ) ( PERSON-AT ?auto_10172 ?auto_10170 ) ( not ( = ?auto_10172 ?auto_10171 ) ) ( PERSON-AT ?auto_10171 ?auto_10174 ) ( AIRCRAFT-AT ?auto_10178 ?auto_10170 ) ( FUEL-LEVEL ?auto_10178 ?auto_10175 ) ( IN ?auto_10177 ?auto_10178 ) ( not ( = ?auto_10172 ?auto_10177 ) ) ( not ( = ?auto_10171 ?auto_10177 ) ) ( PERSON-AT ?auto_10173 ?auto_10170 ) ( not ( = ?auto_10171 ?auto_10173 ) ) ( not ( = ?auto_10172 ?auto_10173 ) ) ( not ( = ?auto_10173 ?auto_10177 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10172 ?auto_10171 ?auto_10170 )
      ( FLY-3PPL-VERIFY ?auto_10171 ?auto_10172 ?auto_10173 ?auto_10170 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10180 - PERSON
      ?auto_10181 - PERSON
      ?auto_10182 - PERSON
      ?auto_10179 - CITY
    )
    :vars
    (
      ?auto_10184 - FLEVEL
      ?auto_10185 - FLEVEL
      ?auto_10183 - CITY
      ?auto_10186 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10184 ?auto_10185 ) ( not ( = ?auto_10179 ?auto_10183 ) ) ( not ( = ?auto_10185 ?auto_10184 ) ) ( PERSON-AT ?auto_10181 ?auto_10179 ) ( not ( = ?auto_10181 ?auto_10180 ) ) ( PERSON-AT ?auto_10180 ?auto_10183 ) ( AIRCRAFT-AT ?auto_10186 ?auto_10179 ) ( FUEL-LEVEL ?auto_10186 ?auto_10184 ) ( IN ?auto_10182 ?auto_10186 ) ( not ( = ?auto_10181 ?auto_10182 ) ) ( not ( = ?auto_10180 ?auto_10182 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10181 ?auto_10180 ?auto_10179 )
      ( FLY-3PPL-VERIFY ?auto_10180 ?auto_10181 ?auto_10182 ?auto_10179 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10197 - PERSON
      ?auto_10198 - PERSON
      ?auto_10199 - PERSON
      ?auto_10196 - CITY
    )
    :vars
    (
      ?auto_10201 - FLEVEL
      ?auto_10202 - FLEVEL
      ?auto_10200 - CITY
      ?auto_10203 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10201 ?auto_10202 ) ( not ( = ?auto_10196 ?auto_10200 ) ) ( not ( = ?auto_10202 ?auto_10201 ) ) ( PERSON-AT ?auto_10199 ?auto_10196 ) ( not ( = ?auto_10199 ?auto_10197 ) ) ( PERSON-AT ?auto_10197 ?auto_10200 ) ( AIRCRAFT-AT ?auto_10203 ?auto_10196 ) ( FUEL-LEVEL ?auto_10203 ?auto_10201 ) ( IN ?auto_10198 ?auto_10203 ) ( not ( = ?auto_10199 ?auto_10198 ) ) ( not ( = ?auto_10197 ?auto_10198 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10199 ?auto_10197 ?auto_10196 )
      ( FLY-3PPL-VERIFY ?auto_10197 ?auto_10198 ?auto_10199 ?auto_10196 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_10251 - PERSON
      ?auto_10250 - CITY
    )
    :vars
    (
      ?auto_10254 - FLEVEL
      ?auto_10255 - FLEVEL
      ?auto_10252 - CITY
      ?auto_10253 - PERSON
      ?auto_10256 - PERSON
      ?auto_10257 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10254 ?auto_10255 ) ( not ( = ?auto_10250 ?auto_10252 ) ) ( not ( = ?auto_10255 ?auto_10254 ) ) ( PERSON-AT ?auto_10253 ?auto_10250 ) ( not ( = ?auto_10253 ?auto_10251 ) ) ( PERSON-AT ?auto_10251 ?auto_10252 ) ( IN ?auto_10256 ?auto_10257 ) ( not ( = ?auto_10253 ?auto_10256 ) ) ( not ( = ?auto_10251 ?auto_10256 ) ) ( AIRCRAFT-AT ?auto_10257 ?auto_10252 ) ( FUEL-LEVEL ?auto_10257 ?auto_10255 ) )
    :subtasks
    ( ( !FLY ?auto_10257 ?auto_10252 ?auto_10250 ?auto_10255 ?auto_10254 )
      ( FLY-2PPL ?auto_10253 ?auto_10251 ?auto_10250 )
      ( FLY-1PPL-VERIFY ?auto_10251 ?auto_10250 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10259 - PERSON
      ?auto_10260 - PERSON
      ?auto_10258 - CITY
    )
    :vars
    (
      ?auto_10262 - FLEVEL
      ?auto_10264 - FLEVEL
      ?auto_10261 - CITY
      ?auto_10265 - PERSON
      ?auto_10263 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10262 ?auto_10264 ) ( not ( = ?auto_10258 ?auto_10261 ) ) ( not ( = ?auto_10264 ?auto_10262 ) ) ( PERSON-AT ?auto_10259 ?auto_10258 ) ( not ( = ?auto_10259 ?auto_10260 ) ) ( PERSON-AT ?auto_10260 ?auto_10261 ) ( IN ?auto_10265 ?auto_10263 ) ( not ( = ?auto_10259 ?auto_10265 ) ) ( not ( = ?auto_10260 ?auto_10265 ) ) ( AIRCRAFT-AT ?auto_10263 ?auto_10261 ) ( FUEL-LEVEL ?auto_10263 ?auto_10264 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_10260 ?auto_10258 )
      ( FLY-2PPL-VERIFY ?auto_10259 ?auto_10260 ?auto_10258 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10267 - PERSON
      ?auto_10268 - PERSON
      ?auto_10266 - CITY
    )
    :vars
    (
      ?auto_10269 - FLEVEL
      ?auto_10270 - FLEVEL
      ?auto_10273 - CITY
      ?auto_10272 - PERSON
      ?auto_10271 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10269 ?auto_10270 ) ( not ( = ?auto_10266 ?auto_10273 ) ) ( not ( = ?auto_10270 ?auto_10269 ) ) ( PERSON-AT ?auto_10272 ?auto_10266 ) ( not ( = ?auto_10272 ?auto_10268 ) ) ( PERSON-AT ?auto_10268 ?auto_10273 ) ( IN ?auto_10267 ?auto_10271 ) ( not ( = ?auto_10272 ?auto_10267 ) ) ( not ( = ?auto_10268 ?auto_10267 ) ) ( AIRCRAFT-AT ?auto_10271 ?auto_10273 ) ( FUEL-LEVEL ?auto_10271 ?auto_10270 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10272 ?auto_10268 ?auto_10266 )
      ( FLY-2PPL-VERIFY ?auto_10267 ?auto_10268 ?auto_10266 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10275 - PERSON
      ?auto_10276 - PERSON
      ?auto_10274 - CITY
    )
    :vars
    (
      ?auto_10277 - FLEVEL
      ?auto_10278 - FLEVEL
      ?auto_10280 - CITY
      ?auto_10281 - PERSON
      ?auto_10279 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10277 ?auto_10278 ) ( not ( = ?auto_10274 ?auto_10280 ) ) ( not ( = ?auto_10278 ?auto_10277 ) ) ( PERSON-AT ?auto_10276 ?auto_10274 ) ( not ( = ?auto_10276 ?auto_10275 ) ) ( PERSON-AT ?auto_10275 ?auto_10280 ) ( IN ?auto_10281 ?auto_10279 ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10275 ?auto_10281 ) ) ( AIRCRAFT-AT ?auto_10279 ?auto_10280 ) ( FUEL-LEVEL ?auto_10279 ?auto_10278 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10276 ?auto_10275 ?auto_10274 )
      ( FLY-2PPL-VERIFY ?auto_10275 ?auto_10276 ?auto_10274 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10283 - PERSON
      ?auto_10284 - PERSON
      ?auto_10282 - CITY
    )
    :vars
    (
      ?auto_10285 - FLEVEL
      ?auto_10286 - FLEVEL
      ?auto_10289 - CITY
      ?auto_10288 - PERSON
      ?auto_10287 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10285 ?auto_10286 ) ( not ( = ?auto_10282 ?auto_10289 ) ) ( not ( = ?auto_10286 ?auto_10285 ) ) ( PERSON-AT ?auto_10288 ?auto_10282 ) ( not ( = ?auto_10288 ?auto_10283 ) ) ( PERSON-AT ?auto_10283 ?auto_10289 ) ( IN ?auto_10284 ?auto_10287 ) ( not ( = ?auto_10288 ?auto_10284 ) ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( AIRCRAFT-AT ?auto_10287 ?auto_10289 ) ( FUEL-LEVEL ?auto_10287 ?auto_10286 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10288 ?auto_10283 ?auto_10282 )
      ( FLY-2PPL-VERIFY ?auto_10283 ?auto_10284 ?auto_10282 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10300 - PERSON
      ?auto_10301 - PERSON
      ?auto_10302 - PERSON
      ?auto_10299 - CITY
    )
    :vars
    (
      ?auto_10303 - FLEVEL
      ?auto_10304 - FLEVEL
      ?auto_10306 - CITY
      ?auto_10307 - PERSON
      ?auto_10305 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10303 ?auto_10304 ) ( not ( = ?auto_10299 ?auto_10306 ) ) ( not ( = ?auto_10304 ?auto_10303 ) ) ( PERSON-AT ?auto_10300 ?auto_10299 ) ( not ( = ?auto_10300 ?auto_10302 ) ) ( PERSON-AT ?auto_10302 ?auto_10306 ) ( IN ?auto_10307 ?auto_10305 ) ( not ( = ?auto_10300 ?auto_10307 ) ) ( not ( = ?auto_10302 ?auto_10307 ) ) ( AIRCRAFT-AT ?auto_10305 ?auto_10306 ) ( FUEL-LEVEL ?auto_10305 ?auto_10304 ) ( PERSON-AT ?auto_10301 ?auto_10299 ) ( not ( = ?auto_10300 ?auto_10301 ) ) ( not ( = ?auto_10301 ?auto_10302 ) ) ( not ( = ?auto_10301 ?auto_10307 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10300 ?auto_10302 ?auto_10299 )
      ( FLY-3PPL-VERIFY ?auto_10300 ?auto_10301 ?auto_10302 ?auto_10299 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10309 - PERSON
      ?auto_10310 - PERSON
      ?auto_10311 - PERSON
      ?auto_10308 - CITY
    )
    :vars
    (
      ?auto_10312 - FLEVEL
      ?auto_10313 - FLEVEL
      ?auto_10315 - CITY
      ?auto_10314 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10312 ?auto_10313 ) ( not ( = ?auto_10308 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10312 ) ) ( PERSON-AT ?auto_10309 ?auto_10308 ) ( not ( = ?auto_10309 ?auto_10311 ) ) ( PERSON-AT ?auto_10311 ?auto_10315 ) ( IN ?auto_10310 ?auto_10314 ) ( not ( = ?auto_10309 ?auto_10310 ) ) ( not ( = ?auto_10311 ?auto_10310 ) ) ( AIRCRAFT-AT ?auto_10314 ?auto_10315 ) ( FUEL-LEVEL ?auto_10314 ?auto_10313 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10309 ?auto_10311 ?auto_10308 )
      ( FLY-3PPL-VERIFY ?auto_10309 ?auto_10310 ?auto_10311 ?auto_10308 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10317 - PERSON
      ?auto_10318 - PERSON
      ?auto_10319 - PERSON
      ?auto_10316 - CITY
    )
    :vars
    (
      ?auto_10320 - FLEVEL
      ?auto_10321 - FLEVEL
      ?auto_10323 - CITY
      ?auto_10324 - PERSON
      ?auto_10322 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10320 ?auto_10321 ) ( not ( = ?auto_10316 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10320 ) ) ( PERSON-AT ?auto_10319 ?auto_10316 ) ( not ( = ?auto_10319 ?auto_10318 ) ) ( PERSON-AT ?auto_10318 ?auto_10323 ) ( IN ?auto_10324 ?auto_10322 ) ( not ( = ?auto_10319 ?auto_10324 ) ) ( not ( = ?auto_10318 ?auto_10324 ) ) ( AIRCRAFT-AT ?auto_10322 ?auto_10323 ) ( FUEL-LEVEL ?auto_10322 ?auto_10321 ) ( PERSON-AT ?auto_10317 ?auto_10316 ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10319 ) ) ( not ( = ?auto_10317 ?auto_10324 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10319 ?auto_10318 ?auto_10316 )
      ( FLY-3PPL-VERIFY ?auto_10317 ?auto_10318 ?auto_10319 ?auto_10316 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10326 - PERSON
      ?auto_10327 - PERSON
      ?auto_10328 - PERSON
      ?auto_10325 - CITY
    )
    :vars
    (
      ?auto_10329 - FLEVEL
      ?auto_10330 - FLEVEL
      ?auto_10332 - CITY
      ?auto_10331 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10329 ?auto_10330 ) ( not ( = ?auto_10325 ?auto_10332 ) ) ( not ( = ?auto_10330 ?auto_10329 ) ) ( PERSON-AT ?auto_10326 ?auto_10325 ) ( not ( = ?auto_10326 ?auto_10327 ) ) ( PERSON-AT ?auto_10327 ?auto_10332 ) ( IN ?auto_10328 ?auto_10331 ) ( not ( = ?auto_10326 ?auto_10328 ) ) ( not ( = ?auto_10327 ?auto_10328 ) ) ( AIRCRAFT-AT ?auto_10331 ?auto_10332 ) ( FUEL-LEVEL ?auto_10331 ?auto_10330 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10326 ?auto_10327 ?auto_10325 )
      ( FLY-3PPL-VERIFY ?auto_10326 ?auto_10327 ?auto_10328 ?auto_10325 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10343 - PERSON
      ?auto_10344 - PERSON
      ?auto_10345 - PERSON
      ?auto_10342 - CITY
    )
    :vars
    (
      ?auto_10346 - FLEVEL
      ?auto_10347 - FLEVEL
      ?auto_10349 - CITY
      ?auto_10348 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10346 ?auto_10347 ) ( not ( = ?auto_10342 ?auto_10349 ) ) ( not ( = ?auto_10347 ?auto_10346 ) ) ( PERSON-AT ?auto_10344 ?auto_10342 ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( PERSON-AT ?auto_10345 ?auto_10349 ) ( IN ?auto_10343 ?auto_10348 ) ( not ( = ?auto_10344 ?auto_10343 ) ) ( not ( = ?auto_10345 ?auto_10343 ) ) ( AIRCRAFT-AT ?auto_10348 ?auto_10349 ) ( FUEL-LEVEL ?auto_10348 ?auto_10347 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10344 ?auto_10345 ?auto_10342 )
      ( FLY-3PPL-VERIFY ?auto_10343 ?auto_10344 ?auto_10345 ?auto_10342 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10360 - PERSON
      ?auto_10361 - PERSON
      ?auto_10362 - PERSON
      ?auto_10359 - CITY
    )
    :vars
    (
      ?auto_10363 - FLEVEL
      ?auto_10364 - FLEVEL
      ?auto_10366 - CITY
      ?auto_10365 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10363 ?auto_10364 ) ( not ( = ?auto_10359 ?auto_10366 ) ) ( not ( = ?auto_10364 ?auto_10363 ) ) ( PERSON-AT ?auto_10362 ?auto_10359 ) ( not ( = ?auto_10362 ?auto_10361 ) ) ( PERSON-AT ?auto_10361 ?auto_10366 ) ( IN ?auto_10360 ?auto_10365 ) ( not ( = ?auto_10362 ?auto_10360 ) ) ( not ( = ?auto_10361 ?auto_10360 ) ) ( AIRCRAFT-AT ?auto_10365 ?auto_10366 ) ( FUEL-LEVEL ?auto_10365 ?auto_10364 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10362 ?auto_10361 ?auto_10359 )
      ( FLY-3PPL-VERIFY ?auto_10360 ?auto_10361 ?auto_10362 ?auto_10359 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10386 - PERSON
      ?auto_10387 - PERSON
      ?auto_10388 - PERSON
      ?auto_10385 - CITY
    )
    :vars
    (
      ?auto_10389 - FLEVEL
      ?auto_10390 - FLEVEL
      ?auto_10392 - CITY
      ?auto_10393 - PERSON
      ?auto_10391 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10389 ?auto_10390 ) ( not ( = ?auto_10385 ?auto_10392 ) ) ( not ( = ?auto_10390 ?auto_10389 ) ) ( PERSON-AT ?auto_10387 ?auto_10385 ) ( not ( = ?auto_10387 ?auto_10386 ) ) ( PERSON-AT ?auto_10386 ?auto_10392 ) ( IN ?auto_10393 ?auto_10391 ) ( not ( = ?auto_10387 ?auto_10393 ) ) ( not ( = ?auto_10386 ?auto_10393 ) ) ( AIRCRAFT-AT ?auto_10391 ?auto_10392 ) ( FUEL-LEVEL ?auto_10391 ?auto_10390 ) ( PERSON-AT ?auto_10388 ?auto_10385 ) ( not ( = ?auto_10386 ?auto_10388 ) ) ( not ( = ?auto_10387 ?auto_10388 ) ) ( not ( = ?auto_10388 ?auto_10393 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10387 ?auto_10386 ?auto_10385 )
      ( FLY-3PPL-VERIFY ?auto_10386 ?auto_10387 ?auto_10388 ?auto_10385 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10395 - PERSON
      ?auto_10396 - PERSON
      ?auto_10397 - PERSON
      ?auto_10394 - CITY
    )
    :vars
    (
      ?auto_10398 - FLEVEL
      ?auto_10399 - FLEVEL
      ?auto_10401 - CITY
      ?auto_10400 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10398 ?auto_10399 ) ( not ( = ?auto_10394 ?auto_10401 ) ) ( not ( = ?auto_10399 ?auto_10398 ) ) ( PERSON-AT ?auto_10396 ?auto_10394 ) ( not ( = ?auto_10396 ?auto_10395 ) ) ( PERSON-AT ?auto_10395 ?auto_10401 ) ( IN ?auto_10397 ?auto_10400 ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10395 ?auto_10397 ) ) ( AIRCRAFT-AT ?auto_10400 ?auto_10401 ) ( FUEL-LEVEL ?auto_10400 ?auto_10399 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10396 ?auto_10395 ?auto_10394 )
      ( FLY-3PPL-VERIFY ?auto_10395 ?auto_10396 ?auto_10397 ?auto_10394 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10412 - PERSON
      ?auto_10413 - PERSON
      ?auto_10414 - PERSON
      ?auto_10411 - CITY
    )
    :vars
    (
      ?auto_10415 - FLEVEL
      ?auto_10416 - FLEVEL
      ?auto_10418 - CITY
      ?auto_10417 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10415 ?auto_10416 ) ( not ( = ?auto_10411 ?auto_10418 ) ) ( not ( = ?auto_10416 ?auto_10415 ) ) ( PERSON-AT ?auto_10414 ?auto_10411 ) ( not ( = ?auto_10414 ?auto_10412 ) ) ( PERSON-AT ?auto_10412 ?auto_10418 ) ( IN ?auto_10413 ?auto_10417 ) ( not ( = ?auto_10414 ?auto_10413 ) ) ( not ( = ?auto_10412 ?auto_10413 ) ) ( AIRCRAFT-AT ?auto_10417 ?auto_10418 ) ( FUEL-LEVEL ?auto_10417 ?auto_10416 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10414 ?auto_10412 ?auto_10411 )
      ( FLY-3PPL-VERIFY ?auto_10412 ?auto_10413 ?auto_10414 ?auto_10411 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_10466 - PERSON
      ?auto_10465 - CITY
    )
    :vars
    (
      ?auto_10467 - FLEVEL
      ?auto_10468 - FLEVEL
      ?auto_10471 - CITY
      ?auto_10470 - PERSON
      ?auto_10472 - PERSON
      ?auto_10469 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10467 ?auto_10468 ) ( not ( = ?auto_10465 ?auto_10471 ) ) ( not ( = ?auto_10468 ?auto_10467 ) ) ( PERSON-AT ?auto_10470 ?auto_10465 ) ( not ( = ?auto_10470 ?auto_10466 ) ) ( PERSON-AT ?auto_10466 ?auto_10471 ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( not ( = ?auto_10466 ?auto_10472 ) ) ( AIRCRAFT-AT ?auto_10469 ?auto_10471 ) ( FUEL-LEVEL ?auto_10469 ?auto_10468 ) ( PERSON-AT ?auto_10472 ?auto_10471 ) )
    :subtasks
    ( ( !BOARD ?auto_10472 ?auto_10469 ?auto_10471 )
      ( FLY-2PPL ?auto_10470 ?auto_10466 ?auto_10465 )
      ( FLY-1PPL-VERIFY ?auto_10466 ?auto_10465 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10474 - PERSON
      ?auto_10475 - PERSON
      ?auto_10473 - CITY
    )
    :vars
    (
      ?auto_10478 - FLEVEL
      ?auto_10476 - FLEVEL
      ?auto_10477 - CITY
      ?auto_10480 - PERSON
      ?auto_10479 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10478 ?auto_10476 ) ( not ( = ?auto_10473 ?auto_10477 ) ) ( not ( = ?auto_10476 ?auto_10478 ) ) ( PERSON-AT ?auto_10474 ?auto_10473 ) ( not ( = ?auto_10474 ?auto_10475 ) ) ( PERSON-AT ?auto_10475 ?auto_10477 ) ( not ( = ?auto_10474 ?auto_10480 ) ) ( not ( = ?auto_10475 ?auto_10480 ) ) ( AIRCRAFT-AT ?auto_10479 ?auto_10477 ) ( FUEL-LEVEL ?auto_10479 ?auto_10476 ) ( PERSON-AT ?auto_10480 ?auto_10477 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_10475 ?auto_10473 )
      ( FLY-2PPL-VERIFY ?auto_10474 ?auto_10475 ?auto_10473 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10482 - PERSON
      ?auto_10483 - PERSON
      ?auto_10481 - CITY
    )
    :vars
    (
      ?auto_10487 - FLEVEL
      ?auto_10484 - FLEVEL
      ?auto_10485 - CITY
      ?auto_10488 - PERSON
      ?auto_10486 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10487 ?auto_10484 ) ( not ( = ?auto_10481 ?auto_10485 ) ) ( not ( = ?auto_10484 ?auto_10487 ) ) ( PERSON-AT ?auto_10488 ?auto_10481 ) ( not ( = ?auto_10488 ?auto_10483 ) ) ( PERSON-AT ?auto_10483 ?auto_10485 ) ( not ( = ?auto_10488 ?auto_10482 ) ) ( not ( = ?auto_10483 ?auto_10482 ) ) ( AIRCRAFT-AT ?auto_10486 ?auto_10485 ) ( FUEL-LEVEL ?auto_10486 ?auto_10484 ) ( PERSON-AT ?auto_10482 ?auto_10485 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10488 ?auto_10483 ?auto_10481 )
      ( FLY-2PPL-VERIFY ?auto_10482 ?auto_10483 ?auto_10481 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10490 - PERSON
      ?auto_10491 - PERSON
      ?auto_10489 - CITY
    )
    :vars
    (
      ?auto_10496 - FLEVEL
      ?auto_10492 - FLEVEL
      ?auto_10494 - CITY
      ?auto_10493 - PERSON
      ?auto_10495 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10496 ?auto_10492 ) ( not ( = ?auto_10489 ?auto_10494 ) ) ( not ( = ?auto_10492 ?auto_10496 ) ) ( PERSON-AT ?auto_10491 ?auto_10489 ) ( not ( = ?auto_10491 ?auto_10490 ) ) ( PERSON-AT ?auto_10490 ?auto_10494 ) ( not ( = ?auto_10491 ?auto_10493 ) ) ( not ( = ?auto_10490 ?auto_10493 ) ) ( AIRCRAFT-AT ?auto_10495 ?auto_10494 ) ( FUEL-LEVEL ?auto_10495 ?auto_10492 ) ( PERSON-AT ?auto_10493 ?auto_10494 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10491 ?auto_10490 ?auto_10489 )
      ( FLY-2PPL-VERIFY ?auto_10490 ?auto_10491 ?auto_10489 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10498 - PERSON
      ?auto_10499 - PERSON
      ?auto_10497 - CITY
    )
    :vars
    (
      ?auto_10503 - FLEVEL
      ?auto_10500 - FLEVEL
      ?auto_10501 - CITY
      ?auto_10504 - PERSON
      ?auto_10502 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10503 ?auto_10500 ) ( not ( = ?auto_10497 ?auto_10501 ) ) ( not ( = ?auto_10500 ?auto_10503 ) ) ( PERSON-AT ?auto_10504 ?auto_10497 ) ( not ( = ?auto_10504 ?auto_10498 ) ) ( PERSON-AT ?auto_10498 ?auto_10501 ) ( not ( = ?auto_10504 ?auto_10499 ) ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( AIRCRAFT-AT ?auto_10502 ?auto_10501 ) ( FUEL-LEVEL ?auto_10502 ?auto_10500 ) ( PERSON-AT ?auto_10499 ?auto_10501 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10504 ?auto_10498 ?auto_10497 )
      ( FLY-2PPL-VERIFY ?auto_10498 ?auto_10499 ?auto_10497 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10515 - PERSON
      ?auto_10516 - PERSON
      ?auto_10517 - PERSON
      ?auto_10514 - CITY
    )
    :vars
    (
      ?auto_10522 - FLEVEL
      ?auto_10518 - FLEVEL
      ?auto_10520 - CITY
      ?auto_10519 - PERSON
      ?auto_10521 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10522 ?auto_10518 ) ( not ( = ?auto_10514 ?auto_10520 ) ) ( not ( = ?auto_10518 ?auto_10522 ) ) ( PERSON-AT ?auto_10515 ?auto_10514 ) ( not ( = ?auto_10515 ?auto_10517 ) ) ( PERSON-AT ?auto_10517 ?auto_10520 ) ( not ( = ?auto_10515 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10519 ) ) ( AIRCRAFT-AT ?auto_10521 ?auto_10520 ) ( FUEL-LEVEL ?auto_10521 ?auto_10518 ) ( PERSON-AT ?auto_10519 ?auto_10520 ) ( PERSON-AT ?auto_10516 ?auto_10514 ) ( not ( = ?auto_10515 ?auto_10516 ) ) ( not ( = ?auto_10516 ?auto_10517 ) ) ( not ( = ?auto_10516 ?auto_10519 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10515 ?auto_10517 ?auto_10514 )
      ( FLY-3PPL-VERIFY ?auto_10515 ?auto_10516 ?auto_10517 ?auto_10514 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10524 - PERSON
      ?auto_10525 - PERSON
      ?auto_10526 - PERSON
      ?auto_10523 - CITY
    )
    :vars
    (
      ?auto_10530 - FLEVEL
      ?auto_10527 - FLEVEL
      ?auto_10528 - CITY
      ?auto_10529 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10530 ?auto_10527 ) ( not ( = ?auto_10523 ?auto_10528 ) ) ( not ( = ?auto_10527 ?auto_10530 ) ) ( PERSON-AT ?auto_10524 ?auto_10523 ) ( not ( = ?auto_10524 ?auto_10526 ) ) ( PERSON-AT ?auto_10526 ?auto_10528 ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( not ( = ?auto_10526 ?auto_10525 ) ) ( AIRCRAFT-AT ?auto_10529 ?auto_10528 ) ( FUEL-LEVEL ?auto_10529 ?auto_10527 ) ( PERSON-AT ?auto_10525 ?auto_10528 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10524 ?auto_10526 ?auto_10523 )
      ( FLY-3PPL-VERIFY ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10523 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10532 - PERSON
      ?auto_10533 - PERSON
      ?auto_10534 - PERSON
      ?auto_10531 - CITY
    )
    :vars
    (
      ?auto_10539 - FLEVEL
      ?auto_10535 - FLEVEL
      ?auto_10537 - CITY
      ?auto_10536 - PERSON
      ?auto_10538 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10539 ?auto_10535 ) ( not ( = ?auto_10531 ?auto_10537 ) ) ( not ( = ?auto_10535 ?auto_10539 ) ) ( PERSON-AT ?auto_10532 ?auto_10531 ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( PERSON-AT ?auto_10533 ?auto_10537 ) ( not ( = ?auto_10532 ?auto_10536 ) ) ( not ( = ?auto_10533 ?auto_10536 ) ) ( AIRCRAFT-AT ?auto_10538 ?auto_10537 ) ( FUEL-LEVEL ?auto_10538 ?auto_10535 ) ( PERSON-AT ?auto_10536 ?auto_10537 ) ( PERSON-AT ?auto_10534 ?auto_10531 ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10534 ?auto_10536 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10532 ?auto_10533 ?auto_10531 )
      ( FLY-3PPL-VERIFY ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10531 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10541 - PERSON
      ?auto_10542 - PERSON
      ?auto_10543 - PERSON
      ?auto_10540 - CITY
    )
    :vars
    (
      ?auto_10547 - FLEVEL
      ?auto_10544 - FLEVEL
      ?auto_10545 - CITY
      ?auto_10546 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10547 ?auto_10544 ) ( not ( = ?auto_10540 ?auto_10545 ) ) ( not ( = ?auto_10544 ?auto_10547 ) ) ( PERSON-AT ?auto_10541 ?auto_10540 ) ( not ( = ?auto_10541 ?auto_10542 ) ) ( PERSON-AT ?auto_10542 ?auto_10545 ) ( not ( = ?auto_10541 ?auto_10543 ) ) ( not ( = ?auto_10542 ?auto_10543 ) ) ( AIRCRAFT-AT ?auto_10546 ?auto_10545 ) ( FUEL-LEVEL ?auto_10546 ?auto_10544 ) ( PERSON-AT ?auto_10543 ?auto_10545 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10541 ?auto_10542 ?auto_10540 )
      ( FLY-3PPL-VERIFY ?auto_10541 ?auto_10542 ?auto_10543 ?auto_10540 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10558 - PERSON
      ?auto_10559 - PERSON
      ?auto_10560 - PERSON
      ?auto_10557 - CITY
    )
    :vars
    (
      ?auto_10564 - FLEVEL
      ?auto_10561 - FLEVEL
      ?auto_10562 - CITY
      ?auto_10563 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10564 ?auto_10561 ) ( not ( = ?auto_10557 ?auto_10562 ) ) ( not ( = ?auto_10561 ?auto_10564 ) ) ( PERSON-AT ?auto_10559 ?auto_10557 ) ( not ( = ?auto_10559 ?auto_10560 ) ) ( PERSON-AT ?auto_10560 ?auto_10562 ) ( not ( = ?auto_10559 ?auto_10558 ) ) ( not ( = ?auto_10560 ?auto_10558 ) ) ( AIRCRAFT-AT ?auto_10563 ?auto_10562 ) ( FUEL-LEVEL ?auto_10563 ?auto_10561 ) ( PERSON-AT ?auto_10558 ?auto_10562 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10559 ?auto_10560 ?auto_10557 )
      ( FLY-3PPL-VERIFY ?auto_10558 ?auto_10559 ?auto_10560 ?auto_10557 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10575 - PERSON
      ?auto_10576 - PERSON
      ?auto_10577 - PERSON
      ?auto_10574 - CITY
    )
    :vars
    (
      ?auto_10581 - FLEVEL
      ?auto_10578 - FLEVEL
      ?auto_10579 - CITY
      ?auto_10580 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10581 ?auto_10578 ) ( not ( = ?auto_10574 ?auto_10579 ) ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( PERSON-AT ?auto_10577 ?auto_10574 ) ( not ( = ?auto_10577 ?auto_10576 ) ) ( PERSON-AT ?auto_10576 ?auto_10579 ) ( not ( = ?auto_10577 ?auto_10575 ) ) ( not ( = ?auto_10576 ?auto_10575 ) ) ( AIRCRAFT-AT ?auto_10580 ?auto_10579 ) ( FUEL-LEVEL ?auto_10580 ?auto_10578 ) ( PERSON-AT ?auto_10575 ?auto_10579 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10577 ?auto_10576 ?auto_10574 )
      ( FLY-3PPL-VERIFY ?auto_10575 ?auto_10576 ?auto_10577 ?auto_10574 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10601 - PERSON
      ?auto_10602 - PERSON
      ?auto_10603 - PERSON
      ?auto_10600 - CITY
    )
    :vars
    (
      ?auto_10608 - FLEVEL
      ?auto_10604 - FLEVEL
      ?auto_10606 - CITY
      ?auto_10605 - PERSON
      ?auto_10607 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10608 ?auto_10604 ) ( not ( = ?auto_10600 ?auto_10606 ) ) ( not ( = ?auto_10604 ?auto_10608 ) ) ( PERSON-AT ?auto_10602 ?auto_10600 ) ( not ( = ?auto_10602 ?auto_10601 ) ) ( PERSON-AT ?auto_10601 ?auto_10606 ) ( not ( = ?auto_10602 ?auto_10605 ) ) ( not ( = ?auto_10601 ?auto_10605 ) ) ( AIRCRAFT-AT ?auto_10607 ?auto_10606 ) ( FUEL-LEVEL ?auto_10607 ?auto_10604 ) ( PERSON-AT ?auto_10605 ?auto_10606 ) ( PERSON-AT ?auto_10603 ?auto_10600 ) ( not ( = ?auto_10601 ?auto_10603 ) ) ( not ( = ?auto_10602 ?auto_10603 ) ) ( not ( = ?auto_10603 ?auto_10605 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10602 ?auto_10601 ?auto_10600 )
      ( FLY-3PPL-VERIFY ?auto_10601 ?auto_10602 ?auto_10603 ?auto_10600 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10610 - PERSON
      ?auto_10611 - PERSON
      ?auto_10612 - PERSON
      ?auto_10609 - CITY
    )
    :vars
    (
      ?auto_10616 - FLEVEL
      ?auto_10613 - FLEVEL
      ?auto_10614 - CITY
      ?auto_10615 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10616 ?auto_10613 ) ( not ( = ?auto_10609 ?auto_10614 ) ) ( not ( = ?auto_10613 ?auto_10616 ) ) ( PERSON-AT ?auto_10611 ?auto_10609 ) ( not ( = ?auto_10611 ?auto_10610 ) ) ( PERSON-AT ?auto_10610 ?auto_10614 ) ( not ( = ?auto_10611 ?auto_10612 ) ) ( not ( = ?auto_10610 ?auto_10612 ) ) ( AIRCRAFT-AT ?auto_10615 ?auto_10614 ) ( FUEL-LEVEL ?auto_10615 ?auto_10613 ) ( PERSON-AT ?auto_10612 ?auto_10614 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10611 ?auto_10610 ?auto_10609 )
      ( FLY-3PPL-VERIFY ?auto_10610 ?auto_10611 ?auto_10612 ?auto_10609 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10627 - PERSON
      ?auto_10628 - PERSON
      ?auto_10629 - PERSON
      ?auto_10626 - CITY
    )
    :vars
    (
      ?auto_10633 - FLEVEL
      ?auto_10630 - FLEVEL
      ?auto_10631 - CITY
      ?auto_10632 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10633 ?auto_10630 ) ( not ( = ?auto_10626 ?auto_10631 ) ) ( not ( = ?auto_10630 ?auto_10633 ) ) ( PERSON-AT ?auto_10629 ?auto_10626 ) ( not ( = ?auto_10629 ?auto_10627 ) ) ( PERSON-AT ?auto_10627 ?auto_10631 ) ( not ( = ?auto_10629 ?auto_10628 ) ) ( not ( = ?auto_10627 ?auto_10628 ) ) ( AIRCRAFT-AT ?auto_10632 ?auto_10631 ) ( FUEL-LEVEL ?auto_10632 ?auto_10630 ) ( PERSON-AT ?auto_10628 ?auto_10631 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10629 ?auto_10627 ?auto_10626 )
      ( FLY-3PPL-VERIFY ?auto_10627 ?auto_10628 ?auto_10629 ?auto_10626 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_10681 - PERSON
      ?auto_10680 - CITY
    )
    :vars
    (
      ?auto_10686 - FLEVEL
      ?auto_10682 - FLEVEL
      ?auto_10684 - CITY
      ?auto_10687 - PERSON
      ?auto_10683 - PERSON
      ?auto_10685 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10686 ?auto_10682 ) ( not ( = ?auto_10680 ?auto_10684 ) ) ( not ( = ?auto_10682 ?auto_10686 ) ) ( PERSON-AT ?auto_10687 ?auto_10680 ) ( not ( = ?auto_10687 ?auto_10681 ) ) ( PERSON-AT ?auto_10681 ?auto_10684 ) ( not ( = ?auto_10687 ?auto_10683 ) ) ( not ( = ?auto_10681 ?auto_10683 ) ) ( AIRCRAFT-AT ?auto_10685 ?auto_10684 ) ( PERSON-AT ?auto_10683 ?auto_10684 ) ( FUEL-LEVEL ?auto_10685 ?auto_10686 ) )
    :subtasks
    ( ( !REFUEL ?auto_10685 ?auto_10684 ?auto_10686 ?auto_10682 )
      ( FLY-2PPL ?auto_10687 ?auto_10681 ?auto_10680 )
      ( FLY-1PPL-VERIFY ?auto_10681 ?auto_10680 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10689 - PERSON
      ?auto_10690 - PERSON
      ?auto_10688 - CITY
    )
    :vars
    (
      ?auto_10695 - FLEVEL
      ?auto_10692 - FLEVEL
      ?auto_10694 - CITY
      ?auto_10691 - PERSON
      ?auto_10693 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10695 ?auto_10692 ) ( not ( = ?auto_10688 ?auto_10694 ) ) ( not ( = ?auto_10692 ?auto_10695 ) ) ( PERSON-AT ?auto_10689 ?auto_10688 ) ( not ( = ?auto_10689 ?auto_10690 ) ) ( PERSON-AT ?auto_10690 ?auto_10694 ) ( not ( = ?auto_10689 ?auto_10691 ) ) ( not ( = ?auto_10690 ?auto_10691 ) ) ( AIRCRAFT-AT ?auto_10693 ?auto_10694 ) ( PERSON-AT ?auto_10691 ?auto_10694 ) ( FUEL-LEVEL ?auto_10693 ?auto_10695 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_10690 ?auto_10688 )
      ( FLY-2PPL-VERIFY ?auto_10689 ?auto_10690 ?auto_10688 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10697 - PERSON
      ?auto_10698 - PERSON
      ?auto_10696 - CITY
    )
    :vars
    (
      ?auto_10699 - FLEVEL
      ?auto_10703 - FLEVEL
      ?auto_10701 - CITY
      ?auto_10700 - PERSON
      ?auto_10702 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10699 ?auto_10703 ) ( not ( = ?auto_10696 ?auto_10701 ) ) ( not ( = ?auto_10703 ?auto_10699 ) ) ( PERSON-AT ?auto_10700 ?auto_10696 ) ( not ( = ?auto_10700 ?auto_10698 ) ) ( PERSON-AT ?auto_10698 ?auto_10701 ) ( not ( = ?auto_10700 ?auto_10697 ) ) ( not ( = ?auto_10698 ?auto_10697 ) ) ( AIRCRAFT-AT ?auto_10702 ?auto_10701 ) ( PERSON-AT ?auto_10697 ?auto_10701 ) ( FUEL-LEVEL ?auto_10702 ?auto_10699 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10700 ?auto_10698 ?auto_10696 )
      ( FLY-2PPL-VERIFY ?auto_10697 ?auto_10698 ?auto_10696 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10705 - PERSON
      ?auto_10706 - PERSON
      ?auto_10704 - CITY
    )
    :vars
    (
      ?auto_10707 - FLEVEL
      ?auto_10710 - FLEVEL
      ?auto_10708 - CITY
      ?auto_10711 - PERSON
      ?auto_10709 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10707 ?auto_10710 ) ( not ( = ?auto_10704 ?auto_10708 ) ) ( not ( = ?auto_10710 ?auto_10707 ) ) ( PERSON-AT ?auto_10706 ?auto_10704 ) ( not ( = ?auto_10706 ?auto_10705 ) ) ( PERSON-AT ?auto_10705 ?auto_10708 ) ( not ( = ?auto_10706 ?auto_10711 ) ) ( not ( = ?auto_10705 ?auto_10711 ) ) ( AIRCRAFT-AT ?auto_10709 ?auto_10708 ) ( PERSON-AT ?auto_10711 ?auto_10708 ) ( FUEL-LEVEL ?auto_10709 ?auto_10707 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10706 ?auto_10705 ?auto_10704 )
      ( FLY-2PPL-VERIFY ?auto_10705 ?auto_10706 ?auto_10704 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10713 - PERSON
      ?auto_10714 - PERSON
      ?auto_10712 - CITY
    )
    :vars
    (
      ?auto_10715 - FLEVEL
      ?auto_10719 - FLEVEL
      ?auto_10717 - CITY
      ?auto_10716 - PERSON
      ?auto_10718 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10715 ?auto_10719 ) ( not ( = ?auto_10712 ?auto_10717 ) ) ( not ( = ?auto_10719 ?auto_10715 ) ) ( PERSON-AT ?auto_10716 ?auto_10712 ) ( not ( = ?auto_10716 ?auto_10713 ) ) ( PERSON-AT ?auto_10713 ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( AIRCRAFT-AT ?auto_10718 ?auto_10717 ) ( PERSON-AT ?auto_10714 ?auto_10717 ) ( FUEL-LEVEL ?auto_10718 ?auto_10715 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10716 ?auto_10713 ?auto_10712 )
      ( FLY-2PPL-VERIFY ?auto_10713 ?auto_10714 ?auto_10712 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10730 - PERSON
      ?auto_10731 - PERSON
      ?auto_10732 - PERSON
      ?auto_10729 - CITY
    )
    :vars
    (
      ?auto_10733 - FLEVEL
      ?auto_10736 - FLEVEL
      ?auto_10734 - CITY
      ?auto_10737 - PERSON
      ?auto_10735 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10733 ?auto_10736 ) ( not ( = ?auto_10729 ?auto_10734 ) ) ( not ( = ?auto_10736 ?auto_10733 ) ) ( PERSON-AT ?auto_10730 ?auto_10729 ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( PERSON-AT ?auto_10732 ?auto_10734 ) ( not ( = ?auto_10730 ?auto_10737 ) ) ( not ( = ?auto_10732 ?auto_10737 ) ) ( AIRCRAFT-AT ?auto_10735 ?auto_10734 ) ( PERSON-AT ?auto_10737 ?auto_10734 ) ( FUEL-LEVEL ?auto_10735 ?auto_10733 ) ( PERSON-AT ?auto_10731 ?auto_10729 ) ( not ( = ?auto_10730 ?auto_10731 ) ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10737 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10730 ?auto_10732 ?auto_10729 )
      ( FLY-3PPL-VERIFY ?auto_10730 ?auto_10731 ?auto_10732 ?auto_10729 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10739 - PERSON
      ?auto_10740 - PERSON
      ?auto_10741 - PERSON
      ?auto_10738 - CITY
    )
    :vars
    (
      ?auto_10742 - FLEVEL
      ?auto_10745 - FLEVEL
      ?auto_10743 - CITY
      ?auto_10744 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10742 ?auto_10745 ) ( not ( = ?auto_10738 ?auto_10743 ) ) ( not ( = ?auto_10745 ?auto_10742 ) ) ( PERSON-AT ?auto_10739 ?auto_10738 ) ( not ( = ?auto_10739 ?auto_10741 ) ) ( PERSON-AT ?auto_10741 ?auto_10743 ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( not ( = ?auto_10741 ?auto_10740 ) ) ( AIRCRAFT-AT ?auto_10744 ?auto_10743 ) ( PERSON-AT ?auto_10740 ?auto_10743 ) ( FUEL-LEVEL ?auto_10744 ?auto_10742 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10739 ?auto_10741 ?auto_10738 )
      ( FLY-3PPL-VERIFY ?auto_10739 ?auto_10740 ?auto_10741 ?auto_10738 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10747 - PERSON
      ?auto_10748 - PERSON
      ?auto_10749 - PERSON
      ?auto_10746 - CITY
    )
    :vars
    (
      ?auto_10750 - FLEVEL
      ?auto_10753 - FLEVEL
      ?auto_10751 - CITY
      ?auto_10754 - PERSON
      ?auto_10752 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10750 ?auto_10753 ) ( not ( = ?auto_10746 ?auto_10751 ) ) ( not ( = ?auto_10753 ?auto_10750 ) ) ( PERSON-AT ?auto_10749 ?auto_10746 ) ( not ( = ?auto_10749 ?auto_10748 ) ) ( PERSON-AT ?auto_10748 ?auto_10751 ) ( not ( = ?auto_10749 ?auto_10754 ) ) ( not ( = ?auto_10748 ?auto_10754 ) ) ( AIRCRAFT-AT ?auto_10752 ?auto_10751 ) ( PERSON-AT ?auto_10754 ?auto_10751 ) ( FUEL-LEVEL ?auto_10752 ?auto_10750 ) ( PERSON-AT ?auto_10747 ?auto_10746 ) ( not ( = ?auto_10747 ?auto_10748 ) ) ( not ( = ?auto_10747 ?auto_10749 ) ) ( not ( = ?auto_10747 ?auto_10754 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10749 ?auto_10748 ?auto_10746 )
      ( FLY-3PPL-VERIFY ?auto_10747 ?auto_10748 ?auto_10749 ?auto_10746 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10756 - PERSON
      ?auto_10757 - PERSON
      ?auto_10758 - PERSON
      ?auto_10755 - CITY
    )
    :vars
    (
      ?auto_10759 - FLEVEL
      ?auto_10762 - FLEVEL
      ?auto_10760 - CITY
      ?auto_10761 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10759 ?auto_10762 ) ( not ( = ?auto_10755 ?auto_10760 ) ) ( not ( = ?auto_10762 ?auto_10759 ) ) ( PERSON-AT ?auto_10756 ?auto_10755 ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( PERSON-AT ?auto_10757 ?auto_10760 ) ( not ( = ?auto_10756 ?auto_10758 ) ) ( not ( = ?auto_10757 ?auto_10758 ) ) ( AIRCRAFT-AT ?auto_10761 ?auto_10760 ) ( PERSON-AT ?auto_10758 ?auto_10760 ) ( FUEL-LEVEL ?auto_10761 ?auto_10759 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10756 ?auto_10757 ?auto_10755 )
      ( FLY-3PPL-VERIFY ?auto_10756 ?auto_10757 ?auto_10758 ?auto_10755 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10773 - PERSON
      ?auto_10774 - PERSON
      ?auto_10775 - PERSON
      ?auto_10772 - CITY
    )
    :vars
    (
      ?auto_10776 - FLEVEL
      ?auto_10779 - FLEVEL
      ?auto_10777 - CITY
      ?auto_10778 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10776 ?auto_10779 ) ( not ( = ?auto_10772 ?auto_10777 ) ) ( not ( = ?auto_10779 ?auto_10776 ) ) ( PERSON-AT ?auto_10774 ?auto_10772 ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( PERSON-AT ?auto_10775 ?auto_10777 ) ( not ( = ?auto_10774 ?auto_10773 ) ) ( not ( = ?auto_10775 ?auto_10773 ) ) ( AIRCRAFT-AT ?auto_10778 ?auto_10777 ) ( PERSON-AT ?auto_10773 ?auto_10777 ) ( FUEL-LEVEL ?auto_10778 ?auto_10776 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10774 ?auto_10775 ?auto_10772 )
      ( FLY-3PPL-VERIFY ?auto_10773 ?auto_10774 ?auto_10775 ?auto_10772 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10790 - PERSON
      ?auto_10791 - PERSON
      ?auto_10792 - PERSON
      ?auto_10789 - CITY
    )
    :vars
    (
      ?auto_10793 - FLEVEL
      ?auto_10796 - FLEVEL
      ?auto_10794 - CITY
      ?auto_10795 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10793 ?auto_10796 ) ( not ( = ?auto_10789 ?auto_10794 ) ) ( not ( = ?auto_10796 ?auto_10793 ) ) ( PERSON-AT ?auto_10792 ?auto_10789 ) ( not ( = ?auto_10792 ?auto_10791 ) ) ( PERSON-AT ?auto_10791 ?auto_10794 ) ( not ( = ?auto_10792 ?auto_10790 ) ) ( not ( = ?auto_10791 ?auto_10790 ) ) ( AIRCRAFT-AT ?auto_10795 ?auto_10794 ) ( PERSON-AT ?auto_10790 ?auto_10794 ) ( FUEL-LEVEL ?auto_10795 ?auto_10793 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10792 ?auto_10791 ?auto_10789 )
      ( FLY-3PPL-VERIFY ?auto_10790 ?auto_10791 ?auto_10792 ?auto_10789 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10816 - PERSON
      ?auto_10817 - PERSON
      ?auto_10818 - PERSON
      ?auto_10815 - CITY
    )
    :vars
    (
      ?auto_10819 - FLEVEL
      ?auto_10822 - FLEVEL
      ?auto_10820 - CITY
      ?auto_10823 - PERSON
      ?auto_10821 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10819 ?auto_10822 ) ( not ( = ?auto_10815 ?auto_10820 ) ) ( not ( = ?auto_10822 ?auto_10819 ) ) ( PERSON-AT ?auto_10817 ?auto_10815 ) ( not ( = ?auto_10817 ?auto_10816 ) ) ( PERSON-AT ?auto_10816 ?auto_10820 ) ( not ( = ?auto_10817 ?auto_10823 ) ) ( not ( = ?auto_10816 ?auto_10823 ) ) ( AIRCRAFT-AT ?auto_10821 ?auto_10820 ) ( PERSON-AT ?auto_10823 ?auto_10820 ) ( FUEL-LEVEL ?auto_10821 ?auto_10819 ) ( PERSON-AT ?auto_10818 ?auto_10815 ) ( not ( = ?auto_10816 ?auto_10818 ) ) ( not ( = ?auto_10817 ?auto_10818 ) ) ( not ( = ?auto_10818 ?auto_10823 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10817 ?auto_10816 ?auto_10815 )
      ( FLY-3PPL-VERIFY ?auto_10816 ?auto_10817 ?auto_10818 ?auto_10815 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10825 - PERSON
      ?auto_10826 - PERSON
      ?auto_10827 - PERSON
      ?auto_10824 - CITY
    )
    :vars
    (
      ?auto_10828 - FLEVEL
      ?auto_10831 - FLEVEL
      ?auto_10829 - CITY
      ?auto_10830 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10828 ?auto_10831 ) ( not ( = ?auto_10824 ?auto_10829 ) ) ( not ( = ?auto_10831 ?auto_10828 ) ) ( PERSON-AT ?auto_10826 ?auto_10824 ) ( not ( = ?auto_10826 ?auto_10825 ) ) ( PERSON-AT ?auto_10825 ?auto_10829 ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( AIRCRAFT-AT ?auto_10830 ?auto_10829 ) ( PERSON-AT ?auto_10827 ?auto_10829 ) ( FUEL-LEVEL ?auto_10830 ?auto_10828 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10826 ?auto_10825 ?auto_10824 )
      ( FLY-3PPL-VERIFY ?auto_10825 ?auto_10826 ?auto_10827 ?auto_10824 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10842 - PERSON
      ?auto_10843 - PERSON
      ?auto_10844 - PERSON
      ?auto_10841 - CITY
    )
    :vars
    (
      ?auto_10845 - FLEVEL
      ?auto_10848 - FLEVEL
      ?auto_10846 - CITY
      ?auto_10847 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10845 ?auto_10848 ) ( not ( = ?auto_10841 ?auto_10846 ) ) ( not ( = ?auto_10848 ?auto_10845 ) ) ( PERSON-AT ?auto_10844 ?auto_10841 ) ( not ( = ?auto_10844 ?auto_10842 ) ) ( PERSON-AT ?auto_10842 ?auto_10846 ) ( not ( = ?auto_10844 ?auto_10843 ) ) ( not ( = ?auto_10842 ?auto_10843 ) ) ( AIRCRAFT-AT ?auto_10847 ?auto_10846 ) ( PERSON-AT ?auto_10843 ?auto_10846 ) ( FUEL-LEVEL ?auto_10847 ?auto_10845 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10844 ?auto_10842 ?auto_10841 )
      ( FLY-3PPL-VERIFY ?auto_10842 ?auto_10843 ?auto_10844 ?auto_10841 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_10896 - PERSON
      ?auto_10895 - CITY
    )
    :vars
    (
      ?auto_10897 - FLEVEL
      ?auto_10901 - FLEVEL
      ?auto_10899 - CITY
      ?auto_10898 - PERSON
      ?auto_10902 - PERSON
      ?auto_10900 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10897 ?auto_10901 ) ( not ( = ?auto_10895 ?auto_10899 ) ) ( not ( = ?auto_10901 ?auto_10897 ) ) ( PERSON-AT ?auto_10898 ?auto_10895 ) ( not ( = ?auto_10898 ?auto_10896 ) ) ( PERSON-AT ?auto_10896 ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10902 ) ) ( not ( = ?auto_10896 ?auto_10902 ) ) ( PERSON-AT ?auto_10902 ?auto_10899 ) ( AIRCRAFT-AT ?auto_10900 ?auto_10895 ) ( FUEL-LEVEL ?auto_10900 ?auto_10901 ) )
    :subtasks
    ( ( !FLY ?auto_10900 ?auto_10895 ?auto_10899 ?auto_10901 ?auto_10897 )
      ( FLY-2PPL ?auto_10898 ?auto_10896 ?auto_10895 )
      ( FLY-1PPL-VERIFY ?auto_10896 ?auto_10895 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10904 - PERSON
      ?auto_10905 - PERSON
      ?auto_10903 - CITY
    )
    :vars
    (
      ?auto_10908 - FLEVEL
      ?auto_10906 - FLEVEL
      ?auto_10910 - CITY
      ?auto_10907 - PERSON
      ?auto_10909 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10908 ?auto_10906 ) ( not ( = ?auto_10903 ?auto_10910 ) ) ( not ( = ?auto_10906 ?auto_10908 ) ) ( PERSON-AT ?auto_10904 ?auto_10903 ) ( not ( = ?auto_10904 ?auto_10905 ) ) ( PERSON-AT ?auto_10905 ?auto_10910 ) ( not ( = ?auto_10904 ?auto_10907 ) ) ( not ( = ?auto_10905 ?auto_10907 ) ) ( PERSON-AT ?auto_10907 ?auto_10910 ) ( AIRCRAFT-AT ?auto_10909 ?auto_10903 ) ( FUEL-LEVEL ?auto_10909 ?auto_10906 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_10905 ?auto_10903 )
      ( FLY-2PPL-VERIFY ?auto_10904 ?auto_10905 ?auto_10903 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10912 - PERSON
      ?auto_10913 - PERSON
      ?auto_10911 - CITY
    )
    :vars
    (
      ?auto_10918 - FLEVEL
      ?auto_10914 - FLEVEL
      ?auto_10915 - CITY
      ?auto_10916 - PERSON
      ?auto_10917 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10918 ?auto_10914 ) ( not ( = ?auto_10911 ?auto_10915 ) ) ( not ( = ?auto_10914 ?auto_10918 ) ) ( PERSON-AT ?auto_10916 ?auto_10911 ) ( not ( = ?auto_10916 ?auto_10913 ) ) ( PERSON-AT ?auto_10913 ?auto_10915 ) ( not ( = ?auto_10916 ?auto_10912 ) ) ( not ( = ?auto_10913 ?auto_10912 ) ) ( PERSON-AT ?auto_10912 ?auto_10915 ) ( AIRCRAFT-AT ?auto_10917 ?auto_10911 ) ( FUEL-LEVEL ?auto_10917 ?auto_10914 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10916 ?auto_10913 ?auto_10911 )
      ( FLY-2PPL-VERIFY ?auto_10912 ?auto_10913 ?auto_10911 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10920 - PERSON
      ?auto_10921 - PERSON
      ?auto_10919 - CITY
    )
    :vars
    (
      ?auto_10926 - FLEVEL
      ?auto_10922 - FLEVEL
      ?auto_10923 - CITY
      ?auto_10924 - PERSON
      ?auto_10925 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10926 ?auto_10922 ) ( not ( = ?auto_10919 ?auto_10923 ) ) ( not ( = ?auto_10922 ?auto_10926 ) ) ( PERSON-AT ?auto_10921 ?auto_10919 ) ( not ( = ?auto_10921 ?auto_10920 ) ) ( PERSON-AT ?auto_10920 ?auto_10923 ) ( not ( = ?auto_10921 ?auto_10924 ) ) ( not ( = ?auto_10920 ?auto_10924 ) ) ( PERSON-AT ?auto_10924 ?auto_10923 ) ( AIRCRAFT-AT ?auto_10925 ?auto_10919 ) ( FUEL-LEVEL ?auto_10925 ?auto_10922 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10921 ?auto_10920 ?auto_10919 )
      ( FLY-2PPL-VERIFY ?auto_10920 ?auto_10921 ?auto_10919 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_10928 - PERSON
      ?auto_10929 - PERSON
      ?auto_10927 - CITY
    )
    :vars
    (
      ?auto_10934 - FLEVEL
      ?auto_10930 - FLEVEL
      ?auto_10931 - CITY
      ?auto_10932 - PERSON
      ?auto_10933 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10934 ?auto_10930 ) ( not ( = ?auto_10927 ?auto_10931 ) ) ( not ( = ?auto_10930 ?auto_10934 ) ) ( PERSON-AT ?auto_10932 ?auto_10927 ) ( not ( = ?auto_10932 ?auto_10928 ) ) ( PERSON-AT ?auto_10928 ?auto_10931 ) ( not ( = ?auto_10932 ?auto_10929 ) ) ( not ( = ?auto_10928 ?auto_10929 ) ) ( PERSON-AT ?auto_10929 ?auto_10931 ) ( AIRCRAFT-AT ?auto_10933 ?auto_10927 ) ( FUEL-LEVEL ?auto_10933 ?auto_10930 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10932 ?auto_10928 ?auto_10927 )
      ( FLY-2PPL-VERIFY ?auto_10928 ?auto_10929 ?auto_10927 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10945 - PERSON
      ?auto_10946 - PERSON
      ?auto_10947 - PERSON
      ?auto_10944 - CITY
    )
    :vars
    (
      ?auto_10952 - FLEVEL
      ?auto_10948 - FLEVEL
      ?auto_10949 - CITY
      ?auto_10950 - PERSON
      ?auto_10951 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10952 ?auto_10948 ) ( not ( = ?auto_10944 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10952 ) ) ( PERSON-AT ?auto_10945 ?auto_10944 ) ( not ( = ?auto_10945 ?auto_10947 ) ) ( PERSON-AT ?auto_10947 ?auto_10949 ) ( not ( = ?auto_10945 ?auto_10950 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( PERSON-AT ?auto_10950 ?auto_10949 ) ( AIRCRAFT-AT ?auto_10951 ?auto_10944 ) ( FUEL-LEVEL ?auto_10951 ?auto_10948 ) ( PERSON-AT ?auto_10946 ?auto_10944 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( not ( = ?auto_10946 ?auto_10947 ) ) ( not ( = ?auto_10946 ?auto_10950 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10945 ?auto_10947 ?auto_10944 )
      ( FLY-3PPL-VERIFY ?auto_10945 ?auto_10946 ?auto_10947 ?auto_10944 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10954 - PERSON
      ?auto_10955 - PERSON
      ?auto_10956 - PERSON
      ?auto_10953 - CITY
    )
    :vars
    (
      ?auto_10960 - FLEVEL
      ?auto_10957 - FLEVEL
      ?auto_10958 - CITY
      ?auto_10959 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10960 ?auto_10957 ) ( not ( = ?auto_10953 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10960 ) ) ( PERSON-AT ?auto_10954 ?auto_10953 ) ( not ( = ?auto_10954 ?auto_10956 ) ) ( PERSON-AT ?auto_10956 ?auto_10958 ) ( not ( = ?auto_10954 ?auto_10955 ) ) ( not ( = ?auto_10956 ?auto_10955 ) ) ( PERSON-AT ?auto_10955 ?auto_10958 ) ( AIRCRAFT-AT ?auto_10959 ?auto_10953 ) ( FUEL-LEVEL ?auto_10959 ?auto_10957 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10954 ?auto_10956 ?auto_10953 )
      ( FLY-3PPL-VERIFY ?auto_10954 ?auto_10955 ?auto_10956 ?auto_10953 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10962 - PERSON
      ?auto_10963 - PERSON
      ?auto_10964 - PERSON
      ?auto_10961 - CITY
    )
    :vars
    (
      ?auto_10969 - FLEVEL
      ?auto_10965 - FLEVEL
      ?auto_10966 - CITY
      ?auto_10967 - PERSON
      ?auto_10968 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10969 ?auto_10965 ) ( not ( = ?auto_10961 ?auto_10966 ) ) ( not ( = ?auto_10965 ?auto_10969 ) ) ( PERSON-AT ?auto_10964 ?auto_10961 ) ( not ( = ?auto_10964 ?auto_10963 ) ) ( PERSON-AT ?auto_10963 ?auto_10966 ) ( not ( = ?auto_10964 ?auto_10967 ) ) ( not ( = ?auto_10963 ?auto_10967 ) ) ( PERSON-AT ?auto_10967 ?auto_10966 ) ( AIRCRAFT-AT ?auto_10968 ?auto_10961 ) ( FUEL-LEVEL ?auto_10968 ?auto_10965 ) ( PERSON-AT ?auto_10962 ?auto_10961 ) ( not ( = ?auto_10962 ?auto_10963 ) ) ( not ( = ?auto_10962 ?auto_10964 ) ) ( not ( = ?auto_10962 ?auto_10967 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10964 ?auto_10963 ?auto_10961 )
      ( FLY-3PPL-VERIFY ?auto_10962 ?auto_10963 ?auto_10964 ?auto_10961 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10971 - PERSON
      ?auto_10972 - PERSON
      ?auto_10973 - PERSON
      ?auto_10970 - CITY
    )
    :vars
    (
      ?auto_10977 - FLEVEL
      ?auto_10974 - FLEVEL
      ?auto_10975 - CITY
      ?auto_10976 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10977 ?auto_10974 ) ( not ( = ?auto_10970 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( PERSON-AT ?auto_10971 ?auto_10970 ) ( not ( = ?auto_10971 ?auto_10972 ) ) ( PERSON-AT ?auto_10972 ?auto_10975 ) ( not ( = ?auto_10971 ?auto_10973 ) ) ( not ( = ?auto_10972 ?auto_10973 ) ) ( PERSON-AT ?auto_10973 ?auto_10975 ) ( AIRCRAFT-AT ?auto_10976 ?auto_10970 ) ( FUEL-LEVEL ?auto_10976 ?auto_10974 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10971 ?auto_10972 ?auto_10970 )
      ( FLY-3PPL-VERIFY ?auto_10971 ?auto_10972 ?auto_10973 ?auto_10970 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10988 - PERSON
      ?auto_10989 - PERSON
      ?auto_10990 - PERSON
      ?auto_10987 - CITY
    )
    :vars
    (
      ?auto_10994 - FLEVEL
      ?auto_10991 - FLEVEL
      ?auto_10992 - CITY
      ?auto_10993 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10994 ?auto_10991 ) ( not ( = ?auto_10987 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( PERSON-AT ?auto_10989 ?auto_10987 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( PERSON-AT ?auto_10990 ?auto_10992 ) ( not ( = ?auto_10989 ?auto_10988 ) ) ( not ( = ?auto_10990 ?auto_10988 ) ) ( PERSON-AT ?auto_10988 ?auto_10992 ) ( AIRCRAFT-AT ?auto_10993 ?auto_10987 ) ( FUEL-LEVEL ?auto_10993 ?auto_10991 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10989 ?auto_10990 ?auto_10987 )
      ( FLY-3PPL-VERIFY ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10987 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11005 - PERSON
      ?auto_11006 - PERSON
      ?auto_11007 - PERSON
      ?auto_11004 - CITY
    )
    :vars
    (
      ?auto_11011 - FLEVEL
      ?auto_11008 - FLEVEL
      ?auto_11009 - CITY
      ?auto_11010 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11011 ?auto_11008 ) ( not ( = ?auto_11004 ?auto_11009 ) ) ( not ( = ?auto_11008 ?auto_11011 ) ) ( PERSON-AT ?auto_11007 ?auto_11004 ) ( not ( = ?auto_11007 ?auto_11006 ) ) ( PERSON-AT ?auto_11006 ?auto_11009 ) ( not ( = ?auto_11007 ?auto_11005 ) ) ( not ( = ?auto_11006 ?auto_11005 ) ) ( PERSON-AT ?auto_11005 ?auto_11009 ) ( AIRCRAFT-AT ?auto_11010 ?auto_11004 ) ( FUEL-LEVEL ?auto_11010 ?auto_11008 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11007 ?auto_11006 ?auto_11004 )
      ( FLY-3PPL-VERIFY ?auto_11005 ?auto_11006 ?auto_11007 ?auto_11004 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11031 - PERSON
      ?auto_11032 - PERSON
      ?auto_11033 - PERSON
      ?auto_11030 - CITY
    )
    :vars
    (
      ?auto_11038 - FLEVEL
      ?auto_11034 - FLEVEL
      ?auto_11035 - CITY
      ?auto_11036 - PERSON
      ?auto_11037 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11038 ?auto_11034 ) ( not ( = ?auto_11030 ?auto_11035 ) ) ( not ( = ?auto_11034 ?auto_11038 ) ) ( PERSON-AT ?auto_11032 ?auto_11030 ) ( not ( = ?auto_11032 ?auto_11031 ) ) ( PERSON-AT ?auto_11031 ?auto_11035 ) ( not ( = ?auto_11032 ?auto_11036 ) ) ( not ( = ?auto_11031 ?auto_11036 ) ) ( PERSON-AT ?auto_11036 ?auto_11035 ) ( AIRCRAFT-AT ?auto_11037 ?auto_11030 ) ( FUEL-LEVEL ?auto_11037 ?auto_11034 ) ( PERSON-AT ?auto_11033 ?auto_11030 ) ( not ( = ?auto_11031 ?auto_11033 ) ) ( not ( = ?auto_11032 ?auto_11033 ) ) ( not ( = ?auto_11033 ?auto_11036 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11032 ?auto_11031 ?auto_11030 )
      ( FLY-3PPL-VERIFY ?auto_11031 ?auto_11032 ?auto_11033 ?auto_11030 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11040 - PERSON
      ?auto_11041 - PERSON
      ?auto_11042 - PERSON
      ?auto_11039 - CITY
    )
    :vars
    (
      ?auto_11046 - FLEVEL
      ?auto_11043 - FLEVEL
      ?auto_11044 - CITY
      ?auto_11045 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11046 ?auto_11043 ) ( not ( = ?auto_11039 ?auto_11044 ) ) ( not ( = ?auto_11043 ?auto_11046 ) ) ( PERSON-AT ?auto_11041 ?auto_11039 ) ( not ( = ?auto_11041 ?auto_11040 ) ) ( PERSON-AT ?auto_11040 ?auto_11044 ) ( not ( = ?auto_11041 ?auto_11042 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( PERSON-AT ?auto_11042 ?auto_11044 ) ( AIRCRAFT-AT ?auto_11045 ?auto_11039 ) ( FUEL-LEVEL ?auto_11045 ?auto_11043 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11041 ?auto_11040 ?auto_11039 )
      ( FLY-3PPL-VERIFY ?auto_11040 ?auto_11041 ?auto_11042 ?auto_11039 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11057 - PERSON
      ?auto_11058 - PERSON
      ?auto_11059 - PERSON
      ?auto_11056 - CITY
    )
    :vars
    (
      ?auto_11063 - FLEVEL
      ?auto_11060 - FLEVEL
      ?auto_11061 - CITY
      ?auto_11062 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11063 ?auto_11060 ) ( not ( = ?auto_11056 ?auto_11061 ) ) ( not ( = ?auto_11060 ?auto_11063 ) ) ( PERSON-AT ?auto_11059 ?auto_11056 ) ( not ( = ?auto_11059 ?auto_11057 ) ) ( PERSON-AT ?auto_11057 ?auto_11061 ) ( not ( = ?auto_11059 ?auto_11058 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( PERSON-AT ?auto_11058 ?auto_11061 ) ( AIRCRAFT-AT ?auto_11062 ?auto_11056 ) ( FUEL-LEVEL ?auto_11062 ?auto_11060 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11059 ?auto_11057 ?auto_11056 )
      ( FLY-3PPL-VERIFY ?auto_11057 ?auto_11058 ?auto_11059 ?auto_11056 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11111 - PERSON
      ?auto_11110 - CITY
    )
    :vars
    (
      ?auto_11117 - FLEVEL
      ?auto_11112 - FLEVEL
      ?auto_11113 - CITY
      ?auto_11114 - PERSON
      ?auto_11115 - PERSON
      ?auto_11116 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11117 ?auto_11112 ) ( not ( = ?auto_11110 ?auto_11113 ) ) ( not ( = ?auto_11112 ?auto_11117 ) ) ( PERSON-AT ?auto_11114 ?auto_11110 ) ( not ( = ?auto_11114 ?auto_11111 ) ) ( PERSON-AT ?auto_11111 ?auto_11113 ) ( not ( = ?auto_11114 ?auto_11115 ) ) ( not ( = ?auto_11111 ?auto_11115 ) ) ( PERSON-AT ?auto_11115 ?auto_11113 ) ( AIRCRAFT-AT ?auto_11116 ?auto_11110 ) ( FUEL-LEVEL ?auto_11116 ?auto_11117 ) )
    :subtasks
    ( ( !REFUEL ?auto_11116 ?auto_11110 ?auto_11117 ?auto_11112 )
      ( FLY-2PPL ?auto_11114 ?auto_11111 ?auto_11110 )
      ( FLY-1PPL-VERIFY ?auto_11111 ?auto_11110 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11119 - PERSON
      ?auto_11120 - PERSON
      ?auto_11118 - CITY
    )
    :vars
    (
      ?auto_11124 - FLEVEL
      ?auto_11122 - FLEVEL
      ?auto_11125 - CITY
      ?auto_11121 - PERSON
      ?auto_11123 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11124 ?auto_11122 ) ( not ( = ?auto_11118 ?auto_11125 ) ) ( not ( = ?auto_11122 ?auto_11124 ) ) ( PERSON-AT ?auto_11119 ?auto_11118 ) ( not ( = ?auto_11119 ?auto_11120 ) ) ( PERSON-AT ?auto_11120 ?auto_11125 ) ( not ( = ?auto_11119 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( PERSON-AT ?auto_11121 ?auto_11125 ) ( AIRCRAFT-AT ?auto_11123 ?auto_11118 ) ( FUEL-LEVEL ?auto_11123 ?auto_11124 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11120 ?auto_11118 )
      ( FLY-2PPL-VERIFY ?auto_11119 ?auto_11120 ?auto_11118 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11127 - PERSON
      ?auto_11128 - PERSON
      ?auto_11126 - CITY
    )
    :vars
    (
      ?auto_11130 - FLEVEL
      ?auto_11129 - FLEVEL
      ?auto_11132 - CITY
      ?auto_11133 - PERSON
      ?auto_11131 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11130 ?auto_11129 ) ( not ( = ?auto_11126 ?auto_11132 ) ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( PERSON-AT ?auto_11133 ?auto_11126 ) ( not ( = ?auto_11133 ?auto_11128 ) ) ( PERSON-AT ?auto_11128 ?auto_11132 ) ( not ( = ?auto_11133 ?auto_11127 ) ) ( not ( = ?auto_11128 ?auto_11127 ) ) ( PERSON-AT ?auto_11127 ?auto_11132 ) ( AIRCRAFT-AT ?auto_11131 ?auto_11126 ) ( FUEL-LEVEL ?auto_11131 ?auto_11130 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11133 ?auto_11128 ?auto_11126 )
      ( FLY-2PPL-VERIFY ?auto_11127 ?auto_11128 ?auto_11126 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11135 - PERSON
      ?auto_11136 - PERSON
      ?auto_11134 - CITY
    )
    :vars
    (
      ?auto_11138 - FLEVEL
      ?auto_11137 - FLEVEL
      ?auto_11140 - CITY
      ?auto_11141 - PERSON
      ?auto_11139 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11138 ?auto_11137 ) ( not ( = ?auto_11134 ?auto_11140 ) ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( PERSON-AT ?auto_11136 ?auto_11134 ) ( not ( = ?auto_11136 ?auto_11135 ) ) ( PERSON-AT ?auto_11135 ?auto_11140 ) ( not ( = ?auto_11136 ?auto_11141 ) ) ( not ( = ?auto_11135 ?auto_11141 ) ) ( PERSON-AT ?auto_11141 ?auto_11140 ) ( AIRCRAFT-AT ?auto_11139 ?auto_11134 ) ( FUEL-LEVEL ?auto_11139 ?auto_11138 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11136 ?auto_11135 ?auto_11134 )
      ( FLY-2PPL-VERIFY ?auto_11135 ?auto_11136 ?auto_11134 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11143 - PERSON
      ?auto_11144 - PERSON
      ?auto_11142 - CITY
    )
    :vars
    (
      ?auto_11146 - FLEVEL
      ?auto_11145 - FLEVEL
      ?auto_11148 - CITY
      ?auto_11149 - PERSON
      ?auto_11147 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11146 ?auto_11145 ) ( not ( = ?auto_11142 ?auto_11148 ) ) ( not ( = ?auto_11145 ?auto_11146 ) ) ( PERSON-AT ?auto_11149 ?auto_11142 ) ( not ( = ?auto_11149 ?auto_11143 ) ) ( PERSON-AT ?auto_11143 ?auto_11148 ) ( not ( = ?auto_11149 ?auto_11144 ) ) ( not ( = ?auto_11143 ?auto_11144 ) ) ( PERSON-AT ?auto_11144 ?auto_11148 ) ( AIRCRAFT-AT ?auto_11147 ?auto_11142 ) ( FUEL-LEVEL ?auto_11147 ?auto_11146 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11149 ?auto_11143 ?auto_11142 )
      ( FLY-2PPL-VERIFY ?auto_11143 ?auto_11144 ?auto_11142 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11160 - PERSON
      ?auto_11161 - PERSON
      ?auto_11162 - PERSON
      ?auto_11159 - CITY
    )
    :vars
    (
      ?auto_11164 - FLEVEL
      ?auto_11163 - FLEVEL
      ?auto_11166 - CITY
      ?auto_11167 - PERSON
      ?auto_11165 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11164 ?auto_11163 ) ( not ( = ?auto_11159 ?auto_11166 ) ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( PERSON-AT ?auto_11160 ?auto_11159 ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( PERSON-AT ?auto_11162 ?auto_11166 ) ( not ( = ?auto_11160 ?auto_11167 ) ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( PERSON-AT ?auto_11167 ?auto_11166 ) ( AIRCRAFT-AT ?auto_11165 ?auto_11159 ) ( FUEL-LEVEL ?auto_11165 ?auto_11164 ) ( PERSON-AT ?auto_11161 ?auto_11159 ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11161 ?auto_11162 ) ) ( not ( = ?auto_11161 ?auto_11167 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11160 ?auto_11162 ?auto_11159 )
      ( FLY-3PPL-VERIFY ?auto_11160 ?auto_11161 ?auto_11162 ?auto_11159 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11169 - PERSON
      ?auto_11170 - PERSON
      ?auto_11171 - PERSON
      ?auto_11168 - CITY
    )
    :vars
    (
      ?auto_11173 - FLEVEL
      ?auto_11172 - FLEVEL
      ?auto_11175 - CITY
      ?auto_11174 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11173 ?auto_11172 ) ( not ( = ?auto_11168 ?auto_11175 ) ) ( not ( = ?auto_11172 ?auto_11173 ) ) ( PERSON-AT ?auto_11169 ?auto_11168 ) ( not ( = ?auto_11169 ?auto_11171 ) ) ( PERSON-AT ?auto_11171 ?auto_11175 ) ( not ( = ?auto_11169 ?auto_11170 ) ) ( not ( = ?auto_11171 ?auto_11170 ) ) ( PERSON-AT ?auto_11170 ?auto_11175 ) ( AIRCRAFT-AT ?auto_11174 ?auto_11168 ) ( FUEL-LEVEL ?auto_11174 ?auto_11173 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11169 ?auto_11171 ?auto_11168 )
      ( FLY-3PPL-VERIFY ?auto_11169 ?auto_11170 ?auto_11171 ?auto_11168 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11177 - PERSON
      ?auto_11178 - PERSON
      ?auto_11179 - PERSON
      ?auto_11176 - CITY
    )
    :vars
    (
      ?auto_11181 - FLEVEL
      ?auto_11180 - FLEVEL
      ?auto_11183 - CITY
      ?auto_11184 - PERSON
      ?auto_11182 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11181 ?auto_11180 ) ( not ( = ?auto_11176 ?auto_11183 ) ) ( not ( = ?auto_11180 ?auto_11181 ) ) ( PERSON-AT ?auto_11179 ?auto_11176 ) ( not ( = ?auto_11179 ?auto_11178 ) ) ( PERSON-AT ?auto_11178 ?auto_11183 ) ( not ( = ?auto_11179 ?auto_11184 ) ) ( not ( = ?auto_11178 ?auto_11184 ) ) ( PERSON-AT ?auto_11184 ?auto_11183 ) ( AIRCRAFT-AT ?auto_11182 ?auto_11176 ) ( FUEL-LEVEL ?auto_11182 ?auto_11181 ) ( PERSON-AT ?auto_11177 ?auto_11176 ) ( not ( = ?auto_11177 ?auto_11178 ) ) ( not ( = ?auto_11177 ?auto_11179 ) ) ( not ( = ?auto_11177 ?auto_11184 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11179 ?auto_11178 ?auto_11176 )
      ( FLY-3PPL-VERIFY ?auto_11177 ?auto_11178 ?auto_11179 ?auto_11176 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11186 - PERSON
      ?auto_11187 - PERSON
      ?auto_11188 - PERSON
      ?auto_11185 - CITY
    )
    :vars
    (
      ?auto_11190 - FLEVEL
      ?auto_11189 - FLEVEL
      ?auto_11192 - CITY
      ?auto_11191 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11190 ?auto_11189 ) ( not ( = ?auto_11185 ?auto_11192 ) ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( PERSON-AT ?auto_11186 ?auto_11185 ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( PERSON-AT ?auto_11187 ?auto_11192 ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( PERSON-AT ?auto_11188 ?auto_11192 ) ( AIRCRAFT-AT ?auto_11191 ?auto_11185 ) ( FUEL-LEVEL ?auto_11191 ?auto_11190 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11186 ?auto_11187 ?auto_11185 )
      ( FLY-3PPL-VERIFY ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11185 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11203 - PERSON
      ?auto_11204 - PERSON
      ?auto_11205 - PERSON
      ?auto_11202 - CITY
    )
    :vars
    (
      ?auto_11207 - FLEVEL
      ?auto_11206 - FLEVEL
      ?auto_11209 - CITY
      ?auto_11208 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11207 ?auto_11206 ) ( not ( = ?auto_11202 ?auto_11209 ) ) ( not ( = ?auto_11206 ?auto_11207 ) ) ( PERSON-AT ?auto_11204 ?auto_11202 ) ( not ( = ?auto_11204 ?auto_11205 ) ) ( PERSON-AT ?auto_11205 ?auto_11209 ) ( not ( = ?auto_11204 ?auto_11203 ) ) ( not ( = ?auto_11205 ?auto_11203 ) ) ( PERSON-AT ?auto_11203 ?auto_11209 ) ( AIRCRAFT-AT ?auto_11208 ?auto_11202 ) ( FUEL-LEVEL ?auto_11208 ?auto_11207 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11204 ?auto_11205 ?auto_11202 )
      ( FLY-3PPL-VERIFY ?auto_11203 ?auto_11204 ?auto_11205 ?auto_11202 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11220 - PERSON
      ?auto_11221 - PERSON
      ?auto_11222 - PERSON
      ?auto_11219 - CITY
    )
    :vars
    (
      ?auto_11224 - FLEVEL
      ?auto_11223 - FLEVEL
      ?auto_11226 - CITY
      ?auto_11225 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11224 ?auto_11223 ) ( not ( = ?auto_11219 ?auto_11226 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( PERSON-AT ?auto_11222 ?auto_11219 ) ( not ( = ?auto_11222 ?auto_11221 ) ) ( PERSON-AT ?auto_11221 ?auto_11226 ) ( not ( = ?auto_11222 ?auto_11220 ) ) ( not ( = ?auto_11221 ?auto_11220 ) ) ( PERSON-AT ?auto_11220 ?auto_11226 ) ( AIRCRAFT-AT ?auto_11225 ?auto_11219 ) ( FUEL-LEVEL ?auto_11225 ?auto_11224 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11222 ?auto_11221 ?auto_11219 )
      ( FLY-3PPL-VERIFY ?auto_11220 ?auto_11221 ?auto_11222 ?auto_11219 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11246 - PERSON
      ?auto_11247 - PERSON
      ?auto_11248 - PERSON
      ?auto_11245 - CITY
    )
    :vars
    (
      ?auto_11250 - FLEVEL
      ?auto_11249 - FLEVEL
      ?auto_11252 - CITY
      ?auto_11253 - PERSON
      ?auto_11251 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11250 ?auto_11249 ) ( not ( = ?auto_11245 ?auto_11252 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( PERSON-AT ?auto_11247 ?auto_11245 ) ( not ( = ?auto_11247 ?auto_11246 ) ) ( PERSON-AT ?auto_11246 ?auto_11252 ) ( not ( = ?auto_11247 ?auto_11253 ) ) ( not ( = ?auto_11246 ?auto_11253 ) ) ( PERSON-AT ?auto_11253 ?auto_11252 ) ( AIRCRAFT-AT ?auto_11251 ?auto_11245 ) ( FUEL-LEVEL ?auto_11251 ?auto_11250 ) ( PERSON-AT ?auto_11248 ?auto_11245 ) ( not ( = ?auto_11246 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11247 ?auto_11246 ?auto_11245 )
      ( FLY-3PPL-VERIFY ?auto_11246 ?auto_11247 ?auto_11248 ?auto_11245 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11255 - PERSON
      ?auto_11256 - PERSON
      ?auto_11257 - PERSON
      ?auto_11254 - CITY
    )
    :vars
    (
      ?auto_11259 - FLEVEL
      ?auto_11258 - FLEVEL
      ?auto_11261 - CITY
      ?auto_11260 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11259 ?auto_11258 ) ( not ( = ?auto_11254 ?auto_11261 ) ) ( not ( = ?auto_11258 ?auto_11259 ) ) ( PERSON-AT ?auto_11256 ?auto_11254 ) ( not ( = ?auto_11256 ?auto_11255 ) ) ( PERSON-AT ?auto_11255 ?auto_11261 ) ( not ( = ?auto_11256 ?auto_11257 ) ) ( not ( = ?auto_11255 ?auto_11257 ) ) ( PERSON-AT ?auto_11257 ?auto_11261 ) ( AIRCRAFT-AT ?auto_11260 ?auto_11254 ) ( FUEL-LEVEL ?auto_11260 ?auto_11259 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11256 ?auto_11255 ?auto_11254 )
      ( FLY-3PPL-VERIFY ?auto_11255 ?auto_11256 ?auto_11257 ?auto_11254 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11272 - PERSON
      ?auto_11273 - PERSON
      ?auto_11274 - PERSON
      ?auto_11271 - CITY
    )
    :vars
    (
      ?auto_11276 - FLEVEL
      ?auto_11275 - FLEVEL
      ?auto_11278 - CITY
      ?auto_11277 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11276 ?auto_11275 ) ( not ( = ?auto_11271 ?auto_11278 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( PERSON-AT ?auto_11274 ?auto_11271 ) ( not ( = ?auto_11274 ?auto_11272 ) ) ( PERSON-AT ?auto_11272 ?auto_11278 ) ( not ( = ?auto_11274 ?auto_11273 ) ) ( not ( = ?auto_11272 ?auto_11273 ) ) ( PERSON-AT ?auto_11273 ?auto_11278 ) ( AIRCRAFT-AT ?auto_11277 ?auto_11271 ) ( FUEL-LEVEL ?auto_11277 ?auto_11276 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11274 ?auto_11272 ?auto_11271 )
      ( FLY-3PPL-VERIFY ?auto_11272 ?auto_11273 ?auto_11274 ?auto_11271 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11326 - PERSON
      ?auto_11325 - CITY
    )
    :vars
    (
      ?auto_11328 - FLEVEL
      ?auto_11327 - FLEVEL
      ?auto_11330 - CITY
      ?auto_11331 - PERSON
      ?auto_11332 - PERSON
      ?auto_11329 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11328 ?auto_11327 ) ( not ( = ?auto_11325 ?auto_11330 ) ) ( not ( = ?auto_11327 ?auto_11328 ) ) ( not ( = ?auto_11331 ?auto_11326 ) ) ( PERSON-AT ?auto_11326 ?auto_11330 ) ( not ( = ?auto_11331 ?auto_11332 ) ) ( not ( = ?auto_11326 ?auto_11332 ) ) ( PERSON-AT ?auto_11332 ?auto_11330 ) ( AIRCRAFT-AT ?auto_11329 ?auto_11325 ) ( FUEL-LEVEL ?auto_11329 ?auto_11328 ) ( IN ?auto_11331 ?auto_11329 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11331 ?auto_11325 )
      ( FLY-2PPL ?auto_11331 ?auto_11326 ?auto_11325 )
      ( FLY-1PPL-VERIFY ?auto_11326 ?auto_11325 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11334 - PERSON
      ?auto_11335 - PERSON
      ?auto_11333 - CITY
    )
    :vars
    (
      ?auto_11340 - FLEVEL
      ?auto_11338 - FLEVEL
      ?auto_11336 - CITY
      ?auto_11337 - PERSON
      ?auto_11339 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11340 ?auto_11338 ) ( not ( = ?auto_11333 ?auto_11336 ) ) ( not ( = ?auto_11338 ?auto_11340 ) ) ( not ( = ?auto_11334 ?auto_11335 ) ) ( PERSON-AT ?auto_11335 ?auto_11336 ) ( not ( = ?auto_11334 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( PERSON-AT ?auto_11337 ?auto_11336 ) ( AIRCRAFT-AT ?auto_11339 ?auto_11333 ) ( FUEL-LEVEL ?auto_11339 ?auto_11340 ) ( IN ?auto_11334 ?auto_11339 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11335 ?auto_11333 )
      ( FLY-2PPL-VERIFY ?auto_11334 ?auto_11335 ?auto_11333 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11342 - PERSON
      ?auto_11343 - PERSON
      ?auto_11341 - CITY
    )
    :vars
    (
      ?auto_11344 - FLEVEL
      ?auto_11345 - FLEVEL
      ?auto_11347 - CITY
      ?auto_11348 - PERSON
      ?auto_11346 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11344 ?auto_11345 ) ( not ( = ?auto_11341 ?auto_11347 ) ) ( not ( = ?auto_11345 ?auto_11344 ) ) ( not ( = ?auto_11348 ?auto_11343 ) ) ( PERSON-AT ?auto_11343 ?auto_11347 ) ( not ( = ?auto_11348 ?auto_11342 ) ) ( not ( = ?auto_11343 ?auto_11342 ) ) ( PERSON-AT ?auto_11342 ?auto_11347 ) ( AIRCRAFT-AT ?auto_11346 ?auto_11341 ) ( FUEL-LEVEL ?auto_11346 ?auto_11344 ) ( IN ?auto_11348 ?auto_11346 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11348 ?auto_11343 ?auto_11341 )
      ( FLY-2PPL-VERIFY ?auto_11342 ?auto_11343 ?auto_11341 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11350 - PERSON
      ?auto_11351 - PERSON
      ?auto_11349 - CITY
    )
    :vars
    (
      ?auto_11352 - FLEVEL
      ?auto_11353 - FLEVEL
      ?auto_11355 - CITY
      ?auto_11356 - PERSON
      ?auto_11354 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11352 ?auto_11353 ) ( not ( = ?auto_11349 ?auto_11355 ) ) ( not ( = ?auto_11353 ?auto_11352 ) ) ( not ( = ?auto_11351 ?auto_11350 ) ) ( PERSON-AT ?auto_11350 ?auto_11355 ) ( not ( = ?auto_11351 ?auto_11356 ) ) ( not ( = ?auto_11350 ?auto_11356 ) ) ( PERSON-AT ?auto_11356 ?auto_11355 ) ( AIRCRAFT-AT ?auto_11354 ?auto_11349 ) ( FUEL-LEVEL ?auto_11354 ?auto_11352 ) ( IN ?auto_11351 ?auto_11354 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11351 ?auto_11350 ?auto_11349 )
      ( FLY-2PPL-VERIFY ?auto_11350 ?auto_11351 ?auto_11349 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11358 - PERSON
      ?auto_11359 - PERSON
      ?auto_11357 - CITY
    )
    :vars
    (
      ?auto_11360 - FLEVEL
      ?auto_11361 - FLEVEL
      ?auto_11363 - CITY
      ?auto_11364 - PERSON
      ?auto_11362 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11360 ?auto_11361 ) ( not ( = ?auto_11357 ?auto_11363 ) ) ( not ( = ?auto_11361 ?auto_11360 ) ) ( not ( = ?auto_11364 ?auto_11358 ) ) ( PERSON-AT ?auto_11358 ?auto_11363 ) ( not ( = ?auto_11364 ?auto_11359 ) ) ( not ( = ?auto_11358 ?auto_11359 ) ) ( PERSON-AT ?auto_11359 ?auto_11363 ) ( AIRCRAFT-AT ?auto_11362 ?auto_11357 ) ( FUEL-LEVEL ?auto_11362 ?auto_11360 ) ( IN ?auto_11364 ?auto_11362 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11364 ?auto_11358 ?auto_11357 )
      ( FLY-2PPL-VERIFY ?auto_11358 ?auto_11359 ?auto_11357 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11384 - PERSON
      ?auto_11385 - PERSON
      ?auto_11386 - PERSON
      ?auto_11383 - CITY
    )
    :vars
    (
      ?auto_11387 - FLEVEL
      ?auto_11388 - FLEVEL
      ?auto_11390 - CITY
      ?auto_11389 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11387 ?auto_11388 ) ( not ( = ?auto_11383 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11387 ) ) ( not ( = ?auto_11384 ?auto_11386 ) ) ( PERSON-AT ?auto_11386 ?auto_11390 ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( not ( = ?auto_11386 ?auto_11385 ) ) ( PERSON-AT ?auto_11385 ?auto_11390 ) ( AIRCRAFT-AT ?auto_11389 ?auto_11383 ) ( FUEL-LEVEL ?auto_11389 ?auto_11387 ) ( IN ?auto_11384 ?auto_11389 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11384 ?auto_11386 ?auto_11383 )
      ( FLY-3PPL-VERIFY ?auto_11384 ?auto_11385 ?auto_11386 ?auto_11383 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11401 - PERSON
      ?auto_11402 - PERSON
      ?auto_11403 - PERSON
      ?auto_11400 - CITY
    )
    :vars
    (
      ?auto_11404 - FLEVEL
      ?auto_11405 - FLEVEL
      ?auto_11407 - CITY
      ?auto_11406 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11404 ?auto_11405 ) ( not ( = ?auto_11400 ?auto_11407 ) ) ( not ( = ?auto_11405 ?auto_11404 ) ) ( not ( = ?auto_11401 ?auto_11402 ) ) ( PERSON-AT ?auto_11402 ?auto_11407 ) ( not ( = ?auto_11401 ?auto_11403 ) ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( PERSON-AT ?auto_11403 ?auto_11407 ) ( AIRCRAFT-AT ?auto_11406 ?auto_11400 ) ( FUEL-LEVEL ?auto_11406 ?auto_11404 ) ( IN ?auto_11401 ?auto_11406 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11401 ?auto_11402 ?auto_11400 )
      ( FLY-3PPL-VERIFY ?auto_11401 ?auto_11402 ?auto_11403 ?auto_11400 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11418 - PERSON
      ?auto_11419 - PERSON
      ?auto_11420 - PERSON
      ?auto_11417 - CITY
    )
    :vars
    (
      ?auto_11421 - FLEVEL
      ?auto_11422 - FLEVEL
      ?auto_11424 - CITY
      ?auto_11423 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11421 ?auto_11422 ) ( not ( = ?auto_11417 ?auto_11424 ) ) ( not ( = ?auto_11422 ?auto_11421 ) ) ( not ( = ?auto_11419 ?auto_11420 ) ) ( PERSON-AT ?auto_11420 ?auto_11424 ) ( not ( = ?auto_11419 ?auto_11418 ) ) ( not ( = ?auto_11420 ?auto_11418 ) ) ( PERSON-AT ?auto_11418 ?auto_11424 ) ( AIRCRAFT-AT ?auto_11423 ?auto_11417 ) ( FUEL-LEVEL ?auto_11423 ?auto_11421 ) ( IN ?auto_11419 ?auto_11423 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11419 ?auto_11420 ?auto_11417 )
      ( FLY-3PPL-VERIFY ?auto_11418 ?auto_11419 ?auto_11420 ?auto_11417 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11435 - PERSON
      ?auto_11436 - PERSON
      ?auto_11437 - PERSON
      ?auto_11434 - CITY
    )
    :vars
    (
      ?auto_11438 - FLEVEL
      ?auto_11439 - FLEVEL
      ?auto_11441 - CITY
      ?auto_11440 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11438 ?auto_11439 ) ( not ( = ?auto_11434 ?auto_11441 ) ) ( not ( = ?auto_11439 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11436 ) ) ( PERSON-AT ?auto_11436 ?auto_11441 ) ( not ( = ?auto_11437 ?auto_11435 ) ) ( not ( = ?auto_11436 ?auto_11435 ) ) ( PERSON-AT ?auto_11435 ?auto_11441 ) ( AIRCRAFT-AT ?auto_11440 ?auto_11434 ) ( FUEL-LEVEL ?auto_11440 ?auto_11438 ) ( IN ?auto_11437 ?auto_11440 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11437 ?auto_11436 ?auto_11434 )
      ( FLY-3PPL-VERIFY ?auto_11435 ?auto_11436 ?auto_11437 ?auto_11434 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11470 - PERSON
      ?auto_11471 - PERSON
      ?auto_11472 - PERSON
      ?auto_11469 - CITY
    )
    :vars
    (
      ?auto_11473 - FLEVEL
      ?auto_11474 - FLEVEL
      ?auto_11476 - CITY
      ?auto_11475 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11473 ?auto_11474 ) ( not ( = ?auto_11469 ?auto_11476 ) ) ( not ( = ?auto_11474 ?auto_11473 ) ) ( not ( = ?auto_11471 ?auto_11470 ) ) ( PERSON-AT ?auto_11470 ?auto_11476 ) ( not ( = ?auto_11471 ?auto_11472 ) ) ( not ( = ?auto_11470 ?auto_11472 ) ) ( PERSON-AT ?auto_11472 ?auto_11476 ) ( AIRCRAFT-AT ?auto_11475 ?auto_11469 ) ( FUEL-LEVEL ?auto_11475 ?auto_11473 ) ( IN ?auto_11471 ?auto_11475 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11471 ?auto_11470 ?auto_11469 )
      ( FLY-3PPL-VERIFY ?auto_11470 ?auto_11471 ?auto_11472 ?auto_11469 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11487 - PERSON
      ?auto_11488 - PERSON
      ?auto_11489 - PERSON
      ?auto_11486 - CITY
    )
    :vars
    (
      ?auto_11490 - FLEVEL
      ?auto_11491 - FLEVEL
      ?auto_11493 - CITY
      ?auto_11492 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_11490 ?auto_11491 ) ( not ( = ?auto_11486 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11487 ) ) ( PERSON-AT ?auto_11487 ?auto_11493 ) ( not ( = ?auto_11489 ?auto_11488 ) ) ( not ( = ?auto_11487 ?auto_11488 ) ) ( PERSON-AT ?auto_11488 ?auto_11493 ) ( AIRCRAFT-AT ?auto_11492 ?auto_11486 ) ( FUEL-LEVEL ?auto_11492 ?auto_11490 ) ( IN ?auto_11489 ?auto_11492 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11489 ?auto_11487 ?auto_11486 )
      ( FLY-3PPL-VERIFY ?auto_11487 ?auto_11488 ?auto_11489 ?auto_11486 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11541 - PERSON
      ?auto_11540 - CITY
    )
    :vars
    (
      ?auto_11542 - FLEVEL
      ?auto_11543 - FLEVEL
      ?auto_11545 - CITY
      ?auto_11547 - PERSON
      ?auto_11546 - PERSON
      ?auto_11544 - AIRCRAFT
      ?auto_11548 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11542 ?auto_11543 ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( not ( = ?auto_11543 ?auto_11542 ) ) ( not ( = ?auto_11547 ?auto_11541 ) ) ( PERSON-AT ?auto_11541 ?auto_11545 ) ( not ( = ?auto_11547 ?auto_11546 ) ) ( not ( = ?auto_11541 ?auto_11546 ) ) ( PERSON-AT ?auto_11546 ?auto_11545 ) ( IN ?auto_11547 ?auto_11544 ) ( AIRCRAFT-AT ?auto_11544 ?auto_11548 ) ( FUEL-LEVEL ?auto_11544 ?auto_11543 ) ( not ( = ?auto_11540 ?auto_11548 ) ) ( not ( = ?auto_11545 ?auto_11548 ) ) )
    :subtasks
    ( ( !FLY ?auto_11544 ?auto_11548 ?auto_11540 ?auto_11543 ?auto_11542 )
      ( FLY-2PPL ?auto_11547 ?auto_11541 ?auto_11540 )
      ( FLY-1PPL-VERIFY ?auto_11541 ?auto_11540 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11550 - PERSON
      ?auto_11551 - PERSON
      ?auto_11549 - CITY
    )
    :vars
    (
      ?auto_11555 - FLEVEL
      ?auto_11554 - FLEVEL
      ?auto_11556 - CITY
      ?auto_11557 - PERSON
      ?auto_11553 - AIRCRAFT
      ?auto_11552 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11555 ?auto_11554 ) ( not ( = ?auto_11549 ?auto_11556 ) ) ( not ( = ?auto_11554 ?auto_11555 ) ) ( not ( = ?auto_11550 ?auto_11551 ) ) ( PERSON-AT ?auto_11551 ?auto_11556 ) ( not ( = ?auto_11550 ?auto_11557 ) ) ( not ( = ?auto_11551 ?auto_11557 ) ) ( PERSON-AT ?auto_11557 ?auto_11556 ) ( IN ?auto_11550 ?auto_11553 ) ( AIRCRAFT-AT ?auto_11553 ?auto_11552 ) ( FUEL-LEVEL ?auto_11553 ?auto_11554 ) ( not ( = ?auto_11549 ?auto_11552 ) ) ( not ( = ?auto_11556 ?auto_11552 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11551 ?auto_11549 )
      ( FLY-2PPL-VERIFY ?auto_11550 ?auto_11551 ?auto_11549 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11559 - PERSON
      ?auto_11560 - PERSON
      ?auto_11558 - CITY
    )
    :vars
    (
      ?auto_11562 - FLEVEL
      ?auto_11563 - FLEVEL
      ?auto_11565 - CITY
      ?auto_11566 - PERSON
      ?auto_11564 - AIRCRAFT
      ?auto_11561 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11562 ?auto_11563 ) ( not ( = ?auto_11558 ?auto_11565 ) ) ( not ( = ?auto_11563 ?auto_11562 ) ) ( not ( = ?auto_11566 ?auto_11560 ) ) ( PERSON-AT ?auto_11560 ?auto_11565 ) ( not ( = ?auto_11566 ?auto_11559 ) ) ( not ( = ?auto_11560 ?auto_11559 ) ) ( PERSON-AT ?auto_11559 ?auto_11565 ) ( IN ?auto_11566 ?auto_11564 ) ( AIRCRAFT-AT ?auto_11564 ?auto_11561 ) ( FUEL-LEVEL ?auto_11564 ?auto_11563 ) ( not ( = ?auto_11558 ?auto_11561 ) ) ( not ( = ?auto_11565 ?auto_11561 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11566 ?auto_11560 ?auto_11558 )
      ( FLY-2PPL-VERIFY ?auto_11559 ?auto_11560 ?auto_11558 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11568 - PERSON
      ?auto_11569 - PERSON
      ?auto_11567 - CITY
    )
    :vars
    (
      ?auto_11571 - FLEVEL
      ?auto_11572 - FLEVEL
      ?auto_11575 - CITY
      ?auto_11573 - PERSON
      ?auto_11574 - AIRCRAFT
      ?auto_11570 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11571 ?auto_11572 ) ( not ( = ?auto_11567 ?auto_11575 ) ) ( not ( = ?auto_11572 ?auto_11571 ) ) ( not ( = ?auto_11569 ?auto_11568 ) ) ( PERSON-AT ?auto_11568 ?auto_11575 ) ( not ( = ?auto_11569 ?auto_11573 ) ) ( not ( = ?auto_11568 ?auto_11573 ) ) ( PERSON-AT ?auto_11573 ?auto_11575 ) ( IN ?auto_11569 ?auto_11574 ) ( AIRCRAFT-AT ?auto_11574 ?auto_11570 ) ( FUEL-LEVEL ?auto_11574 ?auto_11572 ) ( not ( = ?auto_11567 ?auto_11570 ) ) ( not ( = ?auto_11575 ?auto_11570 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11569 ?auto_11568 ?auto_11567 )
      ( FLY-2PPL-VERIFY ?auto_11568 ?auto_11569 ?auto_11567 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11577 - PERSON
      ?auto_11578 - PERSON
      ?auto_11576 - CITY
    )
    :vars
    (
      ?auto_11580 - FLEVEL
      ?auto_11581 - FLEVEL
      ?auto_11583 - CITY
      ?auto_11584 - PERSON
      ?auto_11582 - AIRCRAFT
      ?auto_11579 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11580 ?auto_11581 ) ( not ( = ?auto_11576 ?auto_11583 ) ) ( not ( = ?auto_11581 ?auto_11580 ) ) ( not ( = ?auto_11584 ?auto_11577 ) ) ( PERSON-AT ?auto_11577 ?auto_11583 ) ( not ( = ?auto_11584 ?auto_11578 ) ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( PERSON-AT ?auto_11578 ?auto_11583 ) ( IN ?auto_11584 ?auto_11582 ) ( AIRCRAFT-AT ?auto_11582 ?auto_11579 ) ( FUEL-LEVEL ?auto_11582 ?auto_11581 ) ( not ( = ?auto_11576 ?auto_11579 ) ) ( not ( = ?auto_11583 ?auto_11579 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11584 ?auto_11577 ?auto_11576 )
      ( FLY-2PPL-VERIFY ?auto_11577 ?auto_11578 ?auto_11576 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11606 - PERSON
      ?auto_11607 - PERSON
      ?auto_11608 - PERSON
      ?auto_11605 - CITY
    )
    :vars
    (
      ?auto_11610 - FLEVEL
      ?auto_11611 - FLEVEL
      ?auto_11613 - CITY
      ?auto_11612 - AIRCRAFT
      ?auto_11609 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11610 ?auto_11611 ) ( not ( = ?auto_11605 ?auto_11613 ) ) ( not ( = ?auto_11611 ?auto_11610 ) ) ( not ( = ?auto_11606 ?auto_11608 ) ) ( PERSON-AT ?auto_11608 ?auto_11613 ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( not ( = ?auto_11608 ?auto_11607 ) ) ( PERSON-AT ?auto_11607 ?auto_11613 ) ( IN ?auto_11606 ?auto_11612 ) ( AIRCRAFT-AT ?auto_11612 ?auto_11609 ) ( FUEL-LEVEL ?auto_11612 ?auto_11611 ) ( not ( = ?auto_11605 ?auto_11609 ) ) ( not ( = ?auto_11613 ?auto_11609 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11606 ?auto_11608 ?auto_11605 )
      ( FLY-3PPL-VERIFY ?auto_11606 ?auto_11607 ?auto_11608 ?auto_11605 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11625 - PERSON
      ?auto_11626 - PERSON
      ?auto_11627 - PERSON
      ?auto_11624 - CITY
    )
    :vars
    (
      ?auto_11629 - FLEVEL
      ?auto_11630 - FLEVEL
      ?auto_11632 - CITY
      ?auto_11631 - AIRCRAFT
      ?auto_11628 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11629 ?auto_11630 ) ( not ( = ?auto_11624 ?auto_11632 ) ) ( not ( = ?auto_11630 ?auto_11629 ) ) ( not ( = ?auto_11625 ?auto_11626 ) ) ( PERSON-AT ?auto_11626 ?auto_11632 ) ( not ( = ?auto_11625 ?auto_11627 ) ) ( not ( = ?auto_11626 ?auto_11627 ) ) ( PERSON-AT ?auto_11627 ?auto_11632 ) ( IN ?auto_11625 ?auto_11631 ) ( AIRCRAFT-AT ?auto_11631 ?auto_11628 ) ( FUEL-LEVEL ?auto_11631 ?auto_11630 ) ( not ( = ?auto_11624 ?auto_11628 ) ) ( not ( = ?auto_11632 ?auto_11628 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11625 ?auto_11626 ?auto_11624 )
      ( FLY-3PPL-VERIFY ?auto_11625 ?auto_11626 ?auto_11627 ?auto_11624 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11644 - PERSON
      ?auto_11645 - PERSON
      ?auto_11646 - PERSON
      ?auto_11643 - CITY
    )
    :vars
    (
      ?auto_11648 - FLEVEL
      ?auto_11649 - FLEVEL
      ?auto_11651 - CITY
      ?auto_11650 - AIRCRAFT
      ?auto_11647 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11648 ?auto_11649 ) ( not ( = ?auto_11643 ?auto_11651 ) ) ( not ( = ?auto_11649 ?auto_11648 ) ) ( not ( = ?auto_11645 ?auto_11646 ) ) ( PERSON-AT ?auto_11646 ?auto_11651 ) ( not ( = ?auto_11645 ?auto_11644 ) ) ( not ( = ?auto_11646 ?auto_11644 ) ) ( PERSON-AT ?auto_11644 ?auto_11651 ) ( IN ?auto_11645 ?auto_11650 ) ( AIRCRAFT-AT ?auto_11650 ?auto_11647 ) ( FUEL-LEVEL ?auto_11650 ?auto_11649 ) ( not ( = ?auto_11643 ?auto_11647 ) ) ( not ( = ?auto_11651 ?auto_11647 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11645 ?auto_11646 ?auto_11643 )
      ( FLY-3PPL-VERIFY ?auto_11644 ?auto_11645 ?auto_11646 ?auto_11643 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11663 - PERSON
      ?auto_11664 - PERSON
      ?auto_11665 - PERSON
      ?auto_11662 - CITY
    )
    :vars
    (
      ?auto_11667 - FLEVEL
      ?auto_11668 - FLEVEL
      ?auto_11670 - CITY
      ?auto_11669 - AIRCRAFT
      ?auto_11666 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11667 ?auto_11668 ) ( not ( = ?auto_11662 ?auto_11670 ) ) ( not ( = ?auto_11668 ?auto_11667 ) ) ( not ( = ?auto_11665 ?auto_11664 ) ) ( PERSON-AT ?auto_11664 ?auto_11670 ) ( not ( = ?auto_11665 ?auto_11663 ) ) ( not ( = ?auto_11664 ?auto_11663 ) ) ( PERSON-AT ?auto_11663 ?auto_11670 ) ( IN ?auto_11665 ?auto_11669 ) ( AIRCRAFT-AT ?auto_11669 ?auto_11666 ) ( FUEL-LEVEL ?auto_11669 ?auto_11668 ) ( not ( = ?auto_11662 ?auto_11666 ) ) ( not ( = ?auto_11670 ?auto_11666 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11665 ?auto_11664 ?auto_11662 )
      ( FLY-3PPL-VERIFY ?auto_11663 ?auto_11664 ?auto_11665 ?auto_11662 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11702 - PERSON
      ?auto_11703 - PERSON
      ?auto_11704 - PERSON
      ?auto_11701 - CITY
    )
    :vars
    (
      ?auto_11706 - FLEVEL
      ?auto_11707 - FLEVEL
      ?auto_11709 - CITY
      ?auto_11708 - AIRCRAFT
      ?auto_11705 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11706 ?auto_11707 ) ( not ( = ?auto_11701 ?auto_11709 ) ) ( not ( = ?auto_11707 ?auto_11706 ) ) ( not ( = ?auto_11703 ?auto_11702 ) ) ( PERSON-AT ?auto_11702 ?auto_11709 ) ( not ( = ?auto_11703 ?auto_11704 ) ) ( not ( = ?auto_11702 ?auto_11704 ) ) ( PERSON-AT ?auto_11704 ?auto_11709 ) ( IN ?auto_11703 ?auto_11708 ) ( AIRCRAFT-AT ?auto_11708 ?auto_11705 ) ( FUEL-LEVEL ?auto_11708 ?auto_11707 ) ( not ( = ?auto_11701 ?auto_11705 ) ) ( not ( = ?auto_11709 ?auto_11705 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11703 ?auto_11702 ?auto_11701 )
      ( FLY-3PPL-VERIFY ?auto_11702 ?auto_11703 ?auto_11704 ?auto_11701 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11721 - PERSON
      ?auto_11722 - PERSON
      ?auto_11723 - PERSON
      ?auto_11720 - CITY
    )
    :vars
    (
      ?auto_11725 - FLEVEL
      ?auto_11726 - FLEVEL
      ?auto_11728 - CITY
      ?auto_11727 - AIRCRAFT
      ?auto_11724 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11725 ?auto_11726 ) ( not ( = ?auto_11720 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11725 ) ) ( not ( = ?auto_11723 ?auto_11721 ) ) ( PERSON-AT ?auto_11721 ?auto_11728 ) ( not ( = ?auto_11723 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( PERSON-AT ?auto_11722 ?auto_11728 ) ( IN ?auto_11723 ?auto_11727 ) ( AIRCRAFT-AT ?auto_11727 ?auto_11724 ) ( FUEL-LEVEL ?auto_11727 ?auto_11726 ) ( not ( = ?auto_11720 ?auto_11724 ) ) ( not ( = ?auto_11728 ?auto_11724 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11723 ?auto_11721 ?auto_11720 )
      ( FLY-3PPL-VERIFY ?auto_11721 ?auto_11722 ?auto_11723 ?auto_11720 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_11781 - PERSON
      ?auto_11780 - CITY
    )
    :vars
    (
      ?auto_11783 - FLEVEL
      ?auto_11784 - FLEVEL
      ?auto_11787 - CITY
      ?auto_11788 - PERSON
      ?auto_11785 - PERSON
      ?auto_11786 - AIRCRAFT
      ?auto_11782 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11783 ?auto_11784 ) ( not ( = ?auto_11780 ?auto_11787 ) ) ( not ( = ?auto_11784 ?auto_11783 ) ) ( not ( = ?auto_11788 ?auto_11781 ) ) ( PERSON-AT ?auto_11781 ?auto_11787 ) ( not ( = ?auto_11788 ?auto_11785 ) ) ( not ( = ?auto_11781 ?auto_11785 ) ) ( PERSON-AT ?auto_11785 ?auto_11787 ) ( AIRCRAFT-AT ?auto_11786 ?auto_11782 ) ( FUEL-LEVEL ?auto_11786 ?auto_11784 ) ( not ( = ?auto_11780 ?auto_11782 ) ) ( not ( = ?auto_11787 ?auto_11782 ) ) ( PERSON-AT ?auto_11788 ?auto_11782 ) )
    :subtasks
    ( ( !BOARD ?auto_11788 ?auto_11786 ?auto_11782 )
      ( FLY-2PPL ?auto_11788 ?auto_11781 ?auto_11780 )
      ( FLY-1PPL-VERIFY ?auto_11781 ?auto_11780 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11790 - PERSON
      ?auto_11791 - PERSON
      ?auto_11789 - CITY
    )
    :vars
    (
      ?auto_11795 - FLEVEL
      ?auto_11793 - FLEVEL
      ?auto_11794 - CITY
      ?auto_11792 - PERSON
      ?auto_11796 - AIRCRAFT
      ?auto_11797 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11795 ?auto_11793 ) ( not ( = ?auto_11789 ?auto_11794 ) ) ( not ( = ?auto_11793 ?auto_11795 ) ) ( not ( = ?auto_11790 ?auto_11791 ) ) ( PERSON-AT ?auto_11791 ?auto_11794 ) ( not ( = ?auto_11790 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( PERSON-AT ?auto_11792 ?auto_11794 ) ( AIRCRAFT-AT ?auto_11796 ?auto_11797 ) ( FUEL-LEVEL ?auto_11796 ?auto_11793 ) ( not ( = ?auto_11789 ?auto_11797 ) ) ( not ( = ?auto_11794 ?auto_11797 ) ) ( PERSON-AT ?auto_11790 ?auto_11797 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_11791 ?auto_11789 )
      ( FLY-2PPL-VERIFY ?auto_11790 ?auto_11791 ?auto_11789 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11799 - PERSON
      ?auto_11800 - PERSON
      ?auto_11798 - CITY
    )
    :vars
    (
      ?auto_11804 - FLEVEL
      ?auto_11801 - FLEVEL
      ?auto_11802 - CITY
      ?auto_11806 - PERSON
      ?auto_11803 - AIRCRAFT
      ?auto_11805 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11804 ?auto_11801 ) ( not ( = ?auto_11798 ?auto_11802 ) ) ( not ( = ?auto_11801 ?auto_11804 ) ) ( not ( = ?auto_11806 ?auto_11800 ) ) ( PERSON-AT ?auto_11800 ?auto_11802 ) ( not ( = ?auto_11806 ?auto_11799 ) ) ( not ( = ?auto_11800 ?auto_11799 ) ) ( PERSON-AT ?auto_11799 ?auto_11802 ) ( AIRCRAFT-AT ?auto_11803 ?auto_11805 ) ( FUEL-LEVEL ?auto_11803 ?auto_11801 ) ( not ( = ?auto_11798 ?auto_11805 ) ) ( not ( = ?auto_11802 ?auto_11805 ) ) ( PERSON-AT ?auto_11806 ?auto_11805 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11806 ?auto_11800 ?auto_11798 )
      ( FLY-2PPL-VERIFY ?auto_11799 ?auto_11800 ?auto_11798 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11808 - PERSON
      ?auto_11809 - PERSON
      ?auto_11807 - CITY
    )
    :vars
    (
      ?auto_11814 - FLEVEL
      ?auto_11810 - FLEVEL
      ?auto_11812 - CITY
      ?auto_11811 - PERSON
      ?auto_11813 - AIRCRAFT
      ?auto_11815 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11814 ?auto_11810 ) ( not ( = ?auto_11807 ?auto_11812 ) ) ( not ( = ?auto_11810 ?auto_11814 ) ) ( not ( = ?auto_11809 ?auto_11808 ) ) ( PERSON-AT ?auto_11808 ?auto_11812 ) ( not ( = ?auto_11809 ?auto_11811 ) ) ( not ( = ?auto_11808 ?auto_11811 ) ) ( PERSON-AT ?auto_11811 ?auto_11812 ) ( AIRCRAFT-AT ?auto_11813 ?auto_11815 ) ( FUEL-LEVEL ?auto_11813 ?auto_11810 ) ( not ( = ?auto_11807 ?auto_11815 ) ) ( not ( = ?auto_11812 ?auto_11815 ) ) ( PERSON-AT ?auto_11809 ?auto_11815 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11809 ?auto_11808 ?auto_11807 )
      ( FLY-2PPL-VERIFY ?auto_11808 ?auto_11809 ?auto_11807 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_11817 - PERSON
      ?auto_11818 - PERSON
      ?auto_11816 - CITY
    )
    :vars
    (
      ?auto_11822 - FLEVEL
      ?auto_11819 - FLEVEL
      ?auto_11820 - CITY
      ?auto_11824 - PERSON
      ?auto_11821 - AIRCRAFT
      ?auto_11823 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11822 ?auto_11819 ) ( not ( = ?auto_11816 ?auto_11820 ) ) ( not ( = ?auto_11819 ?auto_11822 ) ) ( not ( = ?auto_11824 ?auto_11817 ) ) ( PERSON-AT ?auto_11817 ?auto_11820 ) ( not ( = ?auto_11824 ?auto_11818 ) ) ( not ( = ?auto_11817 ?auto_11818 ) ) ( PERSON-AT ?auto_11818 ?auto_11820 ) ( AIRCRAFT-AT ?auto_11821 ?auto_11823 ) ( FUEL-LEVEL ?auto_11821 ?auto_11819 ) ( not ( = ?auto_11816 ?auto_11823 ) ) ( not ( = ?auto_11820 ?auto_11823 ) ) ( PERSON-AT ?auto_11824 ?auto_11823 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11824 ?auto_11817 ?auto_11816 )
      ( FLY-2PPL-VERIFY ?auto_11817 ?auto_11818 ?auto_11816 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11846 - PERSON
      ?auto_11847 - PERSON
      ?auto_11848 - PERSON
      ?auto_11845 - CITY
    )
    :vars
    (
      ?auto_11852 - FLEVEL
      ?auto_11849 - FLEVEL
      ?auto_11850 - CITY
      ?auto_11851 - AIRCRAFT
      ?auto_11853 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11852 ?auto_11849 ) ( not ( = ?auto_11845 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( PERSON-AT ?auto_11848 ?auto_11850 ) ( not ( = ?auto_11846 ?auto_11847 ) ) ( not ( = ?auto_11848 ?auto_11847 ) ) ( PERSON-AT ?auto_11847 ?auto_11850 ) ( AIRCRAFT-AT ?auto_11851 ?auto_11853 ) ( FUEL-LEVEL ?auto_11851 ?auto_11849 ) ( not ( = ?auto_11845 ?auto_11853 ) ) ( not ( = ?auto_11850 ?auto_11853 ) ) ( PERSON-AT ?auto_11846 ?auto_11853 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11846 ?auto_11848 ?auto_11845 )
      ( FLY-3PPL-VERIFY ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11845 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11865 - PERSON
      ?auto_11866 - PERSON
      ?auto_11867 - PERSON
      ?auto_11864 - CITY
    )
    :vars
    (
      ?auto_11871 - FLEVEL
      ?auto_11868 - FLEVEL
      ?auto_11869 - CITY
      ?auto_11870 - AIRCRAFT
      ?auto_11872 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11871 ?auto_11868 ) ( not ( = ?auto_11864 ?auto_11869 ) ) ( not ( = ?auto_11868 ?auto_11871 ) ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( PERSON-AT ?auto_11866 ?auto_11869 ) ( not ( = ?auto_11865 ?auto_11867 ) ) ( not ( = ?auto_11866 ?auto_11867 ) ) ( PERSON-AT ?auto_11867 ?auto_11869 ) ( AIRCRAFT-AT ?auto_11870 ?auto_11872 ) ( FUEL-LEVEL ?auto_11870 ?auto_11868 ) ( not ( = ?auto_11864 ?auto_11872 ) ) ( not ( = ?auto_11869 ?auto_11872 ) ) ( PERSON-AT ?auto_11865 ?auto_11872 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11865 ?auto_11866 ?auto_11864 )
      ( FLY-3PPL-VERIFY ?auto_11865 ?auto_11866 ?auto_11867 ?auto_11864 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11884 - PERSON
      ?auto_11885 - PERSON
      ?auto_11886 - PERSON
      ?auto_11883 - CITY
    )
    :vars
    (
      ?auto_11890 - FLEVEL
      ?auto_11887 - FLEVEL
      ?auto_11888 - CITY
      ?auto_11889 - AIRCRAFT
      ?auto_11891 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11890 ?auto_11887 ) ( not ( = ?auto_11883 ?auto_11888 ) ) ( not ( = ?auto_11887 ?auto_11890 ) ) ( not ( = ?auto_11885 ?auto_11886 ) ) ( PERSON-AT ?auto_11886 ?auto_11888 ) ( not ( = ?auto_11885 ?auto_11884 ) ) ( not ( = ?auto_11886 ?auto_11884 ) ) ( PERSON-AT ?auto_11884 ?auto_11888 ) ( AIRCRAFT-AT ?auto_11889 ?auto_11891 ) ( FUEL-LEVEL ?auto_11889 ?auto_11887 ) ( not ( = ?auto_11883 ?auto_11891 ) ) ( not ( = ?auto_11888 ?auto_11891 ) ) ( PERSON-AT ?auto_11885 ?auto_11891 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11885 ?auto_11886 ?auto_11883 )
      ( FLY-3PPL-VERIFY ?auto_11884 ?auto_11885 ?auto_11886 ?auto_11883 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11903 - PERSON
      ?auto_11904 - PERSON
      ?auto_11905 - PERSON
      ?auto_11902 - CITY
    )
    :vars
    (
      ?auto_11909 - FLEVEL
      ?auto_11906 - FLEVEL
      ?auto_11907 - CITY
      ?auto_11908 - AIRCRAFT
      ?auto_11910 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11909 ?auto_11906 ) ( not ( = ?auto_11902 ?auto_11907 ) ) ( not ( = ?auto_11906 ?auto_11909 ) ) ( not ( = ?auto_11905 ?auto_11904 ) ) ( PERSON-AT ?auto_11904 ?auto_11907 ) ( not ( = ?auto_11905 ?auto_11903 ) ) ( not ( = ?auto_11904 ?auto_11903 ) ) ( PERSON-AT ?auto_11903 ?auto_11907 ) ( AIRCRAFT-AT ?auto_11908 ?auto_11910 ) ( FUEL-LEVEL ?auto_11908 ?auto_11906 ) ( not ( = ?auto_11902 ?auto_11910 ) ) ( not ( = ?auto_11907 ?auto_11910 ) ) ( PERSON-AT ?auto_11905 ?auto_11910 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11905 ?auto_11904 ?auto_11902 )
      ( FLY-3PPL-VERIFY ?auto_11903 ?auto_11904 ?auto_11905 ?auto_11902 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11942 - PERSON
      ?auto_11943 - PERSON
      ?auto_11944 - PERSON
      ?auto_11941 - CITY
    )
    :vars
    (
      ?auto_11948 - FLEVEL
      ?auto_11945 - FLEVEL
      ?auto_11946 - CITY
      ?auto_11947 - AIRCRAFT
      ?auto_11949 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11948 ?auto_11945 ) ( not ( = ?auto_11941 ?auto_11946 ) ) ( not ( = ?auto_11945 ?auto_11948 ) ) ( not ( = ?auto_11943 ?auto_11942 ) ) ( PERSON-AT ?auto_11942 ?auto_11946 ) ( not ( = ?auto_11943 ?auto_11944 ) ) ( not ( = ?auto_11942 ?auto_11944 ) ) ( PERSON-AT ?auto_11944 ?auto_11946 ) ( AIRCRAFT-AT ?auto_11947 ?auto_11949 ) ( FUEL-LEVEL ?auto_11947 ?auto_11945 ) ( not ( = ?auto_11941 ?auto_11949 ) ) ( not ( = ?auto_11946 ?auto_11949 ) ) ( PERSON-AT ?auto_11943 ?auto_11949 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11943 ?auto_11942 ?auto_11941 )
      ( FLY-3PPL-VERIFY ?auto_11942 ?auto_11943 ?auto_11944 ?auto_11941 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_11961 - PERSON
      ?auto_11962 - PERSON
      ?auto_11963 - PERSON
      ?auto_11960 - CITY
    )
    :vars
    (
      ?auto_11967 - FLEVEL
      ?auto_11964 - FLEVEL
      ?auto_11965 - CITY
      ?auto_11966 - AIRCRAFT
      ?auto_11968 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_11967 ?auto_11964 ) ( not ( = ?auto_11960 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11967 ) ) ( not ( = ?auto_11963 ?auto_11961 ) ) ( PERSON-AT ?auto_11961 ?auto_11965 ) ( not ( = ?auto_11963 ?auto_11962 ) ) ( not ( = ?auto_11961 ?auto_11962 ) ) ( PERSON-AT ?auto_11962 ?auto_11965 ) ( AIRCRAFT-AT ?auto_11966 ?auto_11968 ) ( FUEL-LEVEL ?auto_11966 ?auto_11964 ) ( not ( = ?auto_11960 ?auto_11968 ) ) ( not ( = ?auto_11965 ?auto_11968 ) ) ( PERSON-AT ?auto_11963 ?auto_11968 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_11963 ?auto_11961 ?auto_11960 )
      ( FLY-3PPL-VERIFY ?auto_11961 ?auto_11962 ?auto_11963 ?auto_11960 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12021 - PERSON
      ?auto_12020 - CITY
    )
    :vars
    (
      ?auto_12026 - FLEVEL
      ?auto_12022 - FLEVEL
      ?auto_12024 - CITY
      ?auto_12028 - PERSON
      ?auto_12023 - PERSON
      ?auto_12025 - AIRCRAFT
      ?auto_12027 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12026 ?auto_12022 ) ( not ( = ?auto_12020 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12026 ) ) ( not ( = ?auto_12028 ?auto_12021 ) ) ( PERSON-AT ?auto_12021 ?auto_12024 ) ( not ( = ?auto_12028 ?auto_12023 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( PERSON-AT ?auto_12023 ?auto_12024 ) ( AIRCRAFT-AT ?auto_12025 ?auto_12027 ) ( not ( = ?auto_12020 ?auto_12027 ) ) ( not ( = ?auto_12024 ?auto_12027 ) ) ( PERSON-AT ?auto_12028 ?auto_12027 ) ( FUEL-LEVEL ?auto_12025 ?auto_12026 ) )
    :subtasks
    ( ( !REFUEL ?auto_12025 ?auto_12027 ?auto_12026 ?auto_12022 )
      ( FLY-2PPL ?auto_12028 ?auto_12021 ?auto_12020 )
      ( FLY-1PPL-VERIFY ?auto_12021 ?auto_12020 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12030 - PERSON
      ?auto_12031 - PERSON
      ?auto_12029 - CITY
    )
    :vars
    (
      ?auto_12032 - FLEVEL
      ?auto_12033 - FLEVEL
      ?auto_12034 - CITY
      ?auto_12035 - PERSON
      ?auto_12037 - AIRCRAFT
      ?auto_12036 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12032 ?auto_12033 ) ( not ( = ?auto_12029 ?auto_12034 ) ) ( not ( = ?auto_12033 ?auto_12032 ) ) ( not ( = ?auto_12030 ?auto_12031 ) ) ( PERSON-AT ?auto_12031 ?auto_12034 ) ( not ( = ?auto_12030 ?auto_12035 ) ) ( not ( = ?auto_12031 ?auto_12035 ) ) ( PERSON-AT ?auto_12035 ?auto_12034 ) ( AIRCRAFT-AT ?auto_12037 ?auto_12036 ) ( not ( = ?auto_12029 ?auto_12036 ) ) ( not ( = ?auto_12034 ?auto_12036 ) ) ( PERSON-AT ?auto_12030 ?auto_12036 ) ( FUEL-LEVEL ?auto_12037 ?auto_12032 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12031 ?auto_12029 )
      ( FLY-2PPL-VERIFY ?auto_12030 ?auto_12031 ?auto_12029 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12039 - PERSON
      ?auto_12040 - PERSON
      ?auto_12038 - CITY
    )
    :vars
    (
      ?auto_12044 - FLEVEL
      ?auto_12045 - FLEVEL
      ?auto_12042 - CITY
      ?auto_12046 - PERSON
      ?auto_12041 - AIRCRAFT
      ?auto_12043 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12044 ?auto_12045 ) ( not ( = ?auto_12038 ?auto_12042 ) ) ( not ( = ?auto_12045 ?auto_12044 ) ) ( not ( = ?auto_12046 ?auto_12040 ) ) ( PERSON-AT ?auto_12040 ?auto_12042 ) ( not ( = ?auto_12046 ?auto_12039 ) ) ( not ( = ?auto_12040 ?auto_12039 ) ) ( PERSON-AT ?auto_12039 ?auto_12042 ) ( AIRCRAFT-AT ?auto_12041 ?auto_12043 ) ( not ( = ?auto_12038 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( PERSON-AT ?auto_12046 ?auto_12043 ) ( FUEL-LEVEL ?auto_12041 ?auto_12044 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12046 ?auto_12040 ?auto_12038 )
      ( FLY-2PPL-VERIFY ?auto_12039 ?auto_12040 ?auto_12038 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12048 - PERSON
      ?auto_12049 - PERSON
      ?auto_12047 - CITY
    )
    :vars
    (
      ?auto_12054 - FLEVEL
      ?auto_12055 - FLEVEL
      ?auto_12051 - CITY
      ?auto_12053 - PERSON
      ?auto_12050 - AIRCRAFT
      ?auto_12052 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12054 ?auto_12055 ) ( not ( = ?auto_12047 ?auto_12051 ) ) ( not ( = ?auto_12055 ?auto_12054 ) ) ( not ( = ?auto_12049 ?auto_12048 ) ) ( PERSON-AT ?auto_12048 ?auto_12051 ) ( not ( = ?auto_12049 ?auto_12053 ) ) ( not ( = ?auto_12048 ?auto_12053 ) ) ( PERSON-AT ?auto_12053 ?auto_12051 ) ( AIRCRAFT-AT ?auto_12050 ?auto_12052 ) ( not ( = ?auto_12047 ?auto_12052 ) ) ( not ( = ?auto_12051 ?auto_12052 ) ) ( PERSON-AT ?auto_12049 ?auto_12052 ) ( FUEL-LEVEL ?auto_12050 ?auto_12054 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12049 ?auto_12048 ?auto_12047 )
      ( FLY-2PPL-VERIFY ?auto_12048 ?auto_12049 ?auto_12047 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12057 - PERSON
      ?auto_12058 - PERSON
      ?auto_12056 - CITY
    )
    :vars
    (
      ?auto_12062 - FLEVEL
      ?auto_12063 - FLEVEL
      ?auto_12060 - CITY
      ?auto_12064 - PERSON
      ?auto_12059 - AIRCRAFT
      ?auto_12061 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12062 ?auto_12063 ) ( not ( = ?auto_12056 ?auto_12060 ) ) ( not ( = ?auto_12063 ?auto_12062 ) ) ( not ( = ?auto_12064 ?auto_12057 ) ) ( PERSON-AT ?auto_12057 ?auto_12060 ) ( not ( = ?auto_12064 ?auto_12058 ) ) ( not ( = ?auto_12057 ?auto_12058 ) ) ( PERSON-AT ?auto_12058 ?auto_12060 ) ( AIRCRAFT-AT ?auto_12059 ?auto_12061 ) ( not ( = ?auto_12056 ?auto_12061 ) ) ( not ( = ?auto_12060 ?auto_12061 ) ) ( PERSON-AT ?auto_12064 ?auto_12061 ) ( FUEL-LEVEL ?auto_12059 ?auto_12062 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12064 ?auto_12057 ?auto_12056 )
      ( FLY-2PPL-VERIFY ?auto_12057 ?auto_12058 ?auto_12056 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12086 - PERSON
      ?auto_12087 - PERSON
      ?auto_12088 - PERSON
      ?auto_12085 - CITY
    )
    :vars
    (
      ?auto_12092 - FLEVEL
      ?auto_12093 - FLEVEL
      ?auto_12090 - CITY
      ?auto_12089 - AIRCRAFT
      ?auto_12091 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12092 ?auto_12093 ) ( not ( = ?auto_12085 ?auto_12090 ) ) ( not ( = ?auto_12093 ?auto_12092 ) ) ( not ( = ?auto_12086 ?auto_12088 ) ) ( PERSON-AT ?auto_12088 ?auto_12090 ) ( not ( = ?auto_12086 ?auto_12087 ) ) ( not ( = ?auto_12088 ?auto_12087 ) ) ( PERSON-AT ?auto_12087 ?auto_12090 ) ( AIRCRAFT-AT ?auto_12089 ?auto_12091 ) ( not ( = ?auto_12085 ?auto_12091 ) ) ( not ( = ?auto_12090 ?auto_12091 ) ) ( PERSON-AT ?auto_12086 ?auto_12091 ) ( FUEL-LEVEL ?auto_12089 ?auto_12092 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12086 ?auto_12088 ?auto_12085 )
      ( FLY-3PPL-VERIFY ?auto_12086 ?auto_12087 ?auto_12088 ?auto_12085 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12105 - PERSON
      ?auto_12106 - PERSON
      ?auto_12107 - PERSON
      ?auto_12104 - CITY
    )
    :vars
    (
      ?auto_12111 - FLEVEL
      ?auto_12112 - FLEVEL
      ?auto_12109 - CITY
      ?auto_12108 - AIRCRAFT
      ?auto_12110 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12111 ?auto_12112 ) ( not ( = ?auto_12104 ?auto_12109 ) ) ( not ( = ?auto_12112 ?auto_12111 ) ) ( not ( = ?auto_12105 ?auto_12106 ) ) ( PERSON-AT ?auto_12106 ?auto_12109 ) ( not ( = ?auto_12105 ?auto_12107 ) ) ( not ( = ?auto_12106 ?auto_12107 ) ) ( PERSON-AT ?auto_12107 ?auto_12109 ) ( AIRCRAFT-AT ?auto_12108 ?auto_12110 ) ( not ( = ?auto_12104 ?auto_12110 ) ) ( not ( = ?auto_12109 ?auto_12110 ) ) ( PERSON-AT ?auto_12105 ?auto_12110 ) ( FUEL-LEVEL ?auto_12108 ?auto_12111 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12105 ?auto_12106 ?auto_12104 )
      ( FLY-3PPL-VERIFY ?auto_12105 ?auto_12106 ?auto_12107 ?auto_12104 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12124 - PERSON
      ?auto_12125 - PERSON
      ?auto_12126 - PERSON
      ?auto_12123 - CITY
    )
    :vars
    (
      ?auto_12130 - FLEVEL
      ?auto_12131 - FLEVEL
      ?auto_12128 - CITY
      ?auto_12127 - AIRCRAFT
      ?auto_12129 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12130 ?auto_12131 ) ( not ( = ?auto_12123 ?auto_12128 ) ) ( not ( = ?auto_12131 ?auto_12130 ) ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( PERSON-AT ?auto_12126 ?auto_12128 ) ( not ( = ?auto_12125 ?auto_12124 ) ) ( not ( = ?auto_12126 ?auto_12124 ) ) ( PERSON-AT ?auto_12124 ?auto_12128 ) ( AIRCRAFT-AT ?auto_12127 ?auto_12129 ) ( not ( = ?auto_12123 ?auto_12129 ) ) ( not ( = ?auto_12128 ?auto_12129 ) ) ( PERSON-AT ?auto_12125 ?auto_12129 ) ( FUEL-LEVEL ?auto_12127 ?auto_12130 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12125 ?auto_12126 ?auto_12123 )
      ( FLY-3PPL-VERIFY ?auto_12124 ?auto_12125 ?auto_12126 ?auto_12123 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12143 - PERSON
      ?auto_12144 - PERSON
      ?auto_12145 - PERSON
      ?auto_12142 - CITY
    )
    :vars
    (
      ?auto_12149 - FLEVEL
      ?auto_12150 - FLEVEL
      ?auto_12147 - CITY
      ?auto_12146 - AIRCRAFT
      ?auto_12148 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12149 ?auto_12150 ) ( not ( = ?auto_12142 ?auto_12147 ) ) ( not ( = ?auto_12150 ?auto_12149 ) ) ( not ( = ?auto_12145 ?auto_12144 ) ) ( PERSON-AT ?auto_12144 ?auto_12147 ) ( not ( = ?auto_12145 ?auto_12143 ) ) ( not ( = ?auto_12144 ?auto_12143 ) ) ( PERSON-AT ?auto_12143 ?auto_12147 ) ( AIRCRAFT-AT ?auto_12146 ?auto_12148 ) ( not ( = ?auto_12142 ?auto_12148 ) ) ( not ( = ?auto_12147 ?auto_12148 ) ) ( PERSON-AT ?auto_12145 ?auto_12148 ) ( FUEL-LEVEL ?auto_12146 ?auto_12149 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12145 ?auto_12144 ?auto_12142 )
      ( FLY-3PPL-VERIFY ?auto_12143 ?auto_12144 ?auto_12145 ?auto_12142 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12182 - PERSON
      ?auto_12183 - PERSON
      ?auto_12184 - PERSON
      ?auto_12181 - CITY
    )
    :vars
    (
      ?auto_12188 - FLEVEL
      ?auto_12189 - FLEVEL
      ?auto_12186 - CITY
      ?auto_12185 - AIRCRAFT
      ?auto_12187 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12188 ?auto_12189 ) ( not ( = ?auto_12181 ?auto_12186 ) ) ( not ( = ?auto_12189 ?auto_12188 ) ) ( not ( = ?auto_12183 ?auto_12182 ) ) ( PERSON-AT ?auto_12182 ?auto_12186 ) ( not ( = ?auto_12183 ?auto_12184 ) ) ( not ( = ?auto_12182 ?auto_12184 ) ) ( PERSON-AT ?auto_12184 ?auto_12186 ) ( AIRCRAFT-AT ?auto_12185 ?auto_12187 ) ( not ( = ?auto_12181 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( PERSON-AT ?auto_12183 ?auto_12187 ) ( FUEL-LEVEL ?auto_12185 ?auto_12188 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12183 ?auto_12182 ?auto_12181 )
      ( FLY-3PPL-VERIFY ?auto_12182 ?auto_12183 ?auto_12184 ?auto_12181 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12201 - PERSON
      ?auto_12202 - PERSON
      ?auto_12203 - PERSON
      ?auto_12200 - CITY
    )
    :vars
    (
      ?auto_12207 - FLEVEL
      ?auto_12208 - FLEVEL
      ?auto_12205 - CITY
      ?auto_12204 - AIRCRAFT
      ?auto_12206 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_12207 ?auto_12208 ) ( not ( = ?auto_12200 ?auto_12205 ) ) ( not ( = ?auto_12208 ?auto_12207 ) ) ( not ( = ?auto_12203 ?auto_12201 ) ) ( PERSON-AT ?auto_12201 ?auto_12205 ) ( not ( = ?auto_12203 ?auto_12202 ) ) ( not ( = ?auto_12201 ?auto_12202 ) ) ( PERSON-AT ?auto_12202 ?auto_12205 ) ( AIRCRAFT-AT ?auto_12204 ?auto_12206 ) ( not ( = ?auto_12200 ?auto_12206 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( PERSON-AT ?auto_12203 ?auto_12206 ) ( FUEL-LEVEL ?auto_12204 ?auto_12207 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12203 ?auto_12201 ?auto_12200 )
      ( FLY-3PPL-VERIFY ?auto_12201 ?auto_12202 ?auto_12203 ?auto_12200 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12261 - PERSON
      ?auto_12260 - CITY
    )
    :vars
    (
      ?auto_12266 - FLEVEL
      ?auto_12267 - FLEVEL
      ?auto_12263 - CITY
      ?auto_12268 - PERSON
      ?auto_12265 - PERSON
      ?auto_12264 - CITY
      ?auto_12262 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12266 ?auto_12267 ) ( not ( = ?auto_12260 ?auto_12263 ) ) ( not ( = ?auto_12267 ?auto_12266 ) ) ( not ( = ?auto_12268 ?auto_12261 ) ) ( PERSON-AT ?auto_12261 ?auto_12263 ) ( not ( = ?auto_12268 ?auto_12265 ) ) ( not ( = ?auto_12261 ?auto_12265 ) ) ( PERSON-AT ?auto_12265 ?auto_12263 ) ( not ( = ?auto_12260 ?auto_12264 ) ) ( not ( = ?auto_12263 ?auto_12264 ) ) ( PERSON-AT ?auto_12268 ?auto_12264 ) ( AIRCRAFT-AT ?auto_12262 ?auto_12260 ) ( FUEL-LEVEL ?auto_12262 ?auto_12267 ) )
    :subtasks
    ( ( !FLY ?auto_12262 ?auto_12260 ?auto_12264 ?auto_12267 ?auto_12266 )
      ( FLY-2PPL ?auto_12268 ?auto_12261 ?auto_12260 )
      ( FLY-1PPL-VERIFY ?auto_12261 ?auto_12260 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12270 - PERSON
      ?auto_12271 - PERSON
      ?auto_12269 - CITY
    )
    :vars
    (
      ?auto_12277 - FLEVEL
      ?auto_12274 - FLEVEL
      ?auto_12276 - CITY
      ?auto_12275 - PERSON
      ?auto_12272 - CITY
      ?auto_12273 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12277 ?auto_12274 ) ( not ( = ?auto_12269 ?auto_12276 ) ) ( not ( = ?auto_12274 ?auto_12277 ) ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( PERSON-AT ?auto_12271 ?auto_12276 ) ( not ( = ?auto_12270 ?auto_12275 ) ) ( not ( = ?auto_12271 ?auto_12275 ) ) ( PERSON-AT ?auto_12275 ?auto_12276 ) ( not ( = ?auto_12269 ?auto_12272 ) ) ( not ( = ?auto_12276 ?auto_12272 ) ) ( PERSON-AT ?auto_12270 ?auto_12272 ) ( AIRCRAFT-AT ?auto_12273 ?auto_12269 ) ( FUEL-LEVEL ?auto_12273 ?auto_12274 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12271 ?auto_12269 )
      ( FLY-2PPL-VERIFY ?auto_12270 ?auto_12271 ?auto_12269 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12279 - PERSON
      ?auto_12280 - PERSON
      ?auto_12278 - CITY
    )
    :vars
    (
      ?auto_12282 - FLEVEL
      ?auto_12285 - FLEVEL
      ?auto_12284 - CITY
      ?auto_12286 - PERSON
      ?auto_12283 - CITY
      ?auto_12281 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12282 ?auto_12285 ) ( not ( = ?auto_12278 ?auto_12284 ) ) ( not ( = ?auto_12285 ?auto_12282 ) ) ( not ( = ?auto_12286 ?auto_12280 ) ) ( PERSON-AT ?auto_12280 ?auto_12284 ) ( not ( = ?auto_12286 ?auto_12279 ) ) ( not ( = ?auto_12280 ?auto_12279 ) ) ( PERSON-AT ?auto_12279 ?auto_12284 ) ( not ( = ?auto_12278 ?auto_12283 ) ) ( not ( = ?auto_12284 ?auto_12283 ) ) ( PERSON-AT ?auto_12286 ?auto_12283 ) ( AIRCRAFT-AT ?auto_12281 ?auto_12278 ) ( FUEL-LEVEL ?auto_12281 ?auto_12285 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12286 ?auto_12280 ?auto_12278 )
      ( FLY-2PPL-VERIFY ?auto_12279 ?auto_12280 ?auto_12278 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12288 - PERSON
      ?auto_12289 - PERSON
      ?auto_12287 - CITY
    )
    :vars
    (
      ?auto_12291 - FLEVEL
      ?auto_12295 - FLEVEL
      ?auto_12293 - CITY
      ?auto_12294 - PERSON
      ?auto_12292 - CITY
      ?auto_12290 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12291 ?auto_12295 ) ( not ( = ?auto_12287 ?auto_12293 ) ) ( not ( = ?auto_12295 ?auto_12291 ) ) ( not ( = ?auto_12289 ?auto_12288 ) ) ( PERSON-AT ?auto_12288 ?auto_12293 ) ( not ( = ?auto_12289 ?auto_12294 ) ) ( not ( = ?auto_12288 ?auto_12294 ) ) ( PERSON-AT ?auto_12294 ?auto_12293 ) ( not ( = ?auto_12287 ?auto_12292 ) ) ( not ( = ?auto_12293 ?auto_12292 ) ) ( PERSON-AT ?auto_12289 ?auto_12292 ) ( AIRCRAFT-AT ?auto_12290 ?auto_12287 ) ( FUEL-LEVEL ?auto_12290 ?auto_12295 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12289 ?auto_12288 ?auto_12287 )
      ( FLY-2PPL-VERIFY ?auto_12288 ?auto_12289 ?auto_12287 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12297 - PERSON
      ?auto_12298 - PERSON
      ?auto_12296 - CITY
    )
    :vars
    (
      ?auto_12300 - FLEVEL
      ?auto_12303 - FLEVEL
      ?auto_12302 - CITY
      ?auto_12304 - PERSON
      ?auto_12301 - CITY
      ?auto_12299 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12300 ?auto_12303 ) ( not ( = ?auto_12296 ?auto_12302 ) ) ( not ( = ?auto_12303 ?auto_12300 ) ) ( not ( = ?auto_12304 ?auto_12297 ) ) ( PERSON-AT ?auto_12297 ?auto_12302 ) ( not ( = ?auto_12304 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( PERSON-AT ?auto_12298 ?auto_12302 ) ( not ( = ?auto_12296 ?auto_12301 ) ) ( not ( = ?auto_12302 ?auto_12301 ) ) ( PERSON-AT ?auto_12304 ?auto_12301 ) ( AIRCRAFT-AT ?auto_12299 ?auto_12296 ) ( FUEL-LEVEL ?auto_12299 ?auto_12303 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12304 ?auto_12297 ?auto_12296 )
      ( FLY-2PPL-VERIFY ?auto_12297 ?auto_12298 ?auto_12296 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12326 - PERSON
      ?auto_12327 - PERSON
      ?auto_12328 - PERSON
      ?auto_12325 - CITY
    )
    :vars
    (
      ?auto_12330 - FLEVEL
      ?auto_12333 - FLEVEL
      ?auto_12332 - CITY
      ?auto_12331 - CITY
      ?auto_12329 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12330 ?auto_12333 ) ( not ( = ?auto_12325 ?auto_12332 ) ) ( not ( = ?auto_12333 ?auto_12330 ) ) ( not ( = ?auto_12326 ?auto_12328 ) ) ( PERSON-AT ?auto_12328 ?auto_12332 ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( not ( = ?auto_12328 ?auto_12327 ) ) ( PERSON-AT ?auto_12327 ?auto_12332 ) ( not ( = ?auto_12325 ?auto_12331 ) ) ( not ( = ?auto_12332 ?auto_12331 ) ) ( PERSON-AT ?auto_12326 ?auto_12331 ) ( AIRCRAFT-AT ?auto_12329 ?auto_12325 ) ( FUEL-LEVEL ?auto_12329 ?auto_12333 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12326 ?auto_12328 ?auto_12325 )
      ( FLY-3PPL-VERIFY ?auto_12326 ?auto_12327 ?auto_12328 ?auto_12325 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12345 - PERSON
      ?auto_12346 - PERSON
      ?auto_12347 - PERSON
      ?auto_12344 - CITY
    )
    :vars
    (
      ?auto_12349 - FLEVEL
      ?auto_12352 - FLEVEL
      ?auto_12351 - CITY
      ?auto_12350 - CITY
      ?auto_12348 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12349 ?auto_12352 ) ( not ( = ?auto_12344 ?auto_12351 ) ) ( not ( = ?auto_12352 ?auto_12349 ) ) ( not ( = ?auto_12345 ?auto_12346 ) ) ( PERSON-AT ?auto_12346 ?auto_12351 ) ( not ( = ?auto_12345 ?auto_12347 ) ) ( not ( = ?auto_12346 ?auto_12347 ) ) ( PERSON-AT ?auto_12347 ?auto_12351 ) ( not ( = ?auto_12344 ?auto_12350 ) ) ( not ( = ?auto_12351 ?auto_12350 ) ) ( PERSON-AT ?auto_12345 ?auto_12350 ) ( AIRCRAFT-AT ?auto_12348 ?auto_12344 ) ( FUEL-LEVEL ?auto_12348 ?auto_12352 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12345 ?auto_12346 ?auto_12344 )
      ( FLY-3PPL-VERIFY ?auto_12345 ?auto_12346 ?auto_12347 ?auto_12344 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12364 - PERSON
      ?auto_12365 - PERSON
      ?auto_12366 - PERSON
      ?auto_12363 - CITY
    )
    :vars
    (
      ?auto_12368 - FLEVEL
      ?auto_12371 - FLEVEL
      ?auto_12370 - CITY
      ?auto_12369 - CITY
      ?auto_12367 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12368 ?auto_12371 ) ( not ( = ?auto_12363 ?auto_12370 ) ) ( not ( = ?auto_12371 ?auto_12368 ) ) ( not ( = ?auto_12365 ?auto_12366 ) ) ( PERSON-AT ?auto_12366 ?auto_12370 ) ( not ( = ?auto_12365 ?auto_12364 ) ) ( not ( = ?auto_12366 ?auto_12364 ) ) ( PERSON-AT ?auto_12364 ?auto_12370 ) ( not ( = ?auto_12363 ?auto_12369 ) ) ( not ( = ?auto_12370 ?auto_12369 ) ) ( PERSON-AT ?auto_12365 ?auto_12369 ) ( AIRCRAFT-AT ?auto_12367 ?auto_12363 ) ( FUEL-LEVEL ?auto_12367 ?auto_12371 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12365 ?auto_12366 ?auto_12363 )
      ( FLY-3PPL-VERIFY ?auto_12364 ?auto_12365 ?auto_12366 ?auto_12363 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12383 - PERSON
      ?auto_12384 - PERSON
      ?auto_12385 - PERSON
      ?auto_12382 - CITY
    )
    :vars
    (
      ?auto_12387 - FLEVEL
      ?auto_12390 - FLEVEL
      ?auto_12389 - CITY
      ?auto_12388 - CITY
      ?auto_12386 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12387 ?auto_12390 ) ( not ( = ?auto_12382 ?auto_12389 ) ) ( not ( = ?auto_12390 ?auto_12387 ) ) ( not ( = ?auto_12385 ?auto_12384 ) ) ( PERSON-AT ?auto_12384 ?auto_12389 ) ( not ( = ?auto_12385 ?auto_12383 ) ) ( not ( = ?auto_12384 ?auto_12383 ) ) ( PERSON-AT ?auto_12383 ?auto_12389 ) ( not ( = ?auto_12382 ?auto_12388 ) ) ( not ( = ?auto_12389 ?auto_12388 ) ) ( PERSON-AT ?auto_12385 ?auto_12388 ) ( AIRCRAFT-AT ?auto_12386 ?auto_12382 ) ( FUEL-LEVEL ?auto_12386 ?auto_12390 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12385 ?auto_12384 ?auto_12382 )
      ( FLY-3PPL-VERIFY ?auto_12383 ?auto_12384 ?auto_12385 ?auto_12382 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12422 - PERSON
      ?auto_12423 - PERSON
      ?auto_12424 - PERSON
      ?auto_12421 - CITY
    )
    :vars
    (
      ?auto_12426 - FLEVEL
      ?auto_12429 - FLEVEL
      ?auto_12428 - CITY
      ?auto_12427 - CITY
      ?auto_12425 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12426 ?auto_12429 ) ( not ( = ?auto_12421 ?auto_12428 ) ) ( not ( = ?auto_12429 ?auto_12426 ) ) ( not ( = ?auto_12423 ?auto_12422 ) ) ( PERSON-AT ?auto_12422 ?auto_12428 ) ( not ( = ?auto_12423 ?auto_12424 ) ) ( not ( = ?auto_12422 ?auto_12424 ) ) ( PERSON-AT ?auto_12424 ?auto_12428 ) ( not ( = ?auto_12421 ?auto_12427 ) ) ( not ( = ?auto_12428 ?auto_12427 ) ) ( PERSON-AT ?auto_12423 ?auto_12427 ) ( AIRCRAFT-AT ?auto_12425 ?auto_12421 ) ( FUEL-LEVEL ?auto_12425 ?auto_12429 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12423 ?auto_12422 ?auto_12421 )
      ( FLY-3PPL-VERIFY ?auto_12422 ?auto_12423 ?auto_12424 ?auto_12421 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12441 - PERSON
      ?auto_12442 - PERSON
      ?auto_12443 - PERSON
      ?auto_12440 - CITY
    )
    :vars
    (
      ?auto_12445 - FLEVEL
      ?auto_12448 - FLEVEL
      ?auto_12447 - CITY
      ?auto_12446 - CITY
      ?auto_12444 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12445 ?auto_12448 ) ( not ( = ?auto_12440 ?auto_12447 ) ) ( not ( = ?auto_12448 ?auto_12445 ) ) ( not ( = ?auto_12443 ?auto_12441 ) ) ( PERSON-AT ?auto_12441 ?auto_12447 ) ( not ( = ?auto_12443 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( PERSON-AT ?auto_12442 ?auto_12447 ) ( not ( = ?auto_12440 ?auto_12446 ) ) ( not ( = ?auto_12447 ?auto_12446 ) ) ( PERSON-AT ?auto_12443 ?auto_12446 ) ( AIRCRAFT-AT ?auto_12444 ?auto_12440 ) ( FUEL-LEVEL ?auto_12444 ?auto_12448 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12443 ?auto_12441 ?auto_12440 )
      ( FLY-3PPL-VERIFY ?auto_12441 ?auto_12442 ?auto_12443 ?auto_12440 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12501 - PERSON
      ?auto_12500 - CITY
    )
    :vars
    (
      ?auto_12503 - FLEVEL
      ?auto_12507 - FLEVEL
      ?auto_12505 - CITY
      ?auto_12508 - PERSON
      ?auto_12506 - PERSON
      ?auto_12504 - CITY
      ?auto_12502 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12503 ?auto_12507 ) ( not ( = ?auto_12500 ?auto_12505 ) ) ( not ( = ?auto_12507 ?auto_12503 ) ) ( not ( = ?auto_12508 ?auto_12501 ) ) ( PERSON-AT ?auto_12501 ?auto_12505 ) ( not ( = ?auto_12508 ?auto_12506 ) ) ( not ( = ?auto_12501 ?auto_12506 ) ) ( PERSON-AT ?auto_12506 ?auto_12505 ) ( not ( = ?auto_12500 ?auto_12504 ) ) ( not ( = ?auto_12505 ?auto_12504 ) ) ( PERSON-AT ?auto_12508 ?auto_12504 ) ( AIRCRAFT-AT ?auto_12502 ?auto_12500 ) ( FUEL-LEVEL ?auto_12502 ?auto_12503 ) )
    :subtasks
    ( ( !REFUEL ?auto_12502 ?auto_12500 ?auto_12503 ?auto_12507 )
      ( FLY-2PPL ?auto_12508 ?auto_12501 ?auto_12500 )
      ( FLY-1PPL-VERIFY ?auto_12501 ?auto_12500 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12510 - PERSON
      ?auto_12511 - PERSON
      ?auto_12509 - CITY
    )
    :vars
    (
      ?auto_12517 - FLEVEL
      ?auto_12512 - FLEVEL
      ?auto_12516 - CITY
      ?auto_12515 - PERSON
      ?auto_12514 - CITY
      ?auto_12513 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12517 ?auto_12512 ) ( not ( = ?auto_12509 ?auto_12516 ) ) ( not ( = ?auto_12512 ?auto_12517 ) ) ( not ( = ?auto_12510 ?auto_12511 ) ) ( PERSON-AT ?auto_12511 ?auto_12516 ) ( not ( = ?auto_12510 ?auto_12515 ) ) ( not ( = ?auto_12511 ?auto_12515 ) ) ( PERSON-AT ?auto_12515 ?auto_12516 ) ( not ( = ?auto_12509 ?auto_12514 ) ) ( not ( = ?auto_12516 ?auto_12514 ) ) ( PERSON-AT ?auto_12510 ?auto_12514 ) ( AIRCRAFT-AT ?auto_12513 ?auto_12509 ) ( FUEL-LEVEL ?auto_12513 ?auto_12517 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12511 ?auto_12509 )
      ( FLY-2PPL-VERIFY ?auto_12510 ?auto_12511 ?auto_12509 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12519 - PERSON
      ?auto_12520 - PERSON
      ?auto_12518 - CITY
    )
    :vars
    (
      ?auto_12522 - FLEVEL
      ?auto_12525 - FLEVEL
      ?auto_12524 - CITY
      ?auto_12526 - PERSON
      ?auto_12523 - CITY
      ?auto_12521 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12522 ?auto_12525 ) ( not ( = ?auto_12518 ?auto_12524 ) ) ( not ( = ?auto_12525 ?auto_12522 ) ) ( not ( = ?auto_12526 ?auto_12520 ) ) ( PERSON-AT ?auto_12520 ?auto_12524 ) ( not ( = ?auto_12526 ?auto_12519 ) ) ( not ( = ?auto_12520 ?auto_12519 ) ) ( PERSON-AT ?auto_12519 ?auto_12524 ) ( not ( = ?auto_12518 ?auto_12523 ) ) ( not ( = ?auto_12524 ?auto_12523 ) ) ( PERSON-AT ?auto_12526 ?auto_12523 ) ( AIRCRAFT-AT ?auto_12521 ?auto_12518 ) ( FUEL-LEVEL ?auto_12521 ?auto_12522 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12526 ?auto_12520 ?auto_12518 )
      ( FLY-2PPL-VERIFY ?auto_12519 ?auto_12520 ?auto_12518 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12528 - PERSON
      ?auto_12529 - PERSON
      ?auto_12527 - CITY
    )
    :vars
    (
      ?auto_12531 - FLEVEL
      ?auto_12534 - FLEVEL
      ?auto_12533 - CITY
      ?auto_12535 - PERSON
      ?auto_12532 - CITY
      ?auto_12530 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12531 ?auto_12534 ) ( not ( = ?auto_12527 ?auto_12533 ) ) ( not ( = ?auto_12534 ?auto_12531 ) ) ( not ( = ?auto_12529 ?auto_12528 ) ) ( PERSON-AT ?auto_12528 ?auto_12533 ) ( not ( = ?auto_12529 ?auto_12535 ) ) ( not ( = ?auto_12528 ?auto_12535 ) ) ( PERSON-AT ?auto_12535 ?auto_12533 ) ( not ( = ?auto_12527 ?auto_12532 ) ) ( not ( = ?auto_12533 ?auto_12532 ) ) ( PERSON-AT ?auto_12529 ?auto_12532 ) ( AIRCRAFT-AT ?auto_12530 ?auto_12527 ) ( FUEL-LEVEL ?auto_12530 ?auto_12531 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12529 ?auto_12528 ?auto_12527 )
      ( FLY-2PPL-VERIFY ?auto_12528 ?auto_12529 ?auto_12527 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12537 - PERSON
      ?auto_12538 - PERSON
      ?auto_12536 - CITY
    )
    :vars
    (
      ?auto_12540 - FLEVEL
      ?auto_12543 - FLEVEL
      ?auto_12542 - CITY
      ?auto_12544 - PERSON
      ?auto_12541 - CITY
      ?auto_12539 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12540 ?auto_12543 ) ( not ( = ?auto_12536 ?auto_12542 ) ) ( not ( = ?auto_12543 ?auto_12540 ) ) ( not ( = ?auto_12544 ?auto_12537 ) ) ( PERSON-AT ?auto_12537 ?auto_12542 ) ( not ( = ?auto_12544 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( PERSON-AT ?auto_12538 ?auto_12542 ) ( not ( = ?auto_12536 ?auto_12541 ) ) ( not ( = ?auto_12542 ?auto_12541 ) ) ( PERSON-AT ?auto_12544 ?auto_12541 ) ( AIRCRAFT-AT ?auto_12539 ?auto_12536 ) ( FUEL-LEVEL ?auto_12539 ?auto_12540 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12544 ?auto_12537 ?auto_12536 )
      ( FLY-2PPL-VERIFY ?auto_12537 ?auto_12538 ?auto_12536 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12566 - PERSON
      ?auto_12567 - PERSON
      ?auto_12568 - PERSON
      ?auto_12565 - CITY
    )
    :vars
    (
      ?auto_12570 - FLEVEL
      ?auto_12573 - FLEVEL
      ?auto_12572 - CITY
      ?auto_12571 - CITY
      ?auto_12569 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12570 ?auto_12573 ) ( not ( = ?auto_12565 ?auto_12572 ) ) ( not ( = ?auto_12573 ?auto_12570 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( PERSON-AT ?auto_12568 ?auto_12572 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12568 ?auto_12567 ) ) ( PERSON-AT ?auto_12567 ?auto_12572 ) ( not ( = ?auto_12565 ?auto_12571 ) ) ( not ( = ?auto_12572 ?auto_12571 ) ) ( PERSON-AT ?auto_12566 ?auto_12571 ) ( AIRCRAFT-AT ?auto_12569 ?auto_12565 ) ( FUEL-LEVEL ?auto_12569 ?auto_12570 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12566 ?auto_12568 ?auto_12565 )
      ( FLY-3PPL-VERIFY ?auto_12566 ?auto_12567 ?auto_12568 ?auto_12565 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12585 - PERSON
      ?auto_12586 - PERSON
      ?auto_12587 - PERSON
      ?auto_12584 - CITY
    )
    :vars
    (
      ?auto_12589 - FLEVEL
      ?auto_12592 - FLEVEL
      ?auto_12591 - CITY
      ?auto_12590 - CITY
      ?auto_12588 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12589 ?auto_12592 ) ( not ( = ?auto_12584 ?auto_12591 ) ) ( not ( = ?auto_12592 ?auto_12589 ) ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( PERSON-AT ?auto_12586 ?auto_12591 ) ( not ( = ?auto_12585 ?auto_12587 ) ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( PERSON-AT ?auto_12587 ?auto_12591 ) ( not ( = ?auto_12584 ?auto_12590 ) ) ( not ( = ?auto_12591 ?auto_12590 ) ) ( PERSON-AT ?auto_12585 ?auto_12590 ) ( AIRCRAFT-AT ?auto_12588 ?auto_12584 ) ( FUEL-LEVEL ?auto_12588 ?auto_12589 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12585 ?auto_12586 ?auto_12584 )
      ( FLY-3PPL-VERIFY ?auto_12585 ?auto_12586 ?auto_12587 ?auto_12584 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12604 - PERSON
      ?auto_12605 - PERSON
      ?auto_12606 - PERSON
      ?auto_12603 - CITY
    )
    :vars
    (
      ?auto_12608 - FLEVEL
      ?auto_12611 - FLEVEL
      ?auto_12610 - CITY
      ?auto_12609 - CITY
      ?auto_12607 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12608 ?auto_12611 ) ( not ( = ?auto_12603 ?auto_12610 ) ) ( not ( = ?auto_12611 ?auto_12608 ) ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( PERSON-AT ?auto_12606 ?auto_12610 ) ( not ( = ?auto_12605 ?auto_12604 ) ) ( not ( = ?auto_12606 ?auto_12604 ) ) ( PERSON-AT ?auto_12604 ?auto_12610 ) ( not ( = ?auto_12603 ?auto_12609 ) ) ( not ( = ?auto_12610 ?auto_12609 ) ) ( PERSON-AT ?auto_12605 ?auto_12609 ) ( AIRCRAFT-AT ?auto_12607 ?auto_12603 ) ( FUEL-LEVEL ?auto_12607 ?auto_12608 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12605 ?auto_12606 ?auto_12603 )
      ( FLY-3PPL-VERIFY ?auto_12604 ?auto_12605 ?auto_12606 ?auto_12603 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12623 - PERSON
      ?auto_12624 - PERSON
      ?auto_12625 - PERSON
      ?auto_12622 - CITY
    )
    :vars
    (
      ?auto_12627 - FLEVEL
      ?auto_12630 - FLEVEL
      ?auto_12629 - CITY
      ?auto_12628 - CITY
      ?auto_12626 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12627 ?auto_12630 ) ( not ( = ?auto_12622 ?auto_12629 ) ) ( not ( = ?auto_12630 ?auto_12627 ) ) ( not ( = ?auto_12625 ?auto_12624 ) ) ( PERSON-AT ?auto_12624 ?auto_12629 ) ( not ( = ?auto_12625 ?auto_12623 ) ) ( not ( = ?auto_12624 ?auto_12623 ) ) ( PERSON-AT ?auto_12623 ?auto_12629 ) ( not ( = ?auto_12622 ?auto_12628 ) ) ( not ( = ?auto_12629 ?auto_12628 ) ) ( PERSON-AT ?auto_12625 ?auto_12628 ) ( AIRCRAFT-AT ?auto_12626 ?auto_12622 ) ( FUEL-LEVEL ?auto_12626 ?auto_12627 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12625 ?auto_12624 ?auto_12622 )
      ( FLY-3PPL-VERIFY ?auto_12623 ?auto_12624 ?auto_12625 ?auto_12622 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12662 - PERSON
      ?auto_12663 - PERSON
      ?auto_12664 - PERSON
      ?auto_12661 - CITY
    )
    :vars
    (
      ?auto_12666 - FLEVEL
      ?auto_12669 - FLEVEL
      ?auto_12668 - CITY
      ?auto_12667 - CITY
      ?auto_12665 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12666 ?auto_12669 ) ( not ( = ?auto_12661 ?auto_12668 ) ) ( not ( = ?auto_12669 ?auto_12666 ) ) ( not ( = ?auto_12663 ?auto_12662 ) ) ( PERSON-AT ?auto_12662 ?auto_12668 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) ( PERSON-AT ?auto_12664 ?auto_12668 ) ( not ( = ?auto_12661 ?auto_12667 ) ) ( not ( = ?auto_12668 ?auto_12667 ) ) ( PERSON-AT ?auto_12663 ?auto_12667 ) ( AIRCRAFT-AT ?auto_12665 ?auto_12661 ) ( FUEL-LEVEL ?auto_12665 ?auto_12666 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12663 ?auto_12662 ?auto_12661 )
      ( FLY-3PPL-VERIFY ?auto_12662 ?auto_12663 ?auto_12664 ?auto_12661 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12681 - PERSON
      ?auto_12682 - PERSON
      ?auto_12683 - PERSON
      ?auto_12680 - CITY
    )
    :vars
    (
      ?auto_12685 - FLEVEL
      ?auto_12688 - FLEVEL
      ?auto_12687 - CITY
      ?auto_12686 - CITY
      ?auto_12684 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12685 ?auto_12688 ) ( not ( = ?auto_12680 ?auto_12687 ) ) ( not ( = ?auto_12688 ?auto_12685 ) ) ( not ( = ?auto_12683 ?auto_12681 ) ) ( PERSON-AT ?auto_12681 ?auto_12687 ) ( not ( = ?auto_12683 ?auto_12682 ) ) ( not ( = ?auto_12681 ?auto_12682 ) ) ( PERSON-AT ?auto_12682 ?auto_12687 ) ( not ( = ?auto_12680 ?auto_12686 ) ) ( not ( = ?auto_12687 ?auto_12686 ) ) ( PERSON-AT ?auto_12683 ?auto_12686 ) ( AIRCRAFT-AT ?auto_12684 ?auto_12680 ) ( FUEL-LEVEL ?auto_12684 ?auto_12685 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12683 ?auto_12681 ?auto_12680 )
      ( FLY-3PPL-VERIFY ?auto_12681 ?auto_12682 ?auto_12683 ?auto_12680 ) )
  )

)

