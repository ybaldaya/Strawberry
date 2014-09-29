/*
 Strawberry window manager v.0.1 - Mit license.
 * */

#define _MIT_SOURCE
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

// Variables
static bool_quit;

// Functions
static void start();

void start(){
	XEvent ev;

	while(!bool_quit && !XNextEvent(dis,&ev)){
		if(events[ev.type])
			events[ev.type](&ev);
	}

}




int main (){


	// start wm
	start();

	exit(0);

}
