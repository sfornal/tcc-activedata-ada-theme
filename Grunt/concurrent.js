//Written by Stephen Fornal on 2015/01/14
'use strict';

//Run two or more build tasks concurrently
module.exports = {
    options: {
        limit: 12, //2 <= limit <= 2x cpu cores
        logConcurrentOutput: false
    },
    devFirst: {
        tasks: ['clean', 'jshint:default', 'sass:dev', 'copy:css']
    },
    devSecond: {
        tasks: ['copy:config', 'copy:xslt', 'copy:def', 'copy:js', 'autoprefixer:dev']
    },
    imgFirst: {
        tasks: ['imagemin', 'copy:images']
    },
    prodFirst: {
        tasks: ['clean', 'jshint:default', 'sass:prod', 'copy:css']
    },
    prodSecond: {
        tasks: ['copy:config', 'copy:xslt', 'copy:def', 'uglify', 'autoprefixer:prod']
    },
};
