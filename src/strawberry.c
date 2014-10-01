/*
 Strawberry window manager v.0.1 - Mit license.
 * */

#define _MIT_SOURCE
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

// Variables
static Display *dis; // open X server that controls a display
static bool_quit; 
static XWindowAttributes attr; // Obtaining Window Information 
static XButtonEvent starter; // xbutton 

// Functions
static void start();

void start(){
	XEvent ev; // Event Structures

	while(!bool_quit && !XNextEvent(dis,&ev)){
		if(events[ev.type])
			events[ev.type](&ev);
	}

}




int main (){

	// Open display
	if (!(dis = XOpenDisplay(NULL))) {
		logger("\033[1;31mCannot open display!"); // in red color 
		exit(1);
	}

	// start wm
	start();

	exit(0);

}
