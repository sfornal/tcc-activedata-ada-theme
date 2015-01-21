//Written by Stephen Fornal on 2015/01/14
'use strict';

//Copy contents from one place to another
module.exports = {

    //copy config.xml to root of theme
    config: {
        files: [
            {
                expand: true,
                cwd: 'src/config',
                src: ['*.xml'],
                dest: 'dist/raw'
            }]
    },

    //copy xslt files to root of theme
    xslt: {
        files: [{
            expand: true,
            cwd: 'src/xslt',
            src: ['*.xslt'],
            dest: 'dist/raw'
        }]
    },

    //copy def files to root of theme
    def: {
        files: [{
            expand: true,
            cwd: 'src/def',
            src: ['*.def'],
            dest: 'dist/raw'
        }]
    },

    //Copy raw CSS files to tmp for autoprefixer to find
    css: {
        files: [{
            expand: true,
            cwd: 'src/css',
            src: ['*.css'],
            dest: 'tmp/'
        }]
    },

    //Copy image types not processed by imagemin to corresponding place in theme
    images: {
        files: [{
            expand: true,
            cwd: 'src/',
            src: ['**/*.{ico,bmp,tif,webp}'],
            dest: 'dist/raw'
        }]
    },

    //Copy JS files for dev build (no concatenate or minify) to js folder in theme
    js: {
        files: [{
            expand: true,
            cwd: 'src/js',
            src: ['*.js'],
            dest: 'dist/raw/js'
        }]
    }
};
