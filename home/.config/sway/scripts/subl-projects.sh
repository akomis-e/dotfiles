SUBLIME_PROJ_DIR=~/Dropbox/hlib/notes_projects

PROJECT_NAME=$(
	(cd $SUBLIME_PROJ_DIR && ls -1 *.sublime-project) | wofi -W 400 --show dmenu
)

if [ -n "${PROJECT_NAME}" ]; then
	swaymsg workspace 3
	subl --project "$SUBLIME_PROJ_DIR/$PROJECT_NAME"
fi

# TO DEBUG 
# notify-send "test $PROJECT_NAME"