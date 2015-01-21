//Written by Stephen Fornal on 2015/01/14
'use strict';

//Copy images to dist folder, and additionally apply optimizations
//to jpeg, png, gif, and svg files

module.exports = {
    options: {
        optimizationLevel: 7,
        progressive: true,
        interlaced: true,
        use: [(require('imagemin-mozjpeg'))()]
    },
    default: {
        files:[
        {
            expand: true,
            cwd: 'src/images',
            src: ['*.jpg,jpeg,gif,png,svg,svgz'],
            dest: 'dist/raw/images'
        },
        {
            expand: true,
            cwd: 'src/thumbnail',
            src: ['thumbnail.{jpg,jpeg,gif,png}'],
            dest: 'dist/raw/'
        }]
    }
};
