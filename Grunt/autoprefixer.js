//Written by Stephen Fornal on 2015/01/21

//Autoprefixer adds vendor prefixes, using data from caniuse.com
//It is used in the build process to add prefixes, as well as copying the
//css to the dist folder
'use strict';

module.exports = {

    options: {
        browsers: ['> 2%', 'last 2 versions', 'ie 8', 'ie 9']
    },

    dev: {
        options: {
            map: true,
            cascade: true
        },
        files: [{
            expand: true,
            cwd: 'tmp/',
            src: '**/*.css',
            dest: 'dist/raw/css'
        }]
    },
    prod: {
        options: {
            map: false,
            cascade: true,
            safe: true,
            silent: true
        },
        files: [{
            expand: true,
            cwd: 'tmp/',
            src: '**/*.css',
            dest: 'dist/raw/css'
        }]
    }
};
