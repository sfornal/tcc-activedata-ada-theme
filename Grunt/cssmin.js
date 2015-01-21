//Written by Stephen Fornal on 2015/01/21
'use strict';

//Minify js files in the dist/raw/css directory
module.exports = {
    default: {
        files: [{
            expand: true,
            cwd: 'dist/raw/css',
            src: ['**/*.css'],
            dest: 'dist/raw/css',
            //ext: 'min.css'
        }]
    }
};
