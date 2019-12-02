#!/bin/sh
# If we have a service specific script, run this now
if [ -x /etc/openvpn/"${RC_SVCNAME}"-down.sh ] ; then
	/etc/openvpn/"${RC_SVCNAME}"-down.sh "$@"
fi

# Restore resolv.conf to how it was
if [ "${PEER_DNS}" != "no" ]; then
	if [ -x /sbin/resolvconf ] ; then
		/sbin/resolvconf -d "${dev}"
	elif [ -e /etc/resolv.conf-"${dev}".sv ] ; then
		# Important that we cat instead of move incase resolv.conf is
		# a symlink and not an actual file
		cat /etc/resolv.conf-"${dev}".sv > /etc/resolv.conf
		rm -f /etc/resolv.conf-"${dev}".sv
	fi
fi

if [ -n "${RC_SVCNAME}" ]; then
	# Re-enter the init script to start any dependant services
	if /etc/init.d/"${RC_SVCNAME}" --quiet status ; then
		export IN_BACKGROUND=true
		/etc/init.d/"${RC_SVCNAME}" --quiet stop
	fi
fi

exit 0

# vim: ts=4 :
