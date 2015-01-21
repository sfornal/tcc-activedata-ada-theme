//Written by Stephen Fornal on 2015-01-21
//For the Active Data ADA Layout Project
'use strict';

module.exports = function(grunt) {
    var path = require('path');
	//Time the build tasks. Useful and fun info!
	require('time-grunt')(grunt);

    //Load all Grunt tasks automagically
    require('load-grunt-config')(grunt, {
        //Use Just-In-Time task loading for a significant savings
        jitGrunt: true,

        //Path to find task configurations
        configPath: path.join(process.cwd(), 'grunt'),

        init: true
    });
};
