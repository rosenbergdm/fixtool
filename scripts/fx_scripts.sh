#!/usr/bin/env bash

FIXDIR=/opt/git/fixtool
: {FIXSPEC=42}

get_spec() {
  echo "$FIXDIR/dicts/FIX${FIXSPEC}.xml"
}

get_mandir() { 
  echo -n "FIX.";
  echo "$1" | perl -pi -e 's/[^\d]//g' | xargs echo "0.1 * " | bc
}

fx() {
  detach xterm -e man "$FIXDIR/manpages/$(get_mandir $FIXSPEC)/$1.1"
}

dx() {
  detach man "$FIXDIR/manpages/$(get_mandir $FIXSPEC)/$1.1" | col -b | dzen2 -h
}




