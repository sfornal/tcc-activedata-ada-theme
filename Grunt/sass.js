//Written by Stephen Fornal on 2015/01/14
'use strict';

//Compile SCSS to a CSS file
module.exports = {
    options: {
        trace: false
    },

    dev: {
        options: {
            debugInfo: true,
            style: 'expanded',
            lineNumbers: true,
            sourceMap: true
        },
        files:[{
            expand: true,
            cwd: 'src/scss',
            src: ['**/*.{scss,sass}'],
            dest: 'tmp/',
            ext: '.css'
        }]
    },

    prod: {
        options: {
            debugInfo: false,
            style: 'compressed',
            lineNumbers: false,
            sourceMap: false
        },
        files:[{
            expand: true,
            cwd: 'src/scss',
            src: ['**/*.{scss,sass}'],
            dest: 'tmp/',
            ext: '.css'
        }]
    }
};
