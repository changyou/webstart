/**
 * For develop and debug
 */

seajs.config({
	alias: {
		"less": "gallery/less/1.3.1/less"
	},
	// preload:[ "less" ],
	debug: true
});

//TODO: USE seajs-less.js
/*
less = {
	env: "development", // or "production"
	async: false,       // load imports async
	fileAsync: false,   // load imports async when in a page under
						// a file protocol
	poll: 1000,			// when in watch mode, time in ms between polls
	functions: {},		// user functions, keyed by name
	dumpLineNumbers: "comments", // or "mediaQuery" or "all"
	relativeUrls: false,// whether to adjust url's to be relative
						// if false, url's are already relative to the
						// entry less file
	rootpath: ""		// a path to add on to the start of every url
						//resource
};
*/