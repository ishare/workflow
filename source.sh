query="{query}"
if [ "$query" == "now" ]; then
	millis=$(date +%s"000")
	export ts=$millis
	timeStr=$(perl -e 'use POSIX qw(strftime);print strftime "%Y-%m-%d %H:%M:%S", localtime("$ENV{ts}"/1000)')
	echo '<?xml version="1.0"?>
<items>
	<item uid="" arg="'$timeStr'">
		<title>'$timeStr'</title>
		<subtitle>press enter to copy...</subtitle>
		<icon>icon.png</icon>
	</item>
	<item uid="" arg="'$millis'">
		<title>'$millis'</title>
		<subtitle>press enter to copy: time millis</subtitle>
		<icon>icon.png</icon>
	</item>
</items>'

else
	if [ "$query" -lt 100000000000 ]; then
		query=$query"000";
	fi
	#timeStr=$(echo 0 | gawk '{print strftime("%Y-%m-%d %H:%M:%S", ($(query) + 500 ) / 1000 )}')
	export ts=$query
	timeStr=$(perl -e 'use POSIX qw(strftime);print strftime "%Y-%m-%d %H:%M:%S", localtime("$ENV{ts}"/1000)')
	echo '<?xml version="1.0"?>
<items>
	<item uid="" arg="'$timeStr'">
		<title>'$timeStr'</title>
		<subtitle>press enter to copy...</subtitle>
		<icon>icon.png</icon>
	</item>
</items>'
fi

