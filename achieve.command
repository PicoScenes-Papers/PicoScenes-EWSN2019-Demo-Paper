#!
if [[ $(uname) = Darwin ]]; then
		echo Darwin
		ABSPATH=$(cd "$(dirname "$0")"; pwd)
		cd $ABSPATH
git archive head --format zip --output ./current_head.zip
fi
