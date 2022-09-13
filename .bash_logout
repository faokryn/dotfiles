case $(( $RANDOM % 50 )) in
    0)
        logout_msg="ARE YOU LIVING IN THE "
        logout_msg_2="REAL WORLD? "
	;;
    [1-2])
        logout_msg="EASY COME, EASY GO... "
	;;
    [3-4])
        logout_msg="LIFE IS BUT A DREAM... "
	;;
    [5-9])
        logout_msg="YOU'RE GONNA CARRY THAT WEIGHT. "
	;;
    *)
	logout_msg="SEE YOU SPACE COWBOY... "
	;;
esac

printf "$(tput sitm)%$(tput cols)s$(tput sgr0)\n" "$logout_msg"
[ -n "$logout_msg_2" ] && printf "$(tput sitm)%$(tput cols)s$(tput sgr0)\n" "$logout_msg_2"
